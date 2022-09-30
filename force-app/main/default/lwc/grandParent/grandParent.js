import { LightningElement } from 'lwc';

export default class GrandParent extends LightningElement {
    buttonclickHandler(event) {
        console.log("In grand parent component!!");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}