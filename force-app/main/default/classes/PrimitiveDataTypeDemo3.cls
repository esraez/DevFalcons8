public  class PrimitiveDataTypeDemo3 {
    public void printNewDate() {
        system.debug('create new date instance');
        //create date here
        //datatype  variable  new instance of date using dateclass method.newInstance(Year,Month,Day);
        Date        newDate =  Date.newInstance(1995,2,17);
        system.debug('new date is '+ newDate);
        Date        newDate2 = Date.newInstance(2021,10,7);
        system.debug('new date2 is '+ newDate2);
        //to get today's date
        Date        todayDate = Date.today();
        system.debug('today\'s date is '+ todayDate);  
    }
    public void printNewTime(){
        //datatype   variable    new instance of time using time class.newInstance(hour,minutes,seconds,miliseconds)
        Time        myTime = Time.newInstance(13,00,30,30);
        system.debug('myTime is '+ myTime);
        Time        meTime= Time.newInstance(6, 00, 00, 00);
        system.debug('meTime is '+ meTime);      
    }
    public void printNewDateTime(){
        //Here will be new date time instances
        Date newDate=date.today();
        Time newTime=Time.newInstance(9,9,0,0);
        //nEW DATETIME from Date and Time
        Datetime dt1=Datetime.newInstance(newDate,newTime);
        system.debug('dt1 is '+dt1);
        //nEW DATETIME from Year, Month, Day --> time will be midnight
        Datetime dt2= Datetime.newInstance(2000,02,22);
        system.debug('dt2 is '+dt2);
        //new datetime using year,month,day,hour,minute, second
        Datetime dt3= Datetime.newInstance(2022,7,12,10,10,10);
        system.debug('dt3 is '+dt3);
        //Datetime with LONG, new instance from miliseconds since Jan 1 1970
        long longNumber = 0L;
        Datetime dt4 = Datetime.newInstance(longNumber);
        system.debug('dt4= '+dt4);
        long longNumber2 =  12339874361L;
        Datetime dt4_1 = Datetime.newInstance(longNumber2);
        system.debug('dt4_1= '+dt4_1);
        //Current time
        Datetime dt5 = datetime.now();
        system.debug('Current time is '+dt5);
        //creates newinstance datetime as per GMT
        Datetime dt6 = Datetime.newInstanceGmt(2022,2,22,2,22,22);
        system.debug('dt6 is '+dt6);    

    }
}
