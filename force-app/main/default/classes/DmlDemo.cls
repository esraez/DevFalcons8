public class DmlDemo {
    public static void dmlInsert_stndObj() {
        //1.creating new instance of account object
        Account acc = new account();
        //2.set field values
        acc.Name = 'SoftInnovas';
        acc.Active__c ='Yes';
        //3.you can set few other fields here...
        //4.now comes the DML, insert record
        insert acc;
        //print it
        system.debug(acc);
    }
    public static void dmlInsertDemo_CstmObj(){
        Salesforce_project__c sp = new salesforce_project__c();
        sp.project_name__c = 'Teach DML to falcons';
        sp.description__c = 'All are great learners';
        insert sp;
        system.debug(sp);
    }
  
}
