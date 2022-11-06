import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import TITLE_FIELD from '@salesforce/schema/Contact.Title'
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import Mobile_FIELD from '@salesforce/schema/Contact.MobilePhone';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';

const FIELDS= [NAME_FIELD, TITLE_FIELD, EMAIL_FIELD, Mobile_FIELD,DEPARTMENT_FIELD];

export default class GetContactRecord extends LightningElement {
    recordId="0038Z00002tFhEJQA0";
    cont;

@wire(getRecord,{recordId: '$recordId', fields:FIELDS })
     recordHandler({data,error}){
        if(data){
            console.log(data);
            this.cont =data;
        }
        if(error){
            console.log(error);
        }
       
     }
     get name(){
        return getFieldValue(this.cont, NAME_FIELD);
    }
    get title(){
        return getFieldValue(this.cont, TITLE_FIELD);
    }
    get email(){
        return getFieldValue(this.cont, EMAIL_FIELD);
    }
    get mobile(){
        return getFieldValue(this.cont, Mobile_FIELD);
    }
    get department(){
        return getFieldValue(this.cont, DEPARTMENT_FIELD);
    }
}