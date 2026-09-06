{}
  :schema-version 1
  :feature 'client-ref-nominal
  :doc "|Preserve the existing nominal WsClient through the singleton Ref write; do not change socket lifecycle or timer contracts."
  :roots $ #{} 'ws-edn.client/ws-connect!
  :definitions $ {}
    'ws-edn.client/ws-connect! $ {}
      :mode :external
      :kind :fn
      :schema $ :: 'Fn $ {}
        :args $ [] 'String 'Dynamic
        :return 'WsClient
        :features $ #{} :js-ffi
    'ws-edn.client/*global-client $ {}
      :mode :external
      :kind :data
      :schema $ :: 'Ref $ :: 'Option 'ws-edn.client/WsClient
    'ws-edn.client/WsClient $ {}
      :mode :external
      :kind :data
      :schema $ :: 'StructDef
    'ws-edn.client/WsClient0 $ {}
      :mode :external
      :kind :data
      :schema $ :: 'StructDef
  :edges $ #{}
    :: :type 'ws-edn.client/ws-connect! 'ws-edn.client/WsClient0
    :: :type 'ws-edn.client/ws-connect! 'ws-edn.client/WsClient
    :: :type 'ws-edn.client/*global-client 'ws-edn.client/WsClient
