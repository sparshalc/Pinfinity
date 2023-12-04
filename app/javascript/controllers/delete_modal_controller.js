import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-modal"
export default class extends Controller {
  connect() {
    console.log("Delete Modal controller is connected successfully.")
  }
  click(e){
    e.preventDefault();
    console.log("Now I need to pop up the delete confirmation modal");
    
    // Get the Bootstrap modal element
    const modalElement = new bootstrap.Modal(document.getElementById("deleteModal"));

    // Open the modal
    modalElement.show();
  }
}
