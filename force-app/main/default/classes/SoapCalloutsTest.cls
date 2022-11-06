@isTest
public with sharing class SoapCalloutsTest {
   @isTest
   private static void parkServiceTest(){
        ParksServicesMock mock = new ParksServicesMock();
        Test.setMock(WebServiceMock.class, mock);
        String country = 'Turkey';
        String[] parks = SoapCallouts.getParksByCountry(country);
        system.assert(parks.size() !=0);
   }
   @isTest
   public static void getSumTest() {
       CalcServicesDoAddMock mock = new CalcServicesDoAddMock();
       Test.setMock(WebServiceMock.class, mock);
       Double output = SoapCallouts.getSum(5, 5);
       System.assertEquals(output, 10);
   }
   @isTest
   public static void getMultiplyTest() {
       CalcServicesDoAddMock mock = new CalcServicesDoAddMock();
       Test.setMock(WebServiceMock.class, mock);
       Double output = SoapCallouts.getMultiply(5, 5);
       System.assertEquals(output, 25);
   }
   @isTest
   public static void getSubtractTest() {
       CalcServicesDoAddMock mock = new CalcServicesDoAddMock();
       Test.setMock(WebServiceMock.class, mock);
       Double output = SoapCallouts.getSubtract(5, 5);
       System.assertEquals(output, 0);
   }
   @isTest
   public static void getDivideTest() {
       CalcServicesDoAddMock mock = new CalcServicesDoAddMock();
       Test.setMock(WebServiceMock.class, mock);
       Double output = SoapCallouts.getDivide(5, 5);
       System.assertEquals(output, 1);
   }
}
