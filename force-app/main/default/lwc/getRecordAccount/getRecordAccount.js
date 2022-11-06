import { LightningElement, wire } from 'lwc';


import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD,TYPE_FIELD,INDUSTRY_FIELD,REVENUE_FIELD,RATING_FIELD,PHONE_FIELD];

export default class GetRecordAccount extends LightningElement {
    recordId ="0018Z00002f8KBPQA2";
    account;

    @wire(getRecord, {recordId:'$recordId', fields: FIELDS})
    recordHandler({data,error}){
        if(data){
            console.log(data);
            this.account =data;
        }
        if(error){
            console.log(error);
        }
    }
    get revenue(){
        return getFieldDisplayValue(this.account, REVENUE_FIELD);
    }
    get name(){
        return getFieldValue(this.account, NAME_FIELD);
    }
    get industry(){
        return getFieldDisplayValue(this.account, INDUSTRY_FIELD);
    }
    get rating(){
        return getFieldDisplayValue(this.account, RATING_FIELD);
    }
    get phone(){
        return getFieldValue(this.account, PHONE_FIELD);
    }
    get type(){
        return getFieldDisplayValue(this.account, TYPE_FIELD);
    }
}