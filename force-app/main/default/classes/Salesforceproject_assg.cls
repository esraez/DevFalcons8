public class Salesforceproject_assg {
    public static void salesforceprojectinsert() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test Task';
        insert sp;
        system.debug('New Salesforce Project: '+ sp);
    }
    public static void salesforceprojectupdate(){
        Salesforce_Project__c sp_updated = [SELECT Project_Name__c FROM Salesforce_Project__c WHERE Project_Name__c = 'Test Task' limit 1];
        sp_updated.Project_Name__c = 'Testing Task';
        update sp_updated;
        system.debug('Updated Salesforce Project: '+ sp_updated);
    }
}
