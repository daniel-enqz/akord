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
