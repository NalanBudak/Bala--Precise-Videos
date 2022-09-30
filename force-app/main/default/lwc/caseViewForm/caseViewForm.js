import { LightningElement, api } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';
import CASE_NUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';

export default class CaseViewForm extends LightningElement {
    //recordId = '5005j00000JdS2FAAV';
    @api recordId;
    objectName = CASE_OBJECT;
    fields = {
        caseNumber : CASE_NUMBER_FIELD,
        account : ACCOUNT_FIELD,
        origin : ORIGIN_FIELD,
        priority : PRIORITY_FIELD,
        status : STATUS_FIELD,
        subject : SUBJECT_FIELD
    }
}