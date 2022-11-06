import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
export default class GetObjectInfoAccount extends LightningElement {
    defaultRtId ="012000000000000AAA";

    @wire(getObjectInfo,{objectApiName: ACCOUNT_OBJECT})
    objectInfoHandler({data,error}){
        if(data){
            console.log(data);
        }
        if(error){
            console.log(error);
        }
    }

}