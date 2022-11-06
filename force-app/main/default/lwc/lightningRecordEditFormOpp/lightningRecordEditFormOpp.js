import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';

export default class LightningRecordEditFormOpp extends LightningElement {
    recordId = "0068Z00001XZiBWQA1";
    objectName =OPP_OBJECT;
    fields = {
        name: NAME_FIELD,
        type: TYPE_FIELD,
        stage: STAGE_FIELD,
        account: ACCOUNT_FIELD,
        closeDate: CLOSEDATE_FIELD,
        amount: AMOUNT_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success!!",
            message: "Case record has been updated successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }

    errorHandler() {
        const errorToast = new ShowToastEvent({
            title: "Error!!",
            message: "Edit was not successfull.",
            variant: "error",
            mode:"sticky"
        });
        this.dispatchEvent(errorToast);
    }
}