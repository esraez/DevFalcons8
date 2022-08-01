public  class SoqlDemo2 {
    public static void accountSOQL_2() {
       List<account> Listacc = [Select name, phone,AccountNumber, createddate from Account order by CreatedDate DESC];
        system.debug('Latest Account '+ Listacc);
        //for each account get name,phone and account number
        for(Account eachAccount:Listacc){
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            system.debug( 'accName= '+ accName + ',phone is' +' '+ accPhone);
            system.debug('account number is '+ eachAccount.AccountNumber);
        }
    }
    public static void accountSOQL_Filter(string accNameFilter){
        List<Account> ListAcc = [select name,phone from account where name = :accNameFilter];
        system.debug('filtered accounts are '+ ListAcc);
    }
    public static void childToParent_Soql1() {
        list<Contact> listCnt = [select id, name, Account.Name, account.industry, account.phone from Contact Where Account.Industry = 'Energy'];
        for (contact eachContact: listCnt){
            string accName = eachContact.account.name;
            system.debug('contact name is '+ ' '+ eachContact.Name +' '+',its acc is'+ ' '+accName);

        }
    }
    public static void sampleSoql4(){
        list<account> accountWithOpps = [select Name,AnnualRevenue,(select amount, name from Opportunities where stageName='Closed Won')from account where type='Customer-Direct'];
        for (account eachAccount:accountWithOpps){
            system.debug('account name' + eachAccount.Name+'and its revenue is' +eachAccount.AnnualRevenue);
            //we want to fetch all opportunities in each account
            List<Opportunity> listOpp = eachAccount.Opportunities;
            for (Opportunity opp:listOpp){
            system.debug('Opportunity Name:' + ' '+ opp.Name);
            system.debug('Opportunity Amount:' +' ' + opp.Amount);
            } 

        }
    }
}