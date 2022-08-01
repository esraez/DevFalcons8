//map(collection)
  //key datatype,
//value datatype    variable name    new instance of same type of map
map<string, string> mapCntCurrency = new map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('Japan', 'Yen');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('India', 'Rupees');//1
mapCntCurrency.put('India', 'Rupee');//2 same key what will happen?
mapCntCurrency.put('Turkey', 'Lira');
mapCntCurrency.put('El Salvador', 'Bitcoin');
mapCntCurrency.put('INDIA', 'RUPEE');
system.debug('map of country vs currency' + mapCntCurrency);

string IndiaCurrency = mapCntCurrency.get('India');
string TurkeyCurrency = mapCntCurrency.get('Turkey');
system.debug('India Currency is '+ IndiaCurrency);
system.debug('Turkey Currency is '+ TurkeyCurrency);

Set<string> countrySet = mapCntCurrency.keySet();
system.debug('countries in map: '+ countrySet);

List<string> countryList = mapCntCurrency.values();
system.debug('countries in map: '+ countryList);

set<string> countries = mapCntCurrency.keySet();
for(string eachKey:countries){
    string printString = 'Country is' + ' ' + eachKey;
    string eachCurrency = mapCntCurrency.get(eachKey);
    printString += ', its currency is ' +eachCurrency;
    system.debug(printString);
}