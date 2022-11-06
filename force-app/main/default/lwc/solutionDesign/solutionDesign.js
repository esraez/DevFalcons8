import { LightningElement } from 'lwc';

export default class SolutionDesign extends LightningElement {
    name='Esra';
    role='Salesforce Developer'
    getName(event){
        this.name = event.target.value; 
        }
       

        get options() {
            return [ //array
                { label: 'Salesforce Admin', value: 'Salesforce Admin' },
                { label: 'Salesforce Developer', value: 'Salesforce Developer' },
                { label: 'Salesforce Architect', value: 'Salesforce Architect' },
            ];
        }
    handleChange(event){
        this.role = event.target.value;
    }
    }
