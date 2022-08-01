public  class ListDemo2 {
    public static void allCats() {
    //create new list of cat
    List<cat> cats = new list<cat>();
    //how to add elements
    //first make new instances of class
    //then add those instances as elements to the list
    cat falconsCat = new cat('fluffykins','white');
    cat vitapsCat = new cat('Simba','brown');

    cats.add(falconsCat);
    cats.add(vitapsCat);
    cats.add(falconsCat);
    system.debug('all cats= '+ cats);
    if(!cats.isEmpty()){
        cat catAt2 = cats[2];
        system.debug('cat at index 2 is '+catAt2 );
    }
   
    }
}
