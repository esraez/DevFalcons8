import { LightningElement } from 'lwc';

export default class LightningInputsCalculator extends LightningElement {
    num1;
    num2;
    sum;

    
       
    handleChange(event){
      if(event.target.name=="num1"){
        this.num1= event.target.value;
      } else{
        this.num2 = event.target.value;
      if(this.num1== undefined){
         this.num1=0;
      }
      if(this.num2 ==undefined)
        this.num2 ==0;
         
      
     
      }
      this.sum =Number(this.num1) + Number(this.num2);
    }
}
    

    
