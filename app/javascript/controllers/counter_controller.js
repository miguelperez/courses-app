import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log('connect')
    this.value = parseInt(this.element.textContent);
  }

  initialize(){
    console.log('init')
  }

  increment(){
    this.value = this.value + 1;
    this.element.textContent = this.value;
  }
}
