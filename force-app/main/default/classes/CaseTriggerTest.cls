@isTest
public with sharing class CaseTriggerTest {
    @isTest
    private static void createCaseTest() {
        contact cnt = new contact();
        cnt.lastname = 'test LN';
        insert cnt;
        list<case> listCase = new list<case>();
        for (Integer i = 0; i < 1000; i++) {
            case c = new case();
            c.status ='New';
            c.origin = 'Phone';
            c.subject = 'case test test case'+ i;
            c.ContactId= cnt.id;
            listCase.add(c);
        }
        Test.startTest();
        //calling the trigger
        insert listCase;
        Test.stopTest();
        //4.assertion
        integer casesCount =[SELECT count() FROM CASE];
        system.assert(casesCount ==1000);
        list<task> listTasks = [SELECT id, subject, whatid, whoid, activitydate FROM TASK];
        for (task t : listTasks) {
            system.assertEquals('Email', t.subject);
            system.assertEquals('Normal', t.Priority);
            system.assertEquals(cnt.id, t.WhoId);
        }
        

    }
}

