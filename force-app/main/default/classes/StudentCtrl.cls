public with sharing class StudentCtrl {
    @AuraEnabled(cacheable=true)
    public static list<Student__c> searchStudentbyPostalCodes(String searchPostal){
        searchPostal = '%' + searchPostal + '%';
        return [SELECT Student_Name__c,Class__c,Mobile__c,Email__c,Postal_Code__c 
        FROM Student__c 
        WHERE Postal_Code__c LIKE :searchPostal
        WITH SECURITY_ENFORCED];
    }
}
