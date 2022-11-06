Map<string, Country_Code__c> mcs = Country_Code__c.getall();
//.getall() returns the map of 'Name' as KEY and Custom Setting Record as Value.
set<string> countries = mcs.keyset();
for(string eachCountry: countries){
    //country code goes here
    country_code__c cs = mcs.get(eachCountry);
    string countryCode = cs.country_code__c;
    system.debug('Country is '+ eachCountry + ', its code is ' + countryCode);
}
system.debug('country codes are--> ' + mcs);