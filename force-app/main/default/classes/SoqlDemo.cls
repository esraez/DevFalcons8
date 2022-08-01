public  class SoqlDemo {
    public static void accountSOQL_1() {
        //SOQL query returns LIST<sObject>      [SOQL query]
        List<Account> listAcc = [Select Id, name, Active__c from Account where name like '%A%'];
        system.debug('listAcc= '+ listAcc);
        system.debug('size of listAcc= '+ listAcc.size());
        //SOQL can return only Sobject if it is returning ONLY 1 RECORD
        //so it can be assigned to account instead of list<account>
        Account acc = [Select name, phone,AccountNumber, createddate from Account order by CreatedDate DESC limit 1];
        system.debug('Latest Account '+ acc);
        //store name in a variable
        string accName = acc.Name;
        string accPhone = acc.Phone;
        system.debug( 'accName= '+ accName + ',phone is' +' '+ accPhone);
        system.debug('account number is '+ acc.AccountNumber);
    }
}
