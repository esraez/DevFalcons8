public class LeadTriggerHandler {
    public static void updateDates(list<lead> lTriggerNew,list<lead> lTriggerOld, map<id,lead> lTriggerNewMap, map<id,lead> lTriggerOldMap) {
        Boolean wantToUpdateDate = false;
            for (lead eachLead : lTriggerNew) {

                if(lTriggerOld==null){
                    //then go ahead and update the dates for insert
                    wantToUpdateDate = true;

                }
              
                if(lTriggerOld !=null){
                    //check if status is changed, then only go ahead and update the dates ,for updates
                    if(lTriggerOldMap.get(eachLead.id).status != eachLead.Status){
                        wantToUpdateDate = true;
                    }
                }
                if(wantToUpdateDate){
                    switch on eachLead.status {
                        when null  {
                            eachLead.Created_Date__c = datetime.now();
                            
                        }
                        when '' {
                            eachLead.Created_Date__c = datetime.now();
                        }
                        when 'Open - Not Contacted'{
                            eachLead.Created_Date__c = datetime.now();     
                        }
                        when 'Working -Contacted'{
                            eachLead.Contact_Date__c = datetime.now();     
                        }
                        when 'Closed - Converted'{
                            eachLead.Closed_Won_Date__c= datetime.now();
                        }
                        when 'Closed - Not Converted' {
                            eachLead.Closed_Lost_Date__c = datetime.now();
                        }                        
                    }
                }

            }

    }
    public static void checkClosedLostReason(list<lead> lTriggerNew,list<lead> lTriggerOld, map<id,lead> lTriggerNewMap, map<id,lead> lTriggerOldMap){
        for (lead eachLead : lTriggerNew) {
    }
  
}
