import Hammer from "hammerjs"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "thumbsup", "thumbsdown", "icons", "maybe"]

  connect() {
    this.initialX = this.element.getBoundingClientRect().x
    this.threshold = 50
    this.limit = this.threshold * 1.25
    this.inputValues = { yes: 1, no: -1, maybe: 0 }
    this.inputFinalPositions = { yes: 50, no: -50, maybe: 0 }
    this.inputValueClasses = ["swipe-no", "swipe-maybe", "swipe-yes"]
    this.hammerSquare = new Hammer(this.element)
    this.hammerSquare.on('panstart', (e) => this.#panStart(e))
  }

  #panStart(e) {
    this.element.classList.remove("smooth-transition")
    this.currentX = this.element.getBoundingClientRect().x
    this.hammerSquare.on('panmove', (e) => this.#panMove(e))
    this.hammerSquare.on('panend', (e) => this.#panEnd(e))

    this.iconsTarget.classList.remove("punch-in")
    this.iconsTarget.classList.add("d-none")
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
    const posX = e.deltaX - deviation
    const isPositive = posX > 0
    const absoluteX = Math.min(Math.abs(posX), this.limit)
    this.element.style.left = `${isPositive ? absoluteX : -absoluteX}px`

    this.iconsTarget.classList.add("opacify")
    this.iconsTarget.classList.remove("d-none")
    this.#displayIcon()

    this.inputValueClasses.forEach((classValue) => { this.element.classList.remove(classValue) })
    this.element.classList.add(this.currentClass)
  }

  #displayIcon() {
    if (this.currentValue == "yes") {
      this.thumbsupTarget.classList.remove("d-none")
      this.maybeTarget.classList.add("d-none")
      this.thumbsdownTarget.classList.add("d-none")
    } else if (this.currentValue == "no") {
      this.thumbsdownTarget.classList.remove("d-none")
      this.maybeTarget.classList.add("d-none")
      this.thumbsupTarget.classList.add("d-none")
    } else {
      this.maybeTarget.classList.remove("d-none")
      this.thumbsupTarget.classList.add("d-none")
      this.thumbsdownTarget.classList.add("d-none")
    }
  }

  #panEnd(e) {
    this.element.classList.add("smooth-transition")
    this.inputTarget.value = this.inputValues[this.currentValue]

    this.iconsTarget.classList.add("punch-in")
    this.iconsTarget.classList.remove("opacify")

    this.element.style.left = `${this.inputFinalPositions[this.currentValue]}px`

    this.hammerSquare.off('panmove', this.#panMove)
    this.hammerSquare.off('panend', this.#panEnd)
  }
}
