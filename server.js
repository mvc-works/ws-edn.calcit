
import { main_$x_, reload_$x_ } from "./js-out/ws-edn.app.server.js"

main_$x_()

if (module.hot) {
  module.hot.accept('./js-out/ws-edn.app.server.js', (main) => {
    reload_$x_()
  })
}
