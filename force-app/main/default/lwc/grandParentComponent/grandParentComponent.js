import { LightningElement } from 'lwc';

export default class GrandParentComponent extends LightningElement {
    showHandler(event){
        console.log("At parent component showHandler1.");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}