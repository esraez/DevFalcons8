trigger AssetTrigger on ASSET (after insert) {
    if(trigger.isAfter ){
        AssetTriggerHandler.countTriggerRan++;
        AssetTriggerHandler.numberOfRecordsInserted += Trigger.size;
        system.debug('trigger called');
        system.debug('trigger ran count= '+ AssetTriggerHandler.countTriggerRan);
        system.debug('number of records inserted= '+ AssetTriggerHandler.numberOfRecordsInserted);
    }
}