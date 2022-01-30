
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

Deps:

```bash
yarn add nanoid
```

### License

MIT
