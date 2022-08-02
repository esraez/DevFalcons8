trigger AccountTrigger on ACCOUNT (before insert, after insert) {
    system.debug('=====Trigger START==== ');
    //this should print only in BEFORE
    if(Trigger.isBefore)
    system.debug('Before INSERT trigger called');
    //this should print only in AFTER
    if(Trigger.isAfter)
    system.debug('After INSERT trigger called');
    system.debug('=====Trigger END==== ');
}