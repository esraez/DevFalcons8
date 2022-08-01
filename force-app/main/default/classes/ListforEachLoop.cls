public  class ListforEachLoop {
    public static void iterateListInteger() {
        List<Integer> integerList = new list<integer>();
        integerList.add(10);
        integerList.add(15);
        integerList.add(21);
        integerList.add(15);
        integerList.add(15);
        system.debug('list of random integers = ' + integerList);

        for(integer eachInteger : integerList){
            system.debug(eachInteger);
        }
    }
    public static integer add(list<integer> listInt){
        integer returnInt = 0;
        for( integer eachInteger: listInt){
            returnInt += eachInteger;
        }
        return returnInt;
    }
}
