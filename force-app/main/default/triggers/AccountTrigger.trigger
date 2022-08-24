trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    system.debug('====Trigger START====');
    if (trigger.isBefore) {
        AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerHandler.updateVIPForAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(Trigger.isAfter && trigger.isInsert){
        /*AccountsQueueableExample aq =new 
        AccountsQueueableExample(trigger.new);
        Id jobId = system.enqueueJob(aq);
        system.debug('job Id is ...' + jobId);*/
    }
    
    system.debug('====Trigger END====');
}   



/*system.debug('====Trigger START====');
    if(trigger.isAfter && trigger.isUpdate){
        integer countWebSiteUpdate = 0;
        map<id, account> trgOldMap = trigger.oldMap;
        map<id, account> trgNewMap = trigger.newMap;

        set<id> AccIdSet = trgNewMap.keyset();

        for(Id eachId: accIdSet){
            account newAcc =  trgNewsMap.get(eachID);
            string newWebsite =newAcc.Website;

            account oldAcc =  trgOldMap.get(eachID);
            string oldWebsite =oldAcc.Website;
            if(newWebsite != oldWebsite){
                system.debug('Acc Name: '+ newAcc.Name + ', website is changed TO==> ' + newWebsite);
                countWebSiteUpdate++;
            }
        }
        system.debug('Count of website updated accounts =' + countWebSiteUpdate);
       

    system.debug('====Trigger END====');*/
  
   /*  system.debug('====Trigger START====');
    if(trigger.isAfter && trigger.isUpdate){
        map<id, account> trgOldMap = trigger.oldMap;
        map<id, account> trgNewMap = trigger.newMap;

        set<id> AccIdSet = trgNewMap.keyset();

        for(Id eachId: AccIdSet){
            system.debug('account id is...' + eachId);
            account newAcc = trgNewMap.get(eachId);
            system.debug('new acc name==>' + newAcc.Name);
            account oldAcc = trgOldMap.get(eachId);
            system.debug('oldacc name==>' + oldAcc.Name);

        }
    }
    system.debug('====Trigger END====');*/



    /* map<id, account> trgOldMap = trigger.oldMap;
    map<id, account> trgNewMap = trigger.newMap;
    system.debug('====Trigger START====');
    if(trigger.isBefore && trigger.isInsert){
        system.debug('====BEFORE INSERT====');
        system.debug('OLD Map===>' + trgOldMap);
        system.debug('NEW Map===>' + trgNewMap);
    }
    if(trigger.isAfter && trigger.isInsert){
        system.debug('====AFTER INSERT====');
        system.debug('OLD Map===>' + trgOldMap);
        system.debug('NEW Map===>' + trgNewMap);
    }  
    if(trigger.isBefore && trigger.isUpdate){
        system.debug('====BEFORE UPDATE====');
        system.debug('OLD Map===>' + trgOldMap);
        system.debug('NEW Map===>' + trgNewMap);
    }
     if(trigger.isAfter && trigger.isUpdate){
        system.debug('====AFTER UPDATE====');
        system.debug('OLD Map===>' + trgOldMap);
        system.debug('NEW Map===>' + trgNewMap);
    }

    system.debug('====Trigger END====');
}*/
    /*system.debug('====Trigger START====');
    list<Account> newAccounts = trigger.new;
    if(trigger.isAfter){
        system.debug('after trigger trigger.new = ' + newAccounts);
        system.debug('size of trigger.new = ' +newAccounts.size());
        
        for(account eachAcc:newAccounts){
            system.debug('account id is ' + eachAcc.id +',each account name is '+ eachAcc.name);
        }
    system.debug('====Trigger END====');
    */
    /*system.debug('=====Trigger START==== ');
    if(trigger.isAfter && trigger.isUpdate){
        list<Account> oldAccounts = trigger.old;
        list<Account> newAccounts = trigger.new;
        for( Account oldAcc: oldAccounts){
            system.debug('Old Account id: '+oldAcc.id +',Old Account name ' + oldAcc.Name);
        }
       
        for( Account newAcc: newAccounts){
            system.debug('New Account id: '+newAcc.id +',new Account name ' + newAcc.Name);
        }
    }
    system.debug('=====Trigger END==== ');*/

    
    /*//INSERT
    if(trigger.isbefore && trigger.isInsert){
        system.debug('Before INSERT trigger called'+ trigger.old);
    }
    if(trigger.isAfter && trigger.isInsert){
        system.debug('After INSERT trigger called' + trigger.old);    
    }

    //UPDATE
    if(trigger.isbefore && trigger.isUpdate){
        system.debug('Before UPDATE trigger called' +trigger.old);
    }
    if(trigger.isAfter && trigger.isUpdate){
        system.debug('After UPDATE trigger called' + trigger.old);    
    }
    system.debug('=====Trigger END==== ');
    */
    

/*
//system.debug('=====Trigger START==== ');
    //this should print only in BEFORE
    //if(Trigger.isBefore)
    //system.debug('Before INSERT trigger called');
    //this should print only in AFTER
    //if(Trigger.isAfter)
    //system.debug('After INSERT trigger called');
    //system.debug('=====Trigger END==== ');
    */