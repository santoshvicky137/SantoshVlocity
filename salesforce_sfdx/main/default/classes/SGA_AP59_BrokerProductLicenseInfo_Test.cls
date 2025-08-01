/*@author       Accenture
@date           12/13/2017
@name           SGA_AP59_BrokerProductLicenseInfo_Test
@description    Test class to test the SGA_AP59_BrokerProductLicenseInfo class.
*/
@isTest
private class SGA_AP59_BrokerProductLicenseInfo_Test {
private static final String HEALTH = 'Health';
private static final String LIFE = 'Life';


  /************************************************************************************
    Method Name : validateAndAddBrokerELSEconditionTest
    Parameters  : None
    Return type : void
    Description : This is testmethod for positive snenario for validateAndAddBroker Method
*************************************************************************************/
    private static testMethod void validateAndAddBrokerELSEconditionTest(){
           string brokerETIN = '123456789';
        	string BROKERAGE = 'Brokerage';
            User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
         	Account acc = Util02_TestData.createBrokerAgentAccount();
            List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
            Database.insert(cs001List);
            acc.AgencyType__c = 'Brokerage';
            Database.insert(acc);
            Contact contactProd = Util02_TestData.producerContact('Test','Prod','123@anthem.com',acc.id);
            contactProd.ETIN__c = '123456789';
            Database.insert(contactProd);
            List<Contact> cntFetchList = [SELECT Id, Name, ETIN__c, MailingStreet, MailingState, MailingCity, MailingPostalCode, Phone, Fax, Email FROM Contact WHERE (ETIN__c =:brokerETIN AND Account.AgencyType__c =:BROKERAGE) Limit 1];
            system.debug('*****cntFetchList###'+cntFetchList);
            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.SGA_ProdType__c  = HEALTH;
            Database.insert(license);
           // User user1 = Util02_TestData.createPortalUser();            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='validateAndAddBroker';
                outputmap.put('ProductLicense','license');
                options.put('BrokerETIN','123456789');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes);
                Test.stopTest();
           // }
        }
    }


  /************************************************************************************
    Method Name : validateAndAddBrokerTest
    Parameters  : None
    Return type : void
    Description : This is testmethod for positive snenario for validateAndAddBroker Method
*************************************************************************************/
    private static testMethod void validateAndAddBrokerTest(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.SGA_ProdType__c  = HEALTH;
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='validateAndAddBroker';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
    
    private static testMethod void validateAndAddBrokerTestexception(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.SGA_ProdType__c  = HEALTH;
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='validateAndAddBroker';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,null,outputmap,options);				
                system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
	
	
  /************************************************************************************
    Method Name : validStatus
    Parameters  : None
    Return type : void
    Description : This is testmethod for positive snenario
*************************************************************************************/
    private static testMethod void validStatus(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.SGA_ProdType__c  = HEALTH;
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
	  /************************************************************************************
    Method Name : validStatus1
    Parameters  : None
    Return type : void
    Description : This is testmethod for positive snenario
*************************************************************************************/
    private static testMethod void validStatus1(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.SGA_ProdType__c  = HEALTH;
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',null);
                inputmap.put('ZipCode3',null);
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
/************************************************************************************
Method Name : invalidStatus1
Parameters  : None
Return type : void
Description : This is testmethod for negative snenario
*************************************************************************************/
    private static testMethod void invalidStatus1(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
            license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
			license.SGA_ProdType__c  = LIFE;
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');    
                options.put('useQueueableApexRemoting',true); 
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);
                system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
/************************************************************************************
Method Name : invalidStatus3
Parameters  : None
Return type : void
Description : This is testmethod for negative snenario
*************************************************************************************/
    private static testMethod void invalidStatus3(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            License_Appointment__c license = Util02_TestData.createTestLicenseData();           
			license.SGA_ProdType__c  = HEALTH;			
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');    
                options.put('useQueueableApexRemoting',true);
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }	
/************************************************************************************
Method Name : invalidStatus4
Parameters  : None
Return type : void
Description : This is testmethod for negative snenario
*************************************************************************************/
    private static testMethod void invalidStatus4(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','Health & Life');
                inputmap.put('BrokerContactId',contactProd.id);
                inputmap.put('ZipCode3','12766');    
                options.put('useQueueableApexRemoting',true);
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
    /************************************************************************************
Method Name : positivetestforNyenroll
Parameters  : None
Return type : void
Description : This testmethod is to test the positive scenario for getLicenseForNYEnroll
*************************************************************************************/
    private static testMethod void positivetestforNyenroll(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            license.SGA_Provider__c = contactProd.Id;
            license.BR_Start_Date__c = system.Today();
            license.BR_State__c = geo.State__c;
            license.BR_End_Date__c = system.Today()+20;
            Database.insert(license);
            License_Appointment__c License1 = Util02_TestData.Licence();
            License1.BR_Type__c = 'Contract';
            License1.SGA_Provider__c = contactProd.Id;
            License1.BR_State__c = geo.State__c;
            License1.BR_Start_Date__c = system.Today();
            License1.BR_End_Date__c = system.Today()+20;
            License1.SGA_ContractType__c = 'Small Group';
            Database.insert(License1);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
            Map<String,Object> inputmap=new Map<String,Object>();
            Map<String,Object> outputmap=new Map<String,Object>();
			Map<String,Object> options=new Map<String,Object>();
            String methodName='getLicenseForNYEnroll';
            options.put('BrokerContactId',contactProd.Id);
            options.put('ZipCode3','12766');
            options.put('CoverageOptions','Medical');
            options.put('CoverageOptions','Medical');
			outputmap.put('ProductLicense','licStatus');
            SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
            Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
		    system.assertEquals(true,approvalRes);
            Test.stopTest();
            }
        }
    }
   
    /************************************************************************************
Method Name : testException
Parameters  : None
Return type : void
Description : This is testmethod for covering the exception for getLicenseForNYEnroll 
*************************************************************************************/
    private static testMethod void testException(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='getStateProductLicense';
                outputmap.put('ProductLicense','license');
                inputmap.put('BrokerContactId','test');
                inputmap.put('ZipCode3',null);    
                options.put('useQueueableApexRemoting',true);
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
    
    /************************************************************************************
Method Name : testException1
Parameters  : None
Return type : void
Description : This testmethod is with new string name to meet the coverage
*************************************************************************************/
    private static testMethod void testException1(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            license.SGA_Provider__c = contactProd.Id;
            license.SGA_ProdType__c = 'Life';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
				Map<String,Object> options=new Map<String,Object>();
                String methodName='getLicenseForNYEnroll';
                options.put('BrokerContactId',license.SGA_Provider__c);
                options.put('ZipCode3','12766');
                outputmap.put('ProductLicense','licStatus');
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);  
            }
            Test.stopTest();
        }
    }
    
    
    private static testMethod void testExceptionNY001(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            license.SGA_Provider__c = contactProd.Id;
            license.SGA_ProdType__c = 'Life';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
				Map<String,Object> options=new Map<String,Object>();
                String methodName='getLicenseForNYEnroll';
                options.put('BrokerContactId',license.SGA_Provider__c);
                //options.put('ZipCode3', null);
                outputmap.put('ProductLicense','licStatus');
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);  
            }
            Test.stopTest();
        }
    }
    /************************************************************************************
Method Name : testException2
Parameters  : None
Return type : void
Description : This testmethod is to cover the exceptions
*************************************************************************************/
    private static testMethod void testException2(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            license.SGA_Provider__c = contactProd.Id;
            license.SGA_ProdType__c = 'Life';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
				Map<String,Object> options=new Map<String,Object>();
                String methodName='getLicenseForNYEnroll';
                options.put('BrokerContactId',Contact.Id);
                options.put('ZipCode3',Null);
                outputmap.put('ProductLicense','licStatus');
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);
                Test.stopTest();
            }
        }
    }
	 /************************************************************************************
Method Name : testException3
Parameters  : None
Return type : void
Description : This testmethod is to cover the exceptions
*************************************************************************************/
    private static testMethod void testException3(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();
            Contact contactProd = Util02_TestData.createAccData();
            Geographical_Info__c geo = Util02_TestData.createGeoRecord();
            Database.insert(geo);    
            License_Appointment__c license = Util02_TestData.Licence();
            license.BR_Type__c = 'License';
            license.SGA_Provider__c = contactProd.Id;
            license.SGA_ProdType__c = 'Health & Life';
            Database.insert(license);
            User user1 = Util02_TestData.createPortalUser();
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
				Map<String,Object> options=new Map<String,Object>();
                String methodName='getLicenseForNYEnroll';
                options.put('BrokerContactId',Contact.Id);
                options.put('ZipCode3',Null);
                outputmap.put('ProductLicense','licStatus');
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);  
				system.assertEquals(true,approvalRes);  
            }
            Test.stopTest();
        }
    }
    
