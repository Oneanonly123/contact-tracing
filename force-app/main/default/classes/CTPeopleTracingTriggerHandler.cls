public with sharing class CTPeopleTracingTriggerHandler {
  public static void beforeInsert(List<People_Tracing__c> newRecords){
      List<People_Tracing__c> duplicates =CTPeopleTracingController.checkDuplicates(newRecords);
      

      for(People_Tracing__c traces: duplicates){
           traces.addError('Duplicate Record Found. Person 1'+ traces.Person_1__c + 'Person 2:' + traces.Person_2__c);
      }

  }
}
