
import { main_BANG_, reload_BANG_ } from "./js-out/ws-edn.app.server.js"

main_BANG_()

if (module.hot) {
  module.hot.accept('./js-out/ws-edn.app.server.js', (main) => {
    reload_BANG_()
  })
}
