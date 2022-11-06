import { LightningElement, wire } from 'lwc';
import getAccountsByIndustry from '@salesforce/apex/accountController.getAccountsByIndustry';

const COLUMNS = [  
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class WiredApex2 extends LightningElement {
    accounts;
    industryType="Biotechnology";  
    columns= COLUMNS;

    @wire(getAccountsByIndustry, {industry: '$industryType'})
    accountsHandler({data,error}){
        if(data){
            this.accounts = data;
        }
        if(error){
            console.error(error);
        }
    }
    get total(){
        if(this.accounts){
            return this.accounts.length;
        }else{
            return 0;
        }
       
    }
}