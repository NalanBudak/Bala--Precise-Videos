public with sharing class CaseInvocable {
    @InvocableMethod(label='Send Email & Save As Activity' 
        description='Sends an email for the given cases and saves the same under activity'
        category='Case')
    public static void sendEmail(List<FlowRequest> inputs) {
        FlowRequest request = inputs[0];
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        msg.setSubject('Case Created: ' + request.caseNumber);
        msg.setPlainTextBody('Hello there \nA case has been created for your query. One of our customer representatives is going to reachout to you. Stay tuned! \n Thank you!');
        msg.setTargetObjectId(request.contactId);
        msg.setSaveAsActivity(true);
        msgs.add(msg);
        //Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{msg});
        Messaging.SendEmailResult[] results = Messaging.sendEmail(msgs);
        for(Messaging.SendEmailResult result : results) {
            if(result.isSuccess()) {
                //create a sucess log
                System.debug('Email has been sent!');
            } else {
                //create an error log
                System.debug(result.getErrors());
            }
        }
    }

    public class FlowRequest {
        @InvocableVariable(label='Case Number' description='Case Number' required=true)
        public String caseNumber;

        @InvocableVariable(label='Contact Id' description='Contact Id' required=true)
        public Id contactId;
    }
}
