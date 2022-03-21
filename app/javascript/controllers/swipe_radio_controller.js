import Hammer from "hammerjs"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    debugger
    this.initialX = this.element.getBoundingClientRect().x
    this.threshold = 100
    this.inputValues = { yes: 1, no: -1, maybe: 0 }
    this.inputFinalPositions = { yes: 100, no: -100, maybe: 0 }
    this.inputValueClasses = ["swipe-no", "swipe-maybe", "swipe-yes"]
    this.hammerSquare = new Hammer(this.element)
    this.hammerSquare.on('panstart', (e) => this.#panStart(e))
  }

  #panStart(e) {
    this.element.classList.remove("smooth-transition")
    this.currentX = this.element.getBoundingClientRect().x
    this.hammerSquare.on('panmove', (e) => this.#panMove(e))
    this.hammerSquare.on('panend', (e) => this.#panEnd(e))
  }

  get currentLeft() {
    return parseInt(this.element.style.left, 10)
  }

  get currentValue() {
    if (this.currentLeft > this.threshold) {
      return "yes"
    } else if (this.currentLeft < -this.threshold) {
      return "no"
    }
    return "maybe"
  }

  get currentClass() {
    return this.inputValueClasses[this.inputValues[this.currentValue] + 1]
  }

  #panMove(e) {
    const deviation = this.initialX - this.currentX
    this.element.style.left = `${e.deltaX - deviation}px`

    this.inputValueClasses.forEach((classValue) => { this.element.classList.remove(classValue) })
    this.element.classList.add(this.currentClass)
  }

  #panEnd(e) {
    this.element.classList.add("smooth-transition")
    this.inputTarget.value = this.inputValues[this.currentValue]

    this.element.style.left = `${this.inputFinalPositions[this.currentValue]}px`

    this.hammerSquare.off('panmove', this.#panMove)
    this.hammerSquare.off('panend', this.#panEnd)
  }
}
