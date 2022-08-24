public class AccountTriggerHandler {

    public static void updateAccountDescription(List<account> accTriggerNew, 
                                         List<account> accTriggerOld,
                                         Map<id, account> accTriggerNewMap,
                                         Map<id, account> accTriggerOldMap) {
     for (Account eachAcc : accTriggerNew) {
         //when inserted
         boolean updateDesc = false;
         //in insert oldMap is NULL so. If OLDMAP is NULL then INSERT.
         if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
             updateDesc = true;
         }
         //when updated. If OLDMAP is NOT NULL then UPDATE
         if(accTriggerOldMap != null){
             map<id, account> triggerOldMap = accTriggerOldMap;
             Account oldAccount = triggerOldMap.get(eachAcc.Id);
             Account newAccount = eachAcc;
             if(newAccount.Active__c == 'Yes' && newAccount.Active__c != oldAccount.Active__c){
                 updateDesc = true;
             }
         }
         if(updateDesc){
             eachAcc.Description = 'Account is now active. Enjoy!!!!!';
         }
     }
    }
public static void updateVIPForAllContacts(List<account> accTriggerNew, 
                                            List<account> accTriggerOld,
                                            Map<id, account> accTriggerNewMap,
                                            Map<id, account> accTriggerOldMap){ 
// get set of account IDs where ONLY VIP field is updated
    set <id> setAccIDs = new set<id>();
    for(Account eachAcc: accTriggerNew){
        //check if VIP field is updated
        account oldAccount = accTriggerOldMap.get(eachAcc.id);
        if(eachAcc.VIP__c != oldAccount.VIP__c){
            setAccIDs.add(eachAcc.id);
        }
    }
    if(!setAccIDs.isEmpty()){
        //get list of contacts for ACCOUNTS where VIP is updated
        list<contact> listContacts = [SELECT id,name,account.id, vip__c FROM CONTACT WHERE account.id in:setAccIDs];
        //Now we want to update CONTACTS record
        for(Contact eachContact:listContacts){
            account newAccountRecord = accTriggerNewMap.get(eachContact.Account.id);
            //fetch VIP field of account for this contact
            //if account's VIP is false, we get false.if true, we will get true
            boolean accVIP = newAccountRecord.VIP__c;
            //set account's VIP to contact
            eachContact.VIP__c =accVIP;
        }
        //update list contacts
        update listContacts;        
    }                                         

}
}





 
 
 
 

