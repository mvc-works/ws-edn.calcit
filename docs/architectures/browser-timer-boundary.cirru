{}
  :schema-version 1
  :feature 'browser-timer-boundary
  :doc "|Reuse js-ffi 0.1.12 browser set-timeout!: (Fn()->Unit, Number)->Number. Dependency definitions are audited with query def because scaffold resolves only local definitions. Preserve cancellation, generations and backoff."
  :roots $ #{} 'ws-edn.client/schedule-client-reconnect! 'ws-edn.client/renew-client-heartbeat!
  :definitions $ {}
    'ws-edn.client/schedule-client-reconnect! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {} (:args $ [] 'WsClient0) (:return 'Unit)
        :features $ #{} :js-ffi
    'ws-edn.client/renew-client-heartbeat! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {} (:args $ [] 'WsClient0 'Number) (:return 'Unit)
        :features $ #{} :js-ffi
  :edges $ #{}
