public class Candidates {
    public string Name;
    public string Gender;
    public static string CompanyName;

    public void printCandidate(){
        system.debug('====START====');
        system.debug('Candidate Name is' + Name + '(' + Gender +')');
        system.debug('Company Name is '+ CompanyName);
        system.debug('====END====');
    } 
}
