trigger PeopleTracing on People_Tracing__c (before insert) {
  
    switch on Trigger.OperationType{
        when BEFORE_INSERT{
            CTPeopleTracingTriggerHandler.beforeInsert(Trigger.new);
        }
       
    }     
}