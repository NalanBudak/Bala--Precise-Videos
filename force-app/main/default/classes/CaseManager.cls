@RestResource(urlMapping='/Case/*')
global with sharing class CaseManager {
    @HttpGet
    global static Case getCase() {
        //https://curious-unicorn-v55bis-dev-ed.lightning.force.com/services/apexrest/Case/500Iw000000uqiwIAA
        RestRequest request = RestContext.request;
        String url = request.requestURI;
        Id caseId = url.split('/')[url.split('/').size()-1];
        Case cs = [SELECT Id, CaseNumber, Subject, Description, Status, Priority
                    FROM Case
                    WHERE Id = :caseId];
        return cs;
    }

    @HttpPost
    global static Id createCase(String subject, String description, String priority) {
        Case cs = new Case();
        cs.Subject = subject;
        cs.Description = description;
        cs.Priority = priority;
        insert cs;
        return cs.Id;
    }

    @HttpDelete
    global static String deleteCase() {
        RestRequest request = RestContext.request;
        String url = request.requestURI;
        Id caseId = url.split('/')[url.split('/').size()-1];
        Case cs = [SELECT Id FROM Case WHERE Id = :caseId];
        delete cs;
        return 'Case has been deleted successfully';
    }

    @HttpPut
    global static Case upsertCase() {
        RestRequest request = RestContext.request;
        String requestBody = request.requestBody.toString();
        Case cs = (Case)JSON.deserialize(requestBody, Case.class);
        upsert cs;
        return cs;
    }

    @HttpPatch
    global static Case patchCase() {
        RestRequest request = RestContext.request;
        String requestBody = request.requestBody.toString();
        Map<String, Object> caseInfo = (Map<String, Object>)JSON.deserializeUntyped(requestBody);
        Case cs = new Case();
        for(String key : caseInfo.keySet()) {
            cs.put(key, caseInfo.get(key));
        }
        update cs;
        return cs;
    }
}
