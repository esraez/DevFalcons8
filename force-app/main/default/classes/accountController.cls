public with sharing class accountController {
    @AuraEnabled(cacheable=true)
    public static list<Account> getTopAccounts() {
        return[SELECT Name, Type, Industry, AnnualRevenue
        FROM Account
        WHERE AnnualRevenue !=null
        WITH SECURITY_ENFORCED 
        ORDER BY AnnualRevenue DESC
        LIMIT 10];

    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccountsByIndustry(String industry){
        return [SELECT Name, Type, Industry, AnnualRevenue
        FROM Account
        WHERE Industry =:industry
        WITH SECURITY_ENFORCED
        LIMIT 10];
    
    }
}
