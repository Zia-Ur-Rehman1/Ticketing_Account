//app/javascript/controllers/modal_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "modal"]
  open(event) {
    event.preventDefault();
    this.modalTarget.showModal();
  }

  close(event) {
    event.preventDefault();
    this.modalTarget.close();
  }

  submitForm(event) {
    event.preventDefault();
  const formElement = this.formTarget;
  formElement.submit();
  this.modalTarget.close();
  }
}
