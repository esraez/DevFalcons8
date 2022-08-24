trigger CaseTrigger on Case (before insert, before update) {
    if(Trigger.isInsert){
        system.debug('before insert case trigger called');
        system.debug('trigger size is ==>>> ' + trigger.size);
    } 
    if(Trigger.isUpdate){
        system.debug('before update case trigger called');
        system.debug('trigger size is ==>>> ' + trigger.size);
        CaseTriggerHandler.countRecordsUpdate += trigger.size;
        CaseTriggerHandler.countTriggerExecution++;
        system.debug('# of times trigger executed = ' + CaseTriggerHandler.countTriggerExecution);
        system.debug('# of total records updated = ' + CaseTriggerHandler.countRecordsUpdate);
    }
}

    /*if(trigger.isBefore){
        system.debug('Before Trigger');
        if(trigger.isInsert){
            system.debug('Insert Before');
        }
        if(trigger.isUpdate){
            system.debug('Update Before');
        }
    }
    if(trigger.isAfter){
        system.debug('After Trigger');
        if(trigger.isInsert){
            system.debug('After Insert');
        }
        if(trigger.isUpdate){
            system.debug('After Update');
            system.debug('Delete After');
        }
        if(trigger.isDelete){
            system.debug( 'Delete Before');
        }
    }*/