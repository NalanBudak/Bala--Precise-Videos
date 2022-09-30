import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';

export default class DeleteRecord extends LightningElement {
    recordId;

    changeHandler(event) {
        this.recordId = event.target.value;
    }

    deleteRec() {
        deleteRecord(this.recordId)
            .then(result => {
                console.log(result);
                this.displayToast("Success", "The record has been deleted successfully!", "success");
            })
            .catch(error => {
                console.error(error);
                this.displayToast("Error", error.body.message, "error");
            })
    }

    displayToast(title, message, variant) {
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}