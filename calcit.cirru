
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |ws-edn
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'ws-edn.app.page/main!) (:mode :native) (:reload-fn 'ws-edn.app.page/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |cumulo-util.calcit/ |js-ffi/
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'ws-edn.app.server/main!) (:mode :native) (:reload-fn 'ws-edn.app.server/reload!) (:target :node)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'ws-edn.app.page $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println |start) (load-console-formatter!)
            ws-connect! (do |wss://localhost:5001 |ws://localhost:9001)
              {}
                :on-open $ fn (event) (println |open)
                  ws-send! $ : test
                :on-data $ fn (data) (js/console.log |data data)
                :on-close $ fn (event) (println |close)
                :class-mapper $ {} $ :Track Track
            js/setInterval
              fn ()
                println "|connected try send" $ ws-connected?
                ws-send! $ {} $ :data "|just message"
                ws-send! $ : message |in |string
                ws-send! $ Track :message "|from client" :time $ current-iso-time!
              , 2000
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            ws-set-on-data! $ fn (data) (println "|reloaded 8:" data)
            println |reload
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.app.page
          :require
            ws-edn.client :refer $ ws-connect! ws-send! ws-connected? ws-set-on-data!
            ws-edn.schema :refer $ Track
            ws-edn.util :refer $ current-iso-time!
    'ws-edn.app.server $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println |started) (load-console-formatter!)
            wss-serve! 9001 $ {}
              :on-listening $ fn () $ println "|server listening"
              :on-open $ fn (sid socket) (println |opened sid)
                wss-send! sid $ : op "|initial message"
              :on-data $ fn (sid data) (js/console.log "|just data" sid data)
              :on-close $ fn (sid event) (println |close sid)
              ; :key |certs/key.pem
              ; :cert |certs/cert.pem
              :class-mapper $ {} $ :Track Track
            js/setInterval
              fn () (println |heartbeat)
                wss-each! $ fn (sid socket) (js/console.log sid)
                  wss-send! sid $ : message "|event 2s"
                  wss-send! sid $ Track :message "|from server" :time $ current-iso-time!
              , 2000
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            wss-set-on-data! $ fn (sid data) (js/console.log "|reloaded 8:" sid data) &unit
            println |reload!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.app.server
          :require
            ws-edn.server :refer $ wss-serve! wss-send! wss-each! wss-set-on-data!
            ws-edn.schema :refer $ Track
            ws-edn.util :refer $ current-iso-time!
    'ws-edn.client $ %{} 'FileEntry
      :defs $ {}
        '*global-client $ %{} 'CodeEntry
          :doc "|Global Ref that stores the WebSocket instance. Used internally to track the current connection."
          :code $ quote $ defref *global-client (Option :none)
          :examples $ []
          :schema $ :: 'Ref $ :: 'calcit.core/Option 'ws-edn.client/WsClient
        'BrowserMessageEventHost $ %{} 'CodeEntry
          :doc "|Typed message-event payload exposed by browser WebSocket callbacks."
          :code $ quote $ deftrait BrowserMessageEventHost (:data 'String)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'BrowserWebSocketHost $ %{} 'CodeEntry
          :doc "|Typed browser WebSocket surface used by the client lifecycle adapter."
          :code $ quote $ deftrait BrowserWebSocketHost (:onopen 'Fn) (:onmessage 'Fn) (:onclose 'Fn) (:onerror 'Fn)
            .send $ :: 'Fn $ {}
              :args $ [] 'BrowserWebSocketHost 'String
              :return 'Unit
            .close $ :: 'Fn $ {}
              :args $ [] 'BrowserWebSocketHost
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :writable $ #{} :onclose :onerror :onmessage :onopen
          :schema $ :: 'Trait
        'WsClient $ %{} 'CodeEntry
          :doc "|Browser WebSocket client with nominal lifecycle methods."
          :code $ quote $ def WsClient (impl-traits WsClient0 WsClientOpsImpl)
          :examples $ []
          :schema $ :: 'StructDef
        'WsClient0 $ %{} 'CodeEntry
          :doc "|Raw browser client handle before attaching lifecycle methods."
          :code $ quote $ defstruct WsClient0
            :state $ :: 'Ref 'WsClientState
            :url 'String
            :options $ :: 'Map 'Tag 'Dynamic
            :on-data $ :: 'Ref $ :: 'Option 'Fn
            :socket-factory $ :: 'Fn $ {}
              :args $ [] 'String
              :return 'ws-edn.client/BrowserWebSocketHost
              :features $ #{} :js-ffi
            :lifecycle-cleanup $ :: 'Ref $ :: 'Option 'Fn
            :retry-state $ :: 'Ref 'cumulo-util.realtime/RetryBackoff
            :reconnect-timer $ :: 'Ref $ :: 'Option 'Number
            :heartbeat-timeout-ms $ :: 'Option 'Number
            :heartbeat-lease $ :: 'Ref $ :: 'Option 'cumulo-util.realtime/HeartbeatLease
            :heartbeat-timer $ :: 'Ref $ :: 'Option 'Number
          :examples $ []
          :schema $ :: 'StructDef
        'WsClientOps $ %{} 'CodeEntry (:doc "|Method contract for browser WebSocket clients.")
          :code $ quote $ deftrait WsClientOps
            .connected? $ :: 'Fn $ {}
              :generics $ [] 'T
              :args $ [] 'T
              :return 'Bool
            .send $ :: 'Fn $ {}
              :generics $ [] 'T 'D
              :args $ [] 'T 'D
              :return 'WsSendOutcome
            .close $ :: 'Fn $ {}
              :generics $ [] 'T
              :args $ [] 'T
              :return 'Unit
            .reconnect $ :: 'Fn $ {}
              :generics $ [] 'T
              :args $ [] 'T
              :return 'Unit
          :examples $ []
          :schema $ :: 'Trait
        'WsClientOpsImpl $ %{} 'CodeEntry (:doc "|Lifecycle method implementation for WsClient.")
          :code $ quote $ defimpl WsClientOpsImpl WsClientOps (.connected? client-connected?) (.send client-send) (.close client-close!) (.reconnect client-reconnect!)
          :examples $ []
          :schema $ :: 'Impl
        'WsClientState $ %{} 'CodeEntry
          :doc "|Generation, phase, and current host socket for one browser client."
          :code $ quote $ defstruct WsClientState (:generation 'Number) (:phase 'WsConnectionPhase)
            :socket $ :: 'Option 'BrowserWebSocketHost
          :examples $ []
          :schema $ :: 'StructDef
        'WsConnectionPhase $ %{} 'CodeEntry (:doc "|Explicit browser WebSocket lifecycle phase.")
          :code $ quote $ defenum WsConnectionPhase (:connecting) (:open) (:backoff) (:closing) (:closed)
          :examples $ []
          :schema $ :: 'EnumDef
        'WsSendOutcome $ %{} 'CodeEntry
          :doc "|Typed outcome from attempting a browser WebSocket send."
          :code $ quote $ defenum WsSendOutcome (:sent) (:not-open 'WsConnectionPhase)
          :examples $ []
          :schema $ :: 'EnumDef
        'cancel-client-heartbeat! $ %{} 'CodeEntry
          :doc "|Cancels and clears the heartbeat deadline timer and lease."
          :code $ quote $ defn cancel-client-heartbeat! (client)
            let
                timer-ref $ :heartbeat-timer client
              match @timer-ref
                (:some timer) (js/clearTimeout timer)
                (:none) &unit
              reset! timer-ref $ Option :none
              reset! (:heartbeat-lease client) (Option :none)
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'cancel-client-reconnect! $ %{} 'CodeEntry
          :doc "|Cancels and clears the single pending reconnect timer."
          :code $ quote $ defn cancel-client-reconnect! (client)
            let
                timer-ref $ :reconnect-timer client
              match @timer-ref
                (:some timer)
                  do (js/clearTimeout timer)
                    reset! timer-ref $ Option :none
                    , &unit
                (:none) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'checked-message-text $ %{} 'CodeEntry (:doc "|在浏览器 WebSocket 边界确认消息为文本。")
          :code $ quote $ defn checked-message-text (data)
            if (string? data) data $ raise "|ws-edn expected a text WebSocket message"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'T
            :features $ #{} :js-ffi
            :generics $ [] 'T
        'checked-now-ms $ %{} 'CodeEntry (:doc "|读取浏览器当前毫秒时间，并在 JS 边界检查其为 Number。")
          :code $ quote $ defn checked-now-ms ()
            &let
              now $ js/Date.now
              if (number? now) now $ raise "|ws-edn expected Date.now to return a Number"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'checked-random-number $ %{} 'CodeEntry (:doc "|在 JS 边界读取随机数并检查其为 Number。")
          :code $ quote $ defn checked-random-number ()
            &let
              value $ js/Math.random
              if (number? value) value $ raise "|ws-edn expected Math.random to return a Number"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'cleanup-client-lifecycle! $ %{} 'CodeEntry
          :doc "|Runs and clears the optional browser lifecycle cleanup capability."
          :code $ quote $ defn cleanup-client-lifecycle! (client)
            let
                cleanup-ref $ :lifecycle-cleanup client
              match @cleanup-ref
                (:some cleanup)
                  do (cleanup)
                    reset! cleanup-ref $ Option :none
                    , &unit
                (:none) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
        'client-close! $ %{} 'CodeEntry
          :doc "|Method implementation for explicitly closing a client."
          :code $ quote $ defn client-close! (client) (cancel-client-reconnect! client) (cancel-client-heartbeat! client) (cleanup-client-lifecycle! client)
            let
                state-ref $ :state client
                state @state-ref
              assert-type state WsClientState
              match (:socket state)
                (:some socket)
                  do
                    reset! state-ref $ assoc state :phase $ WsConnectionPhase :closing
                    .!close socket
                    , &unit
                (:none)
                  do
                    reset! state-ref $ assoc state :phase $ WsConnectionPhase :closed
                    , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'client-connected? $ %{} 'CodeEntry
          :doc "|Method implementation for checking the open phase."
          :code $ quote $ defn client-connected? (client)
            let
                state $ deref $ :state client
              assert-type state WsClientState
              = (WsConnectionPhase :open) (:phase state)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'WsClient0
        'client-option-callback $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn client-option-callback (options key)
            let
                value $ &map:get options key
              if (fn? value) (Option :some value) (Option :none)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag
            :features $ #{} :js-ffi
            :return $ :: 'Option 'Fn
          :tests $ []
            %{} 'TestEntry (:name |rejects-missing-callback)
              :code $ quote $ assert= (Option :none)
                client-option-callback ({}) :on-data
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-number-callback)
              :code $ quote $ assert= (Option :none)
                client-option-callback
                  {} $ :on-data 42
                  , :on-data
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-tag-callback)
              :code $ quote $ assert= (Option :none)
                client-option-callback
                  {} $ :on-data :event
                  , :on-data
              :tags $ #{} :unit
            %{} 'TestEntry (:name |preserves-zero-arity-callback)
              :code $ quote $ let
                  callback $ fn () &unit
                assert= (Option :some callback)
                  client-option-callback
                    {} $ :on-data callback
                    , :on-data
              :tags $ #{} :unit
            %{} 'TestEntry (:name |preserves-one-arity-callback)
              :code $ quote $ let
                  callback $ fn (data) &unit
                assert= (Option :some callback)
                  client-option-callback
                    {} $ :on-data callback
                    , :on-data
              :tags $ #{} :unit
        'client-option-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn client-option-number (options key)
            let
                value $ &map:get options key
              if (number? value) (Option :some value) (Option :none)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag
            :features $ #{} :js-ffi
            :return $ :: 'calcit.core/Option 'Number
          :tests $ []
            %{} 'TestEntry (:name |missing-number-option-is-none)
              :code $ quote $ assert= (Option :none)
                client-option-number ({}) :retry-base-ms
              :tags $ #{} :options-contract :unit
            %{} 'TestEntry (:name |wrong-number-option-is-none)
              :code $ quote $ do
                assert= (Option :none)
                  client-option-number
                    {} $ :retry-base-ms |500
                    , :retry-base-ms
                assert= (Option :none)
                  client-option-number
                    {} $ :retry-base-ms false
                    , :retry-base-ms
                assert= (Option :none)
                  client-option-number
                    {} $ :retry-base-ms nil
                    , :retry-base-ms
              :tags $ #{} :options-contract :unit
            %{} 'TestEntry (:name |zero-number-option-is-preserved)
              :code $ quote $ assert= (Option :some 0)
                client-option-number
                  {} $ :retry-base-ms 0
                  , :retry-base-ms
              :tags $ #{} :options-contract :unit
            %{} 'TestEntry
              :name |number-option-retains-negative-and-fractional-values
              :code $ quote $ do
                assert= (Option :some -1)
                  client-option-number
                    {} $ :retry-base-ms -1
                    , :retry-base-ms
                assert= (Option :some 0.25)
                  client-option-number
                    {} $ :retry-base-ms 0.25
                    , :retry-base-ms
              :tags $ #{} :options-contract :unit
        'client-reconnect! $ %{} 'CodeEntry
          :doc "|Method implementation for replacing the active generation."
          :code $ quote $ defn client-reconnect! (client) (cancel-client-reconnect! client) (connect-client! client)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'client-recover! $ %{} 'CodeEntry
          :doc "|Reconnects from closed or backoff after cancelling a pending timer, preserving single-flight attempts."
          :code $ quote $ defn client-recover! (client)
            let
                state $ deref $ :state client
              assert-type state WsClientState
              if
                or
                  = (WsConnectionPhase :closed) (:phase state)
                  = (WsConnectionPhase :backoff) (:phase state)
                do (cancel-client-reconnect! client) (connect-client! client) &unit
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
        'client-send $ %{} 'CodeEntry
          :doc "|Method implementation returning a typed send outcome."
          :code $ quote $ defn client-send (client data)
            let
                state $ deref $ :state client
              assert-type state WsClientState
              if
                = (WsConnectionPhase :open) (:phase state)
                match (:socket state)
                  (:some socket)
                    do
                      .!send socket $ format-cirru-edn data
                      WsSendOutcome :sent
                  (:none)
                    WsSendOutcome :not-open $ :phase state
                WsSendOutcome :not-open $ :phase state
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'WsSendOutcome)
            :args $ [] 'WsClient0 'D
            :features $ #{} :js-ffi
            :generics $ [] 'D
        'client-state-handle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn client-state-handle (value)
            if (struct? value)
              if (&struct:matches? value WsClient0) value $ raise "|[ws-edn] expected a WsClient state handle"
              raise "|[ws-edn] expected a WsClient state handle"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'WsClient0)
            :args $ [] 'ClientInput
            :generics $ [] 'ClientInput
          :tests $ [] $ %{} 'TestEntry (:name |rejects-invalid-handles)
            :code $ quote $ each
              [] nil 0 false ({}) ([])
                WsClientState :generation 0 :phase (WsConnectionPhase :closed) :socket $ Option :none
              fn (value)
                let
                    rejected? $ ref false
                  try (client-state-handle value)
                    fn (error) (assert= "|[ws-edn] expected a WsClient state handle" error) (reset! rejected? true)
                  assert |invalid-handle-rejected $ deref rejected?
            :tags $ #{} :regression :unit
        'connect-client! $ %{} 'CodeEntry
          :doc "|Starts a new generation and installs stale-event-safe host callbacks."
          :code $ quote $ defn connect-client! (client) (cancel-client-heartbeat! client)
            let
                state-ref $ :state client
                previous @state-ref
              assert-type previous WsClientState
              let
                  generation $ inc $ :generation previous
                  connecting-state $ WsClientState :generation generation :phase (WsConnectionPhase :connecting) :socket $ Option :none
                reset! state-ref connecting-state
                match (:socket previous)
                  (:some socket)
                    do (.!close socket) &unit
                  (:none) &unit
                let
                    socket $
                      :socket-factory client
                      :url client
                  reset! state-ref $ WsClientState :generation generation :phase (WsConnectionPhase :connecting) :socket $ Option :some socket
                  set! (.-onopen socket)
                    fn (event)
                      when (generation-current? @state-ref generation) (cancel-client-reconnect! client)
                        let
                            retry-state $ assert-type
                              deref $ :retry-state client
                              , 'cumulo-util.realtime/RetryBackoff
                          reset! (:retry-state client) (retry-state .reset)
                        reset! state-ref $ assoc @state-ref :phase $ WsConnectionPhase :open
                        renew-client-heartbeat! client generation
                        match
                          client-option-callback (:options client) :on-open
                          (:some callback)
                            let
                                callback $ unsafe-coerce callback $ :: 'Fn
                                  {}
                                    :args $ [] 'Dynamic
                                    :return 'Unit
                              callback event
                          (:none) &unit
                      , &unit
                  set! (.-onmessage socket)
                    fn (event)
                      when (generation-current? @state-ref generation) (renew-client-heartbeat! client generation)
                        match
                          deref $ :on-data client
                          (:some callback)
                            let
                                callback $ unsafe-coerce callback $ :: 'Fn
                                  {}
                                    :args $ [] 'Dynamic
                                    :return 'Unit
                                message-event $ unsafe-coerce event 'BrowserMessageEventHost
                                class-mapper $ &map:get (:options client) :class-mapper
                                parsed $ parse-client-message (.-data message-event)
                                  fn (text) (parse-cirru-edn text class-mapper)
                              match parsed
                                (:ok data) (callback data)
                                (:err message)
                                  let
                                      failure $ new js/Error message
                                    if (notify-client-error! client failure) &unit $ raise message
                          (:none) &unit
                      , &unit
                  set! (.-onclose socket)
                    fn (event)
                      when (generation-current? @state-ref generation) (cancel-client-heartbeat! client)
                        let
                            current-state $ assert-type (deref state-ref) WsClientState
                            explicit-close? $ = (WsConnectionPhase :closing) (:phase current-state)
                          reset! state-ref $ WsClientState :generation generation :phase (WsConnectionPhase :closed) :socket $ Option :none
                          match
                            client-option-callback (:options client) :on-close
                            (:some callback)
                              let
                                  callback $ unsafe-coerce callback $ :: 'Fn
                                    {}
                                      :args $ [] 'Dynamic
                                      :return 'Unit
                                callback event
                            (:none) &unit
                          when (not explicit-close?) (schedule-client-reconnect! client)
                      , &unit
                  set! (.-onerror socket)
                    fn (error)
                      when (generation-current? @state-ref generation) (js/console.error |Failed-to-establish-WebSocket-connection error) (notify-client-error! client error)
                      , &unit
                  , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'create-client-with! $ %{} 'CodeEntry
          :doc "|Creates a client with an injected socket factory, primarily for tests and adapters."
          :code $ quote $ defn create-client-with! (url options socket-factory)
            let
                state-ref $ ref $ WsClientState :generation 0 :phase (%:: WsConnectionPhase :closed) :socket (Option :none)
                on-data-ref $ ref $ assert-type (Option :none) (:: 'Option 'Fn)
                lifecycle-cleanup-ref $ ref $ assert-type (Option :none) (:: 'Option 'Fn)
                retry-base-ms $ match (client-option-number options :retry-base-ms)
                  (:some value) value
                  (:none) 500
                retry-max-ms $ match (client-option-number options :retry-max-ms)
                  (:some value) value
                  (:none) 30000
                retry-jitter $ match (client-option-number options :retry-jitter)
                  (:some value) value
                  (:none) 0.2
                retry-state-ref $ ref $ retry-backoff retry-base-ms retry-max-ms retry-jitter
                reconnect-timer-ref $ ref $ assert-type (Option :none) (:: 'Option 'Number)
                heartbeat-timeout-ms $ client-option-number options :heartbeat-timeout-ms
                heartbeat-lease-ref $ ref $ assert-type (Option :none) (:: 'Option 'cumulo-util.realtime/HeartbeatLease)
                heartbeat-timer-ref $ ref $ assert-type (Option :none) (:: 'Option 'Number)
                client $ %{} WsClient (:state state-ref) (:url url) (:options options) (:on-data on-data-ref) (:socket-factory socket-factory) (:lifecycle-cleanup lifecycle-cleanup-ref) (:retry-state retry-state-ref) (:reconnect-timer reconnect-timer-ref) (:heartbeat-timeout-ms heartbeat-timeout-ms) (:heartbeat-lease heartbeat-lease-ref) (:heartbeat-timer heartbeat-timer-ref)
              match (client-option-callback options :on-data)
                (:some callback)
                  reset! on-data-ref $ Option :some callback
                (:none) &unit
              connect-client! $ client-state-handle client
              , client
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'WsClient)
            :args $ [] 'String (:: 'Map 'Tag 'Dynamic)
              :: 'Fn $ {} (:return 'ws-edn.client/BrowserWebSocketHost)
                :args $ [] 'String
            :features $ #{} :js-ffi
        'generation-current? $ %{} 'CodeEntry
          :doc "|Returns whether an event belongs to the active socket generation."
          :code $ quote $ defn generation-current? (state generation)
            = (:generation state) generation
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'WsClientState 'Number
          :tests $ [] $ %{} 'TestEntry (:name |accepts-only-current-generation)
            :code $ quote $ let
                state $ WsClientState :generation 2 :phase (%:: WsConnectionPhase :connecting) :socket $ Option :none
              assert "|current generation should match" $ = true $ generation-current? state 2
              assert "|stale generation should not match" $ = false $ generation-current? state 1
            :tags $ #{} :unit
        'install-browser-lifecycle! $ %{} 'CodeEntry
          :doc "|Installs visibility and online recovery signals for a browser client."
          :code $ quote $ defn install-browser-lifecycle! (input)
            let
                client $ client-state-handle input
              cleanup-client-lifecycle! client
              let
                  cleanup $ watch-browser-lifecycle!
                    fn (signal)
                      when
                        or (= signal :visible) (= signal :online)
                        client-recover! client
                      , &unit
                    Option :none
                reset! (:lifecycle-cleanup client) (Option :some cleanup)
                , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'ClientInput
            :features $ #{} :js-ffi
            :generics $ [] 'ClientInput
        'notify-client-error! $ %{} 'CodeEntry
          :doc "|调用已有 on-error 一次并报告是否通知；保留开放宿主错误对象与 callback 的异常传播。"
          :code $ quote $ defn notify-client-error! (client error)
            match
              client-option-callback (:options client) :on-error
              (:some callback)
                do (callback error) true
              (:none) false
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'WsClient0 'E
            :features $ #{} :js-ffi
            :generics $ [] 'E
        'parse-client-message $ %{} 'CodeEntry
          :doc "|校验文本帧并用传入的 decoder 解析，返回 Result<Payload,String>；错误不携带原始帧或解析器诊断。payload 类型由 decoder 决定，connect-client! 传入带 class-mapper 的开放 EDN 解析。"
          :code $ quote $ defn parse-client-message (data decode)
            if (string? data)
              try
                Result :ok $ decode data
                fn (message) (Result :err "|[ws-edn/message] invalid Cirru EDN")
              Result :err "|[ws-edn/message] expected a text WebSocket message"
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Data $ :: 'Fn
              {} (:return 'Payload)
                :args $ [] 'String
            :generics $ [] 'Data 'Payload
            :return $ :: 'Result 'Payload 'String
          :tests $ []
            %{} 'TestEntry (:name |valid-open-payloads)
              :code $ quote $ do
                assert= (Result :ok nil)
                  parse-client-message "|do nil" $ fn (text) (parse-cirru-edn text)
                assert= (Result :ok false)
                  parse-client-message "|do false" $ fn (text) (parse-cirru-edn text)
                assert=
                  Result :ok $ [] 1 2
                  parse-client-message "|[] 1 2" $ fn (text) (parse-cirru-edn text)
              :tags $ #{} :message-boundary :unit
            %{} 'TestEntry (:name |rejects-non-text)
              :code $ quote $ do
                assert=
                  Result :err "|[ws-edn/message] expected a text WebSocket message"
                  parse-client-message nil $ fn (text) (parse-cirru-edn text)
                assert=
                  Result :err "|[ws-edn/message] expected a text WebSocket message"
                  parse-client-message 42 $ fn (text) (parse-cirru-edn text)
                assert=
                  Result :err "|[ws-edn/message] expected a text WebSocket message"
                  parse-client-message false $ fn (text) (parse-cirru-edn text)
              :tags $ #{} :message-boundary :unit
            %{} 'TestEntry (:name |rejects-malformed-edn)
              :code $ quote $ assert= (Result :err "|[ws-edn/message] invalid Cirru EDN")
                parse-client-message |{ $ fn (text) (parse-cirru-edn text)
              :tags $ #{} :message-boundary :unit
            %{} 'TestEntry (:name |redacts-private-frame)
              :code $ quote $ assert= (Result :err "|[ws-edn/message] invalid Cirru EDN")
                parse-client-message "|{} $ :token $ unrecognized-private-token-7f12" $ fn (text) (parse-cirru-edn text)
              :tags $ #{} :message-boundary :unit
        'renew-client-heartbeat! $ %{} 'CodeEntry
          :doc "|Renews an enabled heartbeat lease and closes the current generation after its deadline."
          :code $ quote $ defn renew-client-heartbeat! (client generation)
            match (:heartbeat-timeout-ms client)
              (:none) &unit
              (:some timeout-ms)
                do (cancel-client-heartbeat! client)
                  let
                      lease-ref $ :heartbeat-lease client
                      timer-ref $ :heartbeat-timer client
                      state-ref $ :state client
                      now-ms $ checked-now-ms
                      lease $ heartbeat-lease now-ms timeout-ms
                      timer $ flipped set-timeout! timeout-ms $ fn ()
                        match @timer-ref
                          (:some active-timer)
                            when (= active-timer timer)
                              reset! timer-ref $ Option :none
                              let
                                  state $ assert-type (deref state-ref) WsClientState
                                  current-now $ checked-now-ms
                                when
                                  and (generation-current? state generation)
                                    = (WsConnectionPhase :open) (:phase state)
                                  match @lease-ref
                                    (:some current-lease)
                                      let
                                          current-lease $ assert-type current-lease 'cumulo-util.realtime/HeartbeatLease
                                        when (current-lease .expired? current-now)
                                          match (:socket state)
                                            (:some socket) (.!close socket)
                                            (:none) &unit
                                    (:none) &unit
                          (:none) &unit
                        , &unit
                    reset! lease-ref $ Option :some lease
                    reset! timer-ref $ Option :some timer
                    , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0 'Number
            :features $ #{} :js-ffi
        'schedule-client-reconnect! $ %{} 'CodeEntry
          :doc "|Schedules one bounded backoff retry unless one is already pending."
          :code $ quote $ defn schedule-client-reconnect! (client)
            let
                timer-ref $ :reconnect-timer client
              match @timer-ref
                (:some timer) &unit
                (:none)
                  let
                      retry-ref $ :retry-state client
                      state-ref $ :state client
                      retry-state $ assert-type (deref retry-ref) 'cumulo-util.realtime/RetryBackoff
                      step $ assert-type
                        retry-state .next $ checked-random-number
                        , 'cumulo-util.realtime/RetryStep
                      delay-ms $ :delay-ms step
                      timer $ flipped set-timeout! delay-ms $ fn ()
                        reset! timer-ref $ Option :none
                        let
                            state $ assert-type (deref state-ref) WsClientState
                          when
                            = (WsConnectionPhase :backoff) (:phase state)
                            connect-client! client
                        , &unit
                    reset! retry-ref $ :next step
                    let
                        state $ assert-type (deref state-ref) WsClientState
                      reset! state-ref $ assoc state :phase $ WsConnectionPhase :backoff
                    reset! timer-ref $ Option :some timer
                    , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'WsClient0
            :features $ #{} :js-ffi
        'transition-phase $ %{} 'CodeEntry
          :doc "|Applies a phase transition only for the active generation."
          :code $ quote $ defn transition-phase (state generation phase)
            if (generation-current? state generation)
              Option :some $ assoc state :phase phase
              Option :none
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'WsClientState 'Number 'WsConnectionPhase
            :return $ :: 'calcit.core/Option 'WsClientState
          :tests $ [] $ %{} 'TestEntry (:name |ignores-stale-transition)
            :code $ quote $ let
                state $ WsClientState :generation 2 :phase (%:: WsConnectionPhase :connecting) :socket $ Option :none
                open-state $ assoc state :phase $ %:: WsConnectionPhase :open
              match
                transition-phase state 2 $ %:: WsConnectionPhase :open
                (:some next-state)
                  assert "|current generation should transition" $ = open-state next-state
                (:none) (raise "|current generation did not transition")
              match
                transition-phase state 1 $ %:: WsConnectionPhase :open
                (:some _) (raise "|stale generation transitioned")
                (:none) &unit
            :tags $ #{} :unit
        'ws-connect! $ %{} 'CodeEntry
          :doc "|Establishes a WebSocket connection to the specified URL. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks."
          :code $ quote $ defn ws-connect! (ws-url options)
            assert |required-an-url-for-WebSocket-server $ string? ws-url
            match @*global-client
              (:some client) (client .close)
              (:none) &unit
            let
                client $ create-client-with! ws-url options $ fn (url)
                  hint-fn $ {} (:return 'ws-edn.client/BrowserWebSocketHost)
                    :args $ [] 'String
                  unsafe-coerce (new js/WebSocket url) 'ws-edn.client/BrowserWebSocketHost
              install-browser-lifecycle! client
              assert-type client WsClient
              reset! *global-client $ Option :some client
              , client
          :examples $ [] $ quote
            ws-connect! |ws://localhost:8080 $ {}
              :on-open $ fn (event) (println |connected)
              :on-close $ fn (event) (println |closed)
              :on-data $ fn (data) (println |received: data)
          :schema $ :: 'Fn $ {} (:return 'WsClient)
            :args $ [] 'String $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'ws-connected? $ %{} 'CodeEntry
          :doc "|Returns true if WebSocket is currently connected, false otherwise."
          :code $ quote $ defn ws-connected? ()
            match @*global-client
              (:some client) (client .connected?)
              (:none) false
          :examples $ [] $ quote (ws-connected?)
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ []
        'ws-send! $ %{} 'CodeEntry
          :doc "|Sends data through the WebSocket connection. Data will be formatted as Cirru EDN before sending."
          :code $ quote $ defn ws-send! (data)
            match @*global-client
              (:some client)
                match (client .send data)
                  (:sent) &unit
                  (:not-open phase) (js/console.warn |WebSocket-not-open phase)
              (:none) (js/console.warn |Missing-WebSocket-client)
            , &unit
          :examples $ [] $ quote
            ws-send! $ {} (:type |ping)
              :timestamp $ unix-time!
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ws-set-on-data! $ %{} 'CodeEntry
          :doc "|Sets the message handler for incoming WebSocket data. Handler receives parsed Cirru EDN data."
          :code $ quote $ defn ws-set-on-data! (on-data)
            match @*global-client
              (:some client)
                let
                    state-handle $ client-state-handle client
                  reset! (:on-data state-handle) (Option :some on-data)
              (:none) (js/console.warn |Missing-WebSocket-client)
            , &unit
          :examples $ [] $ quote
            ws-set-on-data! $ fn (data) (println "|New message:" data)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Fn
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.client
          :require
            [] ws-edn.util :refer $ [] when-let parse-data stringify-data
            cumulo-util.activity :refer $ watch-browser-lifecycle!
            cumulo-util.realtime :refer $ retry-backoff heartbeat-lease
            js-ffi.browser :refer $ set-timeout!
    'ws-edn.schema $ %{} 'FileEntry
      :defs $ {}
        'Track $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct Track (:message 'String) (:time 'String)
          :examples $ []
          :schema $ :: 'Struct
        'decode-track $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn decode-track (value) (decode-map-as value Track)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Track)
            :args $ [] 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |decodes-track-map)
              :code $ quote $ assert "|decoded track should retain fields"
                =
                  %{} Track (:message |hello) (:time |now)
                  decode-track $ {} (:message |hello) (:time |now)
              :tags $ #{} :unit
            %{} 'TestEntry (:name |rejects-missing-time)
              :code $ quote $ is-throws
                decode-track $ {} $ :message |hello
              :tags $ #{} :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.schema
          :require $ calcit.test :refer $ is-throws
    'ws-edn.server $ %{} 'FileEntry
      :defs $ {}
        '*global-connections $ %{} 'CodeEntry
          :doc "|Global Ref that stores active WebSocket connections as a map of session-id to socket."
          :code $ quote $ defref *global-connections ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'String 'ws-edn.server/NodeWebSocketHost
        '*proxied-data-listener $ %{} 'CodeEntry
          :doc "|Global Ref that stores the data listener callback function. Used internally for message handling."
          :code $ quote $ defref *proxied-data-listener (Option :none)
          :examples $ []
          :schema $ :: 'Ref $ :: 'calcit.core/Option
            :: 'Fn $ {} (:return 'Unit)
              :args $ [] 'String 'Dynamic
        'NodeDataHost $ %{} 'CodeEntry
          :doc "|Typed string conversion surface for Node ws message payloads."
          :code $ quote $ deftrait NodeDataHost
            .to-string $ :: 'Fn $ {}
              :args $ [] 'NodeDataHost
              :return 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
            :names $ {} $ :to-string |toString
          :schema $ :: 'Trait
        'NodeHttpRequestHost $ %{} 'CodeEntry
          :doc "|Typed request URL surface used by the HTTPS upgrade diagnostic."
          :code $ quote $ deftrait NodeHttpRequestHost
            :url $ :: 'JsNullish 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
          :schema $ :: 'Trait
        'NodeHttpResponseHost $ %{} 'CodeEntry
          :doc "|Typed response methods used by the minimal HTTPS health response."
          :code $ quote $ deftrait NodeHttpResponseHost
            .write-head $ :: 'Fn $ {}
              :args $ [] 'NodeHttpResponseHost 'Number
              :return 'Unit
            .end $ :: 'Fn $ {}
              :args $ [] 'NodeHttpResponseHost 'String
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
            :names $ {} $ :write-head |writeHead
          :schema $ :: 'Trait
        'NodeHttpServerHost $ %{} 'CodeEntry
          :doc "|Typed HTTPS server event and listen surface used by secure WebSocket setup."
          :code $ quote $ deftrait NodeHttpServerHost
            .add-listener $ :: 'Fn $ {}
              :args $ [] 'NodeHttpServerHost 'String 'Fn
              :return 'NodeHttpServerHost
            .on $ :: 'Fn $ {}
              :args $ [] 'NodeHttpServerHost 'String 'Fn
              :return 'NodeHttpServerHost
            .listen $ :: 'Fn $ {}
              :args $ [] 'NodeHttpServerHost 'Number 'Fn
              :return 'NodeHttpServerHost
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
            :names $ {} $ :add-listener |addListener
          :schema $ :: 'Trait
        'NodeWebSocketHost $ %{} 'CodeEntry
          :doc "|Typed Node ws connection surface used by server lifecycle adapters."
          :code $ quote $ deftrait NodeWebSocketHost
            .on $ :: 'Fn $ {}
              :args $ [] 'NodeWebSocketHost 'String 'Fn
              :return 'NodeWebSocketHost
            .send $ :: 'Fn $ {}
              :args $ [] 'NodeWebSocketHost 'String
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
          :schema $ :: 'Trait
        'NodeWebSocketServerHost $ %{} 'CodeEntry (:doc "|Typed Node ws server event surface.")
          :code $ quote $ deftrait NodeWebSocketServerHost
            .on $ :: 'Fn $ {}
              :args $ [] 'NodeWebSocketServerHost 'String 'Fn
              :return 'NodeWebSocketServerHost
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :node)
          :schema $ :: 'Trait
        'log-request-url! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn log-request-url! (raw-request)
            let
                request $ unsafe-coerce raw-request 'NodeHttpRequestHost
              js/console.log $ .-url request
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'log-server-error! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn log-server-error! (error) (js/console.error error) &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'maintain-host-socket! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn maintain-host-socket! (raw-socket options)
            maintain-socket! (unsafe-coerce raw-socket 'NodeWebSocketHost) options
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'maintain-socket! $ %{} 'CodeEntry
          :doc "|Registers and maintains a WebSocket connection. Sets up event handlers for message, close, and error events. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks."
          :code $ quote $ defn maintain-socket! (socket options)
            let
                sid $ new-session-id!
                on-close $ match (server-option-callback options :on-close)
                  (:some callback)
                    Option :some $ unsafe-coerce callback $ :: 'Fn
                      {}
                        :args $ [] 'String 'JsObject
                        :return 'Unit
                  (:none)
                    assert-type (Option :none)
                      :: 'Option $ :: 'Fn $ {}
                        :args $ [] 'String 'JsObject
                        :return 'Unit
                on-error $ match (server-option-callback options :on-error)
                  (:some callback)
                    Option :some $ unsafe-coerce callback $ :: 'Fn
                      {}
                        :args $ [] 'JsObject
                        :return 'Unit
                  (:none)
                    assert-type (Option :none)
                      :: 'Option $ :: 'Fn $ {}
                        :args $ [] 'JsObject
                        :return 'Unit
              swap! *global-connections assoc sid socket
              match (server-option-callback options :on-open)
                (:some callback)
                  let
                      callback $ unsafe-coerce callback $ :: 'Fn
                        {}
                          :args $ [] 'String 'ws-edn.server/NodeWebSocketHost
                          :return 'Unit
                    callback sid socket
                (:none) &unit
              match (server-option-callback options :on-data)
                (:some callback)
                  reset! *proxied-data-listener $ Option :some $ unsafe-coerce callback
                    :: 'Fn $ {}
                      :args $ [] 'String 'Dynamic
                      :return 'Unit
                (:none)
                  reset! *proxied-data-listener $ Option :none
              .!on socket |message $ fn (raw-data binary?)
                match @*proxied-data-listener
                  (:some callback)
                    callback sid $ parse-cirru-edn (node-data-string raw-data) (&map:get options :class-mapper)
                  (:none) &unit
                , &unit
              .!on socket |close $ fn (event binary?) (swap! *global-connections dissoc sid)
                match on-close
                  (:some callback) (callback sid event)
                  (:none) &unit
                , &unit
              .!on socket |error $ fn (error) (swap! *global-connections dissoc sid)
                match on-error
                  (:some callback) (callback error)
                  (:none) &unit
                , &unit
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'ws-edn.server/NodeWebSocketHost 'Dynamic
            :features $ #{} :js-ffi
        'new-session-id! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn new-session-id! ()
            let
                value $ nanoid
              if (string? value) value $ raise |Expected-String-session-id-from-nanoid
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
        'node-data-string $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn node-data-string (raw-data)
            let
                data $ unsafe-coerce raw-data 'NodeDataHost
                text $ .!toString data
              if (string? text) text $ raise |Expected-String-WebSocket-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'server-option-callback $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn server-option-callback (options key)
            let
                value $ &map:get options key
              if (fn? value)
                Option :some $ unsafe-coerce value 'Fn
                Option :none
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic 'Tag
            :features $ #{} :js-ffi
            :return $ :: 'calcit.core/Option 'Fn
          :tests $ []
            %{} 'TestEntry (:name |accepts-function-option)
              :code $ quote $ let
                  callback $ fn (value) value
                  options $ {} $ :on-data callback
                assert= true $ match (server-option-callback options :on-data)
                  (:some found) (fn? found)
                  (:none) false
              :tags $ #{} :server :unit
            %{} 'TestEntry (:name |rejects-non-function-options)
              :code $ quote $ do
                assert= true $ .none? $ server-option-callback
                  {} $ :on-data 42
                  , :on-data
                assert= true $ .none? $ server-option-callback
                  {} $ :on-data :callable-tag
                  , :on-data
                assert= true $ .none? $ server-option-callback ({}) :on-data
              :tags $ #{} :server :unit
        'server-option-string $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn server-option-string (options key)
            let
                value $ &map:get options key
              if (string? value) (Option :some value) (Option :none)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic 'Tag
            :features $ #{} :js-ffi
            :return $ :: 'calcit.core/Option 'String
        'write-health-response! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn write-health-response! (raw-response)
            let
                response $ unsafe-coerce raw-response 'NodeHttpResponseHost
              .!write-head response 200
              .!end response "|WSS Server"
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'wss-each! $ %{} 'CodeEntry
          :doc "|Iterates over all active WebSocket connections. Handler function receives session-id and socket as arguments."
          :code $ quote $ defn wss-each! (handler)
            let
                connections $ assert-type @*global-connections $ :: 'Map 'String 'ws-edn.server/NodeWebSocketHost
              &doseq
                sid $ &map:keys connections
                match
                  get connections $ assert-type sid 'String
                  (:some socket) (handler sid socket)
                  (:none) &unit
              , &unit
          :examples $ [] $ quote
            wss-each! $ fn (sid socket) (println |Session: sid)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'String 'ws-edn.server/NodeWebSocketHost
        'wss-send! $ %{} 'CodeEntry
          :doc "|Sends data to a specific WebSocket connection identified by session-id. Data will be formatted as Cirru EDN before sending."
          :code $ quote $ defn wss-send! (sid data)
            let
                socket $ get @*global-connections sid
              match socket
                (:some socket)
                  .!send socket $ format-cirru-edn data
                (:none) (js/console.warn "|socket not found for" sid)
              , &unit
          :examples $ [] $ quote
            wss-send! |session-123 $ {} (:type |notification) (:message "|Hello client")
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'String 'Dynamic
            :features $ #{} :js-ffi
        'wss-serve! $ %{} 'CodeEntry
          :doc "|Starts a WebSocket server on the specified port. Accepts options map with :cert, :key (for SSL), :on-listening, :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks."
          :code $ quote $ defn wss-serve! (port options)
            let
                cert-path $ server-option-string options :cert
                key-path $ server-option-string options :key
                on-listening $ match (server-option-callback options :on-listening)
                  (:some callback)
                    Option :some $ unsafe-coerce callback $ :: 'Fn
                      {}
                        :args $ []
                        :return 'Unit
                  (:none)
                    assert-type (Option :none)
                      :: 'Option $ :: 'Fn $ {}
                        :args $ []
                        :return 'Unit
                on-error $ match (server-option-callback options :on-error)
                  (:some callback)
                    Option :some $ unsafe-coerce callback $ :: 'Fn
                      {}
                        :args $ [] 'JsObject
                        :return 'Unit
                  (:none)
                    assert-type (Option :none)
                      :: 'Option $ :: 'Fn $ {}
                        :args $ [] 'JsObject
                        :return 'Unit
              assert "|SSL requires both :cert and :key options" $ = (option:some? cert-path) (option:some? key-path)
              let
                  wss $ match cert-path
                    (:some cert-file)
                      match key-path
                        (:some key-file)
                          let
                              ssl-options $ &js-object :key (fs/readFileSync key-file) :cert $ fs/readFileSync cert-file
                              raw-server $ https/createServer ssl-options $ fn (req res) (write-health-response! res)
                              server $ unsafe-coerce raw-server 'NodeHttpServerHost
                            .!add-listener server |upgrade $ fn (req res head) (log-request-url! req)
                            .!on server |error $ fn (error) (log-server-error! error)
                            .!listen server port $ fn () $ println "|server at" port
                            unsafe-coerce
                              new WebSocketServer $ &js-object :server server :path |/
                              , 'NodeWebSocketServerHost
                        (:none) (raise "|missing SSL key")
                    (:none)
                      unsafe-coerce
                        new WebSocketServer $ &js-object :port port
                        , 'NodeWebSocketServerHost
                .!on wss |connection $ fn (socket req) (maintain-host-socket! socket options) &unit
                .!on wss |listening $ fn ()
                  match on-listening
                    (:some callback) (callback)
                    (:none) &unit
                  , &unit
                .!on wss |error $ fn (error)
                  match on-error
                    (:some callback) (callback error)
                    (:none) (log-server-error! error)
                  , &unit
                , wss
          :examples $ [] $ quote
            wss-serve! 8080 $ {}
              :on-listening $ fn () $ println "|Server listening on 8080"
              :on-data $ fn (sid data) (println "|Received from" sid : data)
          :schema $ :: 'Fn $ {} (:return 'NodeWebSocketServerHost)
            :args $ [] 'Number 'Dynamic
            :features $ #{} :js-ffi
        'wss-set-on-data! $ %{} 'CodeEntry
          :doc "|Sets the message handler for incoming WebSocket data across all connections. Handler receives session-id and parsed Cirru EDN data."
          :code $ quote $ defn wss-set-on-data! (on-data)
            &let
              _listener $ reset! *proxied-data-listener $ Option :some on-data
              , &unit
          :examples $ [] $ quote
            wss-set-on-data! $ fn (sid data) (println "|New message from" sid : data)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'String 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.server
          :require
            |ws :refer $ WebSocketServer
            ws-edn.util :refer $ when-let parse-data
            |nanoid :refer $ nanoid
            |https :as https
            |fs :as fs
    'ws-edn.util $ %{} 'FileEntry
      :defs $ {}
        'DateHost $ %{} 'CodeEntry
          :doc "|Typed JavaScript Date formatting surface shared by generated page and server payloads."
          :code $ quote $ deftrait DateHost
            .to-iso-string $ :: 'Fn $ {}
              :args $ [] 'DateHost
              :return 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
            :names $ {} $ :to-iso-string |toISOString
          :schema $ :: 'Trait
        'current-iso-time! $ %{} 'CodeEntry
          :doc "|Returns the current JavaScript time as an ISO string through the typed Date adapter."
          :code $ quote $ defn current-iso-time! ()
            let
                date $ unsafe-coerce (new js/Date) 'DateHost
                text $ .!toISOString date
              if (string? text) text $ raise |Expected-String-ISO-time
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ []
            :features $ #{} :js-ffi
        'when-let $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro when-let (pair & body)
            assert "|expected 2 tokens" $ and (list? pair)
              = 2 $ count pair
            quasiquote $ &let ~pair $ when
              non-nil? $ ~ $ first pair
              , ~@body
          :examples $ []
          :schema $ :: 'Macro $ {} (:rest 'Syntax)
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Dynamic
            :required $ [] 'SyntaxList
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns ws-edn.util
