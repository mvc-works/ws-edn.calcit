
{} (:package |ws-edn)
  :configs $ {} (:init-fn |ws-edn.app.page/main!) (:reload-fn |ws-edn.app.page/reload!) (:version |0.0.8)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |ws-edn.app.server/main!) (:reload-fn |ws-edn.app.server/reload!) (:storage-key |calcit.cirru)
      :modules $ []
  :files $ {}
    |ws-edn.app.page $ {}
      :defs $ {}
        |main! $ %{} :CodeEntry
          :code $ quote
            defn main! () (println "\"start") (load-console-formatter!)
              ws-connect! "\"wss://localhost:5001" $ {}
                :on-open $ fn (event) (println "\"open")
                  ws-send! $ : test
                :on-data $ fn (data) (println "\"data" data)
                :on-close $ fn (event) (println "\"close")
              js/setInterval
                fn ()
                  println "\"connected try send" $ ws-connected?
                  ws-send! $ {} (:data "\"just message")
                  ws-send! $ : message "\"in" "\"string"
                , 2000
          :doc |
        |reload! $ %{} :CodeEntry
          :code $ quote
            defn reload! ()
              ws-set-on-data! $ fn (data) (println "\"reloaded 8:" data)
              println "\"reload"
          :doc |
      :ns $ %{} :CodeEntry
        :code $ quote
          ns ws-edn.app.page $ :require
            [] ws-edn.client :refer $ [] ws-connect! ws-send! ws-connected? ws-set-on-data!
        :doc |
    |ws-edn.app.server $ {}
      :defs $ {}
        |main! $ %{} :CodeEntry
          :code $ quote
            defn main! () (println "\"started")
              wss-serve! 5001 $ {}
                :on-listening $ fn () (println "\"server listening")
                :on-open $ fn (sid socket) (println "\"opened" sid)
                  wss-send! sid $ : op "\"initial message"
                :on-data $ fn (sid data) (println "\"just data" sid data)
                :on-close $ fn (sid event) (println "\"close" sid)
                :key "\"certs/key.pem"
                :cert "\"certs/cert.pem"
              js/setInterval
                fn () (println "\"heartbeat")
                  wss-each! $ fn (sid socket) (js/console.log sid)
                    wss-send! sid $ : message "\"event 2s"
                , 2000
          :doc |
        |reload! $ %{} :CodeEntry
          :code $ quote
            defn reload! ()
              wss-set-on-data! $ fn (sid data) (println "\"reloaded 8:" sid data)
              println "\"reload!"
          :doc |
      :ns $ %{} :CodeEntry
        :code $ quote
          ns ws-edn.app.server $ :require
            [] ws-edn.server :refer $ [] wss-serve! wss-send! wss-each! wss-set-on-data!
        :doc |
    |ws-edn.client $ {}
      :defs $ {}
        |*global-ws $ %{} :CodeEntry
          :code $ quote (defatom *global-ws nil)
          :doc |
        |ws-connect! $ %{} :CodeEntry
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
                      on-data $ parse-cirru-edn (.-data event)
                set! (.-onerror ws)
                  fn (error) (js/console.error "\"Failed to establish connection" error)
                    when-let
                      on-error $ :on-error options
                      on-error error
          :doc |
        |ws-connected? $ %{} :CodeEntry
          :code $ quote
            defn ws-connected? () $ some? @*global-ws
          :doc |
        |ws-send! $ %{} :CodeEntry
          :code $ quote
            defn ws-send! (data)
              let
                  ws @*global-ws
                if (some? ws)
                  .!send ws $ format-cirru-edn data
                  js/console.warn "|WebSocket at close state!"
          :doc |
        |ws-set-on-data! $ %{} :CodeEntry
          :code $ quote
            defn ws-set-on-data! (on-data)
              let
                  ws @*global-ws
                if (some? ws)
                  set! (.-onmessage ws)
                    fn (event)
                      on-data $ parse-cirru-edn (.-data event)
                  js/console.warn "\"missing running ws instance"
          :doc |
      :ns $ %{} :CodeEntry
        :code $ quote
          ns ws-edn.client $ :require
            [] ws-edn.util :refer $ [] when-let parse-data stringify-data
        :doc |
    |ws-edn.server $ {}
      :defs $ {}
        |*global-connections $ %{} :CodeEntry
          :code $ quote
            defatom *global-connections $ {}
          :doc |
        |*proxied-data-listener $ %{} :CodeEntry
          :code $ quote (defatom *proxied-data-listener nil)
          :doc |
        |maintain-socket! $ %{} :CodeEntry
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
                    on-data sid $ parse-cirru-edn (.!toString raw-data)
                .!on socket "\"close" $ fn (event binary?) (swap! *global-connections dissoc sid)
                  when-let
                    on-close $ :on-close options
                    on-close sid event
                .!on socket "\"error" $ fn (error) (swap! *global-connections dissoc sid)
                  &let
                    on-error $ :on-error options
                    if (some? on-error) (on-error error) (js/console.error error)
          :doc |
        |wss-each! $ %{} :CodeEntry
          :code $ quote
            defn wss-each! (handler)
              &doseq
                pair $ .to-list @*global-connections
                let[] (sid socket) pair $ handler sid socket
          :doc |
        |wss-send! $ %{} :CodeEntry
          :code $ quote
            defn wss-send! (sid data)
              let
                  socket $ get @*global-connections sid
                if (some? socket)
                  .!send socket $ format-cirru-edn data
                  js/console.warn "\"socket not found for" sid
          :doc |
        |wss-serve! $ %{} :CodeEntry
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
          :doc |
        |wss-set-on-data! $ %{} :CodeEntry
          :code $ quote
            defn wss-set-on-data! (on-data) (reset! *proxied-data-listener on-data)
          :doc |
      :ns $ %{} :CodeEntry
        :code $ quote
          ns ws-edn.server $ :require
            "\"ws" :refer $ WebSocketServer
            ws-edn.util :refer $ when-let parse-data
            "\"nanoid" :refer $ nanoid
            "\"https" :as https
            "\"fs" :as fs
        :doc |
    |ws-edn.util $ {}
      :defs $ {}
        |when-let $ %{} :CodeEntry
          :code $ quote
            defmacro when-let (pair & body)
              assert "\"expected 2 tokens" $ and (list? pair)
                = 2 $ count pair
              quasiquote $ &let ~pair
                when
                  some? $ ~ (first pair)
                  , ~@body
          :doc |
      :ns $ %{} :CodeEntry
        :code $ quote (ns ws-edn.util)
        :doc |
