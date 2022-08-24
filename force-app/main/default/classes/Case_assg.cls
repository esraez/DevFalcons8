public class Case_assg {
    public static void caseinsert() {
    //Insert records in case object with name as ' Testcase'
        case cs = new case();
        cs.subject ='Testcase';
        cs.status ='New';
        cs.origin ='Phone';
        insert cs;
        system.debug('Inserted case: '+ cs );
    }
    public static void caseupdate(){
        case newcase = [SELECT id, Subject FROM CASE WHERE Subject= 'Testcase' limit 1];
        newcase.Subject ='Testing case 1';
        update newcase;
        system.debug('Updated case: '+ newcase);
    }
    public static void casedelete(){
        case delcase = [SELECT id,Subject FROM CASE WHERE Subject= 'Testing case 1' limit 1];
        delete delcase;
        system.debug('Deleted case: '+ delcase );
    }
}
