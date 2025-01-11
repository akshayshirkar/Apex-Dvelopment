public with sharing class getAccounts {
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts() {
        return [Select id, name, phone, website from account limit 5];

    }
}