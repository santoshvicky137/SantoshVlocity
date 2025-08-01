/*@author       Accenture IDC
@date           7/2/2018
@name           SGA_AP63_BrokerRelatedAgencies_Test
@description    Test class to test the SGA_AP63_BrokerRelatedAgencies class.
*/
@isTest
private class SGA_AP63_BrokerRelatedAgencies_Test {
    @testSetup static void methodName() {
        Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Agency/Brokerage').getRecordTypeId();
        Account testGrpAccount = new Account(recordtypeId=grpRecordTypeId,Name='Test Account1',Employer_EIN__c = '345234123',AgencyType__c ='General Agency',Tech_Businesstrack__c='SGQUOTING',Company_State__c = 'NY');
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        Database.insert(cs001List);
        Database.insert(testGrpAccount);
        Contact contactProd = Util02_TestData.producerContact('Test','Prod','123@anthem.com',testGrpAccount.id);
        Database.insert(contactProd);
        Geographical_Info__c geo = Util02_TestData.createGeoRecord();
        system.debug('geo:'+geo);
        Database.insert(geo);
        vlocity_ins__Party__c party = Util02_TestData.CreatePartydata();
        party.vlocity_ins__AccountId__c = contactProd.AccountId;
        party.vlocity_ins__ContactId__c = contactProd.id;
        Database.insert(party);
        vlocity_ins__PartyRelationshipType__c PrtyRType = Util02_TestData.CreatePartyRltnTypedata();
        //PrtyRType.vlocity_ins__TargetRole__c = 'General Agency';
        PrtyRType.vlocity_ins__TargetRole__c = 'Paid Agency';
        Database.insert(PrtyRType);
        vlocity_ins__PartyRelationship__c partyRelation = Util02_TestData.CreatePartyRltndata(party);
        partyRelation.vlocity_ins__RelationshipTypeId__c = PrtyRType.id;
        Database.insert(partyRelation);
    }
    
/************************************************************************************
Method Name : TestGetBroker
Parameters  : None
Return type : void
Description : This is testmethod for getting BrokerId as per the agency type and Zipcode 
*************************************************************************************/
    private static testMethod void TestGetBroker(){
        // try{
        
        Contact con = [Select Id from Contact LIMIT 1];
       // Profile portalProfile = [SELECT Id FROM Profile where name =: SG01_Constants.PNAME_TEST Limit 1];
       Profile portalProfile = [SELECT Id FROM Profile where name = 'SWAT Sales Support' Limit 1];
       
       
       //UserRole r = [SELECT Id,DeveloperName from Userrole where Developername='x0013r00002Mwv5sPartnerUser' Limit 1];
       UserRole r = [SELECT Id,DeveloperName from Userrole where Developername='SWAT_Sales_Support_User' Limit 1];
       
       
            /*User user1 = new User(Username = System.now().Second() + SG01_Constants.USERNAME_TEST+'1',
                                  ContactId = con.Id, ProfileId = portalProfile.Id,
                                  Alias = SG01_Constants.ALIAS_TEST, Email = SG01_Constants.USERNAME_TEST,
                                  EmailEncodingKey = SG01_Constants.ENCODING_TEST,
                                  LastName = SG01_Constants.LNAME_TEST, CommunityNickname = SG01_Constants.NICKNAME_TEST,
                                  TimeZoneSidKey = SG01_Constants.TIMEZONE_TEST, LocaleSidKey = SG01_Constants.LOCALE_TEST,
                                  LanguageLocaleKey = SG01_Constants.LANG_TEST);*/
            User user1 = new User(Username = System.now().Second() + SG01_Constants.USERNAME_TEST+'1',
                                   ProfileId = portalProfile.Id,
                                  Alias = SG01_Constants.ALIAS_TEST, Email = SG01_Constants.USERNAME_TEST,
                                  EmailEncodingKey = SG01_Constants.ENCODING_TEST,
                                  LastName = SG01_Constants.LNAME_TEST, CommunityNickname = SG01_Constants.NICKNAME_TEST,
                                  TimeZoneSidKey = SG01_Constants.TIMEZONE_TEST, LocaleSidKey = SG01_Constants.LOCALE_TEST,
                                  LanguageLocaleKey = SG01_Constants.LANG_TEST);
            Database.insert(user1);
            
            
            
            system.debug('<<<<:'+user1.Id);
            System.runAs(user1){
                Test.startTest();
                    Map<String,Object> inputmap=new Map<String,Object>();
                    Map<String,Object> options=new Map<String,Object>();
                    Map<String,Object> outputmap=new Map<String,Object>();
                    Map<String,String> retMap=new Map<String,String>();
                    List<Map<String,String>> retList = new List<Map<String,String>>();
                    retMap.put('test1','test2');
                    retList.add(retMap);
                    String methodName='getAgencyList';                     
                    inputmap.put('ZipCode3','12766');
                    //inputmap.put('Step','1');
                    options.put('AgencyType','General Agency');                                 
                    SGA_AP63_BrokerRelatedAgencies brage=new SGA_AP63_BrokerRelatedAgencies();
                    brage.blockMap = new map<string,Object>();
                    brage.blockMap.put('BrokerId',con.id);
                    //brage.blockMap.put('BrokerId',testUser.id);
                    brage.returnList = retList;
                    Boolean brokr= brage.invokeMethod(methodName,inputmap,outputmap,options); 
                    
                    brage.invokeMethod('sgQuoteInitialization',inputmap,outputmap,options);
                    brage.invokeMethod('getVendorList',inputmap,outputmap,options);
                
                Test.stopTest();
                
                system.assertEquals(True, brokr);
            }
       /* }catch(exception ex){
            system.debug('Exception -->'+ex.getMessage());
        }*/
    }
    
