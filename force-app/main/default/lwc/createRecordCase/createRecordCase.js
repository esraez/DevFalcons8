import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecordCase extends LightningElement {
    formdata={};
    /**
     * 
     *target is to prepare an object(formdata) with the data
     formdata={
        FirstName:"Esra",
        LastName:"Erkol",
        Title:"Salesforce Developer",
        Email: "test@test.com"
     } 
     */
    changeHandler(event){
        const {name,value} = event.target;
        //const name = event.target.name;
        //const value = event.target.value;
        this.formdata[name] = value; //puts the value to the formdata object
    }
    
    saveContact(){
        const recordInput = {
            apiName:CONTACT_OBJECT.objectApiName,
            fields:this.formdata
        };

    createRecord(recordInput)
        .then(result=>{
            console.log(result);
            const successToast = new ShowToastEvent({
                title:"Success",
                message:"Contact has been saved successfully!",
                variant:"success"
            });
            this.dispatchEvent(successToast);
            //get the contact form and reset it, clear data in HTML
            this.template.querySelector('form.contactform').reset();
            this.formdata ={}; //clear the data from formdata object, clear data in JS
        })
        .catch(error =>{
            console.error(error);
         })
    }
}