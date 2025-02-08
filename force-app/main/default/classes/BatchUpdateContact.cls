public class BatchUpdateContact implements Database.Batchable<sobject> {

    public Database.QueryLocator start(Database.BatchableContext Bc ){
        String query = 'Select id,FisrtName From Contact';
        return Database.getQueryLocator(query);
    }
    Public void execute(Database.BatchableContext BC, List<Contact> scope){

        List<Contact> LstContactToUpdate = new List<Contact>();
        for(Contact conRef : scope){
            conRef.Description = 'Updated from Contact Batch';
            LstContactToUpdate.add(conRef);
        }
        Update LstContactToUpdate;
    }
    public void finish(Database.BatchableContext Bc){

        System.debug('Contact Update batch is called');
    }
   
}