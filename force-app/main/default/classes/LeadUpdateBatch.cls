public class LeadUpdateBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select Id,Name from Lead]);
    }
    public void execute(Database.BatchableContext bc,list<Lead>scope){
        List<lead> lstleadtoupdate = new List<lead>();
        for(lead leadRef : scope ){
            leadRef.Rating = 'Hot';
            lstleadtoupdate.add(leadRef);
        }
        update lstleadtoupdate;
    }
    public void finish(Database.BatchableContext bc){
        id batchid = bc.getJobId();
        System.debug('batch job id is '+batchid);
    }
}