    private static testMethod void TestGetPaidAgencyBroker(){
       // try{
            Contact con = [Select Id from Contact LIMIT 1];
            //UserRole r = [SELECT Id,DeveloperName from Userrole where Developername='x0013r00002Mwv5sPartnerUser' Limit 1];
            UserRole r = [SELECT Id,DeveloperName from Userrole where Developername='SWAT_Sales_Support_User' Limit 1];
            //Profile portalProfile = [SELECT Id FROM Profile where name =: SG01_Constants.PNAME_TEST Limit 1];
             Profile portalProfile = [SELECT Id FROM Profile where name = 'SWAT Sales Support' Limit 1];
            User user1 = new User(Username = System.now().Second() + SG01_Constants.USERNAME_TEST+'1',
                                  ProfileId = portalProfile.Id,
                                  Alias = SG01_Constants.ALIAS_TEST, Email = SG01_Constants.USERNAME_TEST,
                                  EmailEncodingKey = SG01_Constants.ENCODING_TEST,
                                  LastName = SG01_Constants.LNAME_TEST, CommunityNickname = SG01_Constants.NICKNAME_TEST,
                                  TimeZoneSidKey = SG01_Constants.TIMEZONE_TEST, LocaleSidKey = SG01_Constants.LOCALE_TEST,
                                  LanguageLocaleKey = SG01_Constants.LANG_TEST);
            Database.insert(user1);
            
            
            
            System.runAs(user1){
                Test.startTest();
                    Map<String,Object> inputmap=new Map<String,Object>();
                    Map<String,Object> options=new Map<String,Object>();
                    Map<String,Object> outputmap=new Map<String,Object>();
                    Map<String,String> retMap=new Map<String,String>();
                    List<Map<String,String>> retList = new List<Map<String,String>>();
                    retMap.put('test1','test2');
                    retList.add(retMap);
                    String methodName='getAgencyList';                     
                    inputmap.put('ZipCode3','12766');
                    options.put('AgencyType','Paid Agency'); 
                    options.put('BrokerId',con.id);
                    SGA_AP63_BrokerRelatedAgencies brage=new SGA_AP63_BrokerRelatedAgencies();
                    brage.blockMap = new map<string,Object>();
                    brage.blockMap.put('BrokerId',con.id);
                    //brage.blockMap.put('BrokerId',testUser.id);
                    //brage.returnList = retList;
                    Boolean brokr= brage.invokeMethod(methodName,inputmap,outputmap,options); 
                    
                    brage.invokeMethod('sgQuoteInitialization',inputmap,outputmap,options);
                    brage.invokeMethod('getVendorList',inputmap,outputmap,options);
                
                Test.stopTest();
                system.assertEquals(True, brokr);
            }
        /*}catch(exception ex){
            system.debug('Exception -->'+ex.getMessage());
        }*/
    }   
    
/************************************************************************************
Method Name : TestMyexception
Parameters  : None
Return type : void
Description : This is testmethod for testing Negative Scenario
*************************************************************************************/           
private static testMethod void TestMyexception(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);
            vlocity_ins__Party__c party = Util02_TestData.CreatePartydata();
            party.vlocity_ins__AccountId__c = contactProd.AccountId;
            party.vlocity_ins__ContactId__c = contactProd.id;
            Database.insert(party);
            vlocity_ins__PartyRelationshipType__c PrtyRType = Util02_TestData.CreatePartyRltnTypedata();
            PrtyRType.vlocity_ins__TargetRole__c = 'GENERAL AGENCY';
            Database.insert(PrtyRType);
            vlocity_ins__PartyRelationship__c partyRelation = Util02_TestData.CreatePartyRltndata(party);
            partyRelation.vlocity_ins__RelationshipTypeId__c = PrtyRType.id;
            Database.insert(partyRelation);
            Test.startTest();
            Map<String,Object> inputmap=new Map<String,Object>();
            Map<String,Object> options=new Map<String,Object>();
            Map<String,Object> outputmap=new Map<String,Object>();
            String methodName='getAgencyList';                     
            inputmap.put('ZipCode3','12766');
            options.put('AgencyType','General Agency');                                 
            SGA_AP63_BrokerRelatedAgencies brage=new SGA_AP63_BrokerRelatedAgencies();
            brage.blockMap = new map<string,Object>();
            brage.blockMap.put('BrokerId',null);  
            Boolean brokr= brage.invokeMethod(methodName,inputmap,outputmap,options); 
            Test.stopTest();
            system.assertEquals(True, brokr);
        }
    }        
}