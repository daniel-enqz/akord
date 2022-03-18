import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["details", "voters"]

  connect() {
    console.log("Hello");
  }
  displayDetails() {
    this.detailsTarget.classList.toggle("d-none")
    this.votersTarget.classList.add("d-none")
  }
  displayVoters() {
    this.votersTarget.classList.toggle("d-none")
    this.detailsTarget.classList.add("d-none")
  }
}
