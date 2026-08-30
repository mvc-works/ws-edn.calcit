{}
  :schema-version 1
  :feature 'ws-client-browser-lifecycle
  :doc "|Attach Cumulo browser lifecycle recovery to the generation-gated WebSocket client without making the utility module own protocol state."
  :roots $ #{} 'ws-edn.client/install-browser-lifecycle!
  :definitions $ {}
    'ws-edn.client/WsClient0 $ {}
      :mode :external
      :kind :data
      :schema $ :: 'StructDef
    'ws-edn.client/connect-client! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/client-recover! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Reconnects from closed or backoff after cancelling a pending timer, preserving single-flight attempts."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
    'ws-edn.client/cleanup-client-lifecycle! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Runs and clears the optional browser lifecycle cleanup capability."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
    'ws-edn.client/install-browser-lifecycle! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Installs visibility and online recovery signals for a browser client."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
  :edges $ #{}
    :: :call 'ws-edn.client/client-recover! 'ws-edn.client/connect-client!
    :: :call 'ws-edn.client/install-browser-lifecycle! 'ws-edn.client/client-recover!
    :: :call 'ws-edn.client/install-browser-lifecycle! 'ws-edn.client/cleanup-client-lifecycle!
