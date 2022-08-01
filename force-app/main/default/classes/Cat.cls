public class Cat {
    //this is constructor, has no return type and its name of the constructor is always the same as class name
    public string name='';
    public string color='';
    public Cat() {
        system.debug('constructor called');
    }
    //parameterized constructor
    public Cat(string nm,string clr){
        //this.name will refer to the class variable name
        this.name = nm;
        this.color = clr;
        sleeping();
    }
    public void sleeping(){
        system.debug(this.name + '  '+ 'is sleeping');
    }
}
