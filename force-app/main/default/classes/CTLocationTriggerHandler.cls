public with sharing class CTLocationTriggerHandler {
    public static void beforeInsert(List<location__c> newRecords){
        

         for(location__c location :newRecords){
             location.Status__c = 'Green';
         } 
    } 
         
    public static void beforeUpdate(List<location__c>  newRecords, Map<Id , location__c> oldMapRecord){
         for(location__c location: newRecords){
                if(location.Status__c != oldMapRecord.get(location.Id).Status__c){
                    location.Status_Update_Date__c = Date.today();
                }
         }
         
    }

    public static void afterUpdate(List<location__c>  newRecords, Map<Id , location__c> oldMapRecord){
        Set<Id> statusChange = new Set<Id>();
        for(location__c location: newRecords){
            if(location.Status__c =='Red' && oldMapRecord.get(location.id).Status__c !='Red'){
                statusChange.add(location.Id);
            }
        }

        List<Location_Tracing__c> locationTraces = CTLocationTracingController.getLocationsByLocationIds(statusChange);
        Set<Id> personIds = new Set<Id>();
        
        for(Location_Tracing__c traces :locationTraces){
            personIds.add(traces.Person__c);
        }

        List<Person__c> personToUpdate = new List<Person__c>();
        for(Id pid: personIds){
            personToUpdate.add(new Person__c(Id =pid, Health_Status__c ='Yellow'));
        }
        if(personToUpdate.size() >0){
            update personToUpdate;
        }
     }
}
