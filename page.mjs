
import { main_$x_ } from "./out-page/ws-edn.app.page.mjs"

main_$x_()

if (import.meta.hot) {
  import.meta.hot.accept('./out-page/ws-edn.app.page.mjs', (main) => {
    main.reload_$x_()
  })
}
