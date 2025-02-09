public class MapExample {
    public static void updateContactUsingMap(){
        // Get all the contacts
        Set<id> accountsID = new Set<id>();
        List<Contact> lstContacts = [SELECT Id, AccountId, Name, Title FROM Contact WHERE Title = ''];
        for(Contact contactRef : lstContacts){
            if(contactRef.AccountId != NULL ){
                accountsID.add(contactRef.AccountId);
            }
        }
        // This list is created to handle the bul update of the contact.
        List<Contact> lstUpdateContactWithNewTitle= new List<Contact>();
        Map<id,Account> mapAccountsUpdate = new Map<id,Account>([Select id,Industry From Account WHERE id =:accountsID]);
        for(Contact ContactRef : lstContacts ){
            if(mapAccountsUpdate.containsKey(ContactRef.AccountId)){
                if(mapAccountsUpdate.get(ContactRef.AccountId).Industry == 'Technology'){
                    ContactRef.Title = 'Tech Lead';
                    lstUpdateContactWithNewTitle.add(ContactRef);
                }
            }
        }
        Update lstUpdateContactWithNewTitle;
    }
    
    Public static void mappingParentToMultipleChildren(){
        // Get All the Contacts 
        Set<id> setAccountId = new Set<id>();
        List<Contact> lstAllContacts = [Select id,Name,AccountId 
                                        From Contact ];
                
        // Create the Account Map
        Map<id,List<Contact>> lstMapWithAssociatedContacts = new Map<Id,List<Contact>>();
        for(Contact ContactRef : lstAllContacts){
            if(! lstMapWithAssociatedContacts.ContainsKey(ContactRef.AccountId)){
                lstMapWithAssociatedContacts.put(ContactRef.AccountId,new List<Contact>());
            }else{
                lstMapWithAssociatedContacts.get(ContactRef.AccountId).add(ContactRef);
            }
        }
        System.debug('lstMapWithAssociatedContacts ==>'+lstMapWithAssociatedContacts);
                                                                           
    }
}