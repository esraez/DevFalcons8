public class ContactTriggerHandler {
    //1.Don't allow user to update contact if Lead Source is "Partner Referral"
    public static void contactUpdateValidation1(List<contact> conTriggerNew, 
                                                Map<id, contact> conTriggerNewMap,
                                                List<contact> conTriggerOld, 
                                                Map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
             contact oldContact = conTriggerOldMap.get(eachContact.id);
             //old contact---> older value of leadsource is Partner Referral then do not allow it to change.
            if (oldContact.LeadSource == 'Partner Referral') {
                eachContact.addError('Cannot update Partner Referral contact');//it will add validation.
            }
        }
    }
    //2.Don't allow user to update contact's Lead Source
    public static void contactUpdateValidation2(List<contact> conTriggerNew, 
                                                Map<id, contact> conTriggerNewMap,
                                                List<contact> conTriggerOld, 
                                                Map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            contact oldContact = conTriggerOldMap.get(eachContact.id); // this will fetch us the entire contact value for that particular id 
            if (eachContact.LeadSource != oldContact.LeadSource) {
                string customErrorMsg = system.label.ContactValidation2;
                eachContact.LeadSource.addError(customErrorMsg);
            }
        }
    }
    public static void updateAccountRollUpField(set<id> accountIds) {
        //Fetch all accounts and its related contact using inner query
        List<account> listAccounts = [select id, number_of_contacts__c, (select id from Contacts) from account where id in :accountIds];
        for (account eachAccount : listAccounts) {
            List<contact> accContacts = eachAccount.contacts;
            //get number of contact.
            integer noOfContacts = accContacts.size();
            eachAccount.number_of_contacts__c = noOfContacts;
        }
        update listAccounts;

    }
}



