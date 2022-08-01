public  class Conditionclass_assignment {
    public string Ifclassmethod(integer month) {
        string output_Month = 'Not a valid month';
        if(month == 1 ){
            output_Month = 'January';
        }else if(month == 20){
            output_Month = 'February';
        }else{
            output_Month = 'Not a valid Month';
        }
    return output_Month;
    }
    public string casemethod(string monthname){
        string output_Quarter ='Enter a proper month name';
        switch on monthname{
            when 'January','February','March'{
                output_Quarter = 'Quarter 1';
            }
            when else{
                output_Quarter = 'Not a valid Quarter';
            }
        }
        return output_Quarter;
    }   
}
