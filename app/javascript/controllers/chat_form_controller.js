import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("ChatForm controller connected")
  }
  
  submit(event) {
    const textarea = this.element.querySelector('textarea')
    const submitButton = this.element.querySelector('input[type="submit"], button[type="submit"]')
    const loadingOverlay = document.getElementById('loading-overlay')
    
    // Check if textarea has content
    if (!textarea.value.trim()) {
      console.log("Textarea is empty, preventing submission")
      event.preventDefault()
      return false
    }
    
    // Show loading overlay
    if (loadingOverlay) {
      loadingOverlay.classList.remove('hidden')
    }
    
    // Disable form during submission
    submitButton.disabled = true
    textarea.disabled = true
    
    // Add loading state
    submitButton.textContent = "Sending..."
    submitButton.classList.add("opacity-75", "cursor-not-allowed")
    
    // Allow form to submit naturally
    return true
  }
}
