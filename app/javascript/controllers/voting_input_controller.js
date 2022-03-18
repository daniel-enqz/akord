import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["icon"]

  connect() {
    console.log("Hello");
    this.icons = {
      "-1": "fa fa-thumbs-down slide-up",
      "0": "fa fa-thumbs-down slide-up",
      "1": "fa fa-thumbs-up slide-up"
    }
  }
  updateValue(event) {
    console.log("Changed");
    this.iconTarget.classList.value = ""
    setTimeout(() => {
      const valueString = event.target.value.toString()
      this.iconTarget.classList.value = this.icons[valueString]
    }, 10);
  }
}
