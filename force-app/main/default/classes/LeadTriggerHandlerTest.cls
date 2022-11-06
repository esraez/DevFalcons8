@isTest
public with sharing class LeadTriggerHandlerTest {
    @TestSetup
    static void makeDataLead(){
        list<lead> listLead = new list<lead>();
        for (Integer i = 0; i < 1000; i++) {
            lead l = new lead();
            l.LastName= 'weekday'+i;
            l.company = 'calend';
            listLead.add(l);
        }
        insert listLead;
    }


    @isTest
    private static void testUpdateDates1() {
        list<lead> listLead = new list<lead>();
        for (Integer i = 0; i < 100; i++) {
            lead l = new lead();
            l.LastName= 'weekday1' +i;
            l.company = 'calend1';
            l.status = 'Open - Not Contacted';
            listLead.add(l);
        }
        test.startTest();
        insert listLead;
        test.stopTest();

        list<lead> allLeads =[SELECT id, lastname, created_date__c, Closed_Won_Date__c FROM LEAD];
        for(lead l: allLeads){
            system.assert(l.Created_Date__c != null);
            system.assertNotEquals(datetime.now(), Closed_Won_Date__c);
        }
    }
    @isTest
    private static void testUpdateDates2() {
        list<lead> listLead =[SELECT id, lastname, company, status FROM LEAD];
        for(lead l: listLead){
            l.status = 'Working -Contacted';
        }
        update listLead;

      
        list<lead> allLeads =[SELECT id, lastname, Contact_Date__c , Closed_Lost_Date__c FROM LEAD];
        for(lead l: allLeads){
            system.assert(l.Contact_Date__c  != null);
            system.assertNotEquals(datetime.now(), Closed_Lost_Date__c);
        }
    }



}
