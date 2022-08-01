public class SOQL_Assignment {
    public static void soql_WhereClause() {
        list<Contact> lstcontact = [Select LastName from Contact WHERE LastName LIKE '%A%'];
        system.debug('Size of contact list =' + lstcontact.size());
    }
    public static void soql_formethod(){
        list<Contact> lstcontact = [Select LastName, Phone from Contact];
        for(Contact eachContact:lstcontact){
            string lastName_contact = eachContact.LastName;
            string phone_contact = eachContact.Phone;
            system.debug('Contact Last Name: '+' '+ lastName_contact + ' '+ 'and' +' ' +'Phone Number: ' + ' ' + phone_contact);
    }
}
}