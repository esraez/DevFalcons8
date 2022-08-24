@isTest
public class DmlDemo3Test {
    @isTest
    public static void testUpdateMultiple() {
        //1.Prepare DATA(more than 200)
        list<account> listAccount = new list<account>();
        for (Integer i = 0; i < 200; i++) {
            account acc = new account();
            acc.name = 'SoftInnovas 15Aug v'+i;
            acc.AccountNumber = 'Accis-'+i;
            acc.Active__c = 'Yes';
            listAccount.add(acc);
        }
 
        system.debug('size of list = ' + listAccount.size());
        if (!listAccount.isEmpty()) {
            insert listAccount;
        }
        //2.Call method
        DmlDemo3.dmlMultipleRecordUpdate_right();
        //3.verify using asserts
        //fetch accounts via soql
        list<account> accounts = [SELECT id,name FROM ACCOUNT];
        system.assert(accounts[0].Name.contains('via B.0'));
    }
}
