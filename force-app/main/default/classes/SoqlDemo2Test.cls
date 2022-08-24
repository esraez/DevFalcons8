@isTest
public  class SoqlDemo2Test {
        @TestSetup
        static void makeData(){
            list<account> listAcc = new list<account>();
            account a = new account();
            a.name= 'SI Test';
            a.Industry = 'Energy';
            a.Type = 'Customer - Direct';
            listAcc.add(a);
    
            account a1 = new account();
            a1.name= 'UI Test';
            a1.Industry = 'Energy';
            a1.Type = 'Customer - Direct';
            listAcc.add(a1);
    
            account a2 = new account();
            a2.name= 'PI Test';
            a2.Industry = 'Banking';
            a2.Type = 'Customer - Direct';
            listAcc.add(a2);
    
            insert listAcc;
    
            list<contact> listContact = new list<contact>();
            for( Integer i=0; i<300; i++){
                contact cnt = new contact();
                cnt.LastName ='test SOQL';
                if(i<100){
                    cnt.AccountId = a.ID;
                } else if(i<200){
                    cnt.AccountId = a1.ID;
                }else{
                    cnt.AccountId = a2.ID;
                }
                listContact.add(cnt);
            }
            insert listContact;

            list<Opportunity> listOpps = new list<Opportunity>();
            for( Integer i=0; i<300; i++){
                Opportunity opp = new Opportunity();
                opp.Name ='test opp'+ i;
                opp.StageName = 'Closed Won';
                opp.CloseDate = date.today();
            
                if(i<100){
                    opp.AccountId = a.ID;
                } else if(i<200){
                    opp.AccountId = a1.ID;
                }else{
                    opp.AccountId = a2.ID;
                }
                listOpps.add(opp);
            }
            insert listOpps;
        }
    @isTest    
    private static void testChildtoParent() {
        test.startTest();
        SoqlDemo2.childToParent_Soql1();
        test.stopTest();
    }
    @isTest
    private static void testMethod2(){
        SoqlDemo2.sampleSoql4();
    }
 
}