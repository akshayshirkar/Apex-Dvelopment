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
}