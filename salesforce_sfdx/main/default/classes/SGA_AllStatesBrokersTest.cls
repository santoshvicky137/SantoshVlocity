@isTest(seeAllData = true)
public class SGA_AllStatesBrokersTest {


    public static testMethod void getAllStatesBrokerListTest(){
        Account testAcc = Util02_TestData.createGroupAccount();
        testAcc.AgencyType__c ='General Agency';
        Database.insert(testAcc);
        Contact con = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@example.com', AccountId = testAcc.Id);
        insert con;
        User testUser = Util02_TestData.createPortalUser(con);
        
        System.runAs(testUser){
            SGFOA_BrokerLogic__c settings = SGFOA_BrokerLogic__c.getOrgDefaults();
            settings.Use_Party_Relationship__c = true;
            upsert settings SGFOA_BrokerLogic__c.Id;
            
            Contact test_contact = new Contact(FirstName='George', LastName='Harrison', Email='george@email.com', ETIN__c='123456789', AgencyType__c='Brokerage');
            insert test_contact;
            
            Id [] fixedBrokerSearchResults= new Id[1];
            fixedBrokerSearchResults[0] = test_contact.Id;
            test.setFixedSearchResults(fixedBrokerSearchResults);
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);
            SmallGroupSIC__c sic = Util02_TestData.createGroupSIC();
            Map<String,Object> inputMap=new Map<String,Object>();
            Map<String,Object> outputMap=new Map<String,Object>();
            Map<String,Object> options=new Map<String,Object>();
            Test.startTest();
            options.put('searchString', '12345');
            inputMap.put('ZipCode3','10005');
            vlcCustomTypeAhead vcta = new vlcCustomTypeAhead();
            Boolean validateGetbrokerList = vcta.invokeMethod('getAllStatesBrokerList', inputMap, outputMap, options);
            Test.stopTest();
            System.assertEquals(validateGetbrokerList, true);
        }
    }
    public static testMethod void getBrokerListPartyRelationshipTest(){
        ID conRT = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Producer').getRecordTypeId();
        ID AccRT = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Agency/Brokerage').getRecordTypeId();            
        Account testAcc = Util02_TestData.createGroupAccount();
        testAcc.RecordTypeId = AccRT;
        testAcc.AgencyType__c ='General Agency';
        Database.insert(testAcc);
        Contact con = new Contact(FirstName = 'Test', 
                                LastName = 'User', Email = 'test@example.com', 
                                AccountId = testAcc.Id,AgencyType__c='Brokerage',
                                RecordTypeId = conRT);
        insert con;
        Profile p2 = [SELECT Id From Profile where Name='Anthem SG Broker'];
        User testUser = new User(
            Alias = 'newUser',
            IsActive = true,
            Email=con.Email, 
            EmailEncodingKey='UTF-8',
            LastName='Testing',
            LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US',
            ProfileId = p2.Id, 
            TimeZoneSidKey='America/Los_Angeles',
            UserName='standardUSER989999@testOrg.com'+DateTime.now().millisecond(),
        ContactId = con.Id);
        insert testUser;
        License_Appointment__c license = Util02_TestData.Licence();
        license.BR_Type__c = 'License';
        license.BR_State__c = 'CA';
        license.SGA_Provider__c = testUser.ContactId;
        //license.SGA_AgencyBrokerage__c = testUser.AccountId;
        Database.insert(license);

        System.runAs(testUser){
            SGFOA_BrokerLogic__c settings = SGFOA_BrokerLogic__c.getOrgDefaults();
            settings.Use_Party_Relationship__c = true;
            upsert settings SGFOA_BrokerLogic__c.Id;
            test.startTest();
            List<contact> conList = SGA_AllStatesBrokers.getBrokerListPartyRelationship('Test ','CA');
            List<contact> conList2 = SGA_AllStatesBrokers.getBrokerListPartyRelationship('Test ','NY');
            List<contact> conList3 = SGA_AllStatesBrokers.getBrokerListWithSharing('Test ','CA');
            List<contact> conList4 = SGA_AllStatesBrokers.getBrokerListWithSharing('Test ','NY');
            Map<String, String> conMap = SGA_AllStatesBrokers.createContactMap(con);
            test.stopTest();
        }      
    }
    
    
}