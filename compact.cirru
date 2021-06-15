
{} (:package |ws-edn)
  :configs $ {} (:init-fn |ws-edn.app.server/main!) (:reload-fn |ws-edn.app.server/reload!) (:modules nil) (:version |0.0.3)
  :files $ {}
    |ws-edn.client $ {}
      :ns $ quote
        ns ws-edn.client $ :require
          [] ws-edn.util :refer $ [] when-let parse-data stringify-data
      :defs $ {}
        |*global-ws $ quote (defatom *global-ws nil)
        |ws-connect! $ quote
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
        |ws-connected? $ quote
          defn ws-connected? () $ some? @*global-ws
        |ws-send! $ quote
          defn ws-send! (data)
            let
                ws @*global-ws
              if (some? ws)
                .!send ws $ format-cirru-edn data
                js/console.warn "|WebSocket at close state!"
        |ws-set-on-data! $ quote
          defn ws-set-on-data! (on-data)
            let
                ws @*global-ws
              if (some? ws)
                set! (.-onmessage ws)
                  fn (event)
                    on-data $ parse-cirru-edn (.-data event)
                js/console.warn "\"missing running ws instance"
      :proc $ quote ()
    |ws-edn.server $ {}
      :ns $ quote
        ns ws-edn.server $ :require ([] "\"ws" :as ws)
          [] ws-edn.util :refer $ [] when-let parse-data
          [] "\"shortid" :as shortid
      :defs $ {}
        |*global-connections $ quote
          defatom *global-connections $ {}
        |maintain-socket! $ quote
          defn maintain-socket! (socket options)
            let
                sid $ shortid/generate
              swap! *global-connections assoc sid socket
              when-let
                on-open $ :on-open options
                on-open sid socket
              reset! *proxied-data-listener $ :on-data options
              .on socket "\"message" $ fn (raw-data)
                when-let (on-data @*proxied-data-listener)
                  on-data sid $ parse-cirru-edn raw-data
              .on socket "\"close" $ fn (event ? arg) (swap! *global-connections dissoc sid)
                when-let
                  on-close $ :on-close options
                  on-close sid event
              .on socket "\"error" $ fn (error) (swap! *global-connections dissoc sid)
                &let
                  on-error $ :on-error options
                  if (some? on-error) (on-error error) (js/console.error error)
        |wss-each! $ quote
          defn wss-each! (handler)
            &doseq
              pair $ to-pairs @*global-connections
              let[] (sid socket) pair $ handler sid socket
        |wss-send! $ quote
          defn wss-send! (sid data)
            let
                socket $ get @*global-connections sid
              if (some? socket)
                .!send socket $ format-cirru-edn data
                js/console.warn "\"socket not found for" sid
        |wss-serve! $ quote
          defn wss-serve! (port options)
            assert (number? port) "\"first argument is port"
            let
                wss $ new ws/Server
                  js-object $ "\"port" port
              .!on wss "\"connection" $ fn (socket ? req) (maintain-socket! socket options)
              .!on wss "\"listening" $ fn ()
                let
                    on-listening $ :on-listening options
                  if (some? on-listening) (on-listening)
              .!on wss "\"error" $ fn (error)
                let
                    on-error $ :on-error options
                  if (some? on-error) (on-error error) (js/console.error error)
        |*proxied-data-listener $ quote (defatom *proxied-data-listener nil)
        |wss-set-on-data! $ quote
          defn wss-set-on-data! (on-data) (reset! *proxied-data-listener on-data)
      :proc $ quote ()
    |ws-edn.util $ {}
      :ns $ quote (ns ws-edn.util)
      :defs $ {}
        |when-let $ quote
          defmacro when-let (pair & body)
            assert "\"expected 2 tokens" $ and (list? pair)
              = 2 $ count pair
            quasiquote $ &let ~pair
              when
                some? $ ~ (first pair)
                , ~@body
      :proc $ quote ()
      :configs $ {}
    |ws-edn.app.server $ {}
      :ns $ quote
        ns ws-edn.app.server $ :require
          [] ws-edn.server :refer $ [] wss-serve! wss-send! wss-each! wss-set-on-data!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"started")
            wss-serve! 5001 $ {}
              :on-listening $ fn () (println "\"server listening")
              :on-open $ fn (sid socket) (println "\"opened" sid)
                wss-send! sid $ {} (:op "\"initial message")
              :on-data $ fn (sid data) (println "\"just data" sid data)
              :on-close $ fn (sid event) (println "\"close" sid)
            js/setInterval
              fn () (println "\"heartbeat")
                wss-each! $ fn (sid socket) (js/console.log sid)
                  wss-send! sid $ {} (:message "\"event 2s")
              , 2000
        |reload! $ quote
          defn reload! ()
            wss-set-on-data! $ fn (sid data) (println "\"reloaded 8:" sid data)
            println "\"reload!"
      :proc $ quote ()
    |ws-edn.app.page $ {}
      :ns $ quote
        ns ws-edn.app.page $ :require
          [] ws-edn.client :refer $ [] ws-connect! ws-send! ws-connected? ws-set-on-data!
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"start")
            ws-connect! "\"ws://localhost:5001" $ {}
              :on-open $ fn (event) (println "\"open")
                ws-send! $ {} (:op :test)
              :on-data $ fn (data) (println "\"data" data)
              :on-close $ fn (event) (println "\"close")
            js/setInterval
              fn ()
                println "\"connected try send" $ ws-connected?
                ws-send! $ {} (:data "\"just message")
              , 2000
        |reload! $ quote
          defn reload! ()
            ws-set-on-data! $ fn (data) (println "\"reloaded 8:" data)
            println "\"reload"
      :proc $ quote ()
