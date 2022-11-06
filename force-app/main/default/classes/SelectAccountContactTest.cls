@isTest
public class SelectAccountContactTest {
    @isTest
    public static void selectAccContacsTest() {
        //prepare DATA
        account a = new account();
        a.name = 'any account';
        insert a;

        contact c = new contact();
        c.lastName = 'literally';
        c.accountId = a.id;
        insert c;
        SelectAccountContact.SelectAccCont('any account','literally');
    }
}
