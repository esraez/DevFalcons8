public with sharing class CaseTriggerHandler {
    public static integer countTriggerExecution = 0;
    public static integer countRecordsUpdate = 0;
    public static void createDefaultTask(list<case> caseTriggerNew){
        list<task> createTasks = new list<task>();
        list<case> newlist = new list<case>();s
        for(case eachCase: caseTriggerNew){
            task t = new task();
            t.subject = 'Email';
            t.Priority = 'Normal';
            t.WhoId = eachCase.ContactId;
            t.WhatId= eachCase.Id;
            t.ActivityDate = date.today();
            createTasks.add(t);
        }
        if(!createTasks.isEmpty())
            insert createTasks;
    }
}
