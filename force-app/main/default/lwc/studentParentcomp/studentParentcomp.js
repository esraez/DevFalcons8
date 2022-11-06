import searchStudentbyPostalCodes from '@salesforce/apex/StudentCtrl.searchStudentbyPostalCodes';
import { LightningElement } from 'lwc';

const COLUMNS =[
    {label:"Student Name", fieldname:"Student_Name__c", type: "text"},
    {label:"Class", fieldname:"Class__c", type: "text"},
    {label:"Mobile", fieldname:"Mobile__c", type: "phone"},
    {label:"Email", fieldname:"	Email__c", type: "email"},
    {label:"Postal_Code", fieldname:"Postal_Code__c", type: "text"},

];
export default class StudentParentcomp extends LightningElement {
    searchWord;
    students;
    error;
    columns = COLUMNS;

    searchHandler(event) {
        this.searchWord = event.target.value;

        if(this.searchWord.length > 0) {
            searchStudentbyPostalCodes({searchPostal: this.searchWord})
                .then(result => {
                    if(result.length == 0) {
                        this.error = "There are no matching students found. Try another postal code!";
                        this.students = undefined;
                    } else {
                        this.students = result;
                        this.error = undefined;
                    }
                })
                .catch(error => {
                    this.error = error;
                    this.students = undefined;
                })
        }
    }
}