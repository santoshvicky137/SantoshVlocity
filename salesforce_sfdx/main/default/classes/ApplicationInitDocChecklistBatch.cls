global class ApplicationInitDocChecklistBatch implements Database.Batchable<sObject>, Database.AllowsCallouts,Database.Stateful{
/*
** Updated by Muthu on 2021-04-08 to use Is_Submitted_from_API__c  for automatic documen checklist creation for the defect SMGR-42449
*/
    global Set<Id> appsIdList {get;set;}
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query='Select Id, Initial_DocChecklist__c, Application_Number__c, Is_Submitted_from_API__c ' 
                    +' ,(Select Id From Document_Checklist__r) '
                    +' From vlocity_ins__Application__c where Id in :appsIdList';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {

        for(SObject sobj:scope) {
            vlocity_ins__Application__c vapp = (vlocity_ins__Application__c) sobj;
            System.debug('--- InitDocCheckList execute 100 Initial_DocChecklist__c='+vapp.Initial_DocChecklist__c);
            if(Test.isRunningTest() || ((vapp.Document_Checklist__r == null || vapp.Document_Checklist__r.size()==0) 
            && !String.isEmpty(vapp.Application_Number__c)
            && vapp.Is_Submitted_from_API__c)) {                           
                SG01_CreateDocument_Checklist docCheck = new SG01_CreateDocument_Checklist();
                Map<String,Object> options = new Map<String,Object>();
                options.put('applicationidval',vapp.Id);
                docCheck.createDocCheckList(new Map<String,Object>(), new Map<String,Object>(),options);
            }   
        }        
    }   
    
    global void finish(Database.BatchableContext BC) {

    }
}