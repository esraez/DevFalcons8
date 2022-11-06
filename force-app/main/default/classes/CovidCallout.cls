public with sharing class CovidCallout {
    public static HttpResponse getCovidinfo(){
    //1.Prepare the http request
    HttpRequest request= new HttpRequest();
    //wrap the necessary info in it
    request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
    //get=retrieve data from url
    request.setMethod('GET');
    //2.prepare the internet
    Http http = new Http();
    //3.send the httpRequest over the internet to receive httpResponse back
    HttpResponse response = http.send(request);
    //4.process the httpResponse
    if(response.getStatusCode() == 200){
        string jsonstring = response.getBody();
        system.debug(jsonstring);
        //convert the json string into our product object wrapper class==> , then we typecast class into object format, list of product wrapper object
        list<CovidWrapper> CovidWrappers = (list<CovidWrapper>)JSon.deserialize(jsonString, list<CovidWrapper>.class);
        list<Covid_Info__c> covidinfo = [SELECT id, Name, Positive__c, Negative__c, Pending__c  FROM Covid_Info__c WHERE Received_Date__c = TODAY ];

        CovidWrapper covid = CovidWrappers[0];
        if(!covidinfo.isEmpty()){
            covidinfo[0].Name = string.valueof(covid.States);
            covidinfo[0].Negative__c= covid.negative;
            covidinfo[0].Positive__c= covid.positive;
            covidinfo[0].Pending__c = covid.pending;
            update covidinfo[0];
         } else { 
            Covid_Info__c covidobj = new Covid_Info__c();
            covidobj.Name = string.valueof(covid.States);
            covidobj.Negative__c= covid.negative;
            covidobj.Positive__c= covid.positive;
            covidobj.Pending__c = covid.pending;
            covidobj.Received_Date__c = date.today();
            insert covidobj;
         }

     }
     return response;
    }

    public static HttpResponse postBooks(){
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
            request.setEndpoint('https://gorest.co.in/public/v2/posts');
            request.setMethod('POST');
            //1.1 Get data and prepare as JSON
            Posts__c post = [Select User_ID__c, Title__c, Body__c from Posts__c where CreatedDate=TODAY limit 1];
                PostWrapper bw = new PostWrapper();
                bw.body = post.body__c;
                bw.title = post.Title__c;
                bw.user_id = post.User_ID__c;
            request.setBody(JSON.serialize(bw));
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('Authorization',  'Bearer 45638fdb900daa8b17dc1bc7a00c0ff9eb5a9aa310ad20dac35f016f544ac1a8');
            //request.setHeader(‘Authorization’, ‘Bearer AuthKey’);
            //2. Prepare internet
            Http http = new Http();
            //3. Send the HttpsRequest over the internet to receive HttpsResponse back
            HttpResponse response =  http.send(request);
            //4. Process the HttpResponse
            if(response .getStatusCode()== 201){
                system.debug(response.getBody());
            }else{
                system.debug(response.getStatus());
            }
            return response;
       }
}