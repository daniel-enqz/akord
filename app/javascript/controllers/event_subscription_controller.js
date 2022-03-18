import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { eventId: String } // Question: maybe ID or HashID
  static targets = ["dates"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.eventIdValue}.`)
  }
}
