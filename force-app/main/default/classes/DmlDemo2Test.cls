@isTest
public  class DmlDemo2Test {
    @isTest
    public static void DmlInsertRelatedTest() {
        //prepare Data, insert 1 record(dml) in test environment
        Account acc = new account();
        acc.Name = 'SoftInnovas Inc.';
        insert acc;
        //call method
        DmlDemo2.dmlInsertRelatedDemo_1();
        //assert
        list<contact> contacts = [SELECT id, accountId,name FROM CONTACT];
        system.assertEquals(1, contacts.size());
        system.assertEquals(acc.id, contacts[0].AccountId); //checking if contacts account is acc
    }
}
