import { getRecords } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetRecordsSameObject extends LightningElement {

    @track accounts;

    @wire(getRecords, {
        records: [
            {
                recordIds: ["001Iw000002LLi5IAG", "001Iw000002tC1ZIAU"],
                fields: [NAME_FIELD, TYPE_FIELD],
                optionalFields: [INDUSTRY_FIELD]
            }
        ]
    })
    recordsHandler({data, error}) {
        if(data) {
            console.log(data);
            this.accounts = data.results;
            console.log(this.accounts);
        }
        if(error) {
            console.log(error);
        }
    }
}