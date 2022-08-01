public  class DatetimeMethodsDemo {
    //calculate your age in months
    public void calculateAgeInMonths() {
        Date birthdate = Date.newInstance(1982, 7, 22);
        Date todaydate = Date.today();
        Integer ageInMonths = birthdate.monthsBetween(todaydate);
        system.debug('My age in months: '+ ageInMonths);
    }
    public void calculateAgeInDays() {
        Date birthdate = Date.newInstance(1982, 7, 22);
        Date todaydate = Date.today();
        Integer ageInDays = birthdate.daysBetween(todaydate);
        system.debug('My age in days: '+ ageInDays);
    }
}
