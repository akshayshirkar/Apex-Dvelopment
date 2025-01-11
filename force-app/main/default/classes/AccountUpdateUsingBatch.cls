public class AccountUpdateUsingBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Name From Account]);
    }
    
    Public void execute(Database.BatchableContext bc,list<Account>Scope){
        List<Account> AccountToUpdate = new List<Account>();
        for(Account Acc : Scope){
           Acc.Name = Acc.Name + '';
           AccountToUpdate.add(Acc);
        }
        Update AccountToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        
    }
}