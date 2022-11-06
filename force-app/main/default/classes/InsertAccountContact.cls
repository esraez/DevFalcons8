public  class InsertAccountContact {
    public static void InsertAccCont(string accName, string cntName) {
        account a = new account();
        a.name = accName;
        insert a;

        contact c = new contact();
        c.lastName = cntName;
        c.accountId = a.id;
        insert c;

    }
}
