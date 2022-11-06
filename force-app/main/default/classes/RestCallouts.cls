public with sharing class RestCallouts {
    public static httpResponse getAnimals(){
        //step1 prepare httpRequest(SF class to send over the request over the internet) & wrap the necessary info in it.First instantiate the httpRequest
        HttpRequest request = new HttpRequest();
        //wrapping the data in the package
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        //method MUST BE IN UPPERCASE, get=retrieve data from url
        request.setMethod('GET');
        //step2 prepare the internet(mediumw where data travels), instantiate the internet, connect to the internet
        Http http = new Http();
        //step3 send the httpRequest over the internet to receive httpResponse back, HttpResponse, is http method
        HttpResponse response = http.send(request);
        //step4 process the httpResponse
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
        }else{
            CommonUtility.createLog('RestCallouts -getAnimals','Integration Apex', '', 'Error', 'Callout Exception',response.getStatus(),response.getBody());
        }
        return response;
    }

    public static HttpResponse getusers(){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
        }else{
            CommonUtility.createLog('RestCallouts -getUsers','Integration Apex', '', 'Error', 'Callout Exception',response.getStatus(),response.getBody());
        }
        return response;
    }
    public static HttpResponse getrecipes(){
        HttpRequest request= new HttpRequest();
        request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=6a95251396c049caa0f7d74aa3d60156');
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
        }else{
            CommonUtility.createLog('RestCallouts -getUsers','Integration Apex', '', 'Error', 'Callout Exception',response.getStatus(),response.getBody());
        }
        return response;
    }
    
    
    public static HttpResponse getProduct(){
        //1.Prepare the http request
        HttpRequest request= new HttpRequest();
        //wrap the necessary info in it
        request.setEndpoint('https://mockyard.herokuapp.com/products/1');
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
            list<ProductWrapper> productWrappers = (list<ProductWrapper>)JSon.deserialize(jsonString, list<ProductWrapper>.class);
            //empty list of product 
            list<Product__c> products = new list<Product__c>();
            //creating a product record and adding it to products list
            for(ProductWrapper pw : productWrappers ){
                Product__c prod = new Product__c();
                prod.Name = pw.productId;
                prod.Category__c = pw.category;
                prod.description__c = pw.description;
                string pr = pw.price.substring(1); //substring($23.01) will give the string starting from position 1, 23.01
                prod.Price__c = decimal.valueof(pr);
                prod.Image__c = pw.image;
                prod.Product_Name__c = prod.name;
                products.add(prod);
            }
            //catch the dml exceptions
            try{
                if(!products.isEmpty())
                    insert products;
            }catch(Exception ex){
                //create a log record for the exception
                CommonUtility.createLog('RestCallouts -getProduct','Integration Apex',ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(),'');
            
            }
       }
       return response;
    }
    public static HttpResponse getBlog(){
        //1.Prepare the http request
        HttpRequest request = new HttpRequest();
        //wrap the necessary info in it
        request.setEndpoint('https://mockyard.herokuapp.com/blogs/1');
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
            //convert the json string into our blog wrapper class==> , then we typecast class into object format, list of blog wrapper object
            list<BlogWrapper> blogWrappers = (list<BlogWrapper>)JSon.deserialize(jsonString, list<BlogWrapper>.class);
            //empty list of blog 
            list<Blog__c> blogs = new list<Blog__c>();
            for(BlogWrapper bw: blogWrappers){
                blog__c blg = new blog__c();
                blg.name = bw.title;
                blg.Topic__c = bw.topic;
                blg.author__c= bw.author;
                blg.body__c = bw.body;
                blogs.add(blg);
            }
            //catch the dml exceptions
            try{
                if(!blogs.isEmpty())
                    insert blogs;
                }catch(Exception ex){
                //create a log record for the exception
                CommonUtility.createLog('RestCallouts -getBlog','Integration Apex',ex.getStackTraceString(), 'Exception', ex.getTypeName(), ex.getMessage(),'');
                }
            }
            return response;

        }
        public static HttpResponse postCallout(){
            //step 1. prepare class (name) HttpRequest & wrap neccessary information in it
            HttpRequest request = new HttpRequest();
            //The system we send the request to will give you the expected structure for the data preparation
            /*e.g{
                'name': 'value1',
                'Age':'30',
                'Role':'Salesforce Consultant'
            }*/
            request.setMethod('POST');
            request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            //extra step for POSt,set the header, to tell them the content type
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            //this is the data we are sending, map of object, extra step for POST
            Map<String,Object> input = new Map<string,Object>();
            //extra step for POST
            input.put('name','Cat');
            //setting the body and serializing into JSON string
            request.setBody(JSON.serialize(input));
            //step 2. prepare internet -http
            Http http = new Http();
            //step 3. send the HttpRequest over the internet to receive HttpResponse back
            HttpResponse response = http.send(request);
            //step 4. process the HttpResponse
            //201, code for content created
            if(response.getStatusCode() == 201) {
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
            }
            return response;
        }
        public static HttpResponse postContacts(){
            //step 1. prepare class (name) HttpRequest & wrap neccessary information in it
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint('https://gorest.co.in/public/v2/users');
            //1.1 Get data and prepare it JSON
            Contact con = [SELECT Name,Email,Gender__c,Status__c FROM CONTACT WHERE Gender__c!=null AND Status__c !=null LIMIT 1];
            //converting each con from sobject to contactwrapper
            ContactWrapper cw = new ContactWrapper();
            
               cw.name= con.name;
               cw.email= con.email;
               cw.gender= con.gender__c;
               cw.status= con.status__c;
             
            
            //1.3 convert to contactwrapper to JSON
            request.setBody(JSON.serialize(cw));
            //extra step for POSt,set the header, to tell them the content type
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // for authorization key, 'Bearer API Key'
            request.setHeader('Authorization', 'Bearer 45638fdb900daa8b17dc1bc7a00c0ff9eb5a9aa310ad20dac35f016f544ac1a8');
            //2.prepare the internet
            Http http = new Http();
            //step 3. send the HttpRequest over the internet to receive HttpResponse back
            HttpResponse response = http.send(request);
            //step 4. process the HttpResponse
            if(response.getStatusCode() == 201){
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
            }
            return response;
        }

    }

      

    
