public with sharing class AccountUpdateHelper {
  @InvocableMethod
  public static void updateAccountWebsite(list<id> accIDs){
    list<account> listAcc = [SELECT id, website FROM ACCOUNT WHERE id in:accIDs];
    for(account eachAcc: listAcc){
        eachAcc.Website = 'www.softinnovas.com';
    }
    update listAcc;
  }
}
