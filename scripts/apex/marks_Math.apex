map<string,integer> marksObtainInMath = new map<string,integer>();
marksObtainInMath.put('0111CE112',40);
marksObtainInMath.put('0111CE102',19);
marksObtainInMath.put('0111CE100',33);
marksObtainInMath.put('0111CE098',40);
marksObtainInMath.put('0111CE081',24);
marksObtainInMath.put('0111CE070',30);
marksObtainInMath.put('0111CE005',49);

set<string>  uniqueRollNumberSet = marksObtainInMath.keySet();
list<integer> marksObtainList = marksObtainInMath.values();

for (string eachKey:uniqueRollNumberSet){
    system.debug('Student Roll number is =' +eachKey);
}
for (integer eachMark:marksObtainList){
    system.debug('Mark obtained= '+ eachMark);
}
for (string eachKey:uniqueRollNumberSet){
    integer mark = marksObtainInMath.get(eachKey);
    if (mark<20){
        system.debug(eachKey +' '+ 'is not qualified for next class');
    }
}

system.debug('All Marks Obtained =' + marksObtainList);
system.debug('All Student Roll Numbers =' + uniqueRollNumberSet);