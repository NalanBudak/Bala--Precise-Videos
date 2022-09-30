import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    constructor() {
        super();
        console.log("Parent constructor called!");
    }
    connectedCallback() {
        console.log("Parent connectedCallback called!");
    }
    renderedCallback() {
        console.log("Parent renderedCallback called!");
    }
    disconnectedCallback() {
        console.log("Parent disconnectedCallback called!");
    }
    errorCallback(error, stack) {
        console.log("Parent errorCallback called!");
        console.log(error.message);
        console.log(stack);
    }

    input;
    showChild = true;
    changeHandler(event) {
        this.input = event.target.value;
    }
    childHandler() {
        this.showChild = false;
    }
}