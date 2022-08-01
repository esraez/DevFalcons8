public class StringDemoClass {
    public void stringMethod1() {
        //variable name
        String sessionDescription = 'learning string method in apex language';
        system.debug('sessionDescription=' + sessionDescription);
        //length
        integer lengthOfStr = sessionDescription.length();
        system.debug('length of string is=' + lengthOfStr);
        string sessionDescriptionCaps = sessionDescription.toUpperCase();
        system.debug('sessionDescription in caps=' + sessionDescriptionCaps);
        string a='apex';
        Boolean containsApex=sessionDescription.contains(a);
        system.debug('has apex?'+containsApex);
        Boolean containsSF=sessionDescription.contains('salesforce');
        system.debug('has salesforce?'+containsSF);
        Boolean containsApex2=sessionDescription.contains('APEX');
        system.debug('has APEX?'+containsApex2);
        //'Apex' 'APEX' 'apeX' 'APeX' will be all true
        Boolean containsApex3 = sessionDescription.containsIgnoreCase('APEX');
        system.debug('has APEX?'+containsApex3);
        Boolean containsApex4 = sessionDescription.containsAny('APX');
        system.debug('has APEX?'+containsApex4);
    }
}
