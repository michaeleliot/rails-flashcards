import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["reveal", "hide"]
  connect() {
    const revealElements = this.revealTargets
    revealElements.forEach(element => {
      element.classList.add("hidden");
    });
  }

  reveal() {
    const revealElements = this.revealTargets
    revealElements.forEach(element => {
      element.classList.remove("hidden");
    });

    const hideElements = this.hideTargets
    hideElements.forEach(element => {
      element.classList.add("hidden");
    });

  }
}
