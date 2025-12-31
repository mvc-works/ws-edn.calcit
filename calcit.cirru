
{} (:package |ws-edn)
  :configs $ {} (:init-fn |ws-edn.app.page/main!) (:reload-fn |ws-edn.app.page/reload!) (:version |0.0.11)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |ws-edn.app.server/main!) (:reload-fn |ws-edn.app.server/reload!) (:version |0.0.0)
      :modules $ []
  :files $ {}
    |ws-edn.app.page $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544546050477) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1544546050477) (:by |aQJLUBr_Hp) (:text |defn)
              |j $ %{} :Leaf (:at 1544546050477) (:by |aQJLUBr_Hp) (:text |main!)
              |r $ %{} :Expr (:at 1544546050477) (:by |aQJLUBr_Hp)
                :data $ {}
              |v $ %{} :Expr (:at 1544546067312) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544546068176) (:by |aQJLUBr_Hp) (:text |println)
                  |j $ %{} :Leaf (:at 1544546069945) (:by |aQJLUBr_Hp) (:text "|\"start")
              |w $ %{} :Expr (:at 1688320968756) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1688320978639) (:by |aQJLUBr_Hp) (:text |load-console-formatter!)
              |x $ %{} :Expr (:at 1544548406724) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544638474733) (:by |aQJLUBr_Hp) (:text |ws-connect!)
                  |j $ %{} :Expr (:at 1706635085092) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1706635086818) (:by |aQJLUBr_Hp) (:text |do)
                      |T $ %{} :Leaf (:at 1688226660915) (:by |aQJLUBr_Hp) (:text "|\"wss://localhost:5001")
                      |b $ %{} :Leaf (:at 1712258021519) (:by |aQJLUBr_Hp) (:text "|\"ws://localhost:9001")
                  |r $ %{} :Expr (:at 1544548468156) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544548468522) (:by |aQJLUBr_Hp) (:text |{})
                      |j $ %{} :Expr (:at 1544548469083) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810676346) (:by |aQJLUBr_Hp) (:text |:on-open)
                          |j $ %{} :Expr (:at 1544548472288) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544548472562) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544548472890) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544548475401) (:by |aQJLUBr_Hp) (:text |event)
                              |r $ %{} :Expr (:at 1544548475863) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544548476797) (:by |aQJLUBr_Hp) (:text |println)
                                  |j $ %{} :Leaf (:at 1544548477884) (:by |aQJLUBr_Hp) (:text "|\"open")
                              |v $ %{} :Expr (:at 1544549504171) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544638465601) (:by |aQJLUBr_Hp) (:text |ws-send!)
                                  |j $ %{} :Expr (:at 1544549515095) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1688226726948) (:by |aQJLUBr_Hp) (:text |:)
                                      |b $ %{} :Leaf (:at 1688226727677) (:by |aQJLUBr_Hp) (:text |test)
                      |r $ %{} :Expr (:at 1544548487987) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810677692) (:by |aQJLUBr_Hp) (:text |:on-data)
                          |j $ %{} :Expr (:at 1544548491165) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544548491530) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544548495147) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544548497650) (:by |aQJLUBr_Hp) (:text |data)
                              |r $ %{} :Expr (:at 1544548498052) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712259135698) (:by |aQJLUBr_Hp) (:text |js/console.log)
                                  |j $ %{} :Leaf (:at 1544548500226) (:by |aQJLUBr_Hp) (:text "|\"data")
                                  |r $ %{} :Leaf (:at 1544548501271) (:by |aQJLUBr_Hp) (:text |data)
                      |v $ %{} :Expr (:at 1544548505415) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810678783) (:by |aQJLUBr_Hp) (:text |:on-close)
                          |j $ %{} :Expr (:at 1544548508061) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544548508424) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544548509961) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544548511564) (:by |aQJLUBr_Hp) (:text |event)
                              |r $ %{} :Expr (:at 1544548512621) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544548513465) (:by |aQJLUBr_Hp) (:text |println)
                                  |j $ %{} :Leaf (:at 1544548515163) (:by |aQJLUBr_Hp) (:text "|\"close")
                      |w $ %{} :Expr (:at 1712259048714) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712259048714) (:by |aQJLUBr_Hp) (:text |:class-mapper)
                          |b $ %{} :Expr (:at 1712259048714) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1712259048714) (:by |aQJLUBr_Hp) (:text |{})
                              |b $ %{} :Expr (:at 1712259048714) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712259048714) (:by |aQJLUBr_Hp) (:text |:Track)
                                  |b $ %{} :Leaf (:at 1712259048714) (:by |aQJLUBr_Hp) (:text |Track)
              |y $ %{} :Expr (:at 1546105618235) (:by |VDPjyAOgV)
                :data $ {}
                  |T $ %{} :Leaf (:at 1546105621910) (:by |VDPjyAOgV) (:text |js/setInterval)
                  |b $ %{} :Expr (:at 1546105626511) (:by |VDPjyAOgV)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1546105625821) (:by |VDPjyAOgV) (:text |fn)
                      |j $ %{} :Expr (:at 1546105626872) (:by |VDPjyAOgV)
                        :data $ {}
                      |r $ %{} :Expr (:at 1546105627888) (:by |VDPjyAOgV)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1546105628841) (:by |VDPjyAOgV) (:text |println)
                          |b $ %{} :Leaf (:at 1621499446659) (:by |aQJLUBr_Hp) (:text "|\"connected try send")
                          |j $ %{} :Expr (:at 1546105631848) (:by |VDPjyAOgV)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1546105631637) (:by |VDPjyAOgV) (:text |ws-connected?)
                      |v $ %{} :Expr (:at 1621499447450) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621499450345) (:by |aQJLUBr_Hp) (:text |ws-send!)
                          |j $ %{} :Expr (:at 1621499452268) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1621499452596) (:by |aQJLUBr_Hp) (:text |{})
                              |j $ %{} :Expr (:at 1621499452833) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1621499454603) (:by |aQJLUBr_Hp) (:text |:data)
                                  |j $ %{} :Leaf (:at 1621499460181) (:by |aQJLUBr_Hp) (:text "|\"just message")
                      |w $ %{} :Expr (:at 1621499447450) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621499450345) (:by |aQJLUBr_Hp) (:text |ws-send!)
                          |j $ %{} :Expr (:at 1621499452268) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1688321918964) (:by |aQJLUBr_Hp) (:text |:)
                              |b $ %{} :Leaf (:at 1688321920601) (:by |aQJLUBr_Hp) (:text |message)
                              |h $ %{} :Leaf (:at 1688321922622) (:by |aQJLUBr_Hp) (:text "|\"in")
                              |l $ %{} :Leaf (:at 1688321926287) (:by |aQJLUBr_Hp) (:text "|\"string")
                      |x $ %{} :Expr (:at 1712258797335) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712258800125) (:by |aQJLUBr_Hp) (:text |ws-send!)
                          |b $ %{} :Expr (:at 1712258825345) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |D $ %{} :Leaf (:at 1712258875422) (:by |aQJLUBr_Hp) (:text |%{})
                              |T $ %{} :Leaf (:at 1712258827865) (:by |aQJLUBr_Hp) (:text |Track)
                              |b $ %{} :Expr (:at 1712258933683) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712258937127) (:by |aQJLUBr_Hp) (:text |:message)
                                  |b $ %{} :Leaf (:at 1712258941007) (:by |aQJLUBr_Hp) (:text "|\"from client")
                              |h $ %{} :Expr (:at 1712258941708) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712258942739) (:by |aQJLUBr_Hp) (:text |:time)
                                  |b $ %{} :Expr (:at 1712258949821) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |D $ %{} :Leaf (:at 1712258972339) (:by |aQJLUBr_Hp) (:text |.!toISOString)
                                      |T $ %{} :Expr (:at 1712258943304) (:by |aQJLUBr_Hp)
                                        :data $ {}
                                          |D $ %{} :Leaf (:at 1712258948720) (:by |aQJLUBr_Hp) (:text |new)
                                          |T $ %{} :Leaf (:at 1712258946341) (:by |aQJLUBr_Hp) (:text |js/Date)
                  |j $ %{} :Leaf (:at 1546105624993) (:by |VDPjyAOgV) (:text |2000)
          :examples $ []
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544546051379) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1544546051379) (:by |aQJLUBr_Hp) (:text |defn)
              |j $ %{} :Leaf (:at 1544546051379) (:by |aQJLUBr_Hp) (:text |reload!)
              |r $ %{} :Expr (:at 1544546051379) (:by |aQJLUBr_Hp)
                :data $ {}
              |t $ %{} :Expr (:at 1621497455013) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1621499725531) (:by |aQJLUBr_Hp) (:text |ws-set-on-data!)
                  |j $ %{} :Expr (:at 1621497457863) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1621497458164) (:by |aQJLUBr_Hp) (:text |fn)
                      |j $ %{} :Expr (:at 1621497458389) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621497458965) (:by |aQJLUBr_Hp) (:text |data)
                      |r $ %{} :Expr (:at 1621497459419) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621497460973) (:by |aQJLUBr_Hp) (:text |println)
                          |j $ %{} :Leaf (:at 1621500518892) (:by |aQJLUBr_Hp) (:text "|\"reloaded 8:")
                          |r $ %{} :Leaf (:at 1621497463566) (:by |aQJLUBr_Hp) (:text |data)
              |v $ %{} :Expr (:at 1544546056361) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544546058025) (:by |aQJLUBr_Hp) (:text |println)
                  |j $ %{} :Leaf (:at 1544546060744) (:by |aQJLUBr_Hp) (:text "|\"reload")
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544464189777) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1544464189777) (:by |aQJLUBr_Hp) (:text |ns)
            |j $ %{} :Leaf (:at 1544464189777) (:by |aQJLUBr_Hp) (:text |ws-edn.app.page)
            |r $ %{} :Expr (:at 1544548429943) (:by |aQJLUBr_Hp)
              :data $ {}
                |T $ %{} :Leaf (:at 1544548429377) (:by |aQJLUBr_Hp) (:text |:require)
                |j $ %{} :Expr (:at 1544548430873) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1544548430873) (:by |aQJLUBr_Hp) (:text |ws-edn.client)
                    |r $ %{} :Leaf (:at 1544548430873) (:by |aQJLUBr_Hp) (:text |:refer)
                    |v $ %{} :Expr (:at 1544548430873) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1544638469178) (:by |aQJLUBr_Hp) (:text |ws-connect!)
                        |r $ %{} :Leaf (:at 1544638471535) (:by |aQJLUBr_Hp) (:text |ws-send!)
                        |v $ %{} :Leaf (:at 1546105636878) (:by |VDPjyAOgV) (:text |ws-connected?)
                        |x $ %{} :Leaf (:at 1621499723967) (:by |aQJLUBr_Hp) (:text |ws-set-on-data!)
                |n $ %{} :Expr (:at 1712258813260) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1712258817417) (:by |aQJLUBr_Hp) (:text |ws-edn.schema)
                    |b $ %{} :Leaf (:at 1712258818144) (:by |aQJLUBr_Hp) (:text |:refer)
                    |h $ %{} :Expr (:at 1712258818435) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1712258821003) (:by |aQJLUBr_Hp) (:text |Track)
        :examples $ []
    |ws-edn.app.server $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544546020645) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1544546020645) (:by |aQJLUBr_Hp) (:text |defn)
              |j $ %{} :Leaf (:at 1544546020645) (:by |aQJLUBr_Hp) (:text |main!)
              |r $ %{} :Expr (:at 1544546020645) (:by |aQJLUBr_Hp)
                :data $ {}
              |v $ %{} :Expr (:at 1544546025640) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544546029176) (:by |aQJLUBr_Hp) (:text |println)
                  |j $ %{} :Leaf (:at 1544546030835) (:by |aQJLUBr_Hp) (:text "|\"started")
              |w $ %{} :Expr (:at 1712258710027) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1712258710027) (:by |aQJLUBr_Hp) (:text |load-console-formatter!)
              |x $ %{} :Expr (:at 1544547728020) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544638535544) (:by |aQJLUBr_Hp) (:text |wss-serve!)
                  |j $ %{} :Leaf (:at 1712257989992) (:by |aQJLUBr_Hp) (:text |9001)
                  |r $ %{} :Expr (:at 1544547882463) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544547883034) (:by |aQJLUBr_Hp) (:text |{})
                      |b $ %{} :Expr (:at 1544724173453) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810745200) (:by |aQJLUBr_Hp) (:text |:on-listening)
                          |j $ %{} :Expr (:at 1544724179265) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724179573) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544724180013) (:by |aQJLUBr_Hp)
                                :data $ {}
                              |r $ %{} :Expr (:at 1544724181037) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544724181909) (:by |aQJLUBr_Hp) (:text |println)
                                  |j $ %{} :Leaf (:at 1544724185989) (:by |aQJLUBr_Hp) (:text "|\"server listening")
                      |j $ %{} :Expr (:at 1544547883246) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810743007) (:by |aQJLUBr_Hp) (:text |:on-open)
                          |j $ %{} :Expr (:at 1544547888855) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544547889164) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544547889411) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544547891563) (:by |aQJLUBr_Hp) (:text |sid)
                                  |j $ %{} :Leaf (:at 1544547899666) (:by |aQJLUBr_Hp) (:text |socket)
                              |r $ %{} :Expr (:at 1544547900090) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544547903791) (:by |aQJLUBr_Hp) (:text |println)
                                  |j $ %{} :Leaf (:at 1544547939336) (:by |aQJLUBr_Hp) (:text "|\"opened")
                                  |r $ %{} :Leaf (:at 1544547941797) (:by |aQJLUBr_Hp) (:text |sid)
                              |v $ %{} :Expr (:at 1544549772993) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544638502885) (:by |aQJLUBr_Hp) (:text |wss-send!)
                                  |j $ %{} :Leaf (:at 1544549783365) (:by |aQJLUBr_Hp) (:text |sid)
                                  |r $ %{} :Expr (:at 1544549792175) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1688226817060) (:by |aQJLUBr_Hp) (:text |:)
                                      |b $ %{} :Leaf (:at 1688226817511) (:by |aQJLUBr_Hp) (:text |op)
                                      |j $ %{} :Leaf (:at 1544549800499) (:by |aQJLUBr_Hp) (:text "|\"initial message")
                      |r $ %{} :Expr (:at 1544547942745) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810746424) (:by |aQJLUBr_Hp) (:text |:on-data)
                          |j $ %{} :Expr (:at 1544547944952) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544547945267) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544547945549) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544547947111) (:by |aQJLUBr_Hp) (:text |sid)
                                  |j $ %{} :Leaf (:at 1544547948125) (:by |aQJLUBr_Hp) (:text |data)
                              |r $ %{} :Expr (:at 1544547948938) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712258651067) (:by |aQJLUBr_Hp) (:text |js/console.log)
                                  |j $ %{} :Leaf (:at 1621499583527) (:by |aQJLUBr_Hp) (:text "|\"just data")
                                  |r $ %{} :Leaf (:at 1544547955215) (:by |aQJLUBr_Hp) (:text |sid)
                                  |v $ %{} :Leaf (:at 1544547955773) (:by |aQJLUBr_Hp) (:text |data)
                      |v $ %{} :Expr (:at 1544547961776) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810747702) (:by |aQJLUBr_Hp) (:text |:on-close)
                          |j $ %{} :Expr (:at 1544547965030) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544547965364) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544547965672) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544547966295) (:by |aQJLUBr_Hp) (:text |sid)
                                  |j $ %{} :Leaf (:at 1544547968724) (:by |aQJLUBr_Hp) (:text |event)
                              |r $ %{} :Expr (:at 1544547969193) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544547970840) (:by |aQJLUBr_Hp) (:text |println)
                                  |j $ %{} :Leaf (:at 1544547973633) (:by |aQJLUBr_Hp) (:text "|\"close")
                                  |r $ %{} :Leaf (:at 1544547976416) (:by |aQJLUBr_Hp) (:text |sid)
                      |x $ %{} :Expr (:at 1644660486536) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1712257987061) (:by |aQJLUBr_Hp) (:text |;)
                          |T $ %{} :Leaf (:at 1644663074171) (:by |aQJLUBr_Hp) (:text |:key)
                          |j $ %{} :Leaf (:at 1644660502338) (:by |aQJLUBr_Hp) (:text "|\"certs/key.pem")
                      |y $ %{} :Expr (:at 1644660508203) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |D $ %{} :Leaf (:at 1712257986288) (:by |aQJLUBr_Hp) (:text |;)
                          |T $ %{} :Leaf (:at 1644663075897) (:by |aQJLUBr_Hp) (:text |:cert)
                          |j $ %{} :Leaf (:at 1644660510986) (:by |aQJLUBr_Hp) (:text "|\"certs/cert.pem")
                      |z $ %{} :Expr (:at 1712259015766) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712259018561) (:by |aQJLUBr_Hp) (:text |:class-mapper)
                          |b $ %{} :Expr (:at 1712259019207) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1712259019540) (:by |aQJLUBr_Hp) (:text |{})
                              |b $ %{} :Expr (:at 1712259019868) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1712259023173) (:by |aQJLUBr_Hp) (:text |:Track)
                                  |b $ %{} :Leaf (:at 1712259033014) (:by |aQJLUBr_Hp) (:text |Track)
              |y $ %{} :Expr (:at 1544723628971) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544723630790) (:by |aQJLUBr_Hp) (:text |js/setInterval)
                  |j $ %{} :Expr (:at 1544723630790) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544723630790) (:by |aQJLUBr_Hp) (:text |fn)
                      |j $ %{} :Expr (:at 1544723630790) (:by |aQJLUBr_Hp)
                        :data $ {}
                      |n $ %{} :Expr (:at 1544723653596) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544723654448) (:by |aQJLUBr_Hp) (:text |println)
                          |j $ %{} :Leaf (:at 1544724587225) (:by |aQJLUBr_Hp) (:text "|\"heartbeat")
                      |r $ %{} :Expr (:at 1544723630790) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544724444675) (:by |aQJLUBr_Hp) (:text |wss-each!)
                          |j $ %{} :Expr (:at 1544723640898) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544723641216) (:by |aQJLUBr_Hp) (:text |fn)
                              |j $ %{} :Expr (:at 1544723641528) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544723643081) (:by |aQJLUBr_Hp) (:text |sid)
                                  |j $ %{} :Leaf (:at 1544723644344) (:by |aQJLUBr_Hp) (:text |socket)
                              |r $ %{} :Expr (:at 1544723644798) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1614135470770) (:by |aQJLUBr_Hp) (:text |js/console.log)
                                  |j $ %{} :Leaf (:at 1544723647241) (:by |aQJLUBr_Hp) (:text |sid)
                              |v $ %{} :Expr (:at 1621498047999) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1621498047999) (:by |aQJLUBr_Hp) (:text |wss-send!)
                                  |j $ %{} :Leaf (:at 1621498050608) (:by |aQJLUBr_Hp) (:text |sid)
                                  |r $ %{} :Expr (:at 1621498054045) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1688226767286) (:by |aQJLUBr_Hp) (:text |:)
                                      |b $ %{} :Leaf (:at 1688226768527) (:by |aQJLUBr_Hp) (:text |message)
                                      |j $ %{} :Leaf (:at 1621498063826) (:by |aQJLUBr_Hp) (:text "|\"event 2s")
                              |w $ %{} :Expr (:at 1621498047999) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1621498047999) (:by |aQJLUBr_Hp) (:text |wss-send!)
                                  |j $ %{} :Leaf (:at 1621498050608) (:by |aQJLUBr_Hp) (:text |sid)
                                  |r $ %{} :Expr (:at 1621498054045) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1712259081323) (:by |aQJLUBr_Hp) (:text |%{})
                                      |b $ %{} :Leaf (:at 1712259083593) (:by |aQJLUBr_Hp) (:text |Track)
                                      |j $ %{} :Expr (:at 1712259084889) (:by |aQJLUBr_Hp)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1712259086118) (:by |aQJLUBr_Hp) (:text |:message)
                                          |b $ %{} :Leaf (:at 1712259089372) (:by |aQJLUBr_Hp) (:text "|\"from server")
                                      |n $ %{} :Expr (:at 1712259089759) (:by |aQJLUBr_Hp)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1712259090805) (:by |aQJLUBr_Hp) (:text |:time)
                                          |b $ %{} :Expr (:at 1712259093916) (:by |aQJLUBr_Hp)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1712259097371) (:by |aQJLUBr_Hp) (:text |->)
                                              |b $ %{} :Leaf (:at 1712259099333) (:by |aQJLUBr_Hp) (:text |js/Date)
                                              |h $ %{} :Leaf (:at 1712259100901) (:by |aQJLUBr_Hp) (:text |new)
                                              |l $ %{} :Expr (:at 1712259101816) (:by |aQJLUBr_Hp)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1712259106182) (:by |aQJLUBr_Hp) (:text |.!toISOString)
                  |r $ %{} :Leaf (:at 1544723630790) (:by |aQJLUBr_Hp) (:text |2000)
          :examples $ []
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1544546023324) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1544546023324) (:by |aQJLUBr_Hp) (:text |defn)
              |j $ %{} :Leaf (:at 1544546023324) (:by |aQJLUBr_Hp) (:text |reload!)
              |r $ %{} :Expr (:at 1544546023324) (:by |aQJLUBr_Hp)
                :data $ {}
              |t $ %{} :Expr (:at 1621499049650) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1621499635012) (:by |aQJLUBr_Hp) (:text |wss-set-on-data!)
                  |j $ %{} :Expr (:at 1621499062953) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1621499063309) (:by |aQJLUBr_Hp) (:text |fn)
                      |j $ %{} :Expr (:at 1621499063573) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621499586933) (:by |aQJLUBr_Hp) (:text |sid)
                          |j $ %{} :Leaf (:at 1621499066558) (:by |aQJLUBr_Hp) (:text |data)
                      |r $ %{} :Expr (:at 1621499066923) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712258607703) (:by |aQJLUBr_Hp) (:text |js/console.log)
                          |j $ %{} :Leaf (:at 1621500524270) (:by |aQJLUBr_Hp) (:text "|\"reloaded 8:")
                          |n $ %{} :Leaf (:at 1621499560273) (:by |aQJLUBr_Hp) (:text |sid)
                          |r $ %{} :Leaf (:at 1621499075117) (:by |aQJLUBr_Hp) (:text |data)
              |v $ %{} :Expr (:at 1544546034960) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544546036182) (:by |aQJLUBr_Hp) (:text |println)
                  |j $ %{} :Leaf (:at 1544546038619) (:by |aQJLUBr_Hp) (:text "|\"reload!")
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544464151788) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1544464151788) (:by |aQJLUBr_Hp) (:text |ns)
            |j $ %{} :Leaf (:at 1544464151788) (:by |aQJLUBr_Hp) (:text |ws-edn.app.server)
            |r $ %{} :Expr (:at 1544547713449) (:by |aQJLUBr_Hp)
              :data $ {}
                |T $ %{} :Leaf (:at 1544547714878) (:by |aQJLUBr_Hp) (:text |:require)
                |j $ %{} :Expr (:at 1544547715119) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1544547719895) (:by |aQJLUBr_Hp) (:text |ws-edn.server)
                    |r $ %{} :Leaf (:at 1544547720586) (:by |aQJLUBr_Hp) (:text |:refer)
                    |v $ %{} :Expr (:at 1544547720780) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1544638512599) (:by |aQJLUBr_Hp) (:text |wss-serve!)
                        |r $ %{} :Leaf (:at 1544638506925) (:by |aQJLUBr_Hp) (:text |wss-send!)
                        |v $ %{} :Leaf (:at 1544724447213) (:by |aQJLUBr_Hp) (:text |wss-each!)
                        |x $ %{} :Leaf (:at 1621499630802) (:by |aQJLUBr_Hp) (:text |wss-set-on-data!)
                |n $ %{} :Expr (:at 1712259033014) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1712259033014) (:by |aQJLUBr_Hp) (:text |ws-edn.schema)
                    |b $ %{} :Leaf (:at 1712259033014) (:by |aQJLUBr_Hp) (:text |:refer)
                    |h $ %{} :Expr (:at 1712259033014) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1712259033014) (:by |aQJLUBr_Hp) (:text |Track)
        :examples $ []
    |ws-edn.client $ %{} :FileEntry
      :defs $ {}
        |*global-ws $ %{} :CodeEntry (:doc "|Global atom that stores the WebSocket instance. Used internally to track the current connection.")
          :code $ %{} :Expr (:at 1544464574710) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1614084484673) (:by |aQJLUBr_Hp) (:text |defatom)
              |j $ %{} :Leaf (:at 1544464574710) (:by |aQJLUBr_Hp) (:text |*global-ws)
              |r $ %{} :Leaf (:at 1544464574710) (:by |aQJLUBr_Hp) (:text |nil)
          :examples $ []
        |ws-connect! $ %{} :CodeEntry (:doc "|Establishes a WebSocket connection to the specified URL. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-connect!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-url)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |assert)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"reqiured an url for ws server")
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |string?)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-url)
              |b $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |new)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/WebSocket)
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-url)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |reset!)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |*global-ws)
                      |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                  |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |when-let)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-open)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-open)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |set!)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-onopen)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-open)
                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                  |b $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |set!)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-onclose)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |reset!)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |*global-ws)
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |nil)
                          |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |when-let)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-close)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-close)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-close)
                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                  |d $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |when-let)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-data)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |set!)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-onmessage)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |parse-cirru-edn)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-data)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |&map:get)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:class-mapper)
                  |f $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |set!)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-onerror)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.error)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"Failed to establish connection")
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
                          |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |when-let)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-error)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-error)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-error)
                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
          :examples $ []
            quote $ ws-connect! |ws://localhost:8080
              {}
                :on-open $ fn (event) (println |connected)
                :on-close $ fn (event) (println |closed)
                :on-data $ fn (data) (println |received: data)
        |ws-connected? $ %{} :CodeEntry (:doc "|Returns true if WebSocket is currently connected, false otherwise.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-connected?)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |@*global-ws)
          :examples $ []
            quote $ ws-connected?
        |ws-send! $ %{} :CodeEntry (:doc "|Sends data through the WebSocket connection. Data will be formatted as Cirru EDN before sending.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-send!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |data)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |@*global-ws)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!send)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |format-cirru-edn)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |data)
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.warn)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "||WebSocket at close state!")
          :examples $ []
            quote $ ws-send!
              {} (:type |ping)
                :timestamp $ unix-time!
        |ws-set-on-data! $ %{} :CodeEntry (:doc "|Sets the message handler for incoming WebSocket data. Handler receives parsed Cirru EDN data.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws-set-on-data!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |@*global-ws)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |set!)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-onmessage)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ws)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |parse-cirru-edn)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-data)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |event)
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.warn)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"missing running ws instance")
          :examples $ []
            quote $ ws-set-on-data!
              fn (data) (println "|New message:" data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544464133674) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1544464133674) (:by |aQJLUBr_Hp) (:text |ns)
            |j $ %{} :Leaf (:at 1544464133674) (:by |aQJLUBr_Hp) (:text |ws-edn.client)
            |r $ %{} :Expr (:at 1544545986244) (:by |aQJLUBr_Hp)
              :data $ {}
                |T $ %{} :Leaf (:at 1544545987684) (:by |aQJLUBr_Hp) (:text |:require)
                |j $ %{} :Expr (:at 1614144568115) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1614144568713) (:by |aQJLUBr_Hp) (:text |[])
                    |j $ %{} :Leaf (:at 1614144577800) (:by |aQJLUBr_Hp) (:text |ws-edn.util)
                    |r $ %{} :Leaf (:at 1614144578946) (:by |aQJLUBr_Hp) (:text |:refer)
                    |v $ %{} :Expr (:at 1614144579147) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1614144579299) (:by |aQJLUBr_Hp) (:text |[])
                        |j $ %{} :Leaf (:at 1614144581839) (:by |aQJLUBr_Hp) (:text |when-let)
                        |r $ %{} :Leaf (:at 1614144583190) (:by |aQJLUBr_Hp) (:text |parse-data)
                        |v $ %{} :Leaf (:at 1614144586597) (:by |aQJLUBr_Hp) (:text |stringify-data)
        :examples $ []
    |ws-edn.schema $ %{} :FileEntry
      :defs $ {}
        |Track $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1712258753396) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1712258910819) (:by |aQJLUBr_Hp) (:text |def)
              |b $ %{} :Leaf (:at 1712258753396) (:by |aQJLUBr_Hp) (:text |Track)
              |h $ %{} :Expr (:at 1712258914946) (:by |aQJLUBr_Hp)
                :data $ {}
                  |D $ %{} :Leaf (:at 1712258918632) (:by |aQJLUBr_Hp) (:text |new-class-record)
                  |L $ %{} :Leaf (:at 1712258921772) (:by |aQJLUBr_Hp) (:text |TrackMethods)
                  |P $ %{} :Leaf (:at 1712258931531) (:by |aQJLUBr_Hp) (:text |:Track)
                  |T $ %{} :Leaf (:at 1712258777675) (:by |aQJLUBr_Hp) (:text |:message)
                  |b $ %{} :Leaf (:at 1712258923776) (:by |aQJLUBr_Hp) (:text |:time)
          :examples $ []
        |TrackMethods $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1712258838886) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1712258840832) (:by |aQJLUBr_Hp) (:text |defrecord!)
              |b $ %{} :Leaf (:at 1712258838886) (:by |aQJLUBr_Hp) (:text |TrackMethods)
              |h $ %{} :Expr (:at 1712258838886) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1712258844795) (:by |aQJLUBr_Hp) (:text |:log)
                  |b $ %{} :Expr (:at 1712258845489) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1712258846115) (:by |aQJLUBr_Hp) (:text |fn)
                      |b $ %{} :Expr (:at 1712258846851) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712258847603) (:by |aQJLUBr_Hp) (:text |self)
                      |h $ %{} :Expr (:at 1712258848735) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1712258850985) (:by |aQJLUBr_Hp) (:text |js/console.log)
                          |b $ %{} :Expr (:at 1712258853817) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1712258855184) (:by |aQJLUBr_Hp) (:text |get)
                              |b $ %{} :Leaf (:at 1712258856040) (:by |aQJLUBr_Hp) (:text |self)
                              |h $ %{} :Leaf (:at 1712258857297) (:by |aQJLUBr_Hp) (:text |:time)
                          |h $ %{} :Leaf (:at 1712258860297) (:by |aQJLUBr_Hp) (:text "|\"-")
                          |l $ %{} :Expr (:at 1712258861030) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1712258861479) (:by |aQJLUBr_Hp) (:text |get)
                              |b $ %{} :Leaf (:at 1712258862034) (:by |aQJLUBr_Hp) (:text |self)
                              |h $ %{} :Leaf (:at 1712258863325) (:by |aQJLUBr_Hp) (:text |:message)
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1712258740718) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1712258740718) (:by |aQJLUBr_Hp) (:text |ns)
            |b $ %{} :Leaf (:at 1712258740718) (:by |aQJLUBr_Hp) (:text |ws-edn.schema)
        :examples $ []
    |ws-edn.server $ %{} :FileEntry
      :defs $ {}
        |*global-connections $ %{} :CodeEntry (:doc "|Global atom that stores active WebSocket connections as a map of session-id to socket.")
          :code $ %{} :Expr (:at 1544464593464) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1614084825136) (:by |aQJLUBr_Hp) (:text |defatom)
              |j $ %{} :Leaf (:at 1544464593464) (:by |aQJLUBr_Hp) (:text |*global-connections)
              |r $ %{} :Expr (:at 1544464593464) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544464593464) (:by |aQJLUBr_Hp) (:text |{})
          :examples $ []
        |*proxied-data-listener $ %{} :CodeEntry (:doc "|Global atom that stores the data listener callback function. Used internally for message handling.")
          :code $ %{} :Expr (:at 1621498797887) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1621498799644) (:by |aQJLUBr_Hp) (:text |defatom)
              |j $ %{} :Leaf (:at 1621498797887) (:by |aQJLUBr_Hp) (:text |*proxied-data-listener)
              |r $ %{} :Leaf (:at 1621498801653) (:by |aQJLUBr_Hp) (:text |nil)
          :examples $ []
        |maintain-socket! $ %{} :CodeEntry (:doc "|Registers and maintains a WebSocket connection. Sets up event handlers for message, close, and error events. Accepts options map with :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1544724092867) (:by |aQJLUBr_Hp) (:text |defn)
              |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |maintain-socket!)
              |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                  |j $ %{} :Leaf (:at 1544724097962) (:by |aQJLUBr_Hp) (:text |options)
              |x $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |let)
                  |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                          |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |j $ %{} :Leaf (:at 1644659634093) (:by |aQJLUBr_Hp) (:text |nanoid)
                  |v $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |swap!)
                      |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |*global-connections)
                      |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |assoc)
                      |v $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                      |x $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                  |x $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |when-let)
                      |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810714106) (:by |aQJLUBr_Hp) (:text |on-open)
                          |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544810715239) (:by |aQJLUBr_Hp) (:text |:on-open)
                              |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |options)
                      |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544810717000) (:by |aQJLUBr_Hp) (:text |on-open)
                          |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                          |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                  |xT $ %{} :Expr (:at 1621498783236) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |D $ %{} :Leaf (:at 1621498806732) (:by |aQJLUBr_Hp) (:text |reset!)
                      |T $ %{} :Leaf (:at 1621498797291) (:by |aQJLUBr_Hp) (:text |*proxied-data-listener)
                      |j $ %{} :Expr (:at 1621498809574) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1621498809574) (:by |aQJLUBr_Hp) (:text |:on-data)
                          |j $ %{} :Leaf (:at 1621498809574) (:by |aQJLUBr_Hp) (:text |options)
                  |y $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1627725945766) (:by |aQJLUBr_Hp) (:text |.!on)
                      |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                      |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text "|\"message")
                      |v $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |fn)
                          |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |raw-data)
                              |r $ %{} :Leaf (:at 1627725610211) (:by |aQJLUBr_Hp) (:text |binary?)
                          |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |when-let)
                              |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544810718385) (:by |aQJLUBr_Hp) (:text |on-data)
                                  |j $ %{} :Leaf (:at 1621498952618) (:by |aQJLUBr_Hp) (:text |@*proxied-data-listener)
                              |r $ %{} :Expr (:at 1627725920100) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |on-data)
                                  |j $ %{} :Leaf (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |sid)
                                  |r $ %{} :Expr (:at 1627725920100) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |parse-cirru-edn)
                                      |j $ %{} :Expr (:at 1627725920100) (:by |aQJLUBr_Hp)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |.!toString)
                                          |j $ %{} :Leaf (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |raw-data)
                                      |n $ %{} :Expr (:at 1712258181422) (:by |aQJLUBr_Hp)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1712258185739) (:by |aQJLUBr_Hp) (:text |&map:get)
                                          |b $ %{} :Leaf (:at 1712258188805) (:by |aQJLUBr_Hp) (:text |options)
                                          |h $ %{} :Leaf (:at 1712258457379) (:by |aQJLUBr_Hp) (:text |:class-mapper)
                  |yT $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1627725947620) (:by |aQJLUBr_Hp) (:text |.!on)
                      |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                      |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text "|\"close")
                      |v $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |fn)
                          |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |event)
                              |r $ %{} :Leaf (:at 1627725612239) (:by |aQJLUBr_Hp) (:text |binary?)
                          |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |swap!)
                              |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |*global-connections)
                              |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |dissoc)
                              |v $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                          |v $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |when-let)
                              |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544810722907) (:by |aQJLUBr_Hp) (:text |on-close)
                                  |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1544810723953) (:by |aQJLUBr_Hp) (:text |:on-close)
                                      |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |options)
                              |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544810725555) (:by |aQJLUBr_Hp) (:text |on-close)
                                  |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                                  |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |event)
                  |yj $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1627725949323) (:by |aQJLUBr_Hp) (:text |.!on)
                      |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |socket)
                      |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text "|\"error")
                      |v $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |fn)
                          |j $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |error)
                          |r $ %{} :Expr (:at 1544724084862) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |swap!)
                              |j $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |*global-connections)
                              |r $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |dissoc)
                              |v $ %{} :Leaf (:at 1544724084862) (:by |aQJLUBr_Hp) (:text |sid)
                          |v $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1614086096831) (:by |aQJLUBr_Hp) (:text |&let)
                              |j $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544810726857) (:by |aQJLUBr_Hp) (:text |on-error)
                                  |j $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1544810728238) (:by |aQJLUBr_Hp) (:text |:on-error)
                                      |j $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |options)
                              |r $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |if)
                                  |j $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |some?)
                                      |j $ %{} :Leaf (:at 1544810729879) (:by |aQJLUBr_Hp) (:text |on-error)
                                  |r $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1544810731427) (:by |aQJLUBr_Hp) (:text |on-error)
                                      |j $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |error)
                                  |v $ %{} :Expr (:at 1544724243291) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |js/console.error)
                                      |j $ %{} :Leaf (:at 1544724243291) (:by |aQJLUBr_Hp) (:text |error)
          :examples $ []
        |wss-each! $ %{} :CodeEntry (:doc "|Iterates over all active WebSocket connections. Handler function receives session-id and socket as arguments.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss-each!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |handler)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |&doseq)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |pair)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.to-list)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |@*global-connections)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let[])
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |sid)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                      |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |pair)
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |handler)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |sid)
                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
          :examples $ []
            quote $ wss-each!
              fn (sid socket) (println |Session: sid)
        |wss-send! $ %{} :CodeEntry (:doc "|Sends data to a specific WebSocket connection identified by session-id. Data will be formatted as Cirru EDN before sending.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss-send!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |sid)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |data)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |get)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |@*global-connections)
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |sid)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!send)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |format-cirru-edn)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |data)
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.warn)
                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"socket not found for")
                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |sid)
          :examples $ []
            quote $ wss-send! |session-123
              {} (:type |notification) (:message "|Hello client")
        |wss-serve! $ %{} :CodeEntry (:doc "|Starts a WebSocket server on the specified port. Accepts options map with :cert, :key (for SSL), :on-listening, :on-open, :on-close, :on-data, :on-error, and :class-mapper callbacks.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss-serve!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |port)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |assert)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"first argument is port")
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |number?)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |port)
              |b $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:cert)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |new)
                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |WebSocketServer)
                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ssl-options)
                                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js-object)
                                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:key)
                                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fs/readFileSync)
                                                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:key)
                                                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:cert)
                                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fs/readFileSync)
                                                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                            :data $ {}
                                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:cert)
                                                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |server)
                                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |https/createServer)
                                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |ssl-options)
                                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |req)
                                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |res)
                                                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!writeHead)
                                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |res)
                                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |200)
                                                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                        :data $ {}
                                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!end)
                                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |res)
                                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"WSS Server")
                                      |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!addListener)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |server)
                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"upgrade")
                                          |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |req)
                                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |res)
                                                  |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |head)
                                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.log)
                                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                    :data $ {}
                                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.-url)
                                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |req)
                                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!on)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |server)
                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"error")
                                          |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |err)
                                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.error)
                                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |err)
                                      |b $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!listen)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |server)
                                          |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |port)
                                          |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                                :data $ {}
                                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |println)
                                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"server at")
                                                  |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |port)
                                      |d $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js-object)
                                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:server)
                                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |server)
                                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                            :data $ {}
                                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:path)
                                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"/")
                              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |new)
                                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |WebSocketServer)
                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js-object)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:port)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |port)
                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!on)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss)
                      |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"connection")
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |?)
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |req)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |maintain-socket!)
                              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |socket)
                              |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                  |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!on)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss)
                      |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"listening")
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-listening)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-listening)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-listening)
                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-listening)
                  |b $ %{} :Expr (:at 1767184554114) (:by |sync)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |.!on)
                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss)
                      |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text "|\"error")
                      |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |fn)
                          |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
                          |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |let)
                              |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-error)
                                      |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                        :data $ {}
                                          |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |:on-error)
                                          |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |options)
                              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |if)
                                  |V $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |some?)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-error)
                                  |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-error)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
                                  |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |js/console.error)
                                      |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |error)
          :examples $ []
            quote $ wss-serve! 8080
              {}
                :on-listening $ fn () (println "|Server listening on 8080")
                :on-data $ fn (sid data) (println "|Received from" sid : data)
        |wss-set-on-data! $ %{} :CodeEntry (:doc "|Sets the message handler for incoming WebSocket data across all connections. Handler receives session-id and parsed Cirru EDN data.")
          :code $ %{} :Expr (:at 1767184554114) (:by |sync)
            :data $ {}
              |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |defn)
              |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |wss-set-on-data!)
              |X $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
              |Z $ %{} :Expr (:at 1767184554114) (:by |sync)
                :data $ {}
                  |T $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |reset!)
                  |V $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |*proxied-data-listener)
                  |X $ %{} :Leaf (:at 1767184554114) (:by |sync) (:text |on-data)
          :examples $ []
            quote $ wss-set-on-data!
              fn (sid data) (println "|New message from" sid : data)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1544464128346) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1544464128346) (:by |aQJLUBr_Hp) (:text |ns)
            |j $ %{} :Leaf (:at 1544464128346) (:by |aQJLUBr_Hp) (:text |ws-edn.server)
            |r $ %{} :Expr (:at 1544546000331) (:by |aQJLUBr_Hp)
              :data $ {}
                |T $ %{} :Leaf (:at 1544546001037) (:by |aQJLUBr_Hp) (:text |:require)
                |r $ %{} :Expr (:at 1544548020782) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1544548022455) (:by |aQJLUBr_Hp) (:text "|\"ws")
                    |r $ %{} :Leaf (:at 1648661256139) (:by |aQJLUBr_Hp) (:text |:refer)
                    |t $ %{} :Expr (:at 1648661256951) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1648661257336) (:by |aQJLUBr_Hp) (:text |WebSocketServer)
                |t $ %{} :Expr (:at 1614144540185) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |j $ %{} :Leaf (:at 1614144544495) (:by |aQJLUBr_Hp) (:text |ws-edn.util)
                    |r $ %{} :Leaf (:at 1614144546529) (:by |aQJLUBr_Hp) (:text |:refer)
                    |v $ %{} :Expr (:at 1614144546864) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |j $ %{} :Leaf (:at 1614144550081) (:by |aQJLUBr_Hp) (:text |when-let)
                        |r $ %{} :Leaf (:at 1614144552635) (:by |aQJLUBr_Hp) (:text |parse-data)
                |w $ %{} :Expr (:at 1644659636641) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1644659637931) (:by |aQJLUBr_Hp) (:text "|\"nanoid")
                    |j $ %{} :Leaf (:at 1644659640765) (:by |aQJLUBr_Hp) (:text |:refer)
                    |r $ %{} :Expr (:at 1644659643038) (:by |aQJLUBr_Hp)
                      :data $ {}
                        |T $ %{} :Leaf (:at 1644659642846) (:by |aQJLUBr_Hp) (:text |nanoid)
                |x $ %{} :Expr (:at 1644659706546) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1644659708418) (:by |aQJLUBr_Hp) (:text "|\"https")
                    |j $ %{} :Leaf (:at 1644659709551) (:by |aQJLUBr_Hp) (:text |:as)
                    |r $ %{} :Leaf (:at 1644660170409) (:by |aQJLUBr_Hp) (:text |https)
                |y $ %{} :Expr (:at 1644660553453) (:by |aQJLUBr_Hp)
                  :data $ {}
                    |T $ %{} :Leaf (:at 1644660554139) (:by |aQJLUBr_Hp) (:text "|\"fs")
                    |j $ %{} :Leaf (:at 1644660554976) (:by |aQJLUBr_Hp) (:text |:as)
                    |r $ %{} :Leaf (:at 1644660555353) (:by |aQJLUBr_Hp) (:text |fs)
        :examples $ []
    |ws-edn.util $ %{} :FileEntry
      :defs $ {}
        |when-let $ %{} :CodeEntry (:doc |)
          :code $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
            :data $ {}
              |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |defmacro)
              |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |when-let)
              |r $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair)
                  |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |&)
                  |r $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |body)
              |v $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |assert)
                  |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text "|\"expected 2 tokens")
                  |r $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |and)
                      |j $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |list?)
                          |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair)
                      |r $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |=)
                          |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |2)
                          |r $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |count)
                              |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair)
              |x $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                :data $ {}
                  |T $ %{} :Leaf (:at 1623719007545) (:by |aQJLUBr_Hp) (:text |quasiquote)
                  |j $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                    :data $ {}
                      |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |&let)
                      |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~pair)
                      |r $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                        :data $ {}
                          |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |when)
                          |j $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                            :data $ {}
                              |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |some?)
                              |j $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                                :data $ {}
                                  |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~)
                                  |j $ %{} :Expr (:at 1614144465118) (:by |aQJLUBr_Hp)
                                    :data $ {}
                                      |T $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |first)
                                      |j $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair)
                          |r $ %{} :Leaf (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~@body)
          :examples $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ %{} :Expr (:at 1614144454159) (:by |aQJLUBr_Hp)
          :data $ {}
            |T $ %{} :Leaf (:at 1614144454159) (:by |aQJLUBr_Hp) (:text |ns)
            |j $ %{} :Leaf (:at 1614144454159) (:by |aQJLUBr_Hp) (:text |ws-edn.util)
        :examples $ []
  :users $ {}
    |VDPjyAOgV $ {} (:avatar nil) (:id |VDPjyAOgV) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |aQJLUBr_Hp $ {} (:avatar nil) (:id |aQJLUBr_Hp) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