/************************************************************************************
Method Name : ValidateBroker
Parameters  : None
Return type : void
Description : This testmethod is to validate the validateBrokerStateLicense method
*************************************************************************************/
    private static testMethod void ValidateBroker(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){ 
            Test.startTest();
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.BR_Type__c  = 'License';
            Database.insert(license);
            Profile portalProfile = [SELECT Id FROM Profile where name =: SG01_Constants.PNAME_TEST Limit 1];
      		User user1 = new User(Username = System.now().millisecond() + SG01_Constants.USERNAME_TEST+'l',
                      ContactId = license.SGA_Provider__c, ProfileId = portalProfile.Id,
                      Alias = SG01_Constants.ALIAS_TEST, Email = SG01_Constants.USERNAME_TEST,
                      EmailEncodingKey = SG01_Constants.ENCODING_TEST,
                      LastName = SG01_Constants.LNAME_TEST, CommunityNickname = SG01_Constants.NICKNAME_TEST,
                      TimeZoneSidKey = SG01_Constants.TIMEZONE_TEST, LocaleSidKey = SG01_Constants.LOCALE_TEST,
                      LanguageLocaleKey = SG01_Constants.LANG_TEST);
            Database.insert(user1);
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='validateBrokerStateLicense';
                outputmap.put('LicenseStatus','Valid');
                options.put('BrokerContactId',license.SGA_Provider__c);
                inputmap.put('ZipCode3','12766');
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes); 
            }
            Test.stopTest();
        }
    }
    /************************************************************************************
Method Name : ValidateBrokerException
Parameters  : None
Return type : void
Description : This testmethod is to validate the validateBrokerStateLicense method
*************************************************************************************/
    private static testMethod void ValidateBrokerException(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Test.startTest();            
            License_Appointment__c license = Util02_TestData.createTestLicenseData();
			license.BR_Start_Date__c = system.Today();    
            license.BR_End_Date__c = system.Today();
            license.BR_Type__c  = 'License';
            Database.insert(license);
            Profile portalProfile = [SELECT Id FROM Profile where name =: SG01_Constants.PNAME_TEST Limit 1];
      		User user1 = new User(Username = System.now().millisecond() + SG01_Constants.USERNAME_TEST+'l',
                      ContactId = license.SGA_Provider__c, ProfileId = portalProfile.Id,
                      Alias = SG01_Constants.ALIAS_TEST, Email = SG01_Constants.USERNAME_TEST,
                      EmailEncodingKey = SG01_Constants.ENCODING_TEST,
                      LastName = SG01_Constants.LNAME_TEST, CommunityNickname = SG01_Constants.NICKNAME_TEST,
                      TimeZoneSidKey = SG01_Constants.TIMEZONE_TEST, LocaleSidKey = SG01_Constants.LOCALE_TEST,
                      LanguageLocaleKey = SG01_Constants.LANG_TEST);
            Database.insert(user1);
            System.runAs(user1){
                Map<String,Object> inputmap=new Map<String,Object>();
                Map<String,Object> outputmap=new Map<String,Object>();
                Map<String,Object> options=new Map<String,Object>();
                String methodName='validateBrokerStateLicense';
                outputmap.put('LicenseStatus','Valid');
                options.put('BrokerContactId','test');
                inputmap.put('ZipCode3',null);
                options.put('useQueueableApexRemoting',true);				
                SGA_AP59_BrokerProductLicenseInfo actct=new SGA_AP59_BrokerProductLicenseInfo();
                Boolean approvalRes= actct.invokeMethod(methodName,inputmap,outputmap,options);				
                system.assertEquals(true,approvalRes); 
            }
            Test.stopTest();
        }
    } 
    
    private static testMethod void testGetParentEntityDetails(){
         SGA_AP59_BrokerProductLicenseInfo obj=new SGA_AP59_BrokerProductLicenseInfo();
        obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'IN','PortfolioType'=>'ACA','PaidAgencyName1'=>'PaidAgencyName1',
                                       'PaidAgencyName2'=>'PaidAgencyName2','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>'GeneralAgencyName'});
       
        
        obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'IN','PortfolioType'=>'ACA','PaidAgencyName1'=>'',
                                       'PaidAgencyName2'=>'','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>''});
       obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'IN','PortfolioType'=>'ACA','PaidAgencyName1'=>'PaidAgencyName1',
                                       'PaidAgencyName2'=>'PaidAgencyName2','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>''});
        
        
         obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'GA','PortfolioType'=>'ACA','PaidAgencyName1'=>'PaidAgencyName1',
                                       'PaidAgencyName2'=>'PaidAgencyName2','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>'GeneralAgencyName'});
        
         obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'GA','PortfolioType'=>'ACA','PaidAgencyName1'=>'',
                                       'PaidAgencyName2'=>'','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>'GeneralAgencyName'});
        
         obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'GA','PortfolioType'=>'ACA','PaidAgencyName1'=>'',
                                       'PaidAgencyName2'=>'','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>''});
        obj.GetParentEntityDetails(new Map<String,Object> {},new Map<String, Object> {}, 
                                   new  Map<String, Object> {'State' => 'GA','PortfolioType'=>'ACA','PaidAgencyName1'=>'PaidAgencyName1',
                                       'PaidAgencyName2'=>'PaidAgencyName2','BrokerAgentName1'=>'BrokerAgentName1','BrokerAgentName2'=>'BrokerAgentName2',
                                       'GeneralAgencyName'=>''});
        
    }
	
	
   
 }