DateTimeMethodsDemo9 dtm = new DateTimeMethodsDemo9();
date d = date.today();
boolean lpcheck= dtm.leapYearCheck(d);
system.debug('Is Today\'s date a leap year? '+ lpcheck);
date d2 = date.newInstance(2024, 2, 2);
boolean lpcheck2= dtm.leapYearCheck(d2);
system.debug('Is Today\'s date a leap year? '+ lpcheck2);