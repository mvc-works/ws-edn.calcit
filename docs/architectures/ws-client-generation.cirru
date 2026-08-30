{}
  :schema-version 1
  :feature 'ws-client-generation
  :doc "|Generation-gated browser WebSocket client with method-oriented lifecycle APIs."
  :roots $ #{} 'ws-edn.client/create-client-with!
  :definitions $ {}
    'ws-edn.client/WsConnectionPhase $ {}
      :mode :ensure
      :kind :data
      :doc "|Explicit browser WebSocket lifecycle phase."
      :schema $ :: 'EnumDef
      :code $ quote $ defenum WsConnectionPhase (:connecting) (:open) (:backoff) (:closing) (:closed)
    'ws-edn.client/WsSendOutcome $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed outcome from attempting a browser WebSocket send."
      :schema $ :: 'EnumDef
      :code $ quote $ defenum WsSendOutcome (:sent) (:not-open 'WsConnectionPhase)
    'ws-edn.client/WsClientState $ {}
      :mode :ensure
      :kind :data
      :doc "|Generation, phase, and current host socket for one browser client."
      :schema $ :: 'StructDef
      :code $ quote $ defstruct WsClientState (:generation 'Number) (:phase 'WsConnectionPhase) (:socket (:: 'Option 'JsObject))
    'ws-edn.client/WsClient0 $ {}
      :mode :ensure
      :kind :data
      :doc "|Raw browser client handle before attaching lifecycle methods."
      :schema $ :: 'StructDef
      :code $ quote $ defstruct WsClient0
        :state $ :: 'Ref 'WsClientState
        :url 'String
        :options 'Dynamic
        :on-data $ :: 'Ref (:: 'Option 'DynFn)
        :socket-factory $ :: 'Fn $ {} (:args $ [] 'String) (:return 'JsObject) (:features $ #{} :js-ffi)
        :lifecycle-cleanup $ :: 'Ref (:: 'Option 'Fn)
        :retry-state $ :: 'Ref 'cumulo-util.realtime/RetryBackoff
        :reconnect-timer $ :: 'Ref (:: 'Option 'Number)
        :heartbeat-timeout-ms $ :: 'Option 'Number
        :heartbeat-lease $ :: 'Ref (:: 'Option 'cumulo-util.realtime/HeartbeatLease)
        :heartbeat-timer $ :: 'Ref (:: 'Option 'Number)
    'ws-edn.client/WsClientOps $ {}
      :mode :ensure
      :kind :data
      :doc "|Method contract for browser WebSocket clients."
      :schema $ :: 'Trait
      :code $ quote $ deftrait WsClientOps
        .connected? $ :: 'Fn $ {} (:generics $ [] 'T) (:args $ [] 'T) (:return 'Bool)
        .send $ :: 'Fn $ {} (:generics $ [] 'T) (:args $ [] 'T 'Dynamic) (:return 'WsSendOutcome)
        .close $ :: 'Fn $ {} (:generics $ [] 'T) (:args $ [] 'T) (:return 'Unit)
        .reconnect $ :: 'Fn $ {} (:generics $ [] 'T) (:args $ [] 'T) (:return 'Unit)
    'ws-edn.client/generation-current? $ {}
      :mode :ensure
      :kind :fn
      :doc "|Returns whether an event belongs to the active socket generation."
      :params $ [] 'state 'generation
      :schema $ :: :fn $ {} (:args $ [] 'WsClientState 'Number) (:return 'Bool)
    'ws-edn.client/transition-phase $ {}
      :mode :ensure
      :kind :fn
      :doc "|Applies a phase transition only for the active generation."
      :params $ [] 'state 'generation 'phase
      :schema $ :: :fn $ {} (:args $ [] 'WsClientState 'Number 'WsConnectionPhase) (:return (:: 'Option 'WsClientState))
    'ws-edn.client/connect-client! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Starts a new generation and installs stale-event-safe host callbacks."
      :params $ [] 'client
      :schema $ :: :fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/create-client-with! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Creates a client with an injected socket factory, primarily for tests and adapters."
      :params $ [] 'url 'options 'socket-factory
      :schema $ :: :fn $ {}
        :args $ [] 'String 'Dynamic $ :: 'Fn $ {} (:args $ [] 'String) (:return 'JsObject) (:features $ #{} :js-ffi)
        :return 'WsClient
        :features $ #{} :js-ffi
    'ws-edn.client/client-connected? $ {}
      :mode :ensure
      :kind :fn
      :doc "|Method implementation for checking the open phase."
      :params $ [] 'client
      :schema $ :: :fn $ {} (:args $ [] 'WsClient0) (:return 'Bool)
    'ws-edn.client/client-send $ {}
      :mode :ensure
      :kind :fn
      :doc "|Method implementation returning a typed send outcome."
      :params $ [] 'client 'data
      :schema $ :: :fn $ {}
        :args $ [] 'WsClient0 'Dynamic
        :return 'WsSendOutcome
        :features $ #{} :js-ffi
    'ws-edn.client/client-close! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Method implementation for explicitly closing a client."
      :params $ [] 'client
      :schema $ :: :fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/client-reconnect! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Method implementation for replacing the active generation."
      :params $ [] 'client
      :schema $ :: :fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/WsClientOpsImpl $ {}
      :mode :ensure
      :kind :data
      :doc "|Lifecycle method implementation for WsClient."
      :schema $ :: 'Impl
      :code $ quote $ defimpl WsClientOpsImpl WsClientOps (.connected? client-connected?) (.send client-send) (.close client-close!) (.reconnect client-reconnect!)
    'ws-edn.client/WsClient $ {}
      :mode :ensure
      :kind :data
      :doc "|Browser WebSocket client with nominal lifecycle methods."
      :schema $ :: 'StructDef
      :code $ quote $ def WsClient $ impl-traits WsClient0 WsClientOpsImpl
  :edges $ #{}
    :: :type 'ws-edn.client/WsClientState 'ws-edn.client/WsConnectionPhase
    :: :type 'ws-edn.client/WsClient0 'ws-edn.client/WsClientState
    :: :call 'ws-edn.client/create-client-with! 'ws-edn.client/connect-client!
    :: :call 'ws-edn.client/connect-client! 'ws-edn.client/transition-phase
    :: :call 'ws-edn.client/client-reconnect! 'ws-edn.client/connect-client!
    :: :call 'ws-edn.client/client-connected? 'ws-edn.client/generation-current?
    :: :call 'ws-edn.client/client-send 'ws-edn.client/generation-current?
    :: :type 'ws-edn.client/WsClientOpsImpl 'ws-edn.client/WsClientOps
    :: :type 'ws-edn.client/WsClient 'ws-edn.client/WsClientOpsImpl
