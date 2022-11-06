import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    cities=["Houston","Fawley", "Miami","Istanbul","Orlando"];
    clickHandler(){
        //querySelector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = 'green';
        h1elem.style.border = '2px solid red';
        h1elem.style.backgroundColor ='yellow';
        //querySelectorAll p
        const pelem = this.template.querySelector('p');
        console.log(pelem.innerText);
        pelem.style.color = 'pink';
        pelem.style.border = '2px solid blue';
        pelem.style.backgroundColor ='violet';

        //querySelectorAll demo
        const divelem = this.template.querySelectorAll('div.child');
        divelem.forEach(item =>{
            console.log(item.innerText);
            item.style.color="white";
            item.style.backgroundColor ="pink";
            item.setAttribute("class","slds-align_absolute-center");
        })
    }
}