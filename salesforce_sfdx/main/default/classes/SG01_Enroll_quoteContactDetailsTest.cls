@istest
public class SG01_Enroll_quoteContactDetailsTest {
    
    @testsetup  
    public static void createTestData()
    {
         
        List<CS001_RecordTypeBusinessTrack__c> cs001List = BRPUtilTestMethods.createCS001Data();
        insert cs001List; 
        List<CS002_RTypeAssignOnLeadConvert__c> cs002List = BRPUtilTestMethods.createCS002Data();
        insert cs002List;
        BRPSGCIntegration__c bRPSGCIntegration = BRPUtilTestMethods.createBRPSGCIntegration();
        insert  bRPSGCIntegration; 
        Account acct1 = BRPUtilTestMethods.CreateGroupAccount(); 
        insert acct1;   
        Opportunity  opp = BRPUtilTestMethods.CreateOpportunity(acct1);   
        insert opp;     
        Quote qt1 = BRPUtilTestMethods.CreateQuote(acct1,opp );
        insert qt1;
        Contact con1 =Util02_TestData.createContact('firstName', 'lastName', 'testtest@gmail.com' , acct1.id);
        insert con1;
        qt1.ContactId = con1.id;
       Account agencyAccount = Util02_TestData.createAgencyAccount();
        List<CS001_RecordTypeBusinessTrack__c> cs001List1 = Util02_TestData.createCS001Data();
        Database.insert(cs001List1);
        Database.insert(agencyAccount);
        qt1.Paid_Agency_Name__c  = agencyAccount.id;
        qt1.Paid_Agency_ETIN__c = 'CKHJQPKSMY';
        qt1.General_Agency_Name__c = agencyAccount.id;
        qt1.General_Agency_ETIN__c= 'CKHJQPKSMY';
        update qt1;
        vlocity_ins__Application__c testApplication = Util02_TestData.createApplication();
        testApplication.vlocity_ins__AccountId__c = acct1.Id;
        testApplication.Opportunity_Id__c = opp.Id;
        Insert testApplication;
       
        
        
    }
    
    testmethod static void getbrandbyzipcodeTest()
    {
        //LCValidation // LABEL_COUNTYONACCOUNT //LABEL_ZIPCODEONACCOUNT
        Map<string, object> inputmap = new map<string,object>();
         Map<string, object> outputmap = new map<string,object>();
         Map<string, object> options = new map<string,object>();
         
         map<string, string> lcvalidationmap = new map<string, string>();
          SG01_Enroll_quoteContactDetails enrollDetail = new SG01_Enroll_quoteContactDetails();
          
         lcvalidationmap.put(enrollDetail.LABEL_ZIPCODEONACCOUNT , '10001');
         lcvalidationmap.put(enrollDetail.LABEL_COUNTYONACCOUNT , 'NEW YORK');
        inputmap.put(enrollDetail.STEP_LAVALIDATION, lcvalidationmap);
         enrollDetail.invokemethod(enrollDetail.GETBRANDBYZIPCODE,inputMap, outputmap,options );
         
    } 
    testmethod static void DRExtractQuoteOptyContactInfoTest()
    {
       
        Quote Quote1= [SELECT id, ContactId, accountid FROM Quote LIMIT 1];
        Map<string, object> inputMap =new Map<string, object>();
        Map<String, object> outputmap = new Map<string, Object>();
        Map<String, object> optns = new Map<string, Object>();
        Map<string, object> CompanyInformationMap =new Map<string, object>();
        
        inputMap.put('QuoteId' , Quote1.id);
        
        SG01_Enroll_quoteContactDetails enrollDetail = new SG01_Enroll_quoteContactDetails();
        enrollDetail.invokemethod('DRExtractQuoteOptyContactInfo',inputMap, outputmap,optns );
    }
      testmethod static void CreateGroupContactTest()
    {
        Quote Quote1= [SELECT id, ContactId, accountid FROM Quote LIMIT 1];
        Map<string, object> inputMap =new Map<string, object>();
        Map<String, object> outputmap = new Map<string, Object>();
        Map<String, object> optns = new Map<string, Object>();
        Map<string, object> CompanyInformationMap =new Map<string, object>();
        CompanyInformationMap.put('CompanyContactName' , 'test1245');
          CompanyInformationMap.put('EmailAddress' , 'test1234@test.com');
          CompanyInformationMap.put('AdditionalContact' , 'Contact_Last_name');
          CompanyInformationMap.put('AdditionalContactEmail' , 'test12234@test.com');
          CompanyInformationMap.put('PrimaryPhone' , '1234567890');
          optns.put('BrokerEmailAddress' , 'broker@test.com');
          optns.put('BrokerPhoneNumber' , '1238967890');
          optns.put('BrokerAccountId' , '');
          optns.put('BrokerLastName' , 'Broker_test');
          
        // companyInfo.get('CompanyContactName'); 'EmailAddress' 'PrimaryPhone'
        // inputMap.get('QuoteAccountId'); QuoteContactId ;
        inputMap.put('CompanyInformation', CompanyInformationMap);
        inputMap.put('QuoteAccountId', Quote1.accountid); 
        inputMap.put('QuoteContactId', Quote1.ContactId);
        SG01_Enroll_quoteContactDetails enrollDetail = new SG01_Enroll_quoteContactDetails();
        enrollDetail.invokemethod('CreateGroupContact',inputMap, outputmap,optns);
        enrollDetail.invokemethod('updateAdditionalBrokerforMEWA',inputMap, outputmap,optns);
        enrollDetail.invokemethod('updateAdditionalBroker',inputMap, outputmap,optns);
    }
        
