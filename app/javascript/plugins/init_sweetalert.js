import Swal from 'sweetalert2';
import Rails from '@rails/ujs';

window.Swal = Swal;

// Behavior after click to confirm button
const confirmed = (element, result) => {
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
  const message = element.getAttribute('data-confirm-swal');
  const text    = element.getAttribute('data-text');

  Swal.fire({
      title:             message || 'Are you sure?',
      text:              text || '',
      icon:              'warning',
      showCancelButton:  true,
      confirmButtonText: 'Yes',
      cancelButtonText:  'Cancel',
  });

};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);
