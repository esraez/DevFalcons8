@isTest
public  class StringConcateDemoTest {
    @isTest
    private static void concateTest(){
        string r = StringConcateDemo.ConcateAndUpperCase('Test', 'Method');
        system.debug(r);
        system.assertEquals('TEST, METHOD', r);
    }
  
}
