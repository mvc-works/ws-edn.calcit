
{}
  :configs $ {} (:init-fn |ws-edn.app.page/main!) (:port 6001) (:reload-fn |ws-edn.app.page/reload!) (:storage-key |calcit.cirru) (:version |0.0.7)
    :modules $ []
  :entries $ {}
    :server $ {} (:init-fn |ws-edn.app.server/main!) (:reload-fn |ws-edn.app.server/reload!) (:storage-key |calcit.cirru)
      :modules $ []
  :ir $ {} (:package |ws-edn)
    :files $ {}
      |ws-edn.app.page $ {}
        :defs $ {}
          |main! $ {} (:at 1544546050477) (:by |aQJLUBr_Hp) (:id |cxHJr7XH92) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544546050477) (:by |aQJLUBr_Hp) (:id |L4c_BJo5qO) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544546050477) (:by |aQJLUBr_Hp) (:id |7bfqYBv5UW) (:text |main!) (:type :leaf)
              |r $ {} (:at 1544546050477) (:by |aQJLUBr_Hp) (:id |Z1G7IFTq83) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544546067312) (:by |aQJLUBr_Hp) (:id |LXfDMSuSYC) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544546068176) (:by |aQJLUBr_Hp) (:id |LXfDMSuSYCleaf) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544546069945) (:by |aQJLUBr_Hp) (:id |69UuNkOgaC) (:text "|\"start") (:type :leaf)
              |w $ {} (:at 1688320968756) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1688320978639) (:by |aQJLUBr_Hp) (:text |load-console-formatter!) (:type :leaf)
              |x $ {} (:at 1544548406724) (:by |aQJLUBr_Hp) (:id |eaR0xXUY6) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544638474733) (:by |aQJLUBr_Hp) (:id |eaR0xXUY6leaf) (:text |ws-connect!) (:type :leaf)
                  |j $ {} (:at 1688226660915) (:by |aQJLUBr_Hp) (:id |nkkHAgSNFL) (:text "|\"wss://localhost:5001") (:type :leaf)
                  |r $ {} (:at 1544548468156) (:by |aQJLUBr_Hp) (:id |4NAzuwRIFo) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544548468522) (:by |aQJLUBr_Hp) (:id |jTlTgpd5M) (:text |{}) (:type :leaf)
                      |j $ {} (:at 1544548469083) (:by |aQJLUBr_Hp) (:id |fLYs90GFG9) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810676346) (:by |aQJLUBr_Hp) (:id |oFKCD33ykN) (:text |:on-open) (:type :leaf)
                          |j $ {} (:at 1544548472288) (:by |aQJLUBr_Hp) (:id |WvZoFfPyVL) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544548472562) (:by |aQJLUBr_Hp) (:id |hgotLpT_bb) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544548472890) (:by |aQJLUBr_Hp) (:id |ZW9Ml-bQfb) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548475401) (:by |aQJLUBr_Hp) (:id |afiid-gzvC) (:text |event) (:type :leaf)
                              |r $ {} (:at 1544548475863) (:by |aQJLUBr_Hp) (:id |aL3RG3N2jX) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548476797) (:by |aQJLUBr_Hp) (:id |aL3RG3N2jXleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544548477884) (:by |aQJLUBr_Hp) (:id |6qFAOy6S7h) (:text "|\"open") (:type :leaf)
                              |v $ {} (:at 1544549504171) (:by |aQJLUBr_Hp) (:id |U_-5pCLQ0C) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544638465601) (:by |aQJLUBr_Hp) (:id |U_-5pCLQ0Cleaf) (:text |ws-send!) (:type :leaf)
                                  |j $ {} (:at 1544549515095) (:by |aQJLUBr_Hp) (:id |q0hrmYUu9p) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1688226726948) (:by |aQJLUBr_Hp) (:id |79FZFVLf2) (:text |:) (:type :leaf)
                                      |b $ {} (:at 1688226727677) (:by |aQJLUBr_Hp) (:text |test) (:type :leaf)
                      |r $ {} (:at 1544548487987) (:by |aQJLUBr_Hp) (:id |F5YVluf8Ye) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810677692) (:by |aQJLUBr_Hp) (:id |F5YVluf8Yeleaf) (:text |:on-data) (:type :leaf)
                          |j $ {} (:at 1544548491165) (:by |aQJLUBr_Hp) (:id |skj8xThTX7) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544548491530) (:by |aQJLUBr_Hp) (:id |XGD8M_c0z1) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544548495147) (:by |aQJLUBr_Hp) (:id |MZ4NbQPTx) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548497650) (:by |aQJLUBr_Hp) (:id |mvm7GNOkyg) (:text |data) (:type :leaf)
                              |r $ {} (:at 1544548498052) (:by |aQJLUBr_Hp) (:id |x58Wxy1Urm) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548503164) (:by |aQJLUBr_Hp) (:id |x58Wxy1Urmleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544548500226) (:by |aQJLUBr_Hp) (:id |JCUS4QPHWt) (:text "|\"data") (:type :leaf)
                                  |r $ {} (:at 1544548501271) (:by |aQJLUBr_Hp) (:id |QkFjLJ2ncy) (:text |data) (:type :leaf)
                      |v $ {} (:at 1544548505415) (:by |aQJLUBr_Hp) (:id |dQEkO3gY7P) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810678783) (:by |aQJLUBr_Hp) (:id |dQEkO3gY7Pleaf) (:text |:on-close) (:type :leaf)
                          |j $ {} (:at 1544548508061) (:by |aQJLUBr_Hp) (:id |ryu7L7856M) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544548508424) (:by |aQJLUBr_Hp) (:id |wxwIEcXyh) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544548509961) (:by |aQJLUBr_Hp) (:id |r62RrSS0X) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548511564) (:by |aQJLUBr_Hp) (:id |FRbqkLWlt) (:text |event) (:type :leaf)
                              |r $ {} (:at 1544548512621) (:by |aQJLUBr_Hp) (:id |r5S1ViZxN) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544548513465) (:by |aQJLUBr_Hp) (:id |r5S1ViZxNleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544548515163) (:by |aQJLUBr_Hp) (:id |Wt4LkhpUD) (:text "|\"close") (:type :leaf)
              |y $ {} (:at 1546105618235) (:by |VDPjyAOgV) (:id |c9AGVS5Na) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1546105621910) (:by |VDPjyAOgV) (:id |c9AGVS5Naleaf) (:text |js/setInterval) (:type :leaf)
                  |b $ {} (:at 1546105626511) (:by |VDPjyAOgV) (:id |irf66EqUSK) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1546105625821) (:by |VDPjyAOgV) (:id |sRh3dtmxWB) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1546105626872) (:by |VDPjyAOgV) (:id |RHn9K5qEnC) (:type :expr)
                        :data $ {}
                      |r $ {} (:at 1546105627888) (:by |VDPjyAOgV) (:id |mB1Kg7_I1) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1546105628841) (:by |VDPjyAOgV) (:id |mB1Kg7_I1leaf) (:text |println) (:type :leaf)
                          |b $ {} (:at 1621499446659) (:by |aQJLUBr_Hp) (:text "|\"connected try send") (:type :leaf)
                          |j $ {} (:at 1546105631848) (:by |VDPjyAOgV) (:id |GrijH9I73E) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1546105631637) (:by |VDPjyAOgV) (:id |1Vlzy_Yfuu) (:text |ws-connected?) (:type :leaf)
                      |v $ {} (:at 1621499447450) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621499450345) (:by |aQJLUBr_Hp) (:text |ws-send!) (:type :leaf)
                          |j $ {} (:at 1621499452268) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1621499452596) (:by |aQJLUBr_Hp) (:text |{}) (:type :leaf)
                              |j $ {} (:at 1621499452833) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1621499454603) (:by |aQJLUBr_Hp) (:text |:data) (:type :leaf)
                                  |j $ {} (:at 1621499460181) (:by |aQJLUBr_Hp) (:text "|\"just message") (:type :leaf)
                      |w $ {} (:at 1621499447450) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621499450345) (:by |aQJLUBr_Hp) (:text |ws-send!) (:type :leaf)
                          |j $ {} (:at 1621499452268) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1688321918964) (:by |aQJLUBr_Hp) (:text |:) (:type :leaf)
                              |b $ {} (:at 1688321920601) (:by |aQJLUBr_Hp) (:text |message) (:type :leaf)
                              |h $ {} (:at 1688321922622) (:by |aQJLUBr_Hp) (:text "|\"in") (:type :leaf)
                              |l $ {} (:at 1688321926287) (:by |aQJLUBr_Hp) (:text "|\"string") (:type :leaf)
                  |j $ {} (:at 1546105624993) (:by |VDPjyAOgV) (:id |bLKB3ulx_) (:text |2000) (:type :leaf)
          |reload! $ {} (:at 1544546051379) (:by |aQJLUBr_Hp) (:id |mJW-MoOb4F) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544546051379) (:by |aQJLUBr_Hp) (:id |X6pa-Od4-w) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544546051379) (:by |aQJLUBr_Hp) (:id |W6f--VKR73) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1544546051379) (:by |aQJLUBr_Hp) (:id |yVpHEs85Ce) (:type :expr)
                :data $ {}
              |t $ {} (:at 1621497455013) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1621499725531) (:by |aQJLUBr_Hp) (:text |ws-set-on-data!) (:type :leaf)
                  |j $ {} (:at 1621497457863) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1621497458164) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1621497458389) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497458965) (:by |aQJLUBr_Hp) (:text |data) (:type :leaf)
                      |r $ {} (:at 1621497459419) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497460973) (:by |aQJLUBr_Hp) (:text |println) (:type :leaf)
                          |j $ {} (:at 1621500518892) (:by |aQJLUBr_Hp) (:text "|\"reloaded 8:") (:type :leaf)
                          |r $ {} (:at 1621497463566) (:by |aQJLUBr_Hp) (:text |data) (:type :leaf)
              |v $ {} (:at 1544546056361) (:by |aQJLUBr_Hp) (:id |lEN2AHZRio) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544546058025) (:by |aQJLUBr_Hp) (:id |lEN2AHZRioleaf) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544546060744) (:by |aQJLUBr_Hp) (:id |xqccINhKO1) (:text "|\"reload") (:type :leaf)
        :ns $ {} (:at 1544464189777) (:by |aQJLUBr_Hp) (:id |Yxvyyx3ATA) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544464189777) (:by |aQJLUBr_Hp) (:id |OfNiXF6bNy) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544464189777) (:by |aQJLUBr_Hp) (:id |1UwvmLIVIn) (:text |ws-edn.app.page) (:type :leaf)
            |r $ {} (:at 1544548429943) (:by |aQJLUBr_Hp) (:id |PmV5FZiqg) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544548429377) (:by |aQJLUBr_Hp) (:id |5YsrmRpE-c) (:text |:require) (:type :leaf)
                |j $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |9KXQqSaIPU) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |GmRYuPFUcl) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |boLxIOOLvk) (:text |ws-edn.client) (:type :leaf)
                    |r $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |LeDqngfvXb) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |dE7BYk10jp) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1544548430873) (:by |aQJLUBr_Hp) (:id |tmm3oS-O1K) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1544638469178) (:by |aQJLUBr_Hp) (:id |Ypfir19GvX) (:text |ws-connect!) (:type :leaf)
                        |r $ {} (:at 1544638471535) (:by |aQJLUBr_Hp) (:id |4XTw3zGQHE) (:text |ws-send!) (:type :leaf)
                        |v $ {} (:at 1546105636878) (:by |VDPjyAOgV) (:id |c553lyBSgH) (:text |ws-connected?) (:type :leaf)
                        |x $ {} (:at 1621499723967) (:by |aQJLUBr_Hp) (:text |ws-set-on-data!) (:type :leaf)
        :proc $ {} (:at 1544464189777) (:by |aQJLUBr_Hp) (:id |R8-slnikeQ) (:type :expr)
          :data $ {}
      |ws-edn.app.server $ {}
        :defs $ {}
          |main! $ {} (:at 1544546020645) (:by |aQJLUBr_Hp) (:id |mZomMidJyS) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544546020645) (:by |aQJLUBr_Hp) (:id |GtxnwBmZbj) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544546020645) (:by |aQJLUBr_Hp) (:id |PzTUpyC1HN) (:text |main!) (:type :leaf)
              |r $ {} (:at 1544546020645) (:by |aQJLUBr_Hp) (:id |qqvlzxHOts) (:type :expr)
                :data $ {}
              |v $ {} (:at 1544546025640) (:by |aQJLUBr_Hp) (:id |1QlMyYPib) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544546029176) (:by |aQJLUBr_Hp) (:id |1QlMyYPibleaf) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544546030835) (:by |aQJLUBr_Hp) (:id |U5oMFO3Qy3) (:text "|\"started") (:type :leaf)
              |x $ {} (:at 1544547728020) (:by |aQJLUBr_Hp) (:id |Wmq0Kx8_m4) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544638535544) (:by |aQJLUBr_Hp) (:id |Wmq0Kx8_m4leaf) (:text |wss-serve!) (:type :leaf)
                  |j $ {} (:at 1544547747709) (:by |aQJLUBr_Hp) (:id |T9KOdjjs7) (:text |5001) (:type :leaf)
                  |r $ {} (:at 1544547882463) (:by |aQJLUBr_Hp) (:id |lvtnWh4BFO) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544547883034) (:by |aQJLUBr_Hp) (:id |1Q6Ac7pN-) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1544724173453) (:by |aQJLUBr_Hp) (:id |gbZZEtPE0c) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810745200) (:by |aQJLUBr_Hp) (:id |gbZZEtPE0cleaf) (:text |:on-listening) (:type :leaf)
                          |j $ {} (:at 1544724179265) (:by |aQJLUBr_Hp) (:id |CKMijCR6p0) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724179573) (:by |aQJLUBr_Hp) (:id |ci-CjYvYno) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544724180013) (:by |aQJLUBr_Hp) (:id |zCYTcqYql6) (:type :expr)
                                :data $ {}
                              |r $ {} (:at 1544724181037) (:by |aQJLUBr_Hp) (:id |lqzAbzT7FP) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544724181909) (:by |aQJLUBr_Hp) (:id |lqzAbzT7FPleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544724185989) (:by |aQJLUBr_Hp) (:id |RX3NNYCX2M) (:text "|\"server listening") (:type :leaf)
                      |j $ {} (:at 1544547883246) (:by |aQJLUBr_Hp) (:id |kMPlX6JA8W) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810743007) (:by |aQJLUBr_Hp) (:id |d4bsBn4PSk) (:text |:on-open) (:type :leaf)
                          |j $ {} (:at 1544547888855) (:by |aQJLUBr_Hp) (:id |YZ5vRiEYWh) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544547889164) (:by |aQJLUBr_Hp) (:id |VmQkog99M) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544547889411) (:by |aQJLUBr_Hp) (:id |K8yuIQXZA7) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547891563) (:by |aQJLUBr_Hp) (:id |SF9BdhLYx4) (:text |sid) (:type :leaf)
                                  |j $ {} (:at 1544547899666) (:by |aQJLUBr_Hp) (:id |-zA16ICb3I) (:text |socket) (:type :leaf)
                              |r $ {} (:at 1544547900090) (:by |aQJLUBr_Hp) (:id |oksQV5WQcT) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547903791) (:by |aQJLUBr_Hp) (:id |oksQV5WQcTleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544547939336) (:by |aQJLUBr_Hp) (:id |eRX62uUiHJ) (:text "|\"opened") (:type :leaf)
                                  |r $ {} (:at 1544547941797) (:by |aQJLUBr_Hp) (:id |ULOynGru4r) (:text |sid) (:type :leaf)
                              |v $ {} (:at 1544549772993) (:by |aQJLUBr_Hp) (:id |_9qLKT-E8) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544638502885) (:by |aQJLUBr_Hp) (:id |_9qLKT-E8leaf) (:text |wss-send!) (:type :leaf)
                                  |j $ {} (:at 1544549783365) (:by |aQJLUBr_Hp) (:id |4YGlare3-) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1544549792175) (:by |aQJLUBr_Hp) (:id |Y_CGCSbkJ) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1688226817060) (:by |aQJLUBr_Hp) (:id |sDg5EOPfW) (:text |:) (:type :leaf)
                                      |b $ {} (:at 1688226817511) (:by |aQJLUBr_Hp) (:text |op) (:type :leaf)
                                      |j $ {} (:at 1544549800499) (:by |aQJLUBr_Hp) (:id |BkZKLgTYnF) (:text "|\"initial message") (:type :leaf)
                      |r $ {} (:at 1544547942745) (:by |aQJLUBr_Hp) (:id |hcf5KEBjBI) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810746424) (:by |aQJLUBr_Hp) (:id |hcf5KEBjBIleaf) (:text |:on-data) (:type :leaf)
                          |j $ {} (:at 1544547944952) (:by |aQJLUBr_Hp) (:id |OJbmmxqUUY) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544547945267) (:by |aQJLUBr_Hp) (:id |Mwah7YELBT) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544547945549) (:by |aQJLUBr_Hp) (:id |7POVpptSk) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547947111) (:by |aQJLUBr_Hp) (:id |lIPcEK7QE1) (:text |sid) (:type :leaf)
                                  |j $ {} (:at 1544547948125) (:by |aQJLUBr_Hp) (:id |UT0vAlveDJ) (:text |data) (:type :leaf)
                              |r $ {} (:at 1544547948938) (:by |aQJLUBr_Hp) (:id |OmL2DUCN5a) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547951831) (:by |aQJLUBr_Hp) (:id |OmL2DUCN5aleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1621499583527) (:by |aQJLUBr_Hp) (:id |TWzhUOqd0j) (:text "|\"just data") (:type :leaf)
                                  |r $ {} (:at 1544547955215) (:by |aQJLUBr_Hp) (:id |Wv-K8VGe9x) (:text |sid) (:type :leaf)
                                  |v $ {} (:at 1544547955773) (:by |aQJLUBr_Hp) (:id |RrxVhtLvR7) (:text |data) (:type :leaf)
                      |v $ {} (:at 1544547961776) (:by |aQJLUBr_Hp) (:id |gCGaCvDL8) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810747702) (:by |aQJLUBr_Hp) (:id |gCGaCvDL8leaf) (:text |:on-close) (:type :leaf)
                          |j $ {} (:at 1544547965030) (:by |aQJLUBr_Hp) (:id |PjSr908mQp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544547965364) (:by |aQJLUBr_Hp) (:id |WRpxNtcLhv) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544547965672) (:by |aQJLUBr_Hp) (:id |IAm9AzlTL) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547966295) (:by |aQJLUBr_Hp) (:id |TgmHXCj1VE) (:text |sid) (:type :leaf)
                                  |j $ {} (:at 1544547968724) (:by |aQJLUBr_Hp) (:id |l3feW5cAQ) (:text |event) (:type :leaf)
                              |r $ {} (:at 1544547969193) (:by |aQJLUBr_Hp) (:id |GT-hgUhdIs) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544547970840) (:by |aQJLUBr_Hp) (:id |GT-hgUhdIsleaf) (:text |println) (:type :leaf)
                                  |j $ {} (:at 1544547973633) (:by |aQJLUBr_Hp) (:id |uAOaKcexn5) (:text "|\"close") (:type :leaf)
                                  |r $ {} (:at 1544547976416) (:by |aQJLUBr_Hp) (:id |n1k2xy44A) (:text |sid) (:type :leaf)
                      |x $ {} (:at 1644660486536) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1644663074171) (:by |aQJLUBr_Hp) (:text |:key) (:type :leaf)
                          |j $ {} (:at 1644660502338) (:by |aQJLUBr_Hp) (:text "|\"certs/key.pem") (:type :leaf)
                      |y $ {} (:at 1644660508203) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1644663075897) (:by |aQJLUBr_Hp) (:text |:cert) (:type :leaf)
                          |j $ {} (:at 1644660510986) (:by |aQJLUBr_Hp) (:text "|\"certs/cert.pem") (:type :leaf)
              |y $ {} (:at 1544723628971) (:by |aQJLUBr_Hp) (:id |uJEf06RaaZ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |mDIubsSBqF) (:text |js/setInterval) (:type :leaf)
                  |j $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |3yU6ItpxIf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |gC2d3XjFwY) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |67ULddY1AQ) (:type :expr)
                        :data $ {}
                      |n $ {} (:at 1544723653596) (:by |aQJLUBr_Hp) (:id |iXktmLzfC) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544723654448) (:by |aQJLUBr_Hp) (:id |iXktmLzfCleaf) (:text |println) (:type :leaf)
                          |j $ {} (:at 1544724587225) (:by |aQJLUBr_Hp) (:id |z9rkAXpA0) (:text "|\"heartbeat") (:type :leaf)
                      |r $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |OXRFXaNkKV) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544724444675) (:by |aQJLUBr_Hp) (:id |S6OTAd9X2T) (:text |wss-each!) (:type :leaf)
                          |j $ {} (:at 1544723640898) (:by |aQJLUBr_Hp) (:id |CzuEbHSDrI) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544723641216) (:by |aQJLUBr_Hp) (:id |TRj_zUI4r) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544723641528) (:by |aQJLUBr_Hp) (:id |x4rWFm9An) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544723643081) (:by |aQJLUBr_Hp) (:id |9BljWqtdJ1) (:text |sid) (:type :leaf)
                                  |j $ {} (:at 1544723644344) (:by |aQJLUBr_Hp) (:id |5Drs3jiNgW) (:text |socket) (:type :leaf)
                              |r $ {} (:at 1544723644798) (:by |aQJLUBr_Hp) (:id |0NPKfFO0mK) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1614135470770) (:by |aQJLUBr_Hp) (:id |0NPKfFO0mKleaf) (:text |js/console.log) (:type :leaf)
                                  |j $ {} (:at 1544723647241) (:by |aQJLUBr_Hp) (:id |_SrdoHoDYZ) (:text |sid) (:type :leaf)
                              |v $ {} (:at 1621498047999) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1621498047999) (:by |aQJLUBr_Hp) (:text |wss-send!) (:type :leaf)
                                  |j $ {} (:at 1621498050608) (:by |aQJLUBr_Hp) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1621498054045) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1688226767286) (:by |aQJLUBr_Hp) (:text |:) (:type :leaf)
                                      |b $ {} (:at 1688226768527) (:by |aQJLUBr_Hp) (:text |message) (:type :leaf)
                                      |j $ {} (:at 1621498063826) (:by |aQJLUBr_Hp) (:text "|\"event 2s") (:type :leaf)
                  |r $ {} (:at 1544723630790) (:by |aQJLUBr_Hp) (:id |bt4hAdrNXc) (:text |2000) (:type :leaf)
          |reload! $ {} (:at 1544546023324) (:by |aQJLUBr_Hp) (:id |E_xzcWBofE) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544546023324) (:by |aQJLUBr_Hp) (:id |TPvVlEfPC8) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544546023324) (:by |aQJLUBr_Hp) (:id |ouASvbw4_T) (:text |reload!) (:type :leaf)
              |r $ {} (:at 1544546023324) (:by |aQJLUBr_Hp) (:id |duQ6OZoLJa) (:type :expr)
                :data $ {}
              |t $ {} (:at 1621499049650) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1621499635012) (:by |aQJLUBr_Hp) (:text |wss-set-on-data!) (:type :leaf)
                  |j $ {} (:at 1621499062953) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1621499063309) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                      |j $ {} (:at 1621499063573) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621499586933) (:by |aQJLUBr_Hp) (:text |sid) (:type :leaf)
                          |j $ {} (:at 1621499066558) (:by |aQJLUBr_Hp) (:text |data) (:type :leaf)
                      |r $ {} (:at 1621499066923) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621499069428) (:by |aQJLUBr_Hp) (:text |println) (:type :leaf)
                          |j $ {} (:at 1621500524270) (:by |aQJLUBr_Hp) (:text "|\"reloaded 8:") (:type :leaf)
                          |n $ {} (:at 1621499560273) (:by |aQJLUBr_Hp) (:text |sid) (:type :leaf)
                          |r $ {} (:at 1621499075117) (:by |aQJLUBr_Hp) (:text |data) (:type :leaf)
              |v $ {} (:at 1544546034960) (:by |aQJLUBr_Hp) (:id |4RtgpUNPwQ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544546036182) (:by |aQJLUBr_Hp) (:id |4RtgpUNPwQleaf) (:text |println) (:type :leaf)
                  |j $ {} (:at 1544546038619) (:by |aQJLUBr_Hp) (:id |fxhsgwBN1R) (:text "|\"reload!") (:type :leaf)
        :ns $ {} (:at 1544464151788) (:by |aQJLUBr_Hp) (:id |XNYmNIpLpt) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544464151788) (:by |aQJLUBr_Hp) (:id |tb99xBaR_j) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544464151788) (:by |aQJLUBr_Hp) (:id |N-PRpb_ipD) (:text |ws-edn.app.server) (:type :leaf)
            |r $ {} (:at 1544547713449) (:by |aQJLUBr_Hp) (:id |VQSi49loHx) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544547714878) (:by |aQJLUBr_Hp) (:id |ZrXL6lDYOD) (:text |:require) (:type :leaf)
                |j $ {} (:at 1544547715119) (:by |aQJLUBr_Hp) (:id |LXgouPhBoP) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1544547715974) (:by |aQJLUBr_Hp) (:id |lrGvtfp6zW) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1544547719895) (:by |aQJLUBr_Hp) (:id |BLyJSaR1u-) (:text |ws-edn.server) (:type :leaf)
                    |r $ {} (:at 1544547720586) (:by |aQJLUBr_Hp) (:id |MElOdVMRwL) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1544547720780) (:by |aQJLUBr_Hp) (:id |VXHVdktzY-) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1544547720936) (:by |aQJLUBr_Hp) (:id |cQonxmwdhJ) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1544638512599) (:by |aQJLUBr_Hp) (:id |CK9H6x52Nc) (:text |wss-serve!) (:type :leaf)
                        |r $ {} (:at 1544638506925) (:by |aQJLUBr_Hp) (:id |Gzkwic9MIs) (:text |wss-send!) (:type :leaf)
                        |v $ {} (:at 1544724447213) (:by |aQJLUBr_Hp) (:id |N8cYtvrcyE) (:text |wss-each!) (:type :leaf)
                        |x $ {} (:at 1621499630802) (:by |aQJLUBr_Hp) (:text |wss-set-on-data!) (:type :leaf)
        :proc $ {} (:at 1544464151788) (:by |aQJLUBr_Hp) (:id |2Ec0FZ11l9) (:type :expr)
          :data $ {}
      |ws-edn.client $ {}
        :defs $ {}
          |*global-ws $ {} (:at 1544464574710) (:by |aQJLUBr_Hp) (:id |ZREWPsO0LG) (:type :expr)
            :data $ {}
              |T $ {} (:at 1614084484673) (:by |aQJLUBr_Hp) (:id |0aOntCXDNj) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1544464574710) (:by |aQJLUBr_Hp) (:id |1E28gGxcAx) (:text |*global-ws) (:type :leaf)
              |r $ {} (:at 1544464574710) (:by |aQJLUBr_Hp) (:id |ZhuuWpp4HN) (:text |nil) (:type :leaf)
          |ws-connect! $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |t0TVLZbriw) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |dYEylCEMEb) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |pjvbs3mC9h) (:text |ws-connect!) (:type :leaf)
              |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |GawMvQTD70) (:type :expr)
                :data $ {}
                  |L $ {} (:at 1544546617703) (:by |aQJLUBr_Hp) (:id |Kn44zJI4w) (:text |ws-url) (:type :leaf)
                  |j $ {} (:at 1544547608543) (:by |aQJLUBr_Hp) (:id |qKmL3TJRpn) (:text |options) (:type :leaf)
              |t $ {} (:at 1544546570146) (:by |aQJLUBr_Hp) (:id |g3wFl20C_) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544546573052) (:by |aQJLUBr_Hp) (:id |g3wFl20C_leaf) (:text |assert) (:type :leaf)
                  |b $ {} (:at 1614084565178) (:by |aQJLUBr_Hp) (:text "|\"reqiured an url for ws server") (:type :leaf)
                  |j $ {} (:at 1544546574116) (:by |aQJLUBr_Hp) (:id |ssX3Fc8yAq) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544549277335) (:by |aQJLUBr_Hp) (:id |6_HG9B4AU) (:text |string?) (:type :leaf)
                      |j $ {} (:at 1544546620849) (:by |aQJLUBr_Hp) (:id |AouMlNSIVl) (:text |ws-url) (:type :leaf)
              |v $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |XF71vG_IcP) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |z75s4Ka0ec) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |gLSwVHqkor) (:type :expr)
                    :data $ {}
                      |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |N5x8p3YXT4) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |QyiLjZy2GoI) (:text |ws) (:type :leaf)
                          |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |MIwtpfrqfJg) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1614084570263) (:by |aQJLUBr_Hp) (:text |new) (:type :leaf)
                              |T $ {} (:at 1614084569342) (:by |aQJLUBr_Hp) (:id |PiLI-R77yFG) (:text |js/WebSocket) (:type :leaf)
                              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |A6tsx8murEc) (:text |ws-url) (:type :leaf)
                  |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |vV7pOauyOFp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |8mSQwRgThRS) (:text |reset!) (:type :leaf)
                      |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |6XYtkA8OIfc) (:text |*global-ws) (:type :leaf)
                      |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |mQbLXTHF-Fx) (:text |ws) (:type :leaf)
                  |v $ {} (:at 1621496851756) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:text |when-let) (:type :leaf)
                      |L $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:text |on-open) (:type :leaf)
                          |j $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:text |:on-open) (:type :leaf)
                              |j $ {} (:at 1621496858418) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                      |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |niFjMkIj-EG) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |6W0UDJyslNF) (:text |set!) (:type :leaf)
                          |j $ {} (:at 1544547194865) (:by |aQJLUBr_Hp) (:id |GAG7STTV4G) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544547199395) (:by |aQJLUBr_Hp) (:id |vF-TLBfly6) (:text |.-onopen) (:type :leaf)
                              |j $ {} (:at 1544547194865) (:by |aQJLUBr_Hp) (:id |YjOr-Pi6oA) (:text |ws) (:type :leaf)
                          |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |-zpXr-O4Ve7) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |K42pIlmhXFP) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |0ckIJcmXf37) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |Y0lJP8Ftrf3) (:text |event) (:type :leaf)
                              |r $ {} (:at 1544547176352) (:by |aQJLUBr_Hp) (:id |HdUhEbBKKN) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810656599) (:by |aQJLUBr_Hp) (:id |znn93OzvlR) (:text |on-open) (:type :leaf)
                                  |j $ {} (:at 1544547176352) (:by |aQJLUBr_Hp) (:id |XsGoVsRBcH) (:text |event) (:type :leaf)
                  |x $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |vcLhnCG7wgh) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |xKlnAQx-h1q) (:text |set!) (:type :leaf)
                      |j $ {} (:at 1544547193813) (:by |aQJLUBr_Hp) (:id |q8LBnVCiN6) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544547202997) (:by |aQJLUBr_Hp) (:id |VoeZ27Hxpd) (:text |.-onclose) (:type :leaf)
                          |j $ {} (:at 1544547193813) (:by |aQJLUBr_Hp) (:id |VAP-g8sEiO) (:text |ws) (:type :leaf)
                      |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |Y6RAFg9g7B6) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |vQHBjS0i5d5) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |OsCgqgo_MVL) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |lmKxEtAMaKf) (:text |event) (:type :leaf)
                          |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |1Z7uFla3E2Z) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |s8htm2C2qG7) (:text |reset!) (:type :leaf)
                              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |2V7_xsxpZ0L) (:text |*global-ws) (:type :leaf)
                              |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |AvivFox-06I) (:text |nil) (:type :leaf)
                          |v $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |BA8uSvmUSvA) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614085827278) (:by |aQJLUBr_Hp) (:id |gzkTbSCjz2F) (:text |when-let) (:type :leaf)
                              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |ILcd7uhc4L5) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810660102) (:by |aQJLUBr_Hp) (:id |2QClo8Q7DAZ) (:text |on-close) (:type :leaf)
                                  |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |ENX4mRKMwL3) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810661518) (:by |aQJLUBr_Hp) (:id |XVjJYd7lX1X) (:text |:on-close) (:type :leaf)
                                      |j $ {} (:at 1544547611822) (:by |aQJLUBr_Hp) (:id |Oy9-2nxobaI) (:text |options) (:type :leaf)
                              |r $ {} (:at 1614085832311) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1614085832311) (:by |aQJLUBr_Hp) (:text |on-close) (:type :leaf)
                                  |j $ {} (:at 1614085832311) (:by |aQJLUBr_Hp) (:text |event) (:type :leaf)
                  |y $ {} (:at 1621496905917) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1621496909275) (:by |aQJLUBr_Hp) (:text |when-let) (:type :leaf)
                      |L $ {} (:at 1621496911274) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621496911274) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
                          |j $ {} (:at 1621496911274) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1621496911274) (:by |aQJLUBr_Hp) (:text |:on-data) (:type :leaf)
                              |j $ {} (:at 1621496911274) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                      |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |ZVM3xgYNfcY) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |2G6KasLNIgr) (:text |set!) (:type :leaf)
                          |j $ {} (:at 1544547192508) (:by |aQJLUBr_Hp) (:id |0mROkgq360) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544547207729) (:by |aQJLUBr_Hp) (:id |rAn-b0BYnb) (:text |.-onmessage) (:type :leaf)
                              |j $ {} (:at 1544547192508) (:by |aQJLUBr_Hp) (:id |d_3x_ZCIx8) (:text |ws) (:type :leaf)
                          |r $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |eIdrC7Z7Kfm) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |q4_xxWCM92r) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |m0TPYBGSKPi) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544464548128) (:by |aQJLUBr_Hp) (:id |UIxzSO5zGDR) (:text |event) (:type :leaf)
                              |v $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
                                  |j $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1621496931595) (:by |aQJLUBr_Hp) (:text |parse-cirru-edn) (:type :leaf)
                                      |j $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:text |.-data) (:type :leaf)
                                          |j $ {} (:at 1614085866220) (:by |aQJLUBr_Hp) (:text |event) (:type :leaf)
                  |yT $ {} (:at 1544546626117) (:by |aQJLUBr_Hp) (:id |6N4m6o9QAD) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544546627817) (:by |aQJLUBr_Hp) (:id |6N4m6o9QADleaf) (:text |set!) (:type :leaf)
                      |j $ {} (:at 1544546629346) (:by |aQJLUBr_Hp) (:id |qXJfl3I7SF) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544547209744) (:by |aQJLUBr_Hp) (:id |4EF7eHbFV) (:text |.-onerror) (:type :leaf)
                          |j $ {} (:at 1544546641299) (:by |aQJLUBr_Hp) (:id |c6rBN-s05) (:text |ws) (:type :leaf)
                      |r $ {} (:at 1544546643529) (:by |aQJLUBr_Hp) (:id |FB1X1I70T) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544546644022) (:by |aQJLUBr_Hp) (:id |FB1X1I70Tleaf) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544546644575) (:by |aQJLUBr_Hp) (:id |8kdfJpzKy) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544546647319) (:by |aQJLUBr_Hp) (:id |D-yPc8rzbk) (:text |error) (:type :leaf)
                          |r $ {} (:at 1544546647761) (:by |aQJLUBr_Hp) (:id |02K0Ar00eT) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544546656228) (:by |aQJLUBr_Hp) (:id |02K0Ar00eTleaf) (:text |js/console.error) (:type :leaf)
                              |j $ {} (:at 1544546667386) (:by |aQJLUBr_Hp) (:id |HNiuwZaaJ) (:text "|\"Failed to establish connection") (:type :leaf)
                              |r $ {} (:at 1544546670081) (:by |aQJLUBr_Hp) (:id |BpHp21wL3) (:text |error) (:type :leaf)
                          |v $ {} (:at 1544546675352) (:by |aQJLUBr_Hp) (:id |wZLFlW4YYc) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614085852593) (:by |aQJLUBr_Hp) (:id |wZLFlW4YYcleaf) (:text |when-let) (:type :leaf)
                              |j $ {} (:at 1544547130273) (:by |aQJLUBr_Hp) (:id |ZFMwq6uFez) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810670433) (:by |aQJLUBr_Hp) (:id |fss1fravh) (:text |on-error) (:type :leaf)
                                  |j $ {} (:at 1544547137558) (:by |aQJLUBr_Hp) (:id |Nqfr2Djf0) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810669058) (:by |aQJLUBr_Hp) (:id |6U9rY-bKv) (:text |:on-error) (:type :leaf)
                                      |j $ {} (:at 1544547613082) (:by |aQJLUBr_Hp) (:id |NXIysvXtUg) (:text |options) (:type :leaf)
                              |r $ {} (:at 1614085859355) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1614085859355) (:by |aQJLUBr_Hp) (:text |on-error) (:type :leaf)
                                  |j $ {} (:at 1614085859355) (:by |aQJLUBr_Hp) (:text |error) (:type :leaf)
          |ws-connected? $ {} (:at 1546105592926) (:by |VDPjyAOgV) (:id |MuDNZapTkI) (:type :expr)
            :data $ {}
              |T $ {} (:at 1546105592926) (:by |VDPjyAOgV) (:id |eJgBJ5UAW8) (:text |defn) (:type :leaf)
              |j $ {} (:at 1546105592926) (:by |VDPjyAOgV) (:id |z1LUBY-7iF) (:text |ws-connected?) (:type :leaf)
              |r $ {} (:at 1546105592926) (:by |VDPjyAOgV) (:id |lKsqTJ7HIz) (:type :expr)
                :data $ {}
              |v $ {} (:at 1546105597544) (:by |VDPjyAOgV) (:id |PBVlqGD86) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1546105599542) (:by |VDPjyAOgV) (:id |PBVlqGD86leaf) (:text |some?) (:type :leaf)
                  |j $ {} (:at 1546105603638) (:by |VDPjyAOgV) (:id |xG7kWWEsMA) (:text |@*global-ws) (:type :leaf)
          |ws-send! $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |Jsks07bCGE) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |Cw3zRBzlXW) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |42F0qz5NPu) (:text |ws-send!) (:type :leaf)
              |r $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |f0JdjFar_1) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544549826309) (:by |aQJLUBr_Hp) (:id |9cegThFvRF) (:text |data) (:type :leaf)
              |v $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |A4YzsM2Isw) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |b2Dxc4U24E) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |NShY__0nzY) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |KhLctgXoqX) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |whcIWAPENA) (:text |ws) (:type :leaf)
                          |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |DeXvYsyMjT) (:text |@*global-ws) (:type :leaf)
                  |r $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |_5hczl-H0b) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |2D1285nRJS) (:text |if) (:type :leaf)
                      |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |gbx5tHffF2) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |yFXnVZYlP5v) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |8Cvo4y7_ftW) (:text |ws) (:type :leaf)
                      |r $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |0ZlMXHLKP9N) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1623719034335) (:by |aQJLUBr_Hp) (:id |W0sWZ2E-XBd) (:text |.!send) (:type :leaf)
                          |j $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |2Fotv7ralCW) (:text |ws) (:type :leaf)
                          |r $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |v8mWe1-LguB) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1623719032857) (:by |aQJLUBr_Hp) (:id |vLm9TVzHe3A) (:text |format-cirru-edn) (:type :leaf)
                              |j $ {} (:at 1544549830171) (:by |aQJLUBr_Hp) (:id |j2bsnBFP4T) (:text |data) (:type :leaf)
                      |v $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |9TgREcwZqw7) (:type :expr)
                        :data $ {}
                          |j $ {} (:at 1597742375758) (:by |aQJLUBr_Hp) (:id |ZTItCkkW52H) (:text |js/console.warn) (:type :leaf)
                          |r $ {} (:at 1544464559588) (:by |aQJLUBr_Hp) (:id |XVWpYxfxEWr) (:text "||WebSocket at close state!") (:type :leaf)
          |ws-set-on-data! $ {} (:at 1621497316784) (:by |aQJLUBr_Hp) (:type :expr)
            :data $ {}
              |T $ {} (:at 1621497316784) (:by |aQJLUBr_Hp) (:text |defn) (:type :leaf)
              |j $ {} (:at 1621499719133) (:by |aQJLUBr_Hp) (:text |ws-set-on-data!) (:type :leaf)
              |r $ {} (:at 1621497316784) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1621497340276) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
              |v $ {} (:at 1621497341204) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1621497345800) (:by |aQJLUBr_Hp) (:text |let) (:type :leaf)
                  |j $ {} (:at 1621497356510) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1621497346253) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497379864) (:by |aQJLUBr_Hp) (:text |ws) (:type :leaf)
                          |j $ {} (:at 1621497365230) (:by |aQJLUBr_Hp) (:text |@*global-ws) (:type :leaf)
                  |r $ {} (:at 1621497367415) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1621497368757) (:by |aQJLUBr_Hp) (:text |if) (:type :leaf)
                      |j $ {} (:at 1621497369074) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497369892) (:by |aQJLUBr_Hp) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1621497472191) (:by |aQJLUBr_Hp) (:text |ws) (:type :leaf)
                      |r $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |set!) (:type :leaf)
                          |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |.-onmessage) (:type :leaf)
                              |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |ws) (:type :leaf)
                          |r $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                              |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |event) (:type :leaf)
                              |r $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
                                  |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |parse-cirru-edn) (:type :leaf)
                                      |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |.-data) (:type :leaf)
                                          |j $ {} (:at 1621497374176) (:by |aQJLUBr_Hp) (:text |event) (:type :leaf)
                      |v $ {} (:at 1621497391899) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621497395616) (:by |aQJLUBr_Hp) (:text |js/console.warn) (:type :leaf)
                          |j $ {} (:at 1621497424938) (:by |aQJLUBr_Hp) (:text "|\"missing running ws instance") (:type :leaf)
        :ns $ {} (:at 1544464133674) (:by |aQJLUBr_Hp) (:id |z-p-w97NWy) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544464133674) (:by |aQJLUBr_Hp) (:id |UcX5Qa6Jia) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544464133674) (:by |aQJLUBr_Hp) (:id |4mg9L_z7u4) (:text |ws-edn.client) (:type :leaf)
            |r $ {} (:at 1544545986244) (:by |aQJLUBr_Hp) (:id |70lrWg0cb_) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544545987684) (:by |aQJLUBr_Hp) (:id |QDWh8b05bp) (:text |:require) (:type :leaf)
                |j $ {} (:at 1614144568115) (:by |aQJLUBr_Hp) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1614144568713) (:by |aQJLUBr_Hp) (:text |[]) (:type :leaf)
                    |j $ {} (:at 1614144577800) (:by |aQJLUBr_Hp) (:text |ws-edn.util) (:type :leaf)
                    |r $ {} (:at 1614144578946) (:by |aQJLUBr_Hp) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1614144579147) (:by |aQJLUBr_Hp) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1614144579299) (:by |aQJLUBr_Hp) (:text |[]) (:type :leaf)
                        |j $ {} (:at 1614144581839) (:by |aQJLUBr_Hp) (:text |when-let) (:type :leaf)
                        |r $ {} (:at 1614144583190) (:by |aQJLUBr_Hp) (:text |parse-data) (:type :leaf)
                        |v $ {} (:at 1614144586597) (:by |aQJLUBr_Hp) (:text |stringify-data) (:type :leaf)
        :proc $ {} (:at 1544464133674) (:by |aQJLUBr_Hp) (:id |lx2L_hrVBk) (:type :expr)
          :data $ {}
      |ws-edn.server $ {}
        :defs $ {}
          |*global-connections $ {} (:at 1544464593464) (:by |aQJLUBr_Hp) (:id |D_v6VI7TxD) (:type :expr)
            :data $ {}
              |T $ {} (:at 1614084825136) (:by |aQJLUBr_Hp) (:id |TSDDjpbjJS) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1544464593464) (:by |aQJLUBr_Hp) (:id |e5Jk7HpPji) (:text |*global-connections) (:type :leaf)
              |r $ {} (:at 1544464593464) (:by |aQJLUBr_Hp) (:id |h72dYxLMeH) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544464593464) (:by |aQJLUBr_Hp) (:id |tRt89jHeAW) (:text |{}) (:type :leaf)
          |*proxied-data-listener $ {} (:at 1621498797887) (:by |aQJLUBr_Hp) (:type :expr)
            :data $ {}
              |T $ {} (:at 1621498799644) (:by |aQJLUBr_Hp) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1621498797887) (:by |aQJLUBr_Hp) (:text |*proxied-data-listener) (:type :leaf)
              |r $ {} (:at 1621498801653) (:by |aQJLUBr_Hp) (:text |nil) (:type :leaf)
          |maintain-socket! $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |Oy2nbklIpK) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544724092867) (:by |aQJLUBr_Hp) (:id |hIHWPMhNz0) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |Mp4neKMw9y) (:text |maintain-socket!) (:type :leaf)
              |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |CcANVY5aTf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |uec22rqOmA) (:text |socket) (:type :leaf)
                  |j $ {} (:at 1544724097962) (:by |aQJLUBr_Hp) (:id |H5lxCz1im8) (:text |options) (:type :leaf)
              |x $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |gr95ZvwV8-) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |Z4QOBd89-1) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |1mf3APqW6D) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |5EPwLu8o19) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |lu1cUcucOm) (:text |sid) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |0OGv2ib1J_O) (:type :expr)
                            :data $ {}
                              |j $ {} (:at 1644659634093) (:by |aQJLUBr_Hp) (:id |22uKv3IfGR4) (:text |nanoid) (:type :leaf)
                  |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |qv2ODArK6EJ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |2LbpSSaiDmV) (:text |swap!) (:type :leaf)
                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |3EqQAOXh6P4) (:text |*global-connections) (:type :leaf)
                      |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |bXarHmwLibG) (:text |assoc) (:type :leaf)
                      |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |eVgmxCTx-EJ) (:text |sid) (:type :leaf)
                      |x $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |IJPVmfFvUJ7) (:text |socket) (:type :leaf)
                  |x $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |Led9WRBrtYc) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |9T6aUTwdJX-) (:text |when-let) (:type :leaf)
                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |a0nACZWURBP) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810714106) (:by |aQJLUBr_Hp) (:id |T6MwZkEAhaD) (:text |on-open) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |6Z9vPdCoKwl) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544810715239) (:by |aQJLUBr_Hp) (:id |kwM1KQdaK2-) (:text |:on-open) (:type :leaf)
                              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |TjINqpnVxfo) (:text |options) (:type :leaf)
                      |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |dFih9Y2b_80) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544810717000) (:by |aQJLUBr_Hp) (:id |EBZQHDAf6mW) (:text |on-open) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |tBzRmYpkux6) (:text |sid) (:type :leaf)
                          |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |8V58zH5lB59) (:text |socket) (:type :leaf)
                  |xT $ {} (:at 1621498783236) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1621498806732) (:by |aQJLUBr_Hp) (:text |reset!) (:type :leaf)
                      |T $ {} (:at 1621498797291) (:by |aQJLUBr_Hp) (:text |*proxied-data-listener) (:type :leaf)
                      |j $ {} (:at 1621498809574) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1621498809574) (:by |aQJLUBr_Hp) (:text |:on-data) (:type :leaf)
                          |j $ {} (:at 1621498809574) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                  |y $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |StUqLLDd9kl) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1627725945766) (:by |aQJLUBr_Hp) (:id |hvXRTeZw4KX) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |zfzCpnjwsem) (:text |socket) (:type :leaf)
                      |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |gT8jpuWpPbK) (:text "|\"message") (:type :leaf)
                      |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |bVGq01mmJ-p) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |G6eZnCYp_8r) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |HZb20TZnAbG) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |57bXOxxdqdO) (:text |raw-data) (:type :leaf)
                              |r $ {} (:at 1627725610211) (:by |aQJLUBr_Hp) (:text |binary?) (:type :leaf)
                          |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |3pHGdsEgrbQ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |0sbga8F4q-_) (:text |when-let) (:type :leaf)
                              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |CUeM87MRzPl) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810718385) (:by |aQJLUBr_Hp) (:id |ZGVoeCbtMzg) (:text |on-data) (:type :leaf)
                                  |j $ {} (:at 1621498952618) (:by |aQJLUBr_Hp) (:text |@*proxied-data-listener) (:type :leaf)
                              |r $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
                                  |j $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |parse-cirru-edn) (:type :leaf)
                                      |j $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |.!toString) (:type :leaf)
                                          |j $ {} (:at 1627725920100) (:by |aQJLUBr_Hp) (:text |raw-data) (:type :leaf)
                  |yT $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |0ZAA1TaR2la) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1627725947620) (:by |aQJLUBr_Hp) (:id |2tpMiiJod7I) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |G9fAD3BQ1ws) (:text |socket) (:type :leaf)
                      |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |JZ9jOfDAMV6) (:text "|\"close") (:type :leaf)
                      |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |nnle4R33Sc_) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |prCtX7vetjg) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |sN6gas7kBky) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |joihUZJEk2G) (:text |event) (:type :leaf)
                              |r $ {} (:at 1627725612239) (:by |aQJLUBr_Hp) (:text |binary?) (:type :leaf)
                          |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |RUUb0LyskIV) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |IojTVRT9FbN) (:text |swap!) (:type :leaf)
                              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |w3d7M2Cdi_W) (:text |*global-connections) (:type :leaf)
                              |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |XvzEvn-YOf9) (:text |dissoc) (:type :leaf)
                              |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |sh_b-H8BkWW) (:text |sid) (:type :leaf)
                          |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |XcPP95XL5eR) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |-cR1EeLUiGn) (:text |when-let) (:type :leaf)
                              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |RIZJRpsGvw1) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810722907) (:by |aQJLUBr_Hp) (:id |LR2ZPdn36SE) (:text |on-close) (:type :leaf)
                                  |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |v6tKvsEiXtt) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810723953) (:by |aQJLUBr_Hp) (:id |4RPpO-YUvIb) (:text |:on-close) (:type :leaf)
                                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |AaRvX7Y8SWI) (:text |options) (:type :leaf)
                              |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |DgXmKpp8gje) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810725555) (:by |aQJLUBr_Hp) (:id |uOBviITcmSD) (:text |on-close) (:type :leaf)
                                  |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |V_6ecmfn5Xi) (:text |sid) (:type :leaf)
                                  |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |YWW2EdJXO6h) (:text |event) (:type :leaf)
                  |yj $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |ei0gxTUP94o) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1627725949323) (:by |aQJLUBr_Hp) (:id |fC7STHKC7Ro) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |hv-9mlD1Tqr) (:text |socket) (:type :leaf)
                      |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |j01Gp0V4WnZ) (:text "|\"error") (:type :leaf)
                      |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |attYaoWG5h3) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |8MsWlo74Veg) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |jtpVASHENoz) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |-SrOdQwDm6s) (:text |error) (:type :leaf)
                          |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |gBt7UXgYfTU) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |rOBxk-ppHVT) (:text |swap!) (:type :leaf)
                              |j $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |NLpMwDfWcoC) (:text |*global-connections) (:type :leaf)
                              |r $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |5XUHq9H0u2s) (:text |dissoc) (:type :leaf)
                              |v $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |VA0cA6Bog7w) (:text |sid) (:type :leaf)
                          |v $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |icrpcaoi71) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614086096831) (:by |aQJLUBr_Hp) (:id |X6WT5tjINy) (:text |&let) (:type :leaf)
                              |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |Ae9Vv9UYB4) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544810726857) (:by |aQJLUBr_Hp) (:id |mGjMH5AA-p) (:text |on-error) (:type :leaf)
                                  |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |a_fC-htBi7) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810728238) (:by |aQJLUBr_Hp) (:id |V_qoEZEi4Y) (:text |:on-error) (:type :leaf)
                                      |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |JZXd_5bG7w) (:text |options) (:type :leaf)
                              |r $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |lGUo8ab_0x) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |Crm4OvrLyL) (:text |if) (:type :leaf)
                                  |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |4NFvPerFt5) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |lmx2YMWScx) (:text |some?) (:type :leaf)
                                      |j $ {} (:at 1544810729879) (:by |aQJLUBr_Hp) (:id |9nbOKn7iRa) (:text |on-error) (:type :leaf)
                                  |r $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |kkoyaH_TAK) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810731427) (:by |aQJLUBr_Hp) (:id |1YRMw29pEDi) (:text |on-error) (:type :leaf)
                                      |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |f61h7wzkLiU) (:text |error) (:type :leaf)
                                  |v $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |JbF-5yJMaff) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |X0sXngh6miB) (:text |js/console.error) (:type :leaf)
                                      |j $ {} (:at 1544724243291) (:by |aQJLUBr_Hp) (:id |m0uqSPCy5-D) (:text |error) (:type :leaf)
          |wss-each! $ {} (:at 1544723456746) (:by |aQJLUBr_Hp) (:id |81gGgnfPhr) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544723456746) (:by |aQJLUBr_Hp) (:id |bawoxQ2xIf) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544723686589) (:by |aQJLUBr_Hp) (:id |jkl6lP_5DU) (:text |wss-each!) (:type :leaf)
              |r $ {} (:at 1544723456746) (:by |aQJLUBr_Hp) (:id |dKS0bFm5Kh) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544723471178) (:by |aQJLUBr_Hp) (:id |vQrd1ym90) (:text |handler) (:type :leaf)
              |v $ {} (:at 1544723487933) (:by |aQJLUBr_Hp) (:id |VcA4OiTMNg) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1614084753276) (:by |aQJLUBr_Hp) (:id |Zc86c5agtAleaf) (:text |&doseq) (:type :leaf)
                  |b $ {} (:at 1614084768532) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1614084769265) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
                      |j $ {} (:at 1614135055936) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1627725978184) (:by |aQJLUBr_Hp) (:text |.to-list) (:type :leaf)
                          |T $ {} (:at 1614084772014) (:by |aQJLUBr_Hp) (:text |@*global-connections) (:type :leaf)
                  |r $ {} (:at 1614084755849) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1614084775604) (:by |aQJLUBr_Hp) (:text |let[]) (:type :leaf)
                      |L $ {} (:at 1614084775937) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1614084789443) (:by |aQJLUBr_Hp) (:text |sid) (:type :leaf)
                          |j $ {} (:at 1614084790663) (:by |aQJLUBr_Hp) (:text |socket) (:type :leaf)
                      |P $ {} (:at 1614084794252) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
                      |T $ {} (:at 1544723535987) (:by |aQJLUBr_Hp) (:id |T-L-70petL) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544723545706) (:by |aQJLUBr_Hp) (:id |T-L-70petLleaf) (:text |handler) (:type :leaf)
                          |j $ {} (:at 1544723546985) (:by |aQJLUBr_Hp) (:id |riVsxSc-GK) (:text |sid) (:type :leaf)
                          |r $ {} (:at 1544723575493) (:by |aQJLUBr_Hp) (:id |1Otdw7hnnk) (:text |socket) (:type :leaf)
          |wss-send! $ {} (:at 1544549548595) (:by |aQJLUBr_Hp) (:id |kYqXoOiktj) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544549548595) (:by |aQJLUBr_Hp) (:id |YKh87JbEZ7) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544549548595) (:by |aQJLUBr_Hp) (:id |1eQ02SrhHr) (:text |wss-send!) (:type :leaf)
              |r $ {} (:at 1544549548595) (:by |aQJLUBr_Hp) (:id |eooS1aXH9u) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544549553385) (:by |aQJLUBr_Hp) (:id |CjAuW9Sjdl) (:text |sid) (:type :leaf)
                  |j $ {} (:at 1544549553966) (:by |aQJLUBr_Hp) (:id |hWo14iRwNw) (:text |data) (:type :leaf)
              |v $ {} (:at 1544549554907) (:by |aQJLUBr_Hp) (:id |EqHb8gXLxM) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544549601371) (:by |aQJLUBr_Hp) (:id |EqHb8gXLxMleaf) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544549580338) (:by |aQJLUBr_Hp) (:id |QJbyEneQbu) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544549580457) (:by |aQJLUBr_Hp) (:id |poILYhoWQy) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544549581848) (:by |aQJLUBr_Hp) (:id |R7QuTOEE47) (:text |socket) (:type :leaf)
                          |j $ {} (:at 1544549582509) (:by |aQJLUBr_Hp) (:id |vxU_Ii_y02) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1544549591484) (:by |aQJLUBr_Hp) (:id |RyMCJ3hFu) (:text |get) (:type :leaf)
                              |T $ {} (:at 1544549585476) (:by |aQJLUBr_Hp) (:id |8dWOawx5dl) (:text |@*global-connections) (:type :leaf)
                              |j $ {} (:at 1544549594247) (:by |aQJLUBr_Hp) (:id |5nyHwomA9A) (:text |sid) (:type :leaf)
                  |r $ {} (:at 1544549602555) (:by |aQJLUBr_Hp) (:id |L9-pjJT_6) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544549603655) (:by |aQJLUBr_Hp) (:id |L9-pjJT_6leaf) (:text |if) (:type :leaf)
                      |j $ {} (:at 1544549603887) (:by |aQJLUBr_Hp) (:id |6qOAiBffan) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544549604904) (:by |aQJLUBr_Hp) (:id |WctKMHmyGJ) (:text |some?) (:type :leaf)
                          |j $ {} (:at 1544549606278) (:by |aQJLUBr_Hp) (:id |hkQe7OKCO4) (:text |socket) (:type :leaf)
                      |r $ {} (:at 1544549606823) (:by |aQJLUBr_Hp) (:id |j_YFHNtOEK) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1623719041581) (:by |aQJLUBr_Hp) (:id |j_YFHNtOEKleaf) (:text |.!send) (:type :leaf)
                          |j $ {} (:at 1544549641365) (:by |aQJLUBr_Hp) (:id |9hnTFJodt) (:text |socket) (:type :leaf)
                          |r $ {} (:at 1544549642700) (:by |aQJLUBr_Hp) (:id |Fiv3j9HsA) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1623719044483) (:by |aQJLUBr_Hp) (:id |zpic-VR-I) (:text |format-cirru-edn) (:type :leaf)
                              |j $ {} (:at 1544549644666) (:by |aQJLUBr_Hp) (:id |QhagPC6ldm) (:text |data) (:type :leaf)
                      |v $ {} (:at 1544549647604) (:by |aQJLUBr_Hp) (:id |xGeWt5wKq) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544549684125) (:by |aQJLUBr_Hp) (:id |xGeWt5wKqleaf) (:text |js/console.warn) (:type :leaf)
                          |j $ {} (:at 1544549698727) (:by |aQJLUBr_Hp) (:id |bzj-eAqly) (:text "|\"socket not found for") (:type :leaf)
                          |r $ {} (:at 1544549700063) (:by |aQJLUBr_Hp) (:id |NP--I9VMEV) (:text |sid) (:type :leaf)
          |wss-serve! $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |XAziNuHcq7) (:type :expr)
            :data $ {}
              |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |sJgMh2aE53) (:text |defn) (:type :leaf)
              |j $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |hEF0V8jUTj) (:text |wss-serve!) (:type :leaf)
              |r $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |zsdYfYRei2) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1544547246152) (:by |aQJLUBr_Hp) (:id |sgaq5C5f_) (:text |port) (:type :leaf)
                  |T $ {} (:at 1544547335287) (:by |aQJLUBr_Hp) (:id |iL2A14tPlY) (:text |options) (:type :leaf)
              |t $ {} (:at 1544549283432) (:by |aQJLUBr_Hp) (:id |JPhrh8Zzvm) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544549286579) (:by |aQJLUBr_Hp) (:id |JPhrh8Zzvmleaf) (:text |assert) (:type :leaf)
                  |b $ {} (:at 1627726017095) (:by |aQJLUBr_Hp) (:text "|\"first argument is port") (:type :leaf)
                  |j $ {} (:at 1544549288812) (:by |aQJLUBr_Hp) (:id |YWLwtqVCV) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544549291105) (:by |aQJLUBr_Hp) (:id |OpU8ONODXS) (:text |number?) (:type :leaf)
                      |j $ {} (:at 1544549291640) (:by |aQJLUBr_Hp) (:id |iatcVUDzX9) (:text |port) (:type :leaf)
              |v $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |nC18fqMjfl) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |9K2hp9H5lD) (:text |let) (:type :leaf)
                  |j $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |KuSD6pDQqi) (:type :expr)
                    :data $ {}
                      |j $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |J0hdzWulDmb) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |Cw1XfnW31mh) (:text |wss) (:type :leaf)
                          |j $ {} (:at 1644662835986) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1644662836729) (:by |aQJLUBr_Hp) (:text |if) (:type :leaf)
                              |L $ {} (:at 1644662890393) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1644662894040) (:by |aQJLUBr_Hp) (:text |some?) (:type :leaf)
                                  |T $ {} (:at 1644662890943) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1644662890943) (:by |aQJLUBr_Hp) (:text |:cert) (:type :leaf)
                                      |j $ {} (:at 1644662890943) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                              |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |LxSeefddT2W) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |E5d2MdYN346) (:text |new) (:type :leaf)
                                  |f $ {} (:at 1648661262629) (:by |aQJLUBr_Hp) (:text |WebSocketServer) (:type :leaf)
                                  |r $ {} (:at 1644662854210) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1644662855631) (:by |aQJLUBr_Hp) (:text |let) (:type :leaf)
                                      |L $ {} (:at 1644662856262) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |ssl-options) (:type :leaf)
                                              |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |js-object) (:type :leaf)
                                                  |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |:key) (:type :leaf)
                                                      |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |fs/readFileSync) (:type :leaf)
                                                          |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |:key) (:type :leaf)
                                                              |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                                                  |r $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |:cert) (:type :leaf)
                                                      |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |fs/readFileSync) (:type :leaf)
                                                          |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |:cert) (:type :leaf)
                                                              |j $ {} (:at 1644662861764) (:by |aQJLUBr_Hp) (:text |options) (:type :leaf)
                                          |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |server) (:type :leaf)
                                              |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |https/createServer) (:type :leaf)
                                                  |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |ssl-options) (:type :leaf)
                                                  |r $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                                                      |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |req) (:type :leaf)
                                                          |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |res) (:type :leaf)
                                                      |r $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |.!writeHead) (:type :leaf)
                                                          |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |res) (:type :leaf)
                                                          |r $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |200) (:type :leaf)
                                                      |v $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |.!end) (:type :leaf)
                                                          |j $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text |res) (:type :leaf)
                                                          |r $ {} (:at 1644663060393) (:by |aQJLUBr_Hp) (:text "|\"WSS Server") (:type :leaf)
                                      |R $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |.!addListener) (:type :leaf)
                                          |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |server) (:type :leaf)
                                          |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text "|\"upgrade") (:type :leaf)
                                          |v $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |req) (:type :leaf)
                                                  |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |res) (:type :leaf)
                                                  |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |head) (:type :leaf)
                                              |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |js/console.log) (:type :leaf)
                                                  |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |.-url) (:type :leaf)
                                                      |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |req) (:type :leaf)
                                      |S $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |.!on) (:type :leaf)
                                          |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |server) (:type :leaf)
                                          |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text "|\"error") (:type :leaf)
                                          |v $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |err) (:type :leaf)
                                              |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |js/console.error) (:type :leaf)
                                                  |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |err) (:type :leaf)
                                      |ST $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |.!listen) (:type :leaf)
                                          |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |server) (:type :leaf)
                                          |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |port) (:type :leaf)
                                          |v $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |fn) (:type :leaf)
                                              |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                              |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |println) (:type :leaf)
                                                  |j $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text "|\"server at") (:type :leaf)
                                                  |r $ {} (:at 1644662878756) (:by |aQJLUBr_Hp) (:text |port) (:type :leaf)
                                      |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |IuGPVDKsQSa) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1621498879085) (:by |aQJLUBr_Hp) (:id |0w3zkXdnJJP) (:text |js-object) (:type :leaf)
                                          |b $ {} (:at 1644660084834) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644660098439) (:by |aQJLUBr_Hp) (:text |:server) (:type :leaf)
                                              |j $ {} (:at 1644660086144) (:by |aQJLUBr_Hp) (:text |server) (:type :leaf)
                                          |n $ {} (:at 1644660092514) (:by |aQJLUBr_Hp) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1644660094789) (:by |aQJLUBr_Hp) (:text |:path) (:type :leaf)
                                              |j $ {} (:at 1644662505571) (:by |aQJLUBr_Hp) (:text "|\"/") (:type :leaf)
                              |j $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |LxSeefddT2W) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |E5d2MdYN346) (:text |new) (:type :leaf)
                                  |f $ {} (:at 1648661266410) (:by |aQJLUBr_Hp) (:text |WebSocketServer) (:type :leaf)
                                  |r $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |IuGPVDKsQSa) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1621498879085) (:by |aQJLUBr_Hp) (:id |0w3zkXdnJJP) (:text |js-object) (:type :leaf)
                                      |b $ {} (:at 1644660084834) (:by |aQJLUBr_Hp) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1644662842358) (:by |aQJLUBr_Hp) (:text |:port) (:type :leaf)
                                          |j $ {} (:at 1644662844391) (:by |aQJLUBr_Hp) (:text |port) (:type :leaf)
                  |r $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |xabG3zTY_q5) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1623719187027) (:by |aQJLUBr_Hp) (:id |UZbIDsqp0cP) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544464609226) (:by |aQJLUBr_Hp) (:id |BonJfhc9VFV) (:text |wss) (:type :leaf)
                      |r $ {} (:at 1544464672410) (:by |aQJLUBr_Hp) (:id |uyocwopRBfV) (:text "|\"connection") (:type :leaf)
                      |v $ {} (:at 1544724102470) (:by |aQJLUBr_Hp) (:id |7b1M3vwNa) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1544724103224) (:by |aQJLUBr_Hp) (:id |AsilhuoWy) (:text |fn) (:type :leaf)
                          |L $ {} (:at 1544724103557) (:by |aQJLUBr_Hp) (:id |0wy-nuw5A) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724105241) (:by |aQJLUBr_Hp) (:id |yUDnBNbsuD) (:text |socket) (:type :leaf)
                              |b $ {} (:at 1614094219415) (:by |aQJLUBr_Hp) (:text |?) (:type :leaf)
                              |j $ {} (:at 1614094218838) (:by |aQJLUBr_Hp) (:text |req) (:type :leaf)
                          |T $ {} (:at 1544724106250) (:by |aQJLUBr_Hp) (:id |cMuBcUVAbo) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724084862) (:by |aQJLUBr_Hp) (:id |Ic4SbkPB5w6) (:text |maintain-socket!) (:type :leaf)
                              |j $ {} (:at 1544724108944) (:by |aQJLUBr_Hp) (:id |XUzNeUkvd) (:text |socket) (:type :leaf)
                              |r $ {} (:at 1544724110072) (:by |aQJLUBr_Hp) (:id |PWSAayLR4c) (:text |options) (:type :leaf)
                  |v $ {} (:at 1544548299847) (:by |aQJLUBr_Hp) (:id |R2gtAZYA6) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1623719188364) (:by |aQJLUBr_Hp) (:id |R2gtAZYA6leaf) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544548302607) (:by |aQJLUBr_Hp) (:id |95g5BEqqK) (:text |wss) (:type :leaf)
                      |r $ {} (:at 1544548303823) (:by |aQJLUBr_Hp) (:id |Ib04k_6k1E) (:text "|\"listening") (:type :leaf)
                      |v $ {} (:at 1544548304487) (:by |aQJLUBr_Hp) (:id |Nxfww3C3M_) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544548304771) (:by |aQJLUBr_Hp) (:id |ZSldLsRhsq) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544548306091) (:by |aQJLUBr_Hp) (:id |VsRwg0x1G) (:type :expr)
                            :data $ {}
                          |r $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |G9V4prGJ9Z) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614085967387) (:by |aQJLUBr_Hp) (:id |Hqv1HU7PF0) (:text |let) (:type :leaf)
                              |j $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |-LY07hADTU) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |ij-PwkjaeH) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810686198) (:by |aQJLUBr_Hp) (:id |KHa9T66dFZ) (:text |on-listening) (:type :leaf)
                                      |j $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |LRAik-5Ibh) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1544810691894) (:by |aQJLUBr_Hp) (:id |kwGmxBBdWX) (:text |:on-listening) (:type :leaf)
                                          |j $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |ic-W4g-PLY) (:text |options) (:type :leaf)
                              |r $ {} (:at 1614085970643) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1614085971929) (:by |aQJLUBr_Hp) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1614085972145) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1614085972859) (:by |aQJLUBr_Hp) (:text |some?) (:type :leaf)
                                      |j $ {} (:at 1614085974715) (:by |aQJLUBr_Hp) (:text |on-listening) (:type :leaf)
                                  |T $ {} (:at 1544724152997) (:by |aQJLUBr_Hp) (:id |i347Soea97) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810687502) (:by |aQJLUBr_Hp) (:id |3ehp0E4nul) (:text |on-listening) (:type :leaf)
                  |x $ {} (:at 1544548343602) (:by |aQJLUBr_Hp) (:id |eUA3PAzaU) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1623719190996) (:by |aQJLUBr_Hp) (:id |eUA3PAzaUleaf) (:text |.!on) (:type :leaf)
                      |j $ {} (:at 1544548346030) (:by |aQJLUBr_Hp) (:id |ErqxRJ7q0) (:text |wss) (:type :leaf)
                      |r $ {} (:at 1544548351169) (:by |aQJLUBr_Hp) (:id |HuRPhuxlKk) (:text "|\"error") (:type :leaf)
                      |v $ {} (:at 1544548351624) (:by |aQJLUBr_Hp) (:id |c3IfKjpSs) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1544548351956) (:by |aQJLUBr_Hp) (:id |q9Xa-TdkBG) (:text |fn) (:type :leaf)
                          |j $ {} (:at 1544548352202) (:by |aQJLUBr_Hp) (:id |6tZrjZCbze) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544548353284) (:by |aQJLUBr_Hp) (:id |X84YJDeZfr) (:text |error) (:type :leaf)
                          |r $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |qGDJVwyc9V) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1544724201928) (:by |aQJLUBr_Hp) (:id |eYPfcnl99U) (:text |let) (:type :leaf)
                              |j $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |sYSBcxrgf4) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |6wp65Zznqu) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810689086) (:by |aQJLUBr_Hp) (:id |vCNLeT_hPm) (:text |on-error) (:type :leaf)
                                      |j $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |q7lONdr1y2) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1544810690631) (:by |aQJLUBr_Hp) (:id |9C5_5_iisB) (:text |:on-error) (:type :leaf)
                                          |j $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |e7-GsXfLoe) (:text |options) (:type :leaf)
                              |r $ {} (:at 1544724205590) (:by |aQJLUBr_Hp) (:id |NmTahlWuc) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1544724206112) (:by |aQJLUBr_Hp) (:id |7UEZpLQFhe) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1544724206548) (:by |aQJLUBr_Hp) (:id |I6y4qsN-J) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544724207321) (:by |aQJLUBr_Hp) (:id |bzo6LSsyBg) (:text |some?) (:type :leaf)
                                      |j $ {} (:at 1544810694836) (:by |aQJLUBr_Hp) (:id |OQehFz-af) (:text |on-error) (:type :leaf)
                                  |T $ {} (:at 1544724194836) (:by |aQJLUBr_Hp) (:id |3uz9qG652d) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544810693629) (:by |aQJLUBr_Hp) (:id |bJa-pVY3II) (:text |on-error) (:type :leaf)
                                      |j $ {} (:at 1544724227029) (:by |aQJLUBr_Hp) (:id |oieAbOAVJW) (:text |error) (:type :leaf)
                                  |j $ {} (:at 1544724227674) (:by |aQJLUBr_Hp) (:id |19u-PKLjw) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1544724234946) (:by |aQJLUBr_Hp) (:id |19u-PKLjwleaf) (:text |js/console.error) (:type :leaf)
                                      |j $ {} (:at 1544724235821) (:by |aQJLUBr_Hp) (:id |VFbQLfK4_m) (:text |error) (:type :leaf)
          |wss-set-on-data! $ {} (:at 1621499006635) (:by |aQJLUBr_Hp) (:type :expr)
            :data $ {}
              |T $ {} (:at 1621499006635) (:by |aQJLUBr_Hp) (:text |defn) (:type :leaf)
              |j $ {} (:at 1621499625938) (:by |aQJLUBr_Hp) (:text |wss-set-on-data!) (:type :leaf)
              |r $ {} (:at 1621499006635) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1621499011337) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
              |v $ {} (:at 1621499011857) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1621499036665) (:by |aQJLUBr_Hp) (:text |reset!) (:type :leaf)
                  |T $ {} (:at 1621499025799) (:by |aQJLUBr_Hp) (:text |*proxied-data-listener) (:type :leaf)
                  |j $ {} (:at 1621499039114) (:by |aQJLUBr_Hp) (:text |on-data) (:type :leaf)
        :ns $ {} (:at 1544464128346) (:by |aQJLUBr_Hp) (:id |yz7pQZa7Qq) (:type :expr)
          :data $ {}
            |T $ {} (:at 1544464128346) (:by |aQJLUBr_Hp) (:id |pHWLl0gpP_) (:text |ns) (:type :leaf)
            |j $ {} (:at 1544464128346) (:by |aQJLUBr_Hp) (:id |P5Iwaya4jG) (:text |ws-edn.server) (:type :leaf)
            |r $ {} (:at 1544546000331) (:by |aQJLUBr_Hp) (:id |nThhnf_SyU) (:type :expr)
              :data $ {}
                |T $ {} (:at 1544546001037) (:by |aQJLUBr_Hp) (:id |Fo1iFkJ6sN) (:text |:require) (:type :leaf)
                |r $ {} (:at 1544548020782) (:by |aQJLUBr_Hp) (:id |2I34DaAp6) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1544548022455) (:by |aQJLUBr_Hp) (:id |pZJGG-2bjP) (:text "|\"ws") (:type :leaf)
                    |r $ {} (:at 1648661256139) (:by |aQJLUBr_Hp) (:id |ZLH2ADfdz) (:text |:refer) (:type :leaf)
                    |t $ {} (:at 1648661256951) (:by |aQJLUBr_Hp) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1648661257336) (:by |aQJLUBr_Hp) (:text |WebSocketServer) (:type :leaf)
                |t $ {} (:at 1614144540185) (:by |aQJLUBr_Hp) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1614144544495) (:by |aQJLUBr_Hp) (:text |ws-edn.util) (:type :leaf)
                    |r $ {} (:at 1614144546529) (:by |aQJLUBr_Hp) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1614144546864) (:by |aQJLUBr_Hp) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1614144550081) (:by |aQJLUBr_Hp) (:text |when-let) (:type :leaf)
                        |r $ {} (:at 1614144552635) (:by |aQJLUBr_Hp) (:text |parse-data) (:type :leaf)
                |w $ {} (:at 1644659636641) (:by |aQJLUBr_Hp) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1644659637931) (:by |aQJLUBr_Hp) (:text "|\"nanoid") (:type :leaf)
                    |j $ {} (:at 1644659640765) (:by |aQJLUBr_Hp) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1644659643038) (:by |aQJLUBr_Hp) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1644659642846) (:by |aQJLUBr_Hp) (:text |nanoid) (:type :leaf)
                |x $ {} (:at 1644659706546) (:by |aQJLUBr_Hp) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1644659708418) (:by |aQJLUBr_Hp) (:text "|\"https") (:type :leaf)
                    |j $ {} (:at 1644659709551) (:by |aQJLUBr_Hp) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1644660170409) (:by |aQJLUBr_Hp) (:text |https) (:type :leaf)
                |y $ {} (:at 1644660553453) (:by |aQJLUBr_Hp) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1644660554139) (:by |aQJLUBr_Hp) (:text "|\"fs") (:type :leaf)
                    |j $ {} (:at 1644660554976) (:by |aQJLUBr_Hp) (:text |:as) (:type :leaf)
                    |r $ {} (:at 1644660555353) (:by |aQJLUBr_Hp) (:text |fs) (:type :leaf)
        :proc $ {} (:at 1544464128346) (:by |aQJLUBr_Hp) (:id |ma1EUszMbB) (:type :expr)
          :data $ {}
      |ws-edn.util $ {}
        :configs $ {}
        :defs $ {}
          |when-let $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
            :data $ {}
              |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |defmacro) (:type :leaf)
              |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |when-let) (:type :leaf)
              |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
                  |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |&) (:type :leaf)
                  |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |body) (:type :leaf)
              |v $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |assert) (:type :leaf)
                  |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text "|\"expected 2 tokens") (:type :leaf)
                  |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |and) (:type :leaf)
                      |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |list?) (:type :leaf)
                          |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
                      |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |=) (:type :leaf)
                          |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |2) (:type :leaf)
                          |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |count) (:type :leaf)
                              |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
              |x $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1623719007545) (:by |aQJLUBr_Hp) (:text |quasiquote) (:type :leaf)
                  |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |&let) (:type :leaf)
                      |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~pair) (:type :leaf)
                      |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |when) (:type :leaf)
                          |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |some?) (:type :leaf)
                              |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~) (:type :leaf)
                                  |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |first) (:type :leaf)
                                      |j $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |pair) (:type :leaf)
                          |r $ {} (:at 1614144465118) (:by |aQJLUBr_Hp) (:text |~@body) (:type :leaf)
        :ns $ {} (:at 1614144454159) (:by |aQJLUBr_Hp) (:type :expr)
          :data $ {}
            |T $ {} (:at 1614144454159) (:by |aQJLUBr_Hp) (:text |ns) (:type :leaf)
            |j $ {} (:at 1614144454159) (:by |aQJLUBr_Hp) (:text |ws-edn.util) (:type :leaf)
        :proc $ {} (:at 1614144454159) (:by |aQJLUBr_Hp) (:type :expr)
          :data $ {}
  :users $ {}
    |VDPjyAOgV $ {} (:avatar nil) (:id |VDPjyAOgV) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |aQJLUBr_Hp $ {} (:avatar nil) (:id |aQJLUBr_Hp) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
