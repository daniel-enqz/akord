// The date picker (read the docs)
import flatpickr from "flatpickr";
import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("Connected!");
    flatpickr(
      this.element,
      {
        mode: "multiple",
        dateFormat: "Y-m-d"
      }
    );
  }
}
