
import { main_$x_ } from "./out-page/ws-edn.app.page.js"

main_$x_()

if (import.meta.hot) {
  import.meta.hot.accept('./out-page/ws-edn.app.page.js', (main) => {
    main.reload_$x_()
  })
}
