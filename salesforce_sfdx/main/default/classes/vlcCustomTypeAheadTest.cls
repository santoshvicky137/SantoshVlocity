/****************************************************************************
Class Name  :  vlcCustomTypeAheadTest
Created By  :  Vlocity
Description : Test class for vlcCustomTypeAhead
****************************************************************************/

@isTest(seeAllData = true)
public class vlcCustomTypeAheadTest{
    private static final String NY_STATE='NY';
    public testmethod static void vlcCustomTypeAheadMethod(){
        
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        
        test.startTest();
        vlcCustomTypeAhead vss = new vlcCustomTypeAhead();
        
        
        /* Account Test */
        Contact con = new Contact(FirstName = 'Test', LastName = 'User', Email = 'test@example.com');
        insert con;
        
        Id RecordType_Id = [Select Id from RecordType where sObjectType = 'Account' AND Name = 'Agency'].Id;
        Account test_account = new Account(Name='General Account', Employer_EIN__c='123456789', RecordTypeId = RecordType_Id);
        test_account.Sic = '1234';
        test_account.Primary_Contact__c = con.Id;
        insert test_account;
        
        Account test_account2 = new Account(Name='General Test Account', Employer_EIN__c='12345678', RecordTypeId = RecordType_Id);
        test_account2.Type = 'Enrolled';
        test_account2.Sic = '1234';
        insert test_account2;
        
        Opportunity opp = Util02_TestData.createGrpAccOpportunity();
        opp.AccountId = test_account.Id;
        opp.Type = 'New Sales';
        Database.insert(opp);
        
        Quote qt = Util02_TestData.createQuote();
        qt.Opportunityid = opp.id;
        qt.Status = 'Approved';
        Database.insert(qt);
        
        Id [] fixedAccountSearchResults= new Id[2];
        fixedAccountSearchResults[0] = test_account.Id;
        fixedAccountSearchResults[1] = test_account2.Id;
        test.setFixedSearchResults(fixedAccountSearchResults);
        
        options.put('searchString', 'General');
        Boolean validateAccountsList = vss.invokeMethod('getAccountsList', inputMap, outMap, options);
        System.assertEquals(validateAccountsList, true);
        
        /* General Agency Test */
        Account test_generalagency = new Account(Name='General Account', BR_Encrypted_TIN__c='123456789', RecordTypeId = RecordType_Id, AgencyType__c='General Agency');
        insert test_generalagency;
        
        Id [] fixedGeneralAgencySearchResults= new Id[1];
        fixedGeneralAgencySearchResults[0] = test_generalagency.Id;
        test.setFixedSearchResults(fixedGeneralAgencySearchResults);
        
        Boolean validateGeneralAgencyList = vss.invokeMethod('getGeneralAgencyList', inputMap, outMap, options);
        System.assertEquals(validateGeneralAgencyList, true);
        
        /* Paid Agency Test */
        Account test_paidagency = new Account(Name='General Account', BR_Encrypted_TIN__c='123456789', RecordTypeId = RecordType_Id, AgencyType__c='Paid Agency');
        insert test_paidagency;
        
        Id [] fixedPaidAgencySearchResults= new Id[1];
        fixedPaidAgencySearchResults[0] = test_paidagency.Id;
        test.setFixedSearchResults(fixedPaidAgencySearchResults);
        
        Boolean validatePaidAgencyList = vss.invokeMethod('getPaidAgencyList', inputMap, outMap, options);
        System.assertEquals(validatePaidAgencyList, true);
        
        /* Contact Test */
        Contact test_contact = new Contact(FirstName='George', LastName='Harrison', Email='george@email.com', ETIN__c='123456789', AgencyType__c='Brokerage');
        insert test_contact;
        
        Id [] fixedContactSearchResults= new Id[1];
        fixedContactSearchResults[0] = test_contact.Id;
        test.setFixedSearchResults(fixedContactSearchResults);
        
        options.put('searchString', 'George');
        Boolean validateBrokerList = vss.invokeMethod('getBrokerList', inputMap, outMap, options);
        System.assertEquals(validateBrokerList, true);
        test.stopTest();
    }
    /************************************************************************************
Method Name : TestGetBrokerlist
Parameters  : None
Return type : void
Description : 
*************************************************************************************/
    private static testMethod void TestGetBrokerlist(){
        Account testAcc = Util02_TestData.createGroupAccount();
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
            Test.startTest();
            Map<String,Object> inputMap=new Map<String,Object>();
            Map<String,Object> outputMap=new Map<String,Object>();
            Map<String,Object> options=new Map<String,Object>();
            options.put('searchString', '12345');
            inputMap.put('ZipCode3','10005');
            vlcCustomTypeAhead vcta = new vlcCustomTypeAhead();
            Boolean validateGetbrokerList = vcta.invokeMethod('getAllStatesBrokerList', inputMap, outputMap, options);
            Test.stopTest();
            System.assertEquals(validateGetbrokerList, true);
        }
    }
    /************************************************************************************
Method Name : TestGetBrokerlistExc
Parameters  : None
Return type : void
Description : 
*************************************************************************************/
    private static testMethod void TestGetBrokerlistExc(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Account testAcc = Util02_TestData.createGroupAccount();
            Database.insert(testAcc);
            
            Id RecordType_Id = [Select Id from RecordType where sObjectType = 'Contact' AND Name = 'Producer'].Id;
            Contact test_contact = new Contact(FirstName='George', LastName='Harrison', Email='george@email.com', ETIN__c='123456789', AgencyType__c='Brokerage', RecordTypeId=RecordType_Id);
            insert test_contact;
            Id [] fixedBrokerSearchResults= new Id[1];
            fixedBrokerSearchResults[0] = test_contact.Id;
            test.setFixedSearchResults(fixedBrokerSearchResults);
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);
            Test.startTest();
            Map<String,Object> inputMap=new Map<String,Object>();
            Map<String,Object> outputMap=new Map<String,Object>();
            Map<String,Object> options=new Map<String,Object>();
            options.put('searchString', '123456789');
            inputMap.put('ZipCode3','42633');
            vlcCustomTypeAhead vcta = new vlcCustomTypeAhead();
            Boolean validateGetbrokerList = vcta.invokeMethod('getAllStatesBrokerList', inputMap, outputMap, options);
            Test.stopTest();
            System.assertEquals(validateGetbrokerList, true);
        }
    }
    /************************************************************************************
Method Name : TestgetBrokerAccount
Parameters  : None
Return type : void
Description : 
*************************************************************************************/
    private static testMethod void TestgetBrokerAccount(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Account testAcc = Util02_TestData.createGroupAccount();
            Database.insert(testAcc);
            Contact test_contact = new Contact(FirstName='George', LastName='Harrison', Email='george@email.com', ETIN__c='123456789', AgencyType__c='Brokerage');
            insert test_contact;
            Id [] fixedBrokerSearchResults= new Id[1];
            fixedBrokerSearchResults[0] = test_contact.Id;
            test.setFixedSearchResults(fixedBrokerSearchResults);
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);
            Test.startTest();
            Map<String,Object> inputMap=new Map<String,Object>();
            Map<String,Object> outputMap=new Map<String,Object>();
            Map<String,Object> options=new Map<String,Object>();
            options.put('searchString', 'Brokerage');
            vlcCustomTypeAhead vcta = new vlcCustomTypeAhead();
            Boolean validateGetbrokerList = vcta.invokeMethod('getBrokerAccountsList', inputMap, outputMap, options);
            Test.stopTest();
            System.assertEquals(validateGetbrokerList, true);
        }
    }
    
}