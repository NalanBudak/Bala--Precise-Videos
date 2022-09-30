import { LightningElement } from 'lwc';

export default class Child extends LightningElement {
    handleClick(event) {
        console.log("In child component, before preparing and dispatching event");
        const buttonclickEvent = new CustomEvent('buttonclick', {bubbles: true, composed: true});
        this.dispatchEvent(buttonclickEvent);
    }
}