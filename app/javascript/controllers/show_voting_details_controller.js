import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "voters"]

  connect() {
    console.log("Hello");
  }
  displayVoters() {
    this.votersTarget.classList.toggle("d-none")
  }
}
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
