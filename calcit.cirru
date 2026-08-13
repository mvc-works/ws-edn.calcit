
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `cr query` to inspect and `cr edit`/`cr tree` to modify. Run `cr docs agents --full` first. Manual edits must follow format and schema conventions, then run `cr edit format`.") (:package |ws-edn) (:version |0.0.15)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'ws-edn.app.page/main!) (:mode :native) (:reload-fn 'ws-edn.app.page/reload!)
      :modules $ []
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'ws-edn.app.server/main!) (:mode :native) (:reload-fn 'ws-edn.app.server/reload!)
      :modules $ []
      :type-slots $ {}
  :files $ {}
    |ws-edn.app.page $ %{} 'FileEntry
      :defs $ {}
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (println |start) (load-console-formatter!)
              ws-connect! (do |wss://localhost:5001 |ws://localhost:9001)
                {}
                  :on-open $ fn (event) (println |open)
                    ws-send! $ : test
                  :on-data $ fn (data) (js/console.log |data data)
                  :on-close $ fn (event) (println |close)
                  :class-mapper $ {} (:Track Track)
              js/setInterval
                fn ()
                  println "|connected try send" $ ws-connected?
                  ws-send! $ {} (:data "|just message")
                  ws-send! $ : message |in |string
                  ws-send! $ %{} Track (:message "|from client")
                    :time $ .!toISOString (new js/Date)
                , 2000
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ []
              :features $ #{} :js-ffi
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! ()
              ws-set-on-data! $ fn (data) (println "|reloaded 8:" data)
              println |reload
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.app.page $ :require
            ws-edn.client :refer $ ws-connect! ws-send! ws-connected? ws-set-on-data!
            ws-edn.schema :refer $ Track
    |ws-edn.app.server $ %{} 'FileEntry
      :defs $ {}
        |main! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn main! () (println |started) (load-console-formatter!)
              wss-serve! 9001 $ {}
                :on-listening $ fn () (println "|server listening")
                :on-open $ fn (sid socket) (println |opened sid)
                  wss-send! sid $ : op "|initial message"
                :on-data $ fn (sid data) (js/console.log "|just data" sid data)
                :on-close $ fn (sid event) (println |close sid)
                ; :key |certs/key.pem
                ; :cert |certs/cert.pem
                :class-mapper $ {} (:Track Track)
              js/setInterval
                fn () (println |heartbeat)
                  wss-each! $ fn (sid socket) (js/console.log sid)
                    wss-send! sid $ : message "|event 2s"
                    wss-send! sid $ %{} Track (:message "|from server")
                      :time $ -> js/Date new (.!toISOString)
                , 2000
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ []
              :features $ #{} :js-ffi
        |reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn reload! ()
              wss-set-on-data! $ fn (sid data) (js/console.log "|reloaded 8:" sid data)
              println |reload!
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.app.server $ :require
            ws-edn.server :refer $ wss-serve! wss-send! wss-each! wss-set-on-data!
            ws-edn.schema :refer $ Track
    |ws-edn.client $ %{} 'FileEntry
      :defs $ {}
        |*global-ws $ %{} 'CodeEntry (:doc "|Global atom that stores the WebSocket instance. Used internally to track the current connection.")
          :code $ quote (defatom *global-ws nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |ws-connect! $ %{} 'CodeEntry (:doc "|Establishes a WebSocket connection to the specified URL. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ quote
            defn ws-connect! (ws-url options)
              assert "|reqiured an url for ws server" $ string? ws-url
              let
                  ws $ new js/WebSocket ws-url
                reset! *global-ws ws
                when-let
                  on-open $ get options :on-open
                  let
                      callback $ unsafe-coerce on-open 'Fn
                    set! (.-onopen ws)
                      fn (event) (callback event)
                set! (.-onclose ws)
                  fn (event) (reset! *global-ws nil)
                    when-let
                      on-close $ get options :on-close
                      let
                          callback $ unsafe-coerce on-close 'Fn
                        callback event
                when-let
                  on-data $ get options :on-data
                  let
                      callback $ unsafe-coerce on-data 'Fn
                    set! (.-onmessage ws)
                      fn (event)
                        callback $ parse-cirru-edn
                          unsafe-coerce (.-data event) 'String
                          &map:get options :class-mapper
                set! (.-onerror ws)
                  fn (error) (js/console.error "|Failed to establish connection" error)
                    when-let
                      on-error $ get options :on-error
                      let
                          callback $ unsafe-coerce on-error 'Fn
                        callback error
          :examples $ []
            quote $ ws-connect! |ws://localhost:8080
              {}
                :on-open $ fn (event) (println |connected)
                :on-close $ fn (event) (println |closed)
                :on-data $ fn (data) (println |received: data)
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'Dynamic 'Dynamic
              :features $ #{} :js-ffi
        |ws-connected? $ %{} 'CodeEntry (:doc "|Returns true if WebSocket is currently connected, false otherwise.")
          :code $ quote
            defn ws-connected? () $ some? @*global-ws
          :examples $ []
            quote $ ws-connected?
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ []
        |ws-send! $ %{} 'CodeEntry (:doc "|Sends data through the WebSocket connection. Data will be formatted as Cirru EDN before sending.")
          :code $ quote
            defn ws-send! (data)
              do $ let
                  ws @*global-ws
                if (some? ws)
                  .!send ws $ format-cirru-edn data
                  js/console.warn "|WebSocket at close state!"
                , nil
          :examples $ []
            quote $ ws-send!
              {} (:type |ping)
                :timestamp $ unix-time!
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Dynamic
              :features $ #{} :js-ffi
        |ws-set-on-data! $ %{} 'CodeEntry (:doc "|Sets the message handler for incoming WebSocket data. Handler receives parsed Cirru EDN data.")
          :code $ quote
            defn ws-set-on-data! (on-data)
              let
                  ws @*global-ws
                if (some? ws)
                  let
                      callback $ unsafe-coerce on-data 'Fn
                    set! (.-onmessage ws)
                      fn (event)
                        callback $ parse-cirru-edn
                          unsafe-coerce (.-data event) 'String
                  js/console.warn "|missing running ws instance"
          :examples $ []
            quote $ ws-set-on-data!
              fn (data) (println "|New message:" data)
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'Dynamic
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.client $ :require
            [] ws-edn.util :refer $ [] when-let parse-data stringify-data
    |ws-edn.schema $ %{} 'FileEntry
      :defs $ {}
        |Track $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstruct Track (:message 'String) (:time 'String)
          :examples $ []
          :schema $ :: 'Struct
        |decode-track $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defn decode-track (value) (decode-map-as value Track)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Track)
              :args $ [] 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |decodes-track-map)
              :code $ quote
                assert=
                  %{} Track (:message |hello) (:time |now)
                  decode-track $ {} (:message |hello) (:time |now)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-missing-time)
              :code $ quote
                is-throws $ decode-track
                  {} $ :message |hello
              :tags $ #{} :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.schema $ :require
            calcit.test :refer $ assert= is-throws
    |ws-edn.server $ %{} 'FileEntry
      :defs $ {}
        |*global-connections $ %{} 'CodeEntry (:doc "|Global atom that stores active WebSocket connections as a map of session-id to socket.")
          :code $ quote
            defatom *global-connections $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        |*proxied-data-listener $ %{} 'CodeEntry (:doc "|Global atom that stores the data listener callback function. Used internally for message handling.")
          :code $ quote (defatom *proxied-data-listener nil)
          :examples $ []
          :schema $ :: 'Dynamic
        |maintain-socket! $ %{} 'CodeEntry (:doc "|Registers and maintains a WebSocket connection. Sets up event handlers for message, close, and error events. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ quote
            defn maintain-socket! (socket options)
              let
                  sid $ nanoid
                swap! *global-connections assoc sid socket
                when-let
                  on-open $ get options :on-open
                  let
                      callback $ unsafe-coerce on-open 'Fn
                    callback sid socket
                reset! *proxied-data-listener $ get options :on-data
                .!on socket |message $ fn (raw-data binary?)
                  when-let (on-data @*proxied-data-listener)
                    let
                        callback $ unsafe-coerce on-data 'Fn
                      callback sid $ parse-cirru-edn
                        unsafe-coerce (.!toString raw-data) 'String
                        &map:get options :class-mapper
                .!on socket |close $ fn (event binary?) (swap! *global-connections dissoc sid)
                  when-let
                    on-close $ get options :on-close
                    let
                        callback $ unsafe-coerce on-close 'Fn
                      callback sid event
                .!on socket |error $ fn (error) (swap! *global-connections dissoc sid)
                  when-let
                    on-error $ get options :on-error
                    let
                        callback $ unsafe-coerce on-error 'Fn
                      callback error
          :examples $ []
          :schema $ :: 'Dynamic
        |wss-each! $ %{} 'CodeEntry (:doc "|Iterates over all active WebSocket connections. Handler function receives session-id and socket as arguments.")
          :code $ quote
            defn wss-each! (handler)
              &doseq
                pair $ .to-list @*global-connections
                let[] (sid socket) pair $ handler sid socket
          :examples $ []
            quote $ wss-each!
              fn (sid socket) (println |Session: sid)
          :schema $ :: 'Dynamic
        |wss-send! $ %{} 'CodeEntry (:doc "|Sends data to a specific WebSocket connection identified by session-id. Data will be formatted as Cirru EDN before sending.")
          :code $ quote
            defn wss-send! (sid data)
              do $ let
                  socket $ get @*global-connections sid
                if (some? socket)
                  .!send socket $ format-cirru-edn data
                  js/console.warn "|socket not found for" sid
                , nil
          :examples $ []
            quote $ wss-send! |session-123
              {} (:type |notification) (:message "|Hello client")
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'String 'Dynamic
              :features $ #{} :js-ffi
        |wss-serve! $ %{} 'CodeEntry (:doc "|Starts a WebSocket server on the specified port. Accepts options map with :cert, :key (for SSL), :on-listening, :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ quote
            defn wss-serve! (port options)
              assert "|first argument is port" $ number? port
              assert "|SSL requires both :cert and :key options" $ =
                option:some? $ get options :cert
                option:some? $ get options :key
              let
                  wss $ if
                    option:some? $ get options :cert
                    new WebSocketServer $ let
                        ssl-options $ js-object
                          :key $ fs/readFileSync
                            option:unwrap $ get options :key
                          :cert $ fs/readFileSync
                            option:unwrap $ get options :cert
                        server $ https/createServer ssl-options
                          fn (req res) (.!writeHead res 200) (.!end res "|WSS Server")
                      .!addListener server |upgrade $ fn (req res head)
                        js/console.log $ .-url req
                      .!on server |error $ fn (err) (js/console.error err)
                      .!listen server port $ fn () (println "|server at" port)
                      js-object (:server server) (:path |/)
                    new WebSocketServer $ js-object (:port port)
                .!on wss |connection $ fn (socket ? req) (maintain-socket! socket options)
                .!on wss |listening $ fn ()
                  when-let
                    on-listening $ get options :on-listening
                    let
                        callback $ unsafe-coerce on-listening 'Fn
                      callback
                .!on wss |error $ fn (error)
                  if-let
                    on-error $ get options :on-error
                    let
                        callback $ unsafe-coerce on-error 'Fn
                      callback error
                    js/console.error error
          :examples $ []
            quote $ wss-serve! 8080
              {}
                :on-listening $ fn () (println "|Server listening on 8080")
                :on-data $ fn (sid data) (println "|Received from" sid : data)
          :schema $ :: 'Fn
            {} (:return 'Dynamic)
              :args $ [] 'Dynamic 'Dynamic
              :features $ #{} :js-ffi
        |wss-set-on-data! $ %{} 'CodeEntry (:doc "|Sets the message handler for incoming WebSocket data across all connections. Handler receives session-id and parsed Cirru EDN data.")
          :code $ quote
            defn wss-set-on-data! (on-data) (reset! *proxied-data-listener on-data)
          :examples $ []
            quote $ wss-set-on-data!
              fn (sid data) (println "|New message from" sid : data)
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.server $ :require
            |ws :refer $ WebSocketServer
            ws-edn.util :refer $ when-let parse-data
            |nanoid :refer $ nanoid
            |https :as https
            |fs :as fs
    |ws-edn.util $ %{} 'FileEntry
      :defs $ {}
        |when-let $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defmacro when-let (pair & body)
              assert "|expected 2 tokens" $ and (list? pair)
                = 2 $ count pair
              quasiquote $ &let ~pair
                when
                  some? $ ~ (first pair)
                  , ~@body
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns ws-edn.util)
