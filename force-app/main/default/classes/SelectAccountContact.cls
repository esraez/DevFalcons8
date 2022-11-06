public class SelectAccountContact {
    public static void SelectAccCont(string accName, string contName){
        list<account> accs = [SELECT id,name,phone,website FROM ACCOUNT WHERE name=:accName];
        system.debug('accs= ' + accs);
        for(Account a: accs){
            string s = a.name;
            system.debug('acc name+ ' + s);
        }

        list<contact> contacs = [SELECT id,accountid,LastName FROM CONTACT WHERE lastname=:contName];
        system.debug('contacs= ' + contacs);
        for(contact c: contacs){
            string s = c.lastname;
            system.debug('c name= ' + s);
        }
    }
}
