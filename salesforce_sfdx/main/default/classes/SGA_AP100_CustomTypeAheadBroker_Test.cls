/**********************************************************************************
Class Name :  SGA_AP64_ValidateNSaveAccAddr_Test
Date Created : 01/30/2018
Created By   : IDC Offshore
Description  : 1. This class is the test class for SGA_AP100_CustomTypeAheadBroker
*************************************************************************************/
@isTest(SeeAllData = false)
Private class SGA_AP100_CustomTypeAheadBroker_Test {
    public static final String GETVALIDATIONERROR = 'getValidationError';
    private static final String GETFILEUPLOADSTATUS = 'getFileUploadStatus';
    
/************************************************************************************
    Method Name : testsaveAddressinfoBoth
    Parameters  : None
    Return type : void
    Description : This is the testmethod for create medical products

*************************************************************************************/ 
    public testmethod static void medProductsTest1(){
       
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser)
       {
           Test.startTest();
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
        Account testAcc = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc);
        Account testAcc1 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc1);
        Account testAcc2 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc2);
        Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Agency/Brokerage').getRecordTypeId();
        Account gaAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountGA',Employer_EIN__c = '345234723',AgencyType__c ='General Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(gaAcc);
        Account paAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountPA',Employer_EIN__c = '345244723',AgencyType__c ='Paid Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(paAcc);
         vlocity_ins__Application__c testApplication = Util02_TestData.createApplication();
         database.insert(testApplication);
         Contact test_contact = new Contact(FirstName='George',AccountID=testAcc.Id,LastName='Harrison', Email='george@email.com', ETIN__c='345234123', AgencyType__c='Brokerage');
         database.insert(test_contact);
         AccountTeamMember act = New AccountTeamMember(AccountId=testAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(act);
         AccountTeamMember actGA = New AccountTeamMember(AccountId=gaAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actGA);
         AccountTeamMember actPA = New AccountTeamMember(AccountId=paAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actPA);
         
         Account testGrpAcc = Util02_TestData.createGroupAccount();
        database.insert(testGrpAcc);
         
         SGA_QuoteEnrollmentStage__c stageData = new SGA_QuoteEnrollmentStage__c();
         stageData.AccountID__c = testGrpAcc.id;
         stageData.GeneralAgency__c= gaAcc.Id;
         stageData.PaidAgency__c= paAcc.Id;
         database.insert(stageData,false);
         
         Map<String,Object> inputmap=new Map<String,Object>();
         Map<String,Object> outmap=new Map<String,Object>();
         Map<String,Object> optns=new Map<String,Object>();
   
         optns.put('applicationidval',testApplication.Id);
         optns.put('accountbrokerid',testAcc1.Id);
         optns.put('accountbrokeridVA',testAcc2.Id);
         optns.put('UpdateGeneralAgencyAccId',gaAcc.Id);
         optns.put('UpdatePaidAgencyAccountId',paAcc.Id);
         optns.put('memEnroll','Real-Time');
         optns.put('EnrollStageID',stageData.Id);
         Map<String,Object> groupLoad = new Map<String,Object>();
         String dataJson = '{"searchString" : "345234123"}';
         object data = (Object)(JSON.deserializeUntyped(dataJson));
         inputmap.put('GroupLoad',data);
         SGA_AP100_CustomTypeAheadBroker vgp= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres=vgp.invokeMethod('updateBrokerList',inputmap,outmap,optns);
         
         SGA_AP100_CustomTypeAheadBroker vgpfetch= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres2=vgpfetch.invokeMethod('fetchAgenciesList',inputmap,outmap,optns);
         SGA_AP100_CustomTypeAheadBroker.updateGeneralPaidAgency(testApplication.Id,testAcc.Id,test_contact.Id,testAcc.Id);
         Test.stopTest();
         
         system.assertEquals(True,ecpres);
         
      }
    }
    
