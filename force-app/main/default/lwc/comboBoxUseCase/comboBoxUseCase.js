import { LightningElement } from 'lwc';

export default class ComboBoxUseCase extends LightningElement {
    value = 'inProgress';

    get options() {
        return [ //array
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }

    handleChange(event) {
        console.log(event);
        this.value = event.detail.value;
    }
}