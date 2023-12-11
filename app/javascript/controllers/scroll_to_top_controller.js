import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-top"
export default class extends Controller {
  connect() {
    const scroll_to_top = document.getElementById('scrollToTop')
    window.addEventListener('scroll', function(){
      scroll_to_top.classList.toggle('active', this.window.pageYOffset > 20)
    })
    scroll_to_top.addEventListener('click', function (e) {
      window.scrollTo(0, 0)
    })
  }
}
