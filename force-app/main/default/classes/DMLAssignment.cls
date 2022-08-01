public with sharing class DMLAssignment {
    public static void DMLAccount() {
        Account acc = new account();
        acc.Name = 'Testdata';
        insert acc;
    }
    public static void SalesforcePro(){
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Insert Records';
        sp.Status__c = 'New';
        insert sp;
    }

}
