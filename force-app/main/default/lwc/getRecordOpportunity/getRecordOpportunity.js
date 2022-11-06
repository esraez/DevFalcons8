import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class GetRecordOpportunity extends LightningElement {
    oppRTId;
    stageOptions;
    typeOptions;
    oppName;
    selectedStage;
    selectedType;
    @wire(getPicklistValuesByRecordType, {objectApiName: OPPORTUNITY_OBJECT, recordTypeId: '$oppRTId'})
    picklistHandler({data, error}){
        if (data) {
            console.log(data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values;
        }
        if (error) {
            console.error(error);
        }
    }


    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    objectInfoHandler({data, error}){
        if (data) {
            this.oppRTId = data.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event){

        if (event.target.label === "Stage Name") {
           this.selectedStage = event.target.value; 
        }
        if (event.target.label === "Type") {
            this.selectedType = event.target.value; 
         }
         if (event.target.label === "Opportunity Name") {
            this.oppName = event.target.value; 
         }
    }
}