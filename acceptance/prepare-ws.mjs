import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync} from 'node:fs';
const run=(...args)=>execFileSync('calcit',args,{encoding:'utf8',maxBuffer:16*1024*1024});
const q=(...args)=>JSON.parse(run('query',...args,'--format','json')).data;
assert.equal(run('-v').trim(),'0.30.1');
run('docs','agents','--full');
const config=q('config');
const inventory=()=>{
  const all=[];const namespaces=q('ns').namespaces;assert.equal(namespaces.length,7);
  for(const ns of namespaces){
    const names=run('query','defs',ns).split('\n').filter(l=>/^  \S/.test(l)).map(l=>l.trim().split(' ')[0]);
    assert.equal(names.length,q('ns',ns).definition_count);
    for(const name of names)all.push(q('def',`${ns}/${name}`));
  }
  assert.equal(all.length,69);return all;
};
const before=inventory();
assert.deepEqual(before,JSON.parse(readFileSync('acceptance/reviewed.json','utf8')));
const expected=structuredClone(before),counts={option:0,constructors:0,mapper:0,cleanup:0,host:0};
const cleanup=['::',"'Fn",['{}',[':return',"'Unit"],[':args',['[]']]]];
const get=id=>expected.find(d=>d.id===id);
assert.equal(q('type','calcit.core/Option').methods.find(m=>m.name==='.some?').definition,'calcit.core/option:some?');
function visit(n,fn){if(!Array.isArray(n))return n;return fn(n.map(v=>visit(v,fn)));}
for(const d of expected){
  const normalize=n=>{
    if(n[0]==='option:some?'){assert.equal(n.length,2);counts.option++;return ['.some?',n[1]];}
    if(n[0]==='%{}'){
      assert.ok(['WsClient','Track'].includes(n[1]));
      assert.ok(n.slice(2).every(p=>p.length===2&&p[0].startsWith(':')));
      counts.constructors++;return [n[1],...n.slice(2).flat()];
    }
    return n;
  };
  d.code=visit(d.code,normalize);
  d.tests=d.tests.map(t=>({...t,code:visit(t.code,normalize)}));
}
for(const id of ['ws-edn.app.page/main!','ws-edn.app.server/main!']){
  get(id).code=visit(get(id).code,n=>{
    if(n.length===2&&n[0]===':Track'&&n[1]==='Track'){
      counts.mapper++;return [':Track',['Track',':message','|',':time','|']];
    }return n;
  });
}
const client=get('ws-edn.client/WsClient0');
const field=client.code.find(p=>Array.isArray(p)&&p[0]===':lifecycle-cleanup');
assert.deepEqual(field,[':lifecycle-cleanup',['::',"'Ref",['::',"'Option","'Fn"]]]);
field[1][2][2]=cleanup;counts.cleanup++;
get('ws-edn.client/create-client-with!').code=visit(get('ws-edn.client/create-client-with!').code,n=>{
  if(n[0]==='lifecycle-cleanup-ref'){
    assert.deepEqual(n,['lifecycle-cleanup-ref',['ref',['assert-type',['Option',':none'],['::',"'Option","'Fn"]]]]);
    n[1][1][2][2]=cleanup;counts.cleanup++;
  }return n;
});
const data=get('ws-edn.server/node-data-string');
data.code=visit(data.code,n=>{
  if(n[0]==='unsafe-coerce'){
    assert.deepEqual(n,['unsafe-coerce','raw-data',"'NodeDataHost"]);counts.host++;return ['js-cast',n[1],n[2]];
  }return n;
});
assert.deepEqual(counts,{option:2,constructors:2,mapper:2,cleanup:2,host:1});
const ops=[];
for(let i=0;i<before.length;i++){
  const a=before[i],b=expected[i];
  if(JSON.stringify(a.code)!==JSON.stringify(b.code))ops.push(['edit','def',b.id,'--overwrite','--input-format','json-ast','--code',JSON.stringify(b.code)]);
  for(let t=0;t<a.tests.length;t++)if(JSON.stringify(a.tests[t])!==JSON.stringify(b.tests[t])){
    // Test replacement uses the owning test name, preserving its tags and assertion.
    ops.push(['edit','add-test',b.id,b.tests[t].name,'--overwrite','--tags',b.tests[t].tags.join(','),'--input-format','json-ast','--code',JSON.stringify(b.tests[t].code)]);
  }
}
writeFileSync('acceptance/before.json',JSON.stringify(before,null,2));
writeFileSync('acceptance/operations.json',JSON.stringify(ops,null,2));
const args=['edit','transaction','--file','acceptance/operations.json','--format','json'];
const preview=JSON.parse(run(...args,'--dry-run'));assert.ok(preview.scoped_revision);
writeFileSync('acceptance/preview.json',JSON.stringify(preview,null,2));
writeFileSync('acceptance/applied.json',run(...args,'--expect-revision',preview.scoped_revision));
assert.deepEqual(inventory(),expected,'All69views: only reviewed code/test changes; all schemas/docs/FFI/test tags retained');
assert.deepEqual(q('config'),config);
writeFileSync('acceptance/after.json',JSON.stringify(expected,null,2));
writeFileSync('acceptance/preserved.json',JSON.stringify({definitions:69,tests:23,examples:8,...counts,optionsAndWireProtocolUnchanged:true},null,2));
writeFileSync('acceptance/snapshot-blob.txt',execFileSync('git',['hash-object','calcit.cirru'],{encoding:'utf8'}));
