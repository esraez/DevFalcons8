import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showData=true;
    details ={
        fullName: "Esra",
        place: "Eugene"
    };
    clickHandler(){
        this.showData =!this.showData;
    }
}