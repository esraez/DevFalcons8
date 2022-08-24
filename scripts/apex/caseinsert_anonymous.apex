List<case> listCase = [select id, subject from case];
for (case c : listCase) {
    c.Subject += '2';
}
update listCase;

list<case> caseList = new list<case>();
for(Integer i=0;i<205; i++){
    case c = new case();
    c.Subject = 'there is a bug -v' +i;
    c.Description = 'Please resolve it';
    c.Origin = 'Web';
    c.Status = 'New';
    caseList.add(c);    
}
insert caseList;