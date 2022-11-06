@RestResource(urlMapping='/Case/*')
global with sharing class CaseManager {
    /* https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case/* */

    /* https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case/{caseId} */

    @HttpGet
    global static Case getCase() {
        //https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case/5008Z00001zrz4MQAQ
        RestRequest request = RestContext.request;
        String requestUrl = request.requestURI;
        Integer lastIndex = requestUrl.lastIndexOf('/');
        Id caseId = requestUrl.subString(lastIndex+1);
        Case cs = [SELECT CaseNumber, Subject, Priority, Origin, Description FROM Case WHERE Id = :caseId LIMIT 1];
        return cs;
    }
    //https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case
    @HttpPost
    global static Id createCase(String subject, String priority, String origin, String description){
        case cs = new Case();
        cs.Subject = subject;
        cs.Priority = priority;
        cs.Origin = origin;
        cs.Description = description;
        insert cs;
        return cs.Id;

    }
    /* https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case{caseId} */
    @HttpDelete
    global static String deleteCase() {
        RestRequest request = RestContext.request;
        String uri = request.requestURI;
        Integer lastIndex = uri.lastIndexOf('/');
        Id caseId = uri.subString(lastIndex+1);
        Case cs = [SELECT Id FROM Case where Id = :caseId LIMIT 1];
        delete cs;
        return 'Case has been deleted successfully!';
    } 
    //Upsert case, update if the case exists or create a new one if it doesn't exist(case id is null)
    @HttpPut
    global static Id upsertCase(string id, string subject,string priority, string origin, string description){
        case cs = new case();
        cs.Id = id;
        cs.Subject = subject;
        cs.Priority = priority; //cs.put(cs, sobject)
        cs.Origin = origin;
        cs.Description = description;
        upsert cs;
        return cs.Id;
    }

    @HttpPatch
    global static Case updateCase(){
        RestRequest request = RestContext.request;
         //requestBody returns a blob, to convert blob into a string, use toString()
        String jsonString = request.requestBody.toString();
         //deserializeUntyped converts JSON to map<id,sobject>
        Map<String, Object> caseInfo = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        System.debug(caseInfo);
        Case cs = new Case();
        for(String key : caseInfo.keySet()) {
            if(key!= 'attributes'){
                cs.put(key, caseInfo.get(key));
            }
            
        }
        update cs;
        return cs;
}
}




/* https://softinnovas-14f-dev-ed.my.salesforce.com/services/apexrest/Case/5008Z00001zrMGaQAM

//Approach 1
split('/') => ['https:', '', 'falcons8-dev-ed.my.salesforce.com', 'services', 'apexrest', 'Case', '5005h00000W7GUaAAN']
                0         1   2                                    3           4           5       6
                size = 7
                get the element from size-1 = 6 (7n)

//Approach 2
lastIndexOf('/') = 51 (1n)
51+1 = 52
requestUrl.subString(52) = 5005h00000W7GUaAAN
*/
