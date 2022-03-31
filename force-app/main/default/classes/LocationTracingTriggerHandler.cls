public with sharing class LocationTracingTriggerHandler {
 public static void beforeInsert(List<Location_Tracing__c> newRecords){
      List<Location_Tracing__c> duplicates = CTLocationTracingController.checkDuplicates(newRecords);

      for(Location_Tracing__c traces : duplicates){
          traces.addError('Location AlreadY Exist. Location Id' + traces.Location__c);
      }
 }
}
