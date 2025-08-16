import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("AutoResize controller connected")
    this.resize()
  }

  resize() {
    console.log("AutoResize resize method called")
    const textarea = this.element
    textarea.style.height = 'auto'
    textarea.style.height = textarea.scrollHeight + 'px'
  }
}
