import { LightningElement,wire } from 'lwc';
import ShowToastEvent from 'lightning/platformShowToastEvent'



import NAME_FIELD from '@salesforce/schema/Blog__c.Name';
import TOPIC_FIELD from '@salesforce/schema/Blog__c.Topic__c';
import AUTHOR_FIELD from '@salesforce/schema/Blog__c.Author__c';
import TITLE_FIELD from '@salesforce/schema/Blog__c.Title__c';
import BODY_FIELD from '@salesforce/schema/Blog__c.Body__c';
import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD, TOPIC_FIELD, AUTHOR_FIELD,TITLE_FIELD];

export default class UpdateRecordBlog extends LightningElement {
    recordId = "a078Z00000s7g5kQAA";
    blog;
    formdata= {};
    @wire(getRecord, {recordId:'$recordId', fields: FIELDS})
    recordHandler({data,error}){
        if(data){
            this.blog=data;
        }
        if(error){
            console.error(error);
        }
    }
    
    get name(){
        return getFieldValue(this.blog,NAME_FIELD);
    }
    get author(){
        return getFieldValue(this.blog,AUTHOR_FIELD);

    }
    get topic(){
        return getFieldValue(this.blog,TOPIC_FIELD);
    }
    get title(){
        return getFieldValue(this.blog,TITLE_FIELD);
    }
    get body(){
        return getFieldValue(this.blog, BODY_FIELD);

    }
    formdata={};

    changeHandler(event){
        const{name,value}= event.target;
        this.formdata[name] = value;
    }
    updateBlog(){
        this.formdata['Id'] = this.recordId;
        const recordInput={
            fields: this.formdata
        };

        updateRecord(recordInput)
            .then(result=>{
                console.log(result);
                const successToast = new ShowToastEvent({
                    title:"Success",
                    message: "Your blog has been updated successfully",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
            })
            .catch(error =>{
                console.error(error);
            })
    }

}
