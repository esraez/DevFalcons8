public with sharing class DmlDemo3 {
    //update multiple accounts
    public static void dmlMultipleRecordUpdate_right() {
        //add all the accounts which we want to update in this list
        List< Account> updateAccounts = new list<Account>();
        //fetch all account
        List<Account> listAccount =[SELECT name FROM ACCOUNT];
        for (Account eachAccount : listAccount) {
            eachAccount.name += 'via B.0';
            updateAccounts.add(eachAccount);
            
        }
        if (!updateAccounts.isEmpty()){
            update updateAccounts;
        } else{
            system.debug('NO ACCOUNTS TO UPDATE');
        }
    }
}
