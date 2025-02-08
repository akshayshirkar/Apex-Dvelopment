public class BatchUpdateOpportunity implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Name,Amount from Opportunity]);

    }
    public void execute(Database.BatchableContext bc, list<Opportunity> Scope){
        List<Opportunity> lstOpportunityToUpdate = new List<Opportunity>();
        for(Opportunity oppRef : Scope){
            oppRef.Amount = 0;
            lstOpportunityToUpdate.add(oppRef);
        }
        update lstOpportunityToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('AsyncApexJob is ==>'+bc.getJobId());
        AsyncApexJob a = [Select id,status from AsyncApexJob where id =: bc.getJobId()];
        if (a.status == 'Completed') {
            System.debug('Job is completed');
        }
        
    }
}