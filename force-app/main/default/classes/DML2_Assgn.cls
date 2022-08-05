public class DML2_Assgn {
    public static void insert_dml() {
        list<account> listAcc = new list<account>();
       
        Account acc1= new account();
        acc1.Name = 'Esra + assignment';
        listAcc.add(acc1);
        Account acc2= new account();
        acc2.Name = 'Esra + assignment';
        listAcc.add(acc2);

        insert listAcc;
        system.debug(listAcc);
    }
    public static void updating_dml(){
        list<account> lst = [SELECT name FROM ACCOUNT WHERE name = 'Esra + assignment'];
        list<account> lstupdated = new list<account>();
        for(account eachAcc: lst){
            eachAcc.name = 'Esra + Assignment updation';
            lstupdated.add(eachAcc);
        }
        update lstupdated;
        system.debug(lstupdated);
    }
}
