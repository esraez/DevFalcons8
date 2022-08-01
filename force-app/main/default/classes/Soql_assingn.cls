public class Soql_assingn {
    public static void soqlavg() {
        list <AggregateResult> avg_num_empl = [select avg(NumberOfEmployees) from Account];
        system.debug('Average number of employees= '+ avg_num_empl);
    }
    public static void numofempbyindustry(){
        list <AggregateResult> indust_avg = [select Industry, avg(NumberOfEmployees) from Account GROUP BY Industry];
        for (AggregateResult eachAcc:indust_avg){
            system.debug('Number of Employees by Industry:'+' '+ eachAcc);
        }  
    }
    public static void max_num_empl(){
        list <AggregateResult> max_num_empl = [select max(NumberOfEmployees) from Account];
        system.debug('Max Number of Employees:'+' '+ max_num_empl);
    }
    public static void accountIDname(){
        //CHILD TO PARENT
        list<Contact> lstcontact = new list<contact>();
        lstcontact = [SELECT name, Account.Name, account.Id FROM CONTACT];
        for(Contact eachContact: lstcontact){
            string accName = eachContact.Account.Name;
            string accId = eachContact.Account.id;
            system.debug('Account Name:'+' '+accName + ' '+ 'Account ID: '+ accId);
        }
    }
    
    public static void contactIDname(){
        //PARENT TO CHILD
        list<Account> lstaccount = new list<account>();
        lstaccount = [SELECT ID, name, (SELECT Id,Name FROM CONTACTS) FROM ACCOUNT];
        for(Account eachacc: lstaccount){
            system.debug('For ACCOUNT: ' + eachacc);
            for(Contact cont:eachacc.Contacts){
                string conName = cont.Name;
                string conId = cont.id;
                system.debug('Contact Name:'+' '+conName + ' '+ 'ContactID: '+ conId);
            }
        }
    }

}