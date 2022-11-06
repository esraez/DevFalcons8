trigger LeadTrigger on LEAD (before insert, after insert, before update, after update ) {
    if(trigger.isBefore){
        //inserted or updated
   
        LeadTriggerHandler.updateDates(Trigger.new, trigger.old, trigger.oldMap, trigger.newMap);
    }

}