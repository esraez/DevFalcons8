public with sharing class RestCalloutsMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET') {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
            response.setStatus('OK');
            return response;
        } else if(request.getEndpoint() == 'https://gorest.co.in/public/v2/users' && request.getMethod() == 'GET') {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody('[{"id":4219,"name":"Lauren Boyle","email":"test@testtest.com","gender":"male","status":"active"}]');
            response.setStatus('OK');
            return response;
        }
        return null;
    }
}