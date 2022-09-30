import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    buttonclickHandler1(event) {
        console.log("In parent component, child on event!!");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }

    buttonclickHandler2(event) {
        console.log("In parent component, on div dom!!");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}