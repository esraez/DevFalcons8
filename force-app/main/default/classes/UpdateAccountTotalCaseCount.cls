public with sharing class UpdateAccountTotalCaseCount {
    @invocableMethod
    public static void UpdateTotalCaseCount(list<Id> listAccountId) {
        list<AggregateResult> casesAGR = [SELECT count(Id) casesCount, accountId FROM CASE WHERE AccountId in:listAccountId GROUP BY AccountId];
        list<account> updateAccounts = new list<account>();
        system.debug('cases agr= '+ casesAGR);
        for(AggregateResult agr: casesAGR){
            system.debug('agr ='+agr);
            system.debug(' agr casesCount ='+ agr.get('casesCount'));
            system.debug(' agr accountId ='+ agr.get('accountId'));
            integer countOfCases = integer.valueOf(agr.get('casesCount'));
            Account acc = new account();
            acc.Id = string.valueof(agr.get('accountId'));
            acc.Total_Case_Count__c = countOfCases;
            updateAccounts.add(acc);
        }
            system.debug(' update account  ='+ updateAccounts);
            update updateAccounts;
    
    
    }
}
