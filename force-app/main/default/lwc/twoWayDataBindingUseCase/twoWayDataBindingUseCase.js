import { LightningElement } from 'lwc';

export default class TwoWayDataBindingUseCase extends LightningElement {
    name='Esra';
    
    handleChange(event){
        this.name = event.target.value;
    }
}