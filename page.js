
import { main_BANG_ } from "./out-page/ws-edn.app.page.js"

main_BANG_()

if (import.meta.hot) {
  import.meta.hot.accept('./out-page/ws-edn.app.page.js', (main) => {
    main.reload_BANG_()
  })
}
