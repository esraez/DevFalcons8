trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
   if(Trigger.isAfter && Trigger.isInsert){
      
        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newMap.keyset());

          //call handler method here
          SalesforceProjectTriggerHandler.createSalesforceProjectTicket(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        /*SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.NewMap,Trigger.OldMap);*/
    }
    if(trigger.isAfter && trigger.isUpdate){
        SalesforceProjectTriggerHandler.spCompletedStatus(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}

/* if(trigger.isBefore){
        if(trigger.isInsert){
            for(Salesforce_Project__c proj: trigger.new){
                system.debug(' Before Insert ' + proj.Project_Name__c);
            }
        }    
        if(trigger.isUpdate){
            system.debug(' After Update ');
            for(Salesforce_Project__c newproj: trigger.new){
                system.debug(' After Update ' + newproj.Project_Name__c);
            }
            }  
    }
} */