public with sharing class AccountsBatch implements Database.Batchable<SObject>, database.stateful{
  public integer updateCount=0;
  public Database.QueryLocator start(Database.BatchableContext bc){
    system.debug('****INSIDE START****');
    Database.QueryLocator ql = database.getQueryLocator([SELECT id, description, active__c FROM ACCOUNT]);
    return ql;
  }

  public void execute(Database.BatchableContext bc, list<account> scope){
    system.debug('*****Inside Execute...');
    system.debug('****size of list= ' +scope.size());
    system.debug('****updatecount ' + updateCount);
    list<account> updateAccounts = new list<account>();
    for(Account acc:scope){
        if(acc.Active__c != 'No'){
            acc.Description += '...updated via BATCH.';
            updateAccounts.add(acc);
            updateCount++;
            system.debug('****Updated****');
        }
    }
    system.debug('****updatecount ' + updateCount);
    update updateAccounts;

  }
  public void finish(Database.BatchableContext bc){
    system.debug('****INSIDE FINISH');
    system.debug('Batch is now COMPLETE. All Chunks are executed.');
  }

}
