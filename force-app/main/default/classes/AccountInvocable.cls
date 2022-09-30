public with sharing class AccountInvocable {
    @InvocableMethod(label='Delete Opportunities' 
        description='Deletes all the closed opportunities for the given account ids'
        category='Account')
    public static void deleteOpportunities(List<Id> accountIds) {
        List<Opportunity> opps = [SELECT Id FROM Opportunity   
                                WHERE AccountId = :accountIds
                                AND StageName IN ('Closed Won', 'Closed Lost')];
        delete opps;
    }
}
