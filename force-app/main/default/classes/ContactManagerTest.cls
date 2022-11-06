@isTest
public with sharing class ContactManagerTest {
        @TestSetup
        static void makedata() {
            //create an account, a contact and 4 cases
            Account acc = new Account(Name='Test Account');
            insert acc;
            Contact cont = new Contact(FirstName='Integration', LastName='Test', Email='test@test.com');
            insert cont;
    
            List<Contact> contacts = new List<Contact>();
            for(Integer i=0; i<4; i++) {
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.FirstName = 'Amy' + i;
                con.LastName = 'Tester';
                con.Email = 'test@tt.com';
                con.Title= 'Developer';
                con.Department = 'IT';
                contacts.add(con);
            }
            insert contacts;
        }

@isTest
    private static void getContactTest() {
        Test.startTest();
        //prepare request uri
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM CONTACT LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base URL
        String uri = homeUrl + '/services/apexrest/Contact/' + con.Id;

        //prepare restrequest and context
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        request.httpMethod = 'GET';
        RestContext.request = request;

        //test the method and perform asserts
        Contact objContact = ContactManager.getContact();
        System.assert(objContact.Id != null);
        System.assertEquals(objContact.Title, con.Title);
        Test.stopTest();
    }
    @isTest
    private static void createContactTest(){
        Test.startTest();
        Id contactId = ContactManager.createContact('Seyda', 'Gonzalez', 'Developer', 'test@tt.com','Salesforce Developer');
        system.assert(contactId !=null);
        Test.stopTest();
        
    }
    @isTest
    private static void deleteContactTest() {
        Test.startTest();
        //prepare request uri
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM CONTACT LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        String uri = homeUrl + '/services/apexrest/Case/' + con.Id;
        
        //prepare RestRequest & Context
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        
        //Test deleteCase method and perform asserts
        String actual = ContactManager.deleteContact();
        System.assertEquals('Contact has been deleted successfully!', actual);
        Test.stopTest();
    }

    @isTest
    private static void updateContactTest(){
        Test.startTest();
        //get record and update reason
        Contact con = [SELECT Id, FirstName, LastName, Email, Title, Department FROM CONTACT LIMIT 1];
        con.Department ='Human Resources';
        //prepare json string 
        String jsonString = JSON.serialize(con);
        //prepare RestRequest and Context
        RestRequest request = new RestRequest();
        //convert json string into blob and set it to requestbody, because requestbody type is blob
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod ='PATCH';
        RestContext.request = request;
        //tst the method and perform asserts
        Contact updatedContact = ContactManager.updateContact();
        system.assertEquals('Human Resources', updatedContact.Department);
        Test.stopTest();
        
    }
    @isTest
    private static void upsertContactTest1(){
        Test.startTest();
        //do not send case id.observe if a case is getting created
        Id contactId = ContactManager.upsertContact(null, 'Murat', 'Test', 'Manager', 'e@email.com', 'IT');
        system.assert(contactId!=null);
        Test.stopTest();
        
    }
    @isTest
    private static void upsertContactTest2(){
        Test.startTest();
        Contact con = [SELECT Id, FirstName FROM CONTACT limit 1];
        Id contactId = ContactManager.upsertContact(con.Id,'Murat', 'Test', 'Manager', 'e@email.com', 'Human Resources');
        system.assertEquals(con.Id, contactId);
        Test.stopTest();
    }

}