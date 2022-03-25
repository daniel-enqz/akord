import Swal from 'sweetalert2';
import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { eventId: String } // Question: maybe ID or HashID
  static targets = ["dates", "info"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "EventStatusChannel", id: this.eventIdValue },
      {
        received: data => this.#insertStatusInfo(data)
      }
    )
  }

  #insertStatusInfo(data) {
    this.infoTarget.innerHTML = data.info
    this.datesTarget.innerHTML = data.dates
    Swal.fire({
      title:             'Save the date!',
      html:              data.alertWindow
    })
  }
}