/************************************************************************************
    Method Name : testsaveAddressinfoBoth
    Parameters  : None
    Return type : void
    Description : This is the testmethod for create Medical products
*************************************************************************************/ 
    public testmethod static void medProductsTest2(){
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){

        Test.startTest();
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
       Account testAcc = Util02_TestData.createBrokerAgentAccount();
          testAcc.AgencyType__c='Brokerage';
            database.insert(testAcc);
        Map<String,Object> inputmap=new Map<String,Object>();
         Map<String,Object> outmap=new Map<String,Object>();
         Map<String,Object> optns=new Map<String,Object>();
        Contact test_contact = new Contact(FirstName='George',AccountID=testAcc.Id,LastName='Harrison', Email='george@email.com', ETIN__c='%345234123%', AgencyType__c='Brokerage');
        
        database.insert(test_contact);
         optns.put('searchString','345234123'); 
         
         Map<String,Object> groupLoad = new Map<String,Object>();
         String dataJson = '{"searchString" : "345234123"}';
         object data = (Object)(JSON.deserializeUntyped(dataJson));
         inputmap.put('GroupLoad',data);
      
         SGA_AP100_CustomTypeAheadBroker vgp= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres=vgp.invokeMethod('getBrokerList',inputmap,outmap,optns);
         
         
         Test.stopTest();
         system.assertEquals(True,ecpres);
         
       }
    }
    
    
    /************************************************************************************
    Method Name : testsaveAddressinfoBoth
    Parameters  : None
    Return type : void
    Description : This is the testmethod for create Medical products
*************************************************************************************/ 
    public testmethod static void medProductsTest6(){
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){

        Test.startTest();
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
       Account testAcc = Util02_TestData.createBrokerAgentAccount();
          testAcc.AgencyType__c='Brokerage';
            database.insert(testAcc);
        Map<String,Object> inputmap=new Map<String,Object>();
         Map<String,Object> outmap=new Map<String,Object>();
         Map<String,Object> optns=new Map<String,Object>();
        Contact test_contact = new Contact(FirstName='George',AccountID=testAcc.Id,LastName='Harrison', Email='george@email.com', ETIN__c='%345234123%', AgencyType__c='Brokerage');
        
        database.insert(test_contact);
         optns.put('searchString','345234123'); 
         
         Map<String,Object> groupLoad = new Map<String,Object>();
         String dataJson = '{"searchString" : "345234123"}';
         object data = (Object)(JSON.deserializeUntyped(dataJson));
         inputmap.put('GroupLoad',data);
      
         SGA_AP100_CustomTypeAheadBroker vgp= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres=vgp.invokeMethod('getBrokerList2',inputmap,outmap,optns);
         
         
         Test.stopTest();
         system.assertEquals(True,ecpres);
         
       }
    }
/************************************************************************************
    Method Name : testsaveAddressinfoBoth
    Parameters  : None
    Return type : void
    Description : This is the testmethod for create medical products

*************************************************************************************/ 
    public testmethod static void medProductsTest3(){
       
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser)
       {
           Test.startTest();
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
        Account testAcc = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc);
        Account testAcc1 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc1);
        Account testAcc2 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc2);
        Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Agency/Brokerage').getRecordTypeId();
        Account gaAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountGA',Employer_EIN__c = '345234723',AgencyType__c ='General Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(gaAcc);
        Account paAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountPA',Employer_EIN__c = '345244723',AgencyType__c ='Paid Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(paAcc);
         vlocity_ins__Application__c testApplication = Util02_TestData.createApplication();
         database.insert(testApplication);
         Contact test_contact = new Contact(FirstName='George',AccountID=testAcc.Id,LastName='Harrison', Email='george@email.com', ETIN__c='345234123', AgencyType__c='Brokerage');
         database.insert(test_contact);
         AccountTeamMember act = New AccountTeamMember(AccountId=testAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(act);
         AccountTeamMember actGA = New AccountTeamMember(AccountId=gaAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actGA);
         AccountTeamMember actPA = New AccountTeamMember(AccountId=paAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actPA);
         
         Account testGrpAcc = Util02_TestData.createGroupAccount();
        database.insert(testGrpAcc);
          Opportunity opp = new Opportunity();

            opp.AccountId = testGrpAcc.id;
            opp.Name = 'testForSGC';
            opp.CloseDate = Date.Today();
            opp.stagename='Opportunity';
            opp.Tech_Businesstrack__c = 'SG Quoting';
            opp.Effective_Date__c =null;
            opp.Type = 'New Sales';
            opp.Name = 'Test for CA 1/1/2999 Opp - Med Den Vis Lif LTD STD';       
            insert opp;  

             Quote quote = new Quote();
                quote.name = 'Quote- TEST ACCOUNT';
                quote.opportunityId = opp.id;
                quote.General_Agency_Name__c = gaAcc.Id;
                quote.Paid_Agency_Name__c = paAcc.Id;
            insert quote;
         
         Map<String,Object> inputmap=new Map<String,Object>();
         Map<String,Object> outmap=new Map<String,Object>();
         Map<String,Object> optns=new Map<String,Object>();
   
         optns.put('applicationidval',testApplication.Id);
         optns.put('accountbrokerid',testAcc1.Id);
         optns.put('accountbrokeridVA',testAcc2.Id);
         optns.put('UpdateGeneralAgencyAccId',gaAcc.Id);
         optns.put('UpdatePaidAgencyAccountId',paAcc.Id);
         optns.put('memEnroll','Real-Time');
         optns.put('EnrollQuoteId',quote.Id);
         Map<String,Object> groupLoad = new Map<String,Object>();
         String dataJson = '{"searchString" : "345234123"}';
         object data = (Object)(JSON.deserializeUntyped(dataJson));
         inputmap.put('GroupLoad',data);
         SGA_AP100_CustomTypeAheadBroker vgp= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres=vgp.invokeMethod('updateBrokerList',inputmap,outmap,optns);
         
         SGA_AP100_CustomTypeAheadBroker vgpfetch= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres2=vgpfetch.invokeMethod('fetchAgenciesList',inputmap,outmap,optns);
         
         Test.stopTest();
         
         system.assertEquals(True,ecpres);
         
      }
    }
