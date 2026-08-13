
ws-edn in calcit-js
----

### Usages

Server side:

```cirru
ws-edn.server/wss-serve! 5001
  {}
    :on-open $ fn (sid socket)
      println |opened sid
    :on-data $ fn (sid data)
      println "data" sid data)
    :on-close $ fn (sid event)
      println "close" sid
    :on-listening $ fn ()
      println "listening"
    :on-error $ fn (error)
      println error

ws-edn.server/wss-send! sid data

ws-edn.server/wss-each! $ fn (sid socket)
  println sid
  ; "or send"
  wss-send! sid $ {} (:data "|some data")

; "use in onreload! to bind a new listener"
ws-edn.server/wss-set-on-data! $ fn (sid data)
  println "|received data" sid data
```

Client side:

```clojure
ws-edn.client/ws-connect! "|ws://localhost:5001"
  {}
    :on-open $ fn (event)
      println "open"
    :on-data $ fn (data)
      println "data" data
    :on-close $ fn (event)
      println "close"
    :on-error $ fn (error)
      println error

ws-edn.client/ws-send! data

ws-edn.client/ws-connected?
; => true or false

; "use in onreload! to bind a new listener"
ws-edn.client/ws-set-on-data! $ fn (data)
  println data
```

Typed decoding for application data:

`ws-edn.schema/Track` is a nominal Struct. Use the built-in `decode-map-as`
boundary when a received map has a known shape; missing required fields and
wrong field types fail before application code consumes the value.

```cirru
ws-edn.schema/decode-track $ {} (:message |hello) (:time |now)
```

Keep open protocol payloads as `Dynamic` only at the WebSocket/JS boundary and
decode them into a named Struct or Enum as soon as their shape is known. Do not
reintroduce the removed `calcit-test`, `lilac`, or `memof` modules.

Legacy class mapper (for compatibility with older payloads):

```cirru
  :class-mapper $ {}
    :Person Person
```

Deps:

```bash
yarn add nanoid
```

### WSS

add in options to enabled WSS mode:

```cirru
{}
  :key "./path-to.pem"
  :cert "./path-to.pem"
```

### License

MIT
