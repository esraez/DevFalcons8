import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

export default class LightningRecordEditFormCase extends LightningElement {
    recordId = "5008Z00001zrMEPQA2";
    objectName = CASE_OBJECT;
    fields = {
        account: ACCOUNT_FIELD,
        contact: CONTACT_FIELD,
        subject: SUBJECT_FIELD,
        description: DESC_FIELD,
        priority: PRIORITY_FIELD,
        origin: ORIGIN_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "Case record has been updated successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }
}