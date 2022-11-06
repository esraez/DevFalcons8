public with sharing class CommonUtility {
    public static void createLog(string targetName,string targetType, string stackTrace, string logType,string exceptionType,string exceptionMessage, String errorRecords){
        Application_Log__c log = new Application_Log__c();
        log.Target_Name__c = targetName;
        log.target_Type__c = targetType;
        log.Stack_Trace__c = stackTrace;
        log.log_Type__c = logType;
        log.exception_Type__c = exceptionType;
        log.exception_Message__c = exceptionMessage;
        log.Error_Records__c= errorRecords;
        insert log;
    }
}
