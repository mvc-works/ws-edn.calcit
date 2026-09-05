
{} (:about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --full` first. Manual edits must follow format and schema conventions, then run `calcit edit format`.") (:package |ws-edn)
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'ws-edn.app.page/main!) (:mode :native) (:reload-fn 'ws-edn.app.page/reload!)
      :feature-policy $ {}
      :modules $ [] |cumulo-util.calcit/
      :type-slots $ {}
    :server $ {} (:description |) (:init-fn 'ws-edn.app.server/main!) (:mode :native) (:reload-fn 'ws-edn.app.server/reload!)
      :feature-policy $ {}
      :modules $ []
      :type-slots $ {}
  :files $ {}
    'ws-edn.app.page $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
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
        'reload! $ %{} 'CodeEntry (:doc |)
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
    'ws-edn.app.server $ %{} 'FileEntry
      :defs $ {}
        'main! $ %{} 'CodeEntry (:doc |)
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
        'reload! $ %{} 'CodeEntry (:doc |)
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
    'ws-edn.client $ %{} 'FileEntry
      :defs $ {}
        '*global-client $ %{} 'CodeEntry (:doc "|Global atom that stores the WebSocket instance. Used internally to track the current connection.")
          :code $ quote
            defatom *global-client $ %none
          :examples $ []
          :schema $ :: 'Ref (:: 'Option 'WsClient)
        'WsClient $ %{} 'CodeEntry (:doc "|Browser WebSocket client with nominal lifecycle methods.")
          :code $ quote
            def WsClient $ impl-traits WsClient0 WsClientOpsImpl
          :examples $ []
          :schema $ :: 'StructDef
        'WsClient0 $ %{} 'CodeEntry (:doc "|Raw browser client handle before attaching lifecycle methods.")
          :code $ quote
            defstruct WsClient0
              :state $ :: 'Ref 'WsClientState
              :url 'String
              :options 'Dynamic
              :on-data $ :: 'Ref (:: 'Option 'DynFn)
              :socket-factory $ :: 'Fn
                {}
                  :args $ [] 'String
                  :return 'JsObject
                  :features $ #{} :js-ffi
              :lifecycle-cleanup $ :: 'Ref (:: 'Option 'Fn)
              :retry-state $ :: 'Ref 'cumulo-util.realtime/RetryBackoff
              :reconnect-timer $ :: 'Ref (:: 'Option 'Number)
              :heartbeat-timeout-ms $ :: 'Option 'Number
              :heartbeat-lease $ :: 'Ref (:: 'Option 'cumulo-util.realtime/HeartbeatLease)
              :heartbeat-timer $ :: 'Ref (:: 'Option 'Number)
          :examples $ []
          :schema $ :: 'StructDef
        'WsClientOps $ %{} 'CodeEntry (:doc "|Method contract for browser WebSocket clients.")
          :code $ quote
            deftrait WsClientOps
              .connected? $ :: 'Fn
                {}
                  :generics $ [] 'T
                  :args $ [] 'T
                  :return 'Bool
              .send $ :: 'Fn
                {}
                  :generics $ [] 'T 'D
                  :args $ [] 'T 'D
                  :return 'WsSendOutcome
              .close $ :: 'Fn
                {}
                  :generics $ [] 'T
                  :args $ [] 'T
                  :return 'Unit
              .reconnect $ :: 'Fn
                {}
                  :generics $ [] 'T
                  :args $ [] 'T
                  :return 'Unit
          :examples $ []
          :schema $ :: 'Trait
        'WsClientOpsImpl $ %{} 'CodeEntry (:doc "|Lifecycle method implementation for WsClient.")
          :code $ quote
            defimpl WsClientOpsImpl WsClientOps (.connected? client-connected?) (.send client-send) (.close client-close!) (.reconnect client-reconnect!)
          :examples $ []
          :schema $ :: 'Impl
        'WsClientState $ %{} 'CodeEntry (:doc "|Generation, phase, and current host socket for one browser client.")
          :code $ quote
            defstruct WsClientState (:generation 'Number) (:phase 'WsConnectionPhase)
              :socket $ :: 'Option 'JsObject
          :examples $ []
          :schema $ :: 'StructDef
        'WsConnectionPhase $ %{} 'CodeEntry (:doc "|Explicit browser WebSocket lifecycle phase.")
          :code $ quote
            defenum WsConnectionPhase (:connecting) (:open) (:backoff) (:closing) (:closed)
          :examples $ []
          :schema $ :: 'EnumDef
        'WsSendOutcome $ %{} 'CodeEntry (:doc "|Typed outcome from attempting a browser WebSocket send.")
          :code $ quote
            defenum WsSendOutcome (:sent) (:not-open 'WsConnectionPhase)
          :examples $ []
          :schema $ :: 'EnumDef
        'cancel-client-heartbeat! $ %{} 'CodeEntry (:doc "|Cancels and clears the heartbeat deadline timer and lease.")
          :code $ quote
            defn cancel-client-heartbeat! (client)
              let
                  timer-ref $ :heartbeat-timer client
                match @timer-ref
                  (:some timer) (js/clearTimeout timer)
                  (:none) &unit
                reset! timer-ref $ %none
                reset! (:heartbeat-lease client) (%none)
                , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'cancel-client-reconnect! $ %{} 'CodeEntry (:doc "|Cancels and clears the single pending reconnect timer.")
          :code $ quote
            defn cancel-client-reconnect! (client)
              let
                  timer-ref $ :reconnect-timer client
                match @timer-ref
                  (:some timer)
                    do (js/clearTimeout timer)
                      reset! timer-ref $ %none
                      , &unit
                  (:none) &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'cleanup-client-lifecycle! $ %{} 'CodeEntry (:doc "|Runs and clears the optional browser lifecycle cleanup capability.")
          :code $ quote
            defn cleanup-client-lifecycle! (client)
              let
                  cleanup-ref $ :lifecycle-cleanup client
                match @cleanup-ref
                  (:some cleanup)
                    do (cleanup)
                      reset! cleanup-ref $ %none
                      , &unit
                  (:none) &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
        'client-close! $ %{} 'CodeEntry (:doc "|Method implementation for explicitly closing a client.")
          :code $ quote
            defn client-close! (client) (cancel-client-reconnect! client) (cancel-client-heartbeat! client) (cleanup-client-lifecycle! client)
              let
                  state-ref $ :state client
                  state @state-ref
                assert-type state WsClientState
                match (:socket state)
                  (:some socket)
                    do
                      reset! state-ref $ assoc state :phase (%:: WsConnectionPhase :closing)
                      .!close socket
                      , &unit
                  (:none)
                    do
                      reset! state-ref $ assoc state :phase (%:: WsConnectionPhase :closed)
                      , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'client-connected? $ %{} 'CodeEntry (:doc "|Method implementation for checking the open phase.")
          :code $ quote
            defn client-connected? (client)
              let
                  state $ deref (:state client)
                assert-type state WsClientState
                = (%:: WsConnectionPhase :open) (:phase state)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ [] 'WsClient0
        'client-reconnect! $ %{} 'CodeEntry (:doc "|Method implementation for replacing the active generation.")
          :code $ quote
            defn client-reconnect! (client) (cancel-client-reconnect! client) (connect-client! client)
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'client-recover! $ %{} 'CodeEntry (:doc "|Reconnects from closed or backoff after cancelling a pending timer, preserving single-flight attempts.")
          :code $ quote
            defn client-recover! (client)
              let
                  state $ deref (:state client)
                assert-type state WsClientState
                if
                  or
                    = (%:: WsConnectionPhase :closed) (:phase state)
                    = (%:: WsConnectionPhase :backoff) (:phase state)
                  do (cancel-client-reconnect! client) (connect-client! client) &unit
                  , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
        'client-send $ %{} 'CodeEntry (:doc "|Method implementation returning a typed send outcome.")
          :code $ quote
            defn client-send (client data)
              let
                  state $ deref (:state client)
                assert-type state WsClientState
                if
                  = (%:: WsConnectionPhase :open) (:phase state)
                  match (:socket state)
                    (:some socket)
                      do
                        .!send socket $ format-cirru-edn data
                        %:: WsSendOutcome :sent
                    (:none)
                      %:: WsSendOutcome :not-open $ :phase state
                  %:: WsSendOutcome :not-open $ :phase state
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'WsSendOutcome)
              :args $ [] 'WsClient0 'D
              :features $ #{} :js-ffi
              :generics $ [] 'D
        'connect-client! $ %{} 'CodeEntry (:doc "|Starts a new generation and installs stale-event-safe host callbacks.")
          :code $ quote
            defn connect-client! (client) (cancel-client-heartbeat! client)
              let
                  state-ref $ :state client
                  previous @state-ref
                assert-type previous WsClientState
                let
                    generation $ inc (:generation previous)
                    connecting-state $ WsClientState :generation generation :phase (%:: WsConnectionPhase :connecting) :socket (%none)
                  reset! state-ref connecting-state
                  match (:socket previous)
                    (:some socket)
                      do (.!close socket) &unit
                    (:none) &unit
                  let
                      socket $
                        :socket-factory client
                        :url client
                    reset! state-ref $ WsClientState :generation generation :phase (%:: WsConnectionPhase :connecting) :socket (%some socket)
                    set! (.-onopen socket)
                      fn (event)
                        when (generation-current? @state-ref generation) (cancel-client-reconnect! client)
                          let
                              retry-state $ assert-type
                                deref $ :retry-state client
                                , 'cumulo-util.realtime/RetryBackoff
                            reset! (:retry-state client) (retry-state .reset)
                          reset! state-ref $ assoc @state-ref :phase (%:: WsConnectionPhase :open)
                          renew-client-heartbeat! client generation
                          when-let
                            on-open $ get (:options client) :on-open
                            let
                                callback $ unsafe-coerce on-open 'Fn
                              callback event
                        , &unit
                    set! (.-onmessage socket)
                      fn (event)
                        when (generation-current? @state-ref generation) (renew-client-heartbeat! client generation)
                          when-let
                            on-data $ deref (:on-data client)
                            let
                                callback $ unsafe-coerce on-data 'Fn
                              callback $ parse-cirru-edn
                                unsafe-coerce (.-data event) 'String
                                &map:get (:options client) :class-mapper
                        , &unit
                    set! (.-onclose socket)
                      fn (event)
                        when (generation-current? @state-ref generation) (cancel-client-heartbeat! client)
                          let
                              current-state $ assert-type (deref state-ref) WsClientState
                              explicit-close? $ = (%:: WsConnectionPhase :closing) (:phase current-state)
                            reset! state-ref $ WsClientState :generation generation :phase (%:: WsConnectionPhase :closed) :socket (%none)
                            when-let
                              on-close $ get (:options client) :on-close
                              let
                                  callback $ unsafe-coerce on-close 'Fn
                                callback event
                            when (not explicit-close?) (schedule-client-reconnect! client)
                        , &unit
                    set! (.-onerror socket)
                      fn (error)
                        when (generation-current? @state-ref generation) (js/console.error |Failed-to-establish-WebSocket-connection error)
                          when-let
                            on-error $ get (:options client) :on-error
                            let
                                callback $ unsafe-coerce on-error 'Fn
                              callback error
                        , &unit
                    , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'create-client-with! $ %{} 'CodeEntry (:doc "|Creates a client with an injected socket factory, primarily for tests and adapters.")
          :code $ quote
            defn create-client-with! (url options socket-factory)
              let
                  state-ref $ atom
                    WsClientState :generation 0 :phase (%:: WsConnectionPhase :closed) :socket $ %none
                  on-data-ref $ atom (%none)
                  lifecycle-cleanup-ref $ atom (%none)
                  retry-base-ms $ match (get options :retry-base-ms)
                    (:some value) (unsafe-coerce value 'Number)
                    (:none) 500
                  retry-max-ms $ match (get options :retry-max-ms)
                    (:some value) (unsafe-coerce value 'Number)
                    (:none) 30000
                  retry-jitter $ match (get options :retry-jitter)
                    (:some value) (unsafe-coerce value 'Number)
                    (:none) 0.2
                  retry-state-ref $ atom (retry-backoff retry-base-ms retry-max-ms retry-jitter)
                  reconnect-timer-ref $ atom (%none)
                  heartbeat-timeout-ms $ match (get options :heartbeat-timeout-ms)
                    (:some value)
                      %some $ unsafe-coerce value 'Number
                    (:none) (%none)
                  heartbeat-lease-ref $ atom (%none)
                  heartbeat-timer-ref $ atom (%none)
                  client $ %{} WsClient (:state state-ref) (:url url) (:options options) (:on-data on-data-ref) (:socket-factory socket-factory) (:lifecycle-cleanup lifecycle-cleanup-ref) (:retry-state retry-state-ref) (:reconnect-timer reconnect-timer-ref) (:heartbeat-timeout-ms heartbeat-timeout-ms) (:heartbeat-lease heartbeat-lease-ref) (:heartbeat-timer heartbeat-timer-ref)
                when-let
                  on-data $ get options :on-data
                  reset! on-data-ref $ %some (unsafe-coerce on-data 'DynFn)
                assert-type client 'WsClient
                connect-client! client
                , client
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'WsClient)
              :args $ [] 'String 'Dynamic
                :: 'Fn $ {} (:return 'JsObject)
                  :args $ [] 'String
              :features $ #{} :js-ffi
        'generation-current? $ %{} 'CodeEntry (:doc "|Returns whether an event belongs to the active socket generation.")
          :code $ quote
            defn generation-current? (state generation)
              = (:generation state) generation
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ [] 'WsClientState 'Number
          :tests $ []
            %{} 'TestEntry (:name |accepts-only-current-generation)
              :code $ quote
                let
                    state $ WsClientState :generation 2 :phase (%:: WsConnectionPhase :connecting) :socket (%none)
                  assert= true $ generation-current? state 2
                  assert= false $ generation-current? state 1
              :tags $ #{} :unit
        'install-browser-lifecycle! $ %{} 'CodeEntry (:doc "|Installs visibility and online recovery signals for a browser client.")
          :code $ quote
            defn install-browser-lifecycle! (client) (cleanup-client-lifecycle! client)
              let
                  cleanup $ watch-browser-lifecycle!
                    fn (signal)
                      when
                        or (= signal :visible) (= signal :online)
                        client-recover! client
                    %none
                reset! (:lifecycle-cleanup client) (%some cleanup)
                , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'renew-client-heartbeat! $ %{} 'CodeEntry (:doc "|Renews an enabled heartbeat lease and closes the current generation after its deadline.")
          :code $ quote
            defn renew-client-heartbeat! (client generation)
              match (:heartbeat-timeout-ms client)
                (:none) &unit
                (:some timeout-ms)
                  do (cancel-client-heartbeat! client)
                    let
                        lease-ref $ :heartbeat-lease client
                        timer-ref $ :heartbeat-timer client
                        state-ref $ :state client
                        now-ms $ unsafe-coerce (js/Date.now) 'Number
                        lease $ heartbeat-lease now-ms timeout-ms
                        timer $ flipped js/setTimeout timeout-ms
                          fn () $ match @timer-ref
                            (:some active-timer)
                              when (= active-timer timer)
                                reset! timer-ref $ %none
                                let
                                    state $ assert-type (deref state-ref) WsClientState
                                    current-now $ unsafe-coerce (js/Date.now) 'Number
                                  when
                                    and (generation-current? state generation)
                                      = (%:: WsConnectionPhase :open) (:phase state)
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
                      reset! lease-ref $ %some lease
                      reset! timer-ref $ %some timer
                      , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0 'Number
              :features $ #{} :js-ffi
        'schedule-client-reconnect! $ %{} 'CodeEntry (:doc "|Schedules one bounded backoff retry unless one is already pending.")
          :code $ quote
            defn schedule-client-reconnect! (client)
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
                          retry-state .next $ unsafe-coerce (js/Math.random) 'Number
                          , 'cumulo-util.realtime/RetryStep
                        delay-ms $ :delay-ms step
                        timer $ flipped js/setTimeout delay-ms
                          fn ()
                            reset! timer-ref $ %none
                            let
                                state $ assert-type (deref state-ref) WsClientState
                              when
                                = (%:: WsConnectionPhase :backoff) (:phase state)
                                connect-client! client
                      reset! retry-ref $ :next step
                      let
                          state $ assert-type (deref state-ref) WsClientState
                        reset! state-ref $ assoc state :phase (%:: WsConnectionPhase :backoff)
                      reset! timer-ref $ %some timer
                      , &unit
          :examples $ []
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'WsClient0
              :features $ #{} :js-ffi
        'transition-phase $ %{} 'CodeEntry (:doc "|Applies a phase transition only for the active generation.")
          :code $ quote
            defn transition-phase (state generation phase)
              if (generation-current? state generation)
                %some $ assoc state :phase phase
                %none
          :examples $ []
          :schema $ :: 'Fn
            {}
              :args $ [] 'WsClientState 'Number 'WsConnectionPhase
              :return $ :: 'Option 'WsClientState
          :tests $ []
            %{} 'TestEntry (:name |ignores-stale-transition)
              :code $ quote
                let
                    state $ WsClientState :generation 2 :phase (%:: WsConnectionPhase :connecting) :socket (%none)
                    open-state $ assoc state :phase (%:: WsConnectionPhase :open)
                  assert= (%some open-state)
                    transition-phase state 2 $ %:: WsConnectionPhase :open
                  assert= (%none)
                    transition-phase state 1 $ %:: WsConnectionPhase :open
              :tags $ #{} :unit
        'ws-connect! $ %{} 'CodeEntry (:doc "|Establishes a WebSocket connection to the specified URL. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ quote
            defn ws-connect! (ws-url options)
              assert |required-an-url-for-WebSocket-server $ string? ws-url
              match @*global-client
                (:some client) (client .close)
                (:none) &unit
              let
                  client $ create-client-with! ws-url options
                    fn (url) (new js/WebSocket url)
                install-browser-lifecycle! $ assert-type client 'WsClient0
                reset! *global-client $ %some client
                assert-type client 'WsClient
          :examples $ []
            quote $ ws-connect! |ws://localhost:8080
              {}
                :on-open $ fn (event) (println |connected)
                :on-close $ fn (event) (println |closed)
                :on-data $ fn (data) (println |received: data)
          :schema $ :: 'Fn
            {} (:return 'WsClient)
              :args $ [] 'String 'Dynamic
              :features $ #{} :js-ffi
        'ws-connected? $ %{} 'CodeEntry (:doc "|Returns true if WebSocket is currently connected, false otherwise.")
          :code $ quote
            defn ws-connected? () $ match @*global-client
              (:some client) (client .connected?)
              (:none) false
          :examples $ []
            quote $ ws-connected?
          :schema $ :: 'Fn
            {} (:return 'Bool)
              :args $ []
        'ws-send! $ %{} 'CodeEntry (:doc "|Sends data through the WebSocket connection. Data will be formatted as Cirru EDN before sending.")
          :code $ quote
            defn ws-send! (data)
              do
                match @*global-client
                  (:some client)
                    match (client .send data)
                      (:sent) &unit
                      (:not-open phase) (js/console.warn |WebSocket-not-open phase)
                  (:none) (js/console.warn |Missing-WebSocket-client)
                , &unit
          :examples $ []
            quote $ ws-send!
              {} (:type |ping)
                :timestamp $ unix-time!
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Dynamic
              :features $ #{} :js-ffi
        'ws-set-on-data! $ %{} 'CodeEntry (:doc "|Sets the message handler for incoming WebSocket data. Handler receives parsed Cirru EDN data.")
          :code $ quote
            defn ws-set-on-data! (on-data)
              do
                match @*global-client
                  (:some client)
                    do (assert-type client WsClient0)
                      reset! (:on-data client)
                        %some $ unsafe-coerce on-data 'DynFn
                  (:none) (js/console.warn |Missing-WebSocket-client)
                , &unit
          :examples $ []
            quote $ ws-set-on-data!
              fn (data) (println "|New message:" data)
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'Fn
              :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote
          ns ws-edn.client $ :require
            [] ws-edn.util :refer $ [] when-let parse-data stringify-data
            cumulo-util.activity :refer $ watch-browser-lifecycle!
            cumulo-util.realtime :refer $ retry-backoff heartbeat-lease
    'ws-edn.schema $ %{} 'FileEntry
      :defs $ {}
        'Track $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defstruct Track (:message 'String) (:time 'String)
          :examples $ []
          :schema $ :: 'Struct
        'decode-track $ %{} 'CodeEntry (:doc |)
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
    'ws-edn.server $ %{} 'FileEntry
      :defs $ {}
        '*global-connections $ %{} 'CodeEntry (:doc "|Global atom that stores active WebSocket connections as a map of session-id to socket.")
          :code $ quote
            defatom *global-connections $ {}
          :examples $ []
          :schema $ :: 'Dynamic
        '*proxied-data-listener $ %{} 'CodeEntry (:doc "|Global atom that stores the data listener callback function. Used internally for message handling.")
          :code $ quote
            defatom *proxied-data-listener $ %none
          :examples $ []
          :schema $ :: 'Ref (:: 'Option 'Dynamic)
        'maintain-socket! $ %{} 'CodeEntry (:doc "|Registers and maintains a WebSocket connection. Sets up event handlers for message, close, and error events. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
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
        'wss-each! $ %{} 'CodeEntry (:doc "|Iterates over all active WebSocket connections. Handler function receives session-id and socket as arguments.")
          :code $ quote
            defn wss-each! (handler)
              &doseq
                pair $ .to-list @*global-connections
                let[] (sid socket) pair $ handler sid socket
          :examples $ []
            quote $ wss-each!
              fn (sid socket) (println |Session: sid)
          :schema $ :: 'Dynamic
        'wss-send! $ %{} 'CodeEntry (:doc "|Sends data to a specific WebSocket connection identified by session-id. Data will be formatted as Cirru EDN before sending.")
          :code $ quote
            defn wss-send! (sid data)
              do $ let
                  socket $ get @*global-connections sid
                match socket
                  (:some socket)
                    .!send socket $ format-cirru-edn data
                  (:none) (js/console.warn "|socket not found for" sid)
                , &unit
          :examples $ []
            quote $ wss-send! |session-123
              {} (:type |notification) (:message "|Hello client")
          :schema $ :: 'Fn
            {} (:return 'Unit)
              :args $ [] 'String 'Dynamic
              :features $ #{} :js-ffi
        'wss-serve! $ %{} 'CodeEntry (:doc "|Starts a WebSocket server on the specified port. Accepts options map with :cert, :key (for SSL), :on-listening, :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
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
        'wss-set-on-data! $ %{} 'CodeEntry (:doc "|Sets the message handler for incoming WebSocket data across all connections. Handler receives session-id and parsed Cirru EDN data.")
          :code $ quote
            defn wss-set-on-data! (on-data)
              reset! *proxied-data-listener $ %some on-data
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
    'ws-edn.util $ %{} 'FileEntry
      :defs $ {}
        'when-let $ %{} 'CodeEntry (:doc |)
          :code $ quote
            defmacro when-let (pair & body)
              assert "|expected 2 tokens" $ and (list? pair)
                = 2 $ count pair
              quasiquote $ &let ~pair
                when
                  some? $ ~ (first pair)
                  , ~@body
          :examples $ []
          :schema $ :: 'Macro
            {} (:rest 'Syntax)
              :capabilities $ #{}
              :expansion $ :: 'Expr 'Dynamic
              :required $ [] 'SyntaxList
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote (ns ws-edn.util)
