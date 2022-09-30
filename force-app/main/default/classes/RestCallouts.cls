public with sharing class RestCallouts {

    private static final String HTTP_GET = 'GET';
    private static final String HTTP_POST = 'POST';
    
    public static HttpResponse getAnimals() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Integration_Info__mdt.getInstance('GET_ANIMALS').Endpoint__c);
        request.setMethod(HTTP_GET);

        //2. prepare http
        Http http = new Http();

        //3. send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200) {
            String jsonStrong = response.getBody();
            System.debug(jsonStrong);
        } else {
            //create an error log
        }
        return response;
    }

    public static HttpResponse getUsers() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Integration_Info__mdt.getInstance('GET_USERS').Endpoint__c);
        request.setMethod(HTTP_GET);

        //2. prepare http
        Http http = new Http();

        //3. send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200) {
            String jsonStrong = response.getBody();
            System.debug(jsonStrong);
            List<ContactResponse> contactResponses = (List<ContactResponse>)JSON.deserialize(jsonStrong, List<ContactResponse>.class);
            processContacts(contactResponses);
        } else {
            //create an error log
        }
        return response;
    }

    private static void processContacts(List<ContactResponse> contactResponses) {
        List<Contact> contacts = new List<Contact>();
        for(ContactResponse conRes : contactResponses) {
            Contact con = new Contact();
            String[] names = conRes.name.split(' ');
            con.FirstName = names[0];
            con.LastName = names[1];
            con.Email = conRes.email;
            con.Gender__c = conRes.gender;
            con.Status__c = conRes.status;
            contacts.add(con);
        }
        insert contacts;
    }

    public static HttpResponse postAnimals() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Integration_Info__mdt.getInstance('POST_ANIMALS').Endpoint__c);
        request.setMethod(HTTP_POST);
        String body = '{"name":"mighty moose"}';
        request.setBody(body);
        request.setHeader('Content-Type','application/json');

        //another example
        List<Contact> contacts = [SELECT FirstName, LastName, Email, Phone FROM Contact LIMIT 100];
        String jsonString = JSON.serialize(contacts);
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json');

        //2. prepare http
        Http http = new Http();

        //3. send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 201) {
            //do business logic
            for(Contact con : contacts) {
                con.Status__c = 'Active';
            }
            update contacts;
        } else {
            //create an error log
        }
        return response;
    }

    public static HttpResponse getAnimalsWithAuthorization() {
        //1. prepare request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Integration_Info__mdt.getInstance('GET_ANIMALS').Endpoint__c);
        request.setMethod('GET');

        //extra: add up authorization details
        String username = 'balakrishna.ette@softinnovas.com';
        String password = 'Test@123';
        Blob detail = Blob.valueOf(username + ':' + password);
        String authorizationString = 'BASIC ' + EncodingUtil.base64Encode(detail);
        request.setHeader('Authorization', authorizationString);

        //2. prepare http
        Http http = new Http();

        //3. send the request over the internet and receive response
        HttpResponse response = http.send(request);

        //4. process the response
        if(response.getStatusCode() == 200) {
            //do business logic
        } else {
            //create an error log
        }
        return response;
    }

}
