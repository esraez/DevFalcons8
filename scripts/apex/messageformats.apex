///JSON///
//Account into JSON
{
    "Name" : "Universal Containers",
    "AnnualRevenue" : 2000000,
    "Industry" : "Biotechnology",
    "Type" : "New Customer"
}

//serialize method
Account acc = [SELECT Name, Type, Industry, AnnualRevenue FROM Account WHERE Name = 'United Oil & Gas Corp.' LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

