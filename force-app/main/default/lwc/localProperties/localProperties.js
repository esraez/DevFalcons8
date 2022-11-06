import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined 
    fullName ="Salesforce Developer"; //string 
    age = 30; //number
    location={    //object
        city: "Houston",
        country: "united States",
        postalCode: "77031"
    };
    fruits =["Banana", "Apple","Grape","Dragon","Mango"]//array
}