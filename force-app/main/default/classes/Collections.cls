public  class Collections {
    public static string listassignment(integer i) {
        list<string> Lstmonth = new  list<string>();
        Lstmonth.add('January');
        Lstmonth.add('February');
        Lstmonth.add('March');
        Lstmonth.add('April');
        Lstmonth.add('May');
        Lstmonth.add('June');
        Lstmonth.add('July');
        Lstmonth.add('August');
        Lstmonth.add('September');
        Lstmonth.add('October');
        Lstmonth.add('November');
        Lstmonth.add('December');
        string output_month='';
        integer sizeOfList = Lstmonth.size();

        if (i<sizeOfList){
            output_month = Lstmonth[i-1];
        }else{
            system.debug('Not a valid month');
        }
        return output_month;
    }
}
