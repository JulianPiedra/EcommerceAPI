// utils/alert.js
import Swal from 'sweetalert2';

export function showToast(icon, title, text) {
  Swal.fire({
    toast: true,
    icon,
    title,
    text,
    timer: 1500,
    position: 'bottom-right',
    showConfirmButton: false,
  });
}
