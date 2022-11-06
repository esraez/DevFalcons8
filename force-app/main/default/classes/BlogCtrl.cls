public with sharing class BlogCtrl {
    @AuraEnabled(cacheable=true)
    public static list<Blog__c> getAllBlogs(){
        return [SELECT Name, Author__c, Topic__c, Title__c,Body__c FROM Blog__c WITH SECURITY_ENFORCED];
    }

/*
* Get all the topics names from bllog records
* refine them just to have unique topic names
*/
@AuraEnabled(cacheable=true)
public static list<String> getTopicNames(){
    Set<string> topics = new set<string>();
    for(Blog__c blog:[SELECT Topic__c FROM Blog__c]){
        topics.add(blog.Topic__c);
    }
    list<string> topicNames = new list<string>();
    topicNames.addAll(topics);
    return topicNames;
}
@AuraEnabled
public static List<Blog__c> getBlogsByTopic(string topic){
    return [SELECT Name, Topic__c, Author__c, Title__c, Body__c
            FROM Blog__c
            WHERE Topic__c = :topic
            WITH SECURITY_ENFORCED];
}
}