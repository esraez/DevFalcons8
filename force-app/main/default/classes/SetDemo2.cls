public  class SetDemo2 {
    public static Set<string> capitalizeSetString(set<string> stringSet) {
        Set<string> capsSet = new Set<string>();
        for(string eachStr: stringSet){
            string tempstr = eachStr.toUpperCase();
            capsSet.add(tempstr);
        }
        return capsSet;
    }
}
