public class DmlDemo2 {
    public static void dmlUpdateDemo_3(){
        //1.soql returns account because limit 1
        account acc = [select id,name from account where name ='SoftInnovas' limit 1];
        //2.update account
        acc.Name = 'SoftInnovas Inc.';
        //3.DML
        update acc;
        system.debug('acc= '+ acc);
    }
    //retrieve using SOQL then update record
    public static void dmlInsertRelatedDemo_1(){
        //1.soql to get One account
        Account acc =[select id,name from account where name ='SoftInnovas Inc.' limit 1];
        //2.create contact's instance
        contact cnt = new contact();
        //2.1 set contact field as usual
        cnt.lastname = 'Biden';
        cnt.AccountId = acc.Id;
        insert cnt;
        system.debug('Contact= '+ cnt);

    }
    public static void dmlInsertRelatedDemo_2(){
        Salesforce_Project__c sp = [select id, name from Salesforce_Project__c order by CreatedDate DESC limit 1];
        Salesforce_Ticket__c st = new salesforce_ticket__c();
        st.subject__c = 'Learn Apex';
        st.priority__c = 'High';
        st.status__c = 'New';
        st.requested_by_date__c = date.newInstance(2021, 12, 06);
        //important set relationship
        st.salesforce_project__c = sp.id;
        insert st;
        system.debug('Salesforce ticket' + st);
    }
    public static void dmlMultipleRecordInsert_right(){
        //1.create list of sobject
        List<Account> listAcc = new List<Account>();
        //2.create first instance
        account acc1 = new account();
        acc1.name = 'bulk acc1';
        //3.add instance in list
        listAcc.add(acc1);
        //4.Repeat the same for 2 more instance
        account acc2 = new account();
        acc2.name = 'bulk acc2';
        listAcc.add(acc2);
        account acc3 = new account();
        acc3.name = 'bulk acc3';
        listAcc.add(acc3);
        insert listAcc;
    }
        public static void dmlMultipleRecordInsert_right2(){
            List<Account> listAccount = new list<account>();      
        //add 15 more accounts in list using for loop
        for(integer i=0;i<200;i++){
            account acc = new account();
            acc.name ='Soft Innovas 29July v'+i;
            acc.AccountNumber ='Accis-'+i;
            acc.Active__c = 'Yes';
            listAccount.add(acc);
        }
        system.debug('size of list ='+listAccount.size());
        if(!listAccount.isEmpty()){
            insert listAccount;
        }

        }
       
    }
