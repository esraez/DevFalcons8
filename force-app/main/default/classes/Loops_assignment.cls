public class Loops_assignment {
    public Loops_assignment(){

    }
    public integer  factorialvalue = 1;
    public integer Forloops(integer n){
       for(integer i=1; i<=n; i++){
        factorialvalue = factorialvalue * i;
       }
       return factorialvalue;
    }
    public integer dowhile(integer n){
        integer factorialvalue = 1;
        integer k = 1;
        while( k<=n){
            factorialvalue = factorialvalue * k; 
            k++;
        }
        return factorialvalue;
    }
}
