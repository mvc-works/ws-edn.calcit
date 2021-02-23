
import { main_BANG_ } from "./js-out/ws-edn.page.js"

main_BANG_()

if (import.meta.hot) {
  import.meta.hot.accept('./js-out/ws-edn.page.js', (main) => {
    main.reload_BANG_()
  })
}
