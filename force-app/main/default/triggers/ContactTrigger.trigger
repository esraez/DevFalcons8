trigger ContactTrigger on CONTACT (before insert, before update, after insert, after update) {
    if(trigger.isBefore){
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
    }
    
}