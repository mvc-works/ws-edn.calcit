{}
  :schema-version 1
  :feature 'ws-client-reconnect-backoff
  :doc "|Bounded single-flight reconnect scheduling above the generation-gated browser WebSocket client."
  :roots $ #{} 'ws-edn.client/schedule-client-reconnect!
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
    'ws-edn.client/cancel-client-reconnect! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Cancels and clears the single pending reconnect timer."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/schedule-client-reconnect! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Schedules one bounded backoff retry unless one is already pending."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/client-recover! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
  :edges $ #{}
    :: :call 'ws-edn.client/schedule-client-reconnect! 'ws-edn.client/connect-client!
    :: :call 'ws-edn.client/client-recover! 'ws-edn.client/cancel-client-reconnect!
    :: :call 'ws-edn.client/client-recover! 'ws-edn.client/connect-client!
