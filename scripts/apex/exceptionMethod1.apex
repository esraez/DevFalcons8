try{
    Account acc = new account();
    insert acc;
} catch(DmlException dex){
    system.debug('DML went wrong');

}catch(Exception ex){
    system.debug('somethig went wrong.');
}
system.debug('Apex is simple');