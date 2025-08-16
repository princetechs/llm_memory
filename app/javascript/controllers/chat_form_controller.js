import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit(event) {
    const form = this.element
    const submitButton = form.querySelector('input[type="submit"], button[type="submit"]')
    const textarea = form.querySelector('textarea')
    
    // Disable form during submission
    submitButton.disabled = true
    textarea.disabled = true
    
    // Add loading state
    submitButton.textContent = "Sending..."
    submitButton.classList.add("opacity-75", "cursor-not-allowed")
    
    // Re-enable after a short delay (form will redirect anyway)
    setTimeout(() => {
      submitButton.disabled = false
      textarea.disabled = false
      submitButton.textContent = "Send"
      submitButton.classList.remove("opacity-75", "cursor-not-allowed")
    }, 1000)
  }
}
