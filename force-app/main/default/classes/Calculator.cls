public class Calculator {
    public void printNewMessage(string msg) {
        system.debug(msg);
    }
    public void add (integer a, integer b){
        integer sum = a + b;
        system.debug(sum);
    }
    public string printAndReturnMessage(string msg){
        string outputstr= msg + '...OK Cool';
        return outputstr;
    }
}
