public class CreateTaskforContact {
    public static void CreateTasks(string contactLastname) {
        string queryString = 'SELECT id, name FROM CONTACT WHERE lastname like \'%' + contactLastname + '%\'';
        list<contact> allContacts = database.query(queryString);
        list<task> tklist = new list<task>();
        for(contact c: allContacts){
            task t = new task();
            t.WhoId =c.id;
            t.subject = 'Email';
            t.Description = 'A task a contact';
            t.ActivityDate = date.today();
            tklist.add(t);
        }
        if(!tklist.isEmpty())
            insert tklist;

    }
    @testVisible
    private static void createOpps(list<contact> listContact){
        list<opportunity> opps = new list<opportunity>();
        for (contact c : listContact) {
            opportunity o = new Opportunity();
            o.name = 'opp for ct: '+ c.name;
            o.stagename = 'New';
            o.closedate = date.today();
            o.ContactId = c.id;
            opps.add(o);

        }
        if(!opps.isEmpty()){
            insert opps;
        }
            
    }
}
