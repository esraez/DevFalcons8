@isTest
public class InsertAccountContactTest {
    @isTest
    private static void insertAccContTest() {
        InsertAccountContact.InsertAccCont('test acc name','cnt last name');
        //SOQL
        list<Account> acc = [SELECT id, name FROM ACCOUNT WHERE name = 'test acc name']; // we should get 1
        //first assertions, should return 1 account because this query will get only 1 account that was inserted in the test environment
        system.assert(acc.size() ==1); 
        list<Contact> cont = [SELECT id, lastname,accountId FROM CONTACT WHERE lastname = 'cnt last name'];//we should get 1
        //second assertion, should return 1 contact related to the inserted account
        system.assert(cont.size() ==1); 
                            //id of account 1 acc[0].id (expected), (actual), get the accountid of contact of account 1, cont[0].accountid
        system.assertEquals(acc[0].id, cont[0].AccountId);

    }
}
