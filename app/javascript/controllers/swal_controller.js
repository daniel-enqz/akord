import Rails from "@rails/ujs"
import Swal from 'sweetalert2';
import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
  }

  alert(event) {
    event.preventDefault()
    Swal.fire({
      title:             'Are you sure?',
      text:              '',
      icon:              'warning',
      showCancelButton:  true,
      confirmButtonText: 'Yes',
      cancelButtonText:  'Cancel',
    }).then(() => {
      window.location = this.element.href
    });
  }
}