    testmethod static void updateBrokerDetailsonApplicationtest()
    {
        Quote Quote1= [SELECT id, ContactId, accountid, Paid_Agency_Name__c,Paid_Agency_ETIN__c FROM Quote LIMIT 1];
        vlocity_ins__Application__c application1 = [SELECT id FROM vlocity_ins__Application__c LIMIT 1];
        
        Map<string, object> inputMap =new Map<string, object>();
        Map<String, object> outputmap = new Map<string, Object>();
        Map<String, object> optns = new Map<string, Object>();
      // PaidAgencyExists GeneralAgencyExists
      string BROKERINFOJSONPATH = 'Agent/Producer/BrokerCert';
        Map<string, object> brokerinfoMap = new Map<string, object>();
        brokerinfoMap.put('PaidAgencyExists', true);
        brokerinfoMap.put('GeneralAgencyExists', true);
        inputMap.put(BROKERINFOJSONPATH, brokerinfoMap);
        optns.put('applicationidval' , application1.id);
        optns.put('UpdatePaidAgencyAccountId' , Quote1.Paid_Agency_Name__c);
         
         //optns.put('UpdateGeneralAgencyAccId' , Quote1.Paid_Agency_Name__c);
         
         SG01_Enroll_quoteContactDetails enrollDetail = new SG01_Enroll_quoteContactDetails();
        enrollDetail.invokemethod('updateBrokerDetails',inputMap, outputmap,optns );
      
    }
    
         testmethod static void updateBrokercontactNYtest()
    {
         Map<string, object> inputMap =new Map<string, object>();
        Map<String, object> outputmap = new Map<string, Object>();
        Map<String, object> optns = new Map<string, Object>();
         optns.put('Lastname' ,'Contact LastName' );   
        optns.put('EmailAddress' , 'test@email.com' );
         optns.put('Phone' ,'4932049111' );
        optns.put('AccountId' , '' );    
        SG01_Enroll_quoteContactDetails enrollDetail = new SG01_Enroll_quoteContactDetails();
        enrollDetail.invokemethod('updateBrokerContactNY',inputMap, outputmap,optns );
    
    }
    
   

}