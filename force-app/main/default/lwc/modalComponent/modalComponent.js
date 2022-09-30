import { LightningElement } from 'lwc';

export default class ModalComponent extends LightningElement {
    closeHandler() {
        //const closeEvent = new CustomEvent('close', {detail: "This data has been sent by child component using close event!!"});
        const con = {
            firstname: "Satya",
            lastname: "Nadella"
        }
        const closeEvent = new CustomEvent('close', {bubbles:true, detail: con});
        this.dispatchEvent(closeEvent);
        console.log("close handler has been called!!");
    }

    footerHandler() {
        console.log('footer handler has been called!!');
    }

    divHandler() {
        console.log('div handler has been called!!');
    }
}