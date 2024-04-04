
{} (:package |ws-edn)
  :configs $ {} (:init-fn |ws-edn.app.page/main!) (:reload-fn |ws-edn.app.page/reload!) (:version |0.0.10)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |ws-edn.app.server/main!) (:reload-fn |ws-edn.app.server/reload!) (:storage-key |calcit.cirru)
      :modules $ []
  :files $ {}
    |ws-edn.app.page $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"start") (load-console-formatter!)
              ws-connect! (do "\"wss://localhost:5001" "\"ws://localhost:9001")
                {}
                  :on-open $ fn (event) (println "\"open")
                    ws-send! $ : test
                  :on-data $ fn (data) (js/console.log "\"data" data)
                  :on-close $ fn (event) (println "\"close")
                  :class-mapper $ {} (:Track Track)
              js/setInterval
                fn ()
                  println "\"connected try send" $ ws-connected?
                  ws-send! $ {} (:data "\"just message")
                  ws-send! $ : message "\"in" "\"string"
                  ws-send! $ %{} Track (:message "\"from client")
                    :time $ .!toISOString (new js/Date)
                , 2000
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! ()
              ws-set-on-data! $ fn (data) (println "\"reloaded 8:" data)
              println "\"reload"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns ws-edn.app.page $ :require
            ws-edn.client :refer $ ws-connect! ws-send! ws-connected? ws-set-on-data!
            ws-edn.schema :refer $ Track
    |ws-edn.app.server $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"started") (load-console-formatter!)
              wss-serve! 9001 $ {}
                :on-listening $ fn () (println "\"server listening")
                :on-open $ fn (sid socket) (println "\"opened" sid)
                  wss-send! sid $ : op "\"initial message"
                :on-data $ fn (sid data) (js/console.log "\"just data" sid data)
                :on-close $ fn (sid event) (println "\"close" sid)
                ; :key "\"certs/key.pem"
                ; :cert "\"certs/cert.pem"
                :class-mapper $ {} (:Track Track)
              js/setInterval
                fn () (println "\"heartbeat")
                  wss-each! $ fn (sid socket) (js/console.log sid)
                    wss-send! sid $ : message "\"event 2s"
                    wss-send! sid $ %{} Track (:message "\"from server")
                      :time $ -> js/Date new (.!toISOString)
                , 2000
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! ()
              wss-set-on-data! $ fn (sid data) (js/console.log "\"reloaded 8:" sid data)
              println "\"reload!"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns ws-edn.app.server $ :require
            ws-edn.server :refer $ wss-serve! wss-send! wss-each! wss-set-on-data!
            ws-edn.schema :refer $ Track
    |ws-edn.client $ %{} :FileEntry
      :defs $ {}
        |*global-ws $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *global-ws nil)
        |ws-connect! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn ws-connect! (ws-url options)
              assert "\"reqiured an url for ws server" $ string? ws-url
              let
                  ws $ new js/WebSocket ws-url
                reset! *global-ws ws
                when-let
                  on-open $ :on-open options
                  set! (.-onopen ws)
                    fn (event) (on-open event)
                set! (.-onclose ws)
                  fn (event) (reset! *global-ws nil)
                    when-let
                      on-close $ :on-close options
                      on-close event
                when-let
                  on-data $ :on-data options
                  set! (.-onmessage ws)
                    fn (event)
                      on-data $ parse-cirru-edn (.-data event) (&map:get options :class-mapper)
                set! (.-onerror ws)
                  fn (error) (js/console.error "\"Failed to establish connection" error)
                    when-let
                      on-error $ :on-error options
                      on-error error
        |ws-connected? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn ws-connected? () $ some? @*global-ws
        |ws-send! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn ws-send! (data)
              let
                  ws @*global-ws
                if (some? ws)
                  .!send ws $ format-cirru-edn data
                  js/console.warn "|WebSocket at close state!"
        |ws-set-on-data! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn ws-set-on-data! (on-data)
              let
                  ws @*global-ws
                if (some? ws)
                  set! (.-onmessage ws)
                    fn (event)
                      on-data $ parse-cirru-edn (.-data event)
                  js/console.warn "\"missing running ws instance"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns ws-edn.client $ :require
            [] ws-edn.util :refer $ [] when-let parse-data stringify-data
    |ws-edn.schema $ %{} :FileEntry
      :defs $ {}
        |Track $ %{} :CodeEntry (:doc |)
          :code $ quote
            def Track $ new-class-record TrackMethods :Track :message :time
        |TrackMethods $ %{} :CodeEntry (:doc |)
          :code $ quote
            defrecord! TrackMethods $ :log
              fn (self)
                js/console.log (get self :time) "\"-" $ get self :message
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns ws-edn.schema)
    |ws-edn.server $ %{} :FileEntry
      :defs $ {}
        |*global-connections $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *global-connections $ {}
        |*proxied-data-listener $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *proxied-data-listener nil)
        |maintain-socket! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn maintain-socket! (socket options)
              let
                  sid $ nanoid
                swap! *global-connections assoc sid socket
                when-let
                  on-open $ :on-open options
                  on-open sid socket
                reset! *proxied-data-listener $ :on-data options
                .!on socket "\"message" $ fn (raw-data binary?)
                  when-let (on-data @*proxied-data-listener)
                    on-data sid $ parse-cirru-edn (.!toString raw-data) (&map:get options :class-mapper)
                .!on socket "\"close" $ fn (event binary?) (swap! *global-connections dissoc sid)
                  when-let
                    on-close $ :on-close options
                    on-close sid event
                .!on socket "\"error" $ fn (error) (swap! *global-connections dissoc sid)
                  &let
                    on-error $ :on-error options
                    if (some? on-error) (on-error error) (js/console.error error)
        |wss-each! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wss-each! (handler)
              &doseq
                pair $ .to-list @*global-connections
                let[] (sid socket) pair $ handler sid socket
        |wss-send! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wss-send! (sid data)
              let
                  socket $ get @*global-connections sid
                if (some? socket)
                  .!send socket $ format-cirru-edn data
                  js/console.warn "\"socket not found for" sid
        |wss-serve! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wss-serve! (port options)
              assert "\"first argument is port" $ number? port
              let
                  wss $ if
                    some? $ :cert options
                    new WebSocketServer $ let
                        ssl-options $ js-object
                          :key $ fs/readFileSync (:key options)
                          :cert $ fs/readFileSync (:cert options)
                        server $ https/createServer ssl-options
                          fn (req res) (.!writeHead res 200) (.!end res "\"WSS Server")
                      .!addListener server "\"upgrade" $ fn (req res head)
                        js/console.log $ .-url req
                      .!on server "\"error" $ fn (err) (js/console.error err)
                      .!listen server port $ fn () (println "\"server at" port)
                      js-object (:server server) (:path "\"/")
                    new WebSocketServer $ js-object (:port port)
                .!on wss "\"connection" $ fn (socket ? req) (maintain-socket! socket options)
                .!on wss "\"listening" $ fn ()
                  let
                      on-listening $ :on-listening options
                    if (some? on-listening) (on-listening)
                .!on wss "\"error" $ fn (error)
                  let
                      on-error $ :on-error options
                    if (some? on-error) (on-error error) (js/console.error error)
        |wss-set-on-data! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wss-set-on-data! (on-data) (reset! *proxied-data-listener on-data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns ws-edn.server $ :require
            "\"ws" :refer $ WebSocketServer
            ws-edn.util :refer $ when-let parse-data
            "\"nanoid" :refer $ nanoid
            "\"https" :as https
            "\"fs" :as fs
    |ws-edn.util $ %{} :FileEntry
      :defs $ {}
        |when-let $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro when-let (pair & body)
              assert "\"expected 2 tokens" $ and (list? pair)
                = 2 $ count pair
              quasiquote $ &let ~pair
                when
                  some? $ ~ (first pair)
                  , ~@body
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns ws-edn.util)
