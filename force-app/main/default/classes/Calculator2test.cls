@isTest
public  class Calculator2test {
    @isTest
    public static void testMethod1() {
        //we test our actual method
        string returnMsg = Calculator2.printAndReturnMessage('this is from test');
        system.assertEquals('this is from test...OK cool', returnMsg);
    }
    @isTest
    public static void testMethod2(){
        integer sum1 = Calculator2.add(15,150);
        //to verify we do asserts
        system.assertEquals(165,sum1);
    }
    @isTest
    public static void testMethod3(){
        integer sum2 = Calculator2.add(20,15,150);
        system.assertEquals(185, sum2);
    }
}
