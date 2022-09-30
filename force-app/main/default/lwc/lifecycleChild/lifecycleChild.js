import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement {
    constructor() {
        super();
        console.log("Child constructor called!");
    }
    connectedCallback() {
        console.log("Child connectedCallback called!");
        throw new Error("Error occurred while getting the things done!!");
    }
    renderedCallback() {
        console.log("Child renderedCallback called!");
    }
    disconnectedCallback() {
        console.log("Child disconnectedCallback called!");
    }
}