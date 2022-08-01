public  class PrimitiveDataTypeDemo {
   public void printBasicDataType(){
        string batchName='Falcons 8';
        integer totalCandidates=40;
        boolean isAdminCompleted=true;
    
        system.debug(batchName);
        system.debug(totalCandidates);
        system.debug(isAdminCompleted);

        string batchDescription= batchName+ ' ' +'are the best';
        system.debug(batchDescription);

   }    
   public void printBasicDataType2(){
        decimal decValue=27.01;
        long longValue=2147483648L;
        ID id1='0015i00000BFSCtAAP'

        system.debug('Decimal value='+ decValue);
        system.debug('Long value='+longValue);
        system.debug('ID is='+ id1);
}

}