@isTest
public class AccountQueueableTest {
    @isTest
    public static void testQueueable() {
        list<account> listAcc = new list<account>();
        for(integer i=0;i<500;i++){
            account a3 = new account();
            a3.name = 'PI Test';
            a3.Industry = 'Banking';
            a3.type = 'Customer - Direct';
            listAcc.add(a3);
        }
        insert listAcc;
        AccountsQueueableExample aq = new AccountsQueueableExample(listAcc);
        Test.startTest();
        ID jobid= system.enqueueJob(aq);
        Test.stopTest();
        list<account> accounts = [SELECT name FROM ACCOUNT WHERE name LIKE '%SI%'];
        system.assertEquals(500, accounts.size());
    }
      
}
