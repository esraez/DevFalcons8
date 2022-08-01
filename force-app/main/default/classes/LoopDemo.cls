public class LoopDemo {
    public void print_int_while() {
        Integer count = 1;
        while(count <=25){
            system.debug(count);
            count++;
        }
    }
    public void print_N_numbers(integer n){
        //for initiliazing  condition   increment
        for( integer i=0;   i<n;    i++ ){
            //print 'i'
            system.debug(i);
        }
    }
    public void print_N_Odd_numbers(integer startInt, integer endInt){
        //not accessible
        integer methodInt = 1;
        //here methodInt is accesible
        for(Integer i=startInt;i<=endInt;i++){
            integer forInt =11;
            integer modI = math.mod(i,2);
            if(modI ==1) {system.debug(i);}
        }
        //system.debug(forInt) Not Allowed here. Forint not accesible outside of for loop (out of scope)
    }
}
