@RestResource(urlMapping='/Contact/*')
global with sharing class ContactManager {
    @HttpGet
    global static Contact getContact() {
        //https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Contact/0038Z00002wEo0cQAC
        RestRequest request = RestContext.request;
        String requestUrl = request.requestURI;
        Integer lastIndex = requestUrl.lastIndexOf('/');
        Id contactId = requestUrl.subString(lastIndex+1);
        Contact con = [SELECT FirstName, LastName, Title, Email, Department FROM CONTACT WHERE Id = :contactId LIMIT 1];
        return con;
    }
    @HttpPost
    global static Id createContact(String FirstName, String LastName, String Title, String Email, String Department){
        contact con = new Contact();
        con.FirstName = FirstName;
        con.LastName = LastName;
        con.Title = Title;
        con.Email = Email;
        con.Department = Department;
        insert con;
        return con.Id;

    }
    @HttpDelete
    global static String deleteContact() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id contactId = uri.subString(lastIndex+1);
        Contact con = [SELECT Id FROM CONTACT where Id = :contactId LIMIT 1];
        delete con;
        return 'Contact has been deleted successfully!';
    }
    
    @HttpPut
    global static Id upsertContact(string Id, string FirstName,string LastName, string Title, string Email, string Department){
        contact con = new contact();
        con.Id = id;
        con.FirstName = FirstName;
        con.LastName = LastName; //cs.put(cs, sobject)
        con.Title = Title;
        con.Email = Email;
        con.Department= Department;
        upsert con;
        return con.Id;
    }
    @HttpPatch
    global static Contact updateContact(){
        RestRequest request = RestContext.request;
         //requestBody returns a blob, to convert blob into a string, use toString()
        String jsonString = request.requestBody.toString();
         //deserializeUntyped converts JSON to map<id,sobject>
        Map<String, Object> contactInfo = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug(contactInfo);
        Contact con = new Contact();
        for(String key : contactInfo.keySet()) {
            if(key!= 'attributes'){
                con.put(key, contactInfo.get(key));
            }
            
        }
        update con;
        return con;
}
}
    
   
