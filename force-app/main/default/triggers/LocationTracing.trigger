trigger LocationTracing on Location_Tracing__c (before insert) {
   switch on Trigger.OperationType{
       when BEFORE_INSERT{
        LocationTracingTriggerHandler.beforeInsert(Trigger.new);
       }
   }
}