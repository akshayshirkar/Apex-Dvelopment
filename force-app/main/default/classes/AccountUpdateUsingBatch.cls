public class AccountUpdateUsingBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Name From Account]);
    }
    
    Public void execute(Database.BatchableContext bc,list<sObject>Scope){
        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}