trigger ContactTrigger on Contact (before insert, before update, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && trigger.isUpdate){
        //call handler method HERE.
        ContactTriggerHandler.contactUpdateValidation1(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
        ContactTriggerHandler.contactUpdateValidation2(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
    }

    if(trigger.isAfter){
        set<id> accountIds = new set<id>();

        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            for (contact eachContact : trigger.new) {
                if(eachContact.AccountId != null){
                    accountids.add(eachContact.AccountId);
                }
            }
        }
        //updated or deleted then get the OLD ACCOUNT ID.
        if(trigger.isUpdate || trigger.isDelete){
            for (contact eachContact : trigger.old) {
                if(eachContact.AccountId != null){
                    accountids.add(eachContact.AccountId);
                }
            }
        }
        //HERE we call handler method
        ContactTriggerHandler.updateAccountRollUpField(accountIds);
    }

}
/*if(trigger.isBefore){
        system.debug('BEFORE trigger');
        if(trigger.isInsert){
            system.debug('Before INSERT Trigger');
        }
        if(trigger.isUpdate){
            system.debug('Before UPDATE Trigger');
        }
    }

    if(trigger.isAfter){
        system.debug('AFTER trigger');
        if(trigger.isInsert){
            system.debug('After INSERT Trigger');
        }
        if(trigger.isUpdate){
            system.debug('After UPDATE Trigger');
        }
    }*/