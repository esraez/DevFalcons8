@isTest
public class CreateTaskforContactTest {
    @TestSetup
    static void makeContactsData(){
        //instead of preparing data inside every method, we use this test setup method for all the test methods inside the class
        list<contact> listContact = new list<contact>();
        for (Integer i = 0; i < 1100; i++) {
            contact c = new contact();
            c.lastname = 'testContact'+i;
            listContact.add(c);
        }
        insert listContact;
    }
    private static void testTaskCreate() {
        //1.Data preparation
        contact c = new contact();
        c.lastname = 'testContact';
        insert c;
        //2.1 start test
        Test.startTest();
        //3.call actual method
        CreateTaskforContact.CreateTasks('testContact');
        //2.2 stop test
        Test.stopTest();
        //4.assertions
        list<task> allTasks = [SELECT id, subject, whoid FROM TASK WHERE whoid = :c.id];
        system.assert(allTasks.size() == 1);
        system.assertNotEquals('call', allTasks[0].subject);
        system.assertEquals('Email', allTasks[0].subject);

    }
    @isTest
    private static void testTaskCreate2() {
        //1.No need because we are using testsetup, when we run test, it will automatically call on test setup method and create data
        //2.1 start test
        Test.startTest();

        //3.call actual method
        CreateTaskforContact.CreateTasks('testContact');
        //2.2 stop test
        Test.stopTest();
        //4.assertions
        list<task> allTasks = [SELECT id, subject, whoid FROM TASK];
        system.assert(allTasks.size() == 1100);
        for(task t: allTasks){
            system.assertNotEquals('call', allTasks[0].subject);
            system.assertEquals('Email', allTasks[0].subject);
        }

    }
    @isTest
    private static void testOppCreate2() {
        //DO A QUERY HERE TO GET THE listContact here. query will get all the contacts here from the test setup method
        list<contact> listContact = [SELECT id ,name, lastname FROM CONTACT];

       
        //2.1 start test
        Test.startTest();

        //3.call actual method
        CreateTaskforContact.createOpps(listContact);
        //2.2 stop test
        Test.stopTest();
        //4.assertions
        list<opportunity> allOpps = [SELECT id, name, contactid FROM OPPORTUNITY WHERE contactid = :listContact];
        system.assert(allOpps.size() == 1100);
      
    }
}
