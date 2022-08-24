public class SalesforceProjectTriggerHandler {
    public static void spCompletedStatus(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld,Map<id, salesforce_project__c> spTriggerNewMap,
    Map<id, salesforce_project__c> spTriggerOldMap){
        set<id> spIds = new set<id>();
        for(Salesforce_Project__c spRecord: spTriggerNew){
            Salesforce_Project__c spOld = spTriggerOldMap.get(spRecord.Id);
            if(spRecord.Status__c == 'Completed' && spOld.Status__c !='Completed'){
                spIds.add(spRecord.Id);
            }
        }
        if(!spIds.isEmpty()){
            //here we call future method
            updateTicketStatusCompleted(spIds);
        }

    }
    @future
    public static void updateTicketStatusCompleted (set<id> spIds){
        List<Salesforce_Ticket__c> listST = [SELECT id, status__c, salesforce_project__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c in:spIds and status__c!='Completed'];
        for(Salesforce_Ticket__c sRecord: listST){
            sRecord.Status__c = 'Completed';
        }
        update listST;
    }
    //create default salesforce ticket record
    public static void createSalesforceProjectTicket(list<Salesforce_Project__c> spTriggerNew) {
       try{
        //create one Empty list of sf ticket
        List<Salesforce_Ticket__c> newSTlist = new List<Salesforce_Ticket__c>();
        //for each project create new ticket
        for(Salesforce_Project__c eachSP: spTriggerNew){
            //create new ST
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Status__c = 'new';
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.id; //relationship id
            newSTlist.add(st);
        }
        //insert only if we have at least one record in the list
        if(!newSTlist.isEmpty())
            insert newSTlist;
        } catch(Exception ex){
            system.debug('There is Error. Please Fix.');
            for(Salesforce_Project__c eachSP: spTriggerNew){
                eachSP.addError('Salesforce Ticket creation failed. Please contact your administrator.');
            }
        }
    }

    public static void validateProjectCompletion(List<salesforce_project__c> spTriggerNew,
    Map<id, salesforce_project__c> spTriggerNewMap,
    Map<id, salesforce_project__c> spTriggerOldMap) {
        //find all the project which are completed
        set<id> setCompletedProjectIds = new set<id>();
        for (salesforce_project__c eachNewSP : spTriggerNew) {
            //check if project's status field is marked as completed.
            //how do we check that?
             //compare old status value and new status value.
             //if not same, then status field is CHANGED.
             salesforce_project__c oldSP = spTriggerOldMap.get(eachNewSP.id);
             if(oldSP.Status__c != eachNewSP.Status__c
                 && eachNewSP.Status__c == 'Completed'){
                 setCompletedProjectIds.add(eachNewSP.Id);
             }
        }
        //fetch all tickets of COMPLETED project.
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
         where Salesforce_Project__c in :setCompletedProjectIds and (status__c != 'Completed' and status__c != 'Cancelled')];
 
         //loop all tickets and if ticket is FOUND then fetch Project from NewMap to addError
         for (salesforce_ticket__c eachST : listST) {
             Salesforce_Project__c spNew = spTriggerNewMap.get(eachST.Salesforce_Project__c);
             spNew.addError('Cannot COMPLETE Project. Please complete all its ticket then come back.');
         }
    }
    @future
    public static void updateProjectDescription(set<id> setSPIds){
        List<Salesforce_Project__c> lstSP = [SELECT id,description__c FROM Salesforce_Project__c WHERE id in:setSpIds];

        for(Salesforce_Project__c spRecord: lstSP){
            spRecord.Description__c = spRecord.Description__c +' Update from Future! ';
        }
        update lstSP;

    }
    
 }