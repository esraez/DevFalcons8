//Get an opportunity record whose amount is greater than 1M
Opportunity opp =[SELECT ID,name, amount FROM OPPORTUNITY WHERE AMOUNT>1000000 LIMIT 1];
//Convert that into json and debug it
String jsonString = JSON.serialize(opp);
System.debug(jsonString);
//Get a lead record whose email and phone are populated
Lead ld = [SELECT ID,name,name, phone, email FROM LEAD WHERE phone!=Null AND email!=Null LIMIT 1];
//convert that record into json format and print it using debug
String jsonString = JSON.serialize(ld);
System.debug(jsonString);
//list of all leads whose Email and Company are populated
list<lead> allLeads =[SELECT ID,name,company, phone, email FROM LEAD WHERE company!=Null AND email!=Null];
String jsonString = JSON.serialize(allLeads);
System.debug(jsonString);
//get all opportunities (Name, amount,stagename) whose stagename is closed won
list<Opportunity>  listopp =[SELECT ID,name, amount,stagename FROM OPPORTUNITY WHERE stagename= 'Closed Won'];
String jsonString = JSON.serialize(listopp);
System.debug(jsonString);
//get 2 cases(casenmber,subject,description,contact.firstname,contact.lastname, account.name) where subject & desc is not null
//convert them into json format
list<Case> listCases = [SELECT ID,casenumber,subject, Contact.Firstname,Contact.lastname, Account.Name FROM CASE WHERE subject!=Null limit 2];
String jsonString = JSON.serialize(listCases);
System.debug(jsonString);