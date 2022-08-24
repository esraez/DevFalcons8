@isTest
public class DmlDemoTest {
    @isTest
    public static void testInsertDML1(){
        //call method, create data
        DmlDemo.dmlInsert_stndObj();
        //to verify if method created records(dml) in test, assert in Soql
        // how many records ,1
        list<account> checkAcc = [SELECT id,name FROM ACCOUNT]; 
        system.assertEquals(1,checkAcc.size());
        system.assertEquals('SoftInnovas', checkAcc[0].Name);
    }
  
}
