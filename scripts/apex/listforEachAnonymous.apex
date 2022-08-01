List<string> listCandidate = new List<string>();
listCandidate.add('Marc'); // 0
listCandidate.add('Elon');
listCandidate.add('Bill');
listCandidate.add('Marc'); // 3
//print each element in uppercase one by one
for(string eachCand:listCandidate){
    system.debug(eachCand.toUpperCase()); 
}
            
     