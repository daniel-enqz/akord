import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { eventId: String } // Question: maybe ID or HashID
  static targets = ["dates"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "EventChannel", id: this.eventIdValue },
      {
        received: data => this.#insertDatesVotes(data)
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.eventIdValue}.`)
  }

  #insertDatesVotes(data) {
    console.log("Received")
    data.forEach((voteData) => {
      const element = this.#dateElements(voteData.date)
      this.#castVoteFor(element, voteData.rate)
    })
  }

  #dateElements(date_string) {
    const element = this.datesTarget.querySelector(`[data-date='${date_string}']`)
    return {
      noDisplay: element.querySelector(".no-display"),
      yesDisplay: element.querySelector(".yes-display"),
      totalDisplay: element.querySelector(".total-display"),
      progressBar: element.querySelector(".progress-bar")
    }
  }

  #castVoteFor(element, voteString) {
    const voteDisplay = element[`${voteString}Display`]
    const totalDisplay = element.totalDisplay
    if (voteDisplay) {
      voteDisplay.innerText = parseInt(voteDisplay.innerText, 10) + 1
    }
    totalDisplay.innerText = parseInt(totalDisplay.innerText, 10) + 1

    const yesCount = parseInt(element.yesDisplay.innerText, 10)
    const progressBarValue = (yesCount * 100) / parseInt(totalDisplay.innerText, 10)
    element.progressBar.style.width = `${progressBarValue}%`
  }
}
