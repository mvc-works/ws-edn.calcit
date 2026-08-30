{}
  :schema-version 1
  :feature 'ws-client-heartbeat-timeout
  :doc "|Opt-in generation-safe heartbeat deadline that actively closes an unresponsive browser WebSocket."
  :roots $ #{} 'ws-edn.client/renew-client-heartbeat!
  :definitions $ {}
    'ws-edn.client/WsClient0 $ {}
      :mode :external
      :kind :data
      :schema $ :: 'StructDef
    'ws-edn.client/cancel-client-heartbeat! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Cancels and clears the heartbeat deadline timer and lease."
      :params $ [] 'client
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0
        :return 'Unit
        :features $ #{} :js-ffi
    'ws-edn.client/renew-client-heartbeat! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Renews an enabled heartbeat lease and closes the current generation after its deadline."
      :params $ [] 'client 'generation
      :schema $ :: 'Fn $ {}
        :args $ [] 'WsClient0 'Number
        :return 'Unit
        :features $ #{} :js-ffi
  :edges $ #{}
    :: :call 'ws-edn.client/renew-client-heartbeat! 'ws-edn.client/cancel-client-heartbeat!
