import { LightningElement } from 'lwc';
import LEAD_OBJECT from'@salesforce/schema/Lead';
import { createRecord } from 'lightning/uiRecordApi';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';


export default class CreateRecordLead extends LightningElement {
    formdata = {};

    changeHandler(event){
        const {name,value} = event.target;
        //const name = event.target.name;
        //const value = event.target.value;
        this.formdata[name] = value; //puts the value to the formdata object
    }
    
    saveLead(){
        const recordInput = {
            apiName:LEAD_OBJECT.objectApiName,
            fields:this.formdata
        };

    createRecord(recordInput)
        .then(result=>{
            console.log(result);
            const successToast = new ShowToastEvent({
                title:"Success",
                message:"Lead has been saved successfully!",
                variant:"success"
            });
            this.dispatchEvent(successToast);
            //get the contact form and reset it, clear data in HTML
            this.template.querySelector('form.leadform').reset();
            this.formdata ={}; //clear the data from formdata object, clear data in JS
        })
        .catch(error =>{
            console.error(error);
         })
    }

}
    

    
