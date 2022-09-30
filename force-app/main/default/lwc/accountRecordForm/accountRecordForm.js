import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUAL_REVNUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class AccountRecordForm extends LightningElement {
    recordId = '0015j00000bs0TvAAI';
    objectName = ACCOUNT_OBJECT;
    fields = [ACCOUNT_NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, ANNUAL_REVNUE_FIELD];

    successHandler() {
        const successEvent = new ShowToastEvent({
            title : "Success",
            message : "The record has been saved successfully!",
            variant : "success" //error //warning //info
        });
        this.dispatchEvent(successEvent);
    }

    errorHandler() {
        const errorEvent = new ShowToastEvent({
            title : "Error",
            message : "An error occurred while saving the information!",
            variant : "error"
        });
        this.dispatchEvent(errorEvent);
    }
}