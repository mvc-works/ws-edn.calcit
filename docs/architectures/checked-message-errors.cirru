{}
  :schema-version 1
  :feature 'checked-message-errors
  :doc "|在消息解析边界生成不含原始帧的 Result，复用 on-error 通知；应用回调位于解析保护之外，transport 参数和 generation/lifecycle 不变。"
  :roots $ #{} 'ws-edn.client/parse-client-message 'ws-edn.client/notify-client-error!
  :definitions $ {}
    'ws-edn.client/parse-client-message $ {} (:mode :ensure) (:kind :fn)
      :doc "|校验消息文本并解析 EDN，失败返回不含原始消息的稳定字符串。"
      :params $ [] 'data 'options
      :schema $ :: 'Fn $ {}
        :args $ [] 'Dynamic (:: 'Map 'Tag 'Dynamic)
        :return $ :: 'Result 'Dynamic 'String
    'ws-edn.client/notify-client-error! $ {} (:mode :ensure) (:kind :fn)
      :doc "|调用已有 on-error 一次，返回是否存在可调用的处理器，不捕获应用异常。"
      :params $ [] 'client 'error
      :schema $ :: 'Fn $ {}
        :args $ [] 'ws-edn.client/WsClient0 'Dynamic
        :return 'Bool
        :features $ #{} :js-ffi
  :edges $ #{}
