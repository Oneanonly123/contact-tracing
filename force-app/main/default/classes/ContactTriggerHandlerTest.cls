@isTest

public with sharing class ContactTriggerHandlerTest {
    @isTest

    public static void afterInsertHandlerTest(){
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name= 'Test 1'));
        testAccounts.add(new Account(Name= 'Test 2'));
   
     insert testAccounts;

     List<Contact> testContacts = new List<Contact>();

     testContacts.add(new Contact(LastName = 'Test Contact 1' , AccountId =testAccounts[0].Id));
     testContacts.add(new Contact(LastName = 'Test Contact 1' , AccountId = testAccounts[0].Id));
     testContacts.add(new Contact(LastName = 'Test Contact 1' , AccountId = testAccounts[0].Id));
     testContacts.add(new Contact(LastName = 'Test Contact 1' , AccountId =testAccounts[1].Id));
 

     insert testContacts;

    /// soql query in test classes only retreive the test data created in test classes


    List<Account> accs = [Select Id, Active__c FROM Account];
    
    System.assertEquals(2, accs.size());
    System.assertEquals(null , accs[0].Active__c);  

    }

   


}
