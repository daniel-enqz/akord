import Swal from 'sweetalert2';
import { Controller } from "stimulus"

export default class extends Controller {
  static values = { shortString: String }

  connect() {
  }

  alert(event) {
    event.preventDefault()
    Swal.fire({
      title:             'Are you sure?',
      text:              `${this.shortStringValue} will be the winner date for this event.`,
      icon:              'warning',
      showCancelButton:  true,
      confirmButtonText: 'Yes',
      cancelButtonText:  'Cancel',
    }).then((result) => {
      if(result.isConfirmed) {
        fetch(this.element.href)
      }
    });
  }
}
