@isTest
public with sharing class CaseManagerTest {
    @TestSetup
    static void makedata() {
        //create an account, a contact and 4 cases
        Account acc = new Account(Name='Test Account');
        insert acc;
        Contact con = new Contact(FirstName='Integration', LastName='Test', Email='test@test.com');
        insert con;

        List<Case> cases = new List<Case>();
        for(Integer i=0; i<4; i++) {
            Case cs = new Case();
            cs.AccountId = acc.Id;
            cs.ContactId = con.Id;
            cs.Subject = 'Problem with the Wi-Fi Routor ' + i;
            cs.Description = 'There was a problem with my Wi-Fi routor since morning. I do not get data';
            cs.Origin = 'Email';
            cs.Priority = 'Medium';
            cases.add(cs);
        }
        insert cases;
    }

    @isTest
    private static void getCaseTest() {
        Test.startTest();
        //prepare request uri
        Case cs = [SELECT Id, CaseNumber, Subject, Description, Priority, Origin FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm(); //Base URL
        String uri = homeUrl + '/services/apexrest/Case/' + cs.Id;

        //prepare restrequest and context
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        request.httpMethod = 'GET';
        RestContext.request = request;

        //test the method and perform asserts
        Case objCase = CaseManager.getCase();
        System.assert(objCase.Id != null);
        System.assertEquals(objCase.Subject, cs.Subject);
        System.assertEquals(objCase.CaseNumber, cs.CaseNumber);
        Test.stopTest();
    }
    @isTest
    private static void createCaseTest(){
        Test.startTest();
        Id caseId = CaseManager.createCase('Test subject', 'Web', 'High', 'Test Desc');
        system.assert(caseId !=null);
        Test.stopTest();
        
    }
    @isTest
    private static void deleteCaseTest() {
        Test.startTest();
        //prepare request uri
        Case cs = [SELECT Id, CaseNumber, Subject, Description, Priority, Origin FROM Case LIMIT 1];
        String homeUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
        String uri = homeUrl + '/services/apexrest/Case/' + cs.Id;
        
        //prepare RestRequest & Context
        RestRequest request = new RestRequest();
        request.requestURI = uri;
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        
        //Test deleteCase method and perform asserts
        String actual = CaseManager.deleteCase();
        System.assertEquals('Case has been deleted successfully!', actual);
        Test.stopTest();
    }
    @isTest
    private static void upsertCaseTest1(){
        Test.startTest();
        //do not send case id.observe if a case is getting created
        Id caseId = CaseManager.upsertCase(null, 'subject','High', 'web', 'description');
        system.assert(caseId!=null);
        Test.stopTest();
        
    }
    @isTest
    private static void upsertCaseTest2(){
        Test.startTest();
        Case cs = [SELECT Id, CaseNumber FROM CASE limit 1];
        Id caseId = CaseManager.upsertCase(cs.Id, 'subject','Medium', 'Email', 'description');
        system.assertEquals(cs.Id, caseId);
        Test.stopTest();
    }
    @isTest
    private static void updateCaseTest(){
        Test.startTest();
        //get case record and update reason
        case cs =[SELECT Id, subject,Description,reason FROM CASE limit 1];
        cs.Reason ='Installation';
        //prepare json string 
        String jsonString = JSON.serialize(cs);
        //prepare RestRequest and Context
        RestRequest request = new RestRequest();
        //convert json string into blob and set it to requestbody, because requestbody type is blob
        request.requestBody = Blob.valueOf(jsonString);
        request.httpMethod ='PATCH';
        RestContext.request = request;
        //tst the method and perform asserts
        Case updatedCase = CaseManager.updateCase();
        system.assertEquals('Installation', updatedCase.Reason);
        Test.stopTest();
        
    }
}