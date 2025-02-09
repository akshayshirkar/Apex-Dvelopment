public class batchlLeadPhoneUpdate implements Database.Batchable<SObject> {
    set<id> leadIdToUpdate = new set<id> ();
    public batchlLeadPhoneUpdate(set<id> leadIdToUpdate) {
        this.leadIdToUpdate = leadIdToUpdate;
    }
    public Database.QueryLocator start(Database.BatchableContext bc ){
        String query = 'Select id,Name From lead Where id =: leadIdToUpdate';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, list<lead>leadRecords){
        System.debug('ExecuteMethod is called');

    }
    public void finish(Database.BatchableContext bc){

    }
}