/************************************************************************************
    Method Name : testsaveAddressinfoBoth
    Parameters  : None
    Return type : void
    Description : This is the testmethod for create medical products

*************************************************************************************/ 
    public testmethod static void medProductsTest4(){
       
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser)
       {
           Test.startTest();
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
        Account testAcc = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc);
        Account testAcc1 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc1);
        Account testAcc2 = Util02_TestData.createBrokerAgentAccount();
        database.insert(testAcc2);
        Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Agency/Brokerage').getRecordTypeId();
        Account gaAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountGA',Employer_EIN__c = '345234723',AgencyType__c ='General Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(gaAcc);
        Account paAcc= new Account(recordtypeId=grpRecordTypeId,Name='Test AccountPA',Employer_EIN__c = '345244723',AgencyType__c ='Paid Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        database.insert(paAcc);
         vlocity_ins__Application__c testApplication = Util02_TestData.createApplication();
         database.insert(testApplication);
         Contact test_contact = new Contact(FirstName='George',AccountID=testAcc.Id,LastName='Harrison', Email='george@email.com', ETIN__c='345234123', AgencyType__c='Brokerage');
         database.insert(test_contact);
         AccountTeamMember act = New AccountTeamMember(AccountId=testAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(act);
         AccountTeamMember actGA = New AccountTeamMember(AccountId=gaAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actGA);
         AccountTeamMember actPA = New AccountTeamMember(AccountId=paAcc.Id,TeamMemberRole='Broker',AccountAccessLevel = 'Read',OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read',UserId = testUser.Id);
         database.insert(actPA);
         
         Account testGrpAcc = Util02_TestData.createGroupAccount();
        database.insert(testGrpAcc);
          Opportunity opp = new Opportunity();

            opp.AccountId = testGrpAcc.id;
            opp.Name = 'testForSGC';
            opp.CloseDate = Date.Today();
            opp.stagename='Opportunity';
            opp.Tech_Businesstrack__c = 'SG Quoting';
            opp.Effective_Date__c =null;
            opp.Type = 'New Sales';
            opp.Name = 'Test for CA 1/1/2999 Opp - Med Den Vis Lif LTD STD';       
            insert opp;  

             Quote quote = new Quote();
                quote.name = 'Quote- TEST ACCOUNT';
                quote.opportunityId = opp.id;
                quote.General_Agency_Name__c = gaAcc.Id;
                quote.Paid_Agency_Name__c = paAcc.Id;
            insert quote;
         
         Map<String,Object> inputmap=new Map<String,Object>();
         Map<String,Object> outmap=new Map<String,Object>();
         Map<String,Object> optns=new Map<String,Object>();
   
         optns.put('applicationidval',testApplication.Id);
         optns.put('UpdateGeneralAgencyAccId',gaAcc.Id);
         optns.put('UpdatePaidAgencyAccountId',paAcc.Id);
         optns.put('memEnroll','Real-Time');
         optns.put('EnrollQuoteId',quote.Id);
         SGA_AP100_CustomTypeAheadBroker vgp= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres=vgp.invokeMethod('updateBrokerList',inputmap,outmap,optns);
         
         SGA_AP100_CustomTypeAheadBroker vgpfetch= new SGA_AP100_CustomTypeAheadBroker();
         Boolean ecpres2=vgpfetch.invokeMethod('fetchAgenciesList',inputmap,outmap,optns);
         
         Test.stopTest();
         
         system.assertEquals(True,ecpres);
         
      }
    }
    
}