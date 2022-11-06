public with sharing class AccountInvocable {
    @InvocableMethod(label = 'Close Related Opportunities'
    description = 'Closes all the related opportunities of the given accounts'
    category = 'Account')
    public static void closeOpportunities(List<Id> accountIds) {
        //get all the open related opportunities
        List<Opportunity> opps = [SELECT Id, StageName 
                                    FROM Opportunity 
                                    WHERE AccountId IN :accountIds
                                    AND StageName NOT IN ('Closed Won', 'Closed Lost')
                                    WITH SECURITY_ENFORCED];
        
        //iterate over the records and populate stage name
        for(Opportunity opp : opps) {
            opp.StageName = 'Closed Lost';
        }

        //hit update
        try {
            update opps;
        } catch(Exception ex) {
            System.debug(ex.getMessage());
        }
    }
}