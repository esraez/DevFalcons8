import ThirdSicDesc from '@salesforce/schema/DandBCompany.ThirdSicDesc';
import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {
    showModal = false;
    message;

    clickHandler(){
        this.showModal = true;
    }

    modalHandler(event){
        this.showModal = false;
        console.log(event);
        this.message = event.detail;
    }
}