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
      text:              'You have selected the winner date for this event',
      icon:              'warning',
      showCancelButton:  true,
      confirmButtonText: 'Yes',
      cancelButtonText:  'Cancel',
    }).then((result) => {
      if(result.isConfirmed) window.location = this.element.href
    });
  }
}
