public class Datetime_assignment {
    public void diffofDate() {
        Date varTomorrowDate = date.newInstance(2022, 07, 15);
        system.debug('Date today is '+ varTomorrowDate);
        Date varTodaysDate = date.newInstance(2022, 07, 14);
        system.debug('Date tomorrow is '+ varTodaysDate);
        Integer Datediff = varTodaysDate.daysBetween(varTomorrowDate);
        system.debug('Date difference is '+ Datediff);
    }
    public void Timecheck(){
        Datetime varTomorrowDatetime = datetime.newInstance(2022,7,15,7,00,00);
        system.debug('Date tomorrow is '+ varTomorrowDatetime);
        Datetime var10daysDatetime = datetime.newInstanceGmt(2022,7,25,9,00,00);
        system.debug('Date in 10 days is '+ var10daysDatetime );
        Long  varDatetimeLong = 12339874361L;
        system.debug('Long date is '+ varDatetimeLong);
        Datetime varnewDatetime = varTomorrowDatetime.addDays(7);
        system.debug('Date in 7 days is '+ varnewDatetime);
        Datetime varnew2Datetime =var10daysDatetime.addDays(10);
        system.debug('Date in 10 days is '+ varnew2Datetime);
    }
}
