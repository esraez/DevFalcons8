import searchContacts from '@salesforce/apex/contactCtrl.searchContacts';
import { LightningElement } from 'lwc';

export default class ImperativeApex2 extends LightningElement {
    contacts;
    error;
    keyword;

    searchHandler(event){
        this.keyword = event.target.value; //keyword stores whatever the user types in the input box
        if(this.keyword.length>0){
            searchContacts({ searchKey: this.keyword })
            .then(result =>{
                this.contacts = result;
                this.error = undefined;
            })
            .catch(error =>{
                this.error = error;
                this.contacts = undefined;
            })
        }else {
            this.contacts = undefined;
            this.error ="Start inputting some keywords in order to find matching contacts.";
        }
      
    }
}