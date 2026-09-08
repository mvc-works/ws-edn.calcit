{}
  :schema-version 1
  :feature 'typed-host-boundaries
  :doc "|Keep browser WebSocket, Node WebSocket/event-emitter, and Date host values behind the smallest external-object contracts while preserving message and lifecycle behavior."
  :quality-note "|The 0.14.4 migration reduces typeNone 5->0, schemaDynamic 9->4, and unresolved 8->3. unsafeCoerce rises 21->30 because formerly untyped browser/Node/Date host reads are now explicitly narrowed inside lexical :js-ffi adapters; the refreshed per-definition baseline prevents further growth."
  :roots $ #{} 'ws-edn.client/connect-client! 'ws-edn.server/wss-serve! 'ws-edn.util/current-iso-time!
  :definitions $ {}
    'ws-edn.client/connect-client! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {} (:args $ [] 'WsClient0) (:return 'Unit)
        :features $ #{} :js-ffi
    'ws-edn.client/BrowserWebSocketHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed browser WebSocket surface used by the client lifecycle adapter."
      :schema $ :: 'Trait
      :code $ quote $ deftrait BrowserWebSocketHost
        :onopen 'DynFn
        :onmessage 'DynFn
        :onclose 'DynFn
        :onerror 'DynFn
        .send $ :: 'Fn $ {} (:args $ [] 'BrowserWebSocketHost 'String) (:return 'Unit)
        .close $ :: 'Fn $ {} (:args $ [] 'BrowserWebSocketHost) (:return 'Unit)
    'ws-edn.client/BrowserMessageEventHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed message-event payload exposed by browser WebSocket callbacks."
      :schema $ :: 'Trait
      :code $ quote $ deftrait BrowserMessageEventHost (:data 'String)
    'ws-edn.server/NodeWebSocketHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed Node ws connection surface used by server lifecycle adapters."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeWebSocketHost
        .on $ :: 'Fn $ {} (:args $ [] 'NodeWebSocketHost 'String 'DynFn) (:return 'NodeWebSocketHost)
        .send $ :: 'Fn $ {} (:args $ [] 'NodeWebSocketHost 'String) (:return 'Unit)
    'ws-edn.server/maintain-socket! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {} (:args $ [] 'ws-edn.server/NodeWebSocketHost 'Dynamic) (:return 'Unit)
        :features $ #{} :js-ffi
    'ws-edn.server/NodeWebSocketServerHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed Node ws server event surface."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeWebSocketServerHost
        .on $ :: 'Fn $ {} (:args $ [] 'NodeWebSocketServerHost 'String 'DynFn) (:return 'NodeWebSocketServerHost)
    'ws-edn.server/NodeDataHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed string conversion surface for Node ws message payloads."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeDataHost
        .to-string $ :: 'Fn $ {} (:args $ [] 'NodeDataHost) (:return 'String)
    'ws-edn.server/NodeHttpServerHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed HTTPS server event and listen surface used by secure WebSocket setup."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeHttpServerHost
        .add-listener $ :: 'Fn $ {} (:args $ [] 'NodeHttpServerHost 'String 'DynFn) (:return 'NodeHttpServerHost)
        .on $ :: 'Fn $ {} (:args $ [] 'NodeHttpServerHost 'String 'DynFn) (:return 'NodeHttpServerHost)
        .listen $ :: 'Fn $ {} (:args $ [] 'NodeHttpServerHost 'Number 'DynFn) (:return 'NodeHttpServerHost)
    'ws-edn.server/NodeHttpRequestHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed request URL surface used by the HTTPS upgrade diagnostic."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeHttpRequestHost
        :url $ :: 'JsNullish 'String
    'ws-edn.server/NodeHttpResponseHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed response methods used by the minimal HTTPS health response."
      :schema $ :: 'Trait
      :code $ quote $ deftrait NodeHttpResponseHost
        .write-head $ :: 'Fn $ {} (:args $ [] 'NodeHttpResponseHost 'Number) (:return 'Unit)
        .end $ :: 'Fn $ {} (:args $ [] 'NodeHttpResponseHost 'String) (:return 'Unit)
    'ws-edn.server/wss-serve! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {} (:args $ [] 'Number 'Dynamic) (:return 'NodeWebSocketServerHost)
        :features $ #{} :js-ffi
    'ws-edn.util/DateHost $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed JavaScript Date formatting surface shared by generated page and server payloads."
      :schema $ :: 'Trait
      :code $ quote $ deftrait DateHost
        .to-iso-string $ :: 'Fn $ {} (:args $ [] 'DateHost) (:return 'String)
    'ws-edn.util/current-iso-time! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Returns the current JavaScript time as an ISO string through the typed Date adapter."
      :params $ []
      :schema $ :: 'Fn $ {}
        :args $ []
        :return 'String
        :features $ #{} :js-ffi
  :edges $ #{}
    :: :type 'ws-edn.client/connect-client! 'ws-edn.client/BrowserWebSocketHost
    :: :type 'ws-edn.client/connect-client! 'ws-edn.client/BrowserMessageEventHost
    :: :type 'ws-edn.server/wss-serve! 'ws-edn.server/NodeWebSocketServerHost
    :: :type 'ws-edn.server/wss-serve! 'ws-edn.server/NodeHttpServerHost
    :: :type 'ws-edn.server/wss-serve! 'ws-edn.server/NodeHttpRequestHost
    :: :type 'ws-edn.server/wss-serve! 'ws-edn.server/NodeHttpResponseHost
    :: :type 'ws-edn.server/maintain-socket! 'ws-edn.server/NodeWebSocketHost
    :: :type 'ws-edn.server/maintain-socket! 'ws-edn.server/NodeDataHost
    :: :type 'ws-edn.util/current-iso-time! 'ws-edn.util/DateHost
