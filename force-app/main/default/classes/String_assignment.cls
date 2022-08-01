public  class String_assignment {
    public void String_method(){
        String Localstring = 'Thanks for the session on the string';
        integer lengthOfLclStr = Localstring.length();
        system.debug('length of string is= ' + lengthOfLclStr);
        string LclStrCaps = Localstring.toUpperCase();
        system.debug('Local string in caps ' + LclStrCaps);
        string a='session';
        Boolean contains_a=Localstring.contains(a);
        system.debug('has session? '+contains_a);
        string b='sessions';
        Boolean contains_b=Localstring.contains(b);
        system.debug('has sessions? '+contains_b);
        string c='SESSION';
        Boolean contains_c=Localstring.contains(c);
        system.debug('has SESSION? '+contains_c);
    }
}
