/****************************************************************************************************
* Class Name  : SGA_AP119_ABF_UpdateApplication_Test
* Description : This is the test class for SGA_AP119_ABF_UpdateApplication class
* Developed By: Vikings Team
* ***************************************************************************************************/   

@isTest(SeeAllData=false)
private class SGA_AP119_ABF_UpdateApplication_Test{

    private static final string APP_NAME = 'Small Group Application for TEST DEC 4 Effective: Jan 1 2017';
    private static final string WRITING_BR_EMAIL = 'rmup@vlocity.com';
    private static final string APP_ID = 'applicationId';
    private static final string METHOD_NAME = 'updateAbfApplication';
    private static final String ACCOUNTNAME = 'AccountName';
    private static final String EFFECTIVEDATE = 'EffectiveDate';
    private static final Boolean TRUEVALUE = true;
    private static final String FOR_TAG = 'For';
    private static final String EFFECTIVE = 'Effective:';
    private static final String ISDENTAL = 'IsDental';
    private static final String ISVISION = 'IsVision';
    private static final String ISLANDD = 'IsLAndD';
    private static final String ISSHORTTERMD = 'IsShortTermD';
    private static final String ISMEDICAL = 'IsMedical';
    private static final String STATE = 'State';
    private static final String ACCOUNTID = 'AccountId';
    
    /****************************************************************************************************
    * Method Name : applicationLoaderTestMethod
    * Description : This is the test method to test the resend docuSign functionality 
    * ***************************************************************************************************/   
     
    static testMethod void applicationLoaderTestMethod(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            SGA_AP119_ABF_UpdateApplication app = new SGA_AP119_ABF_UpdateApplication();
            Account testAccount = Util02_TestData.createGroupAccount();
            List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
            Database.insert(cs001List);
            Database.insert(testAccount);
            vlocity_ins__Application__c appobj = new vlocity_ins__Application__c();
            appobj.Name = APP_NAME;
            appobj.vlocity_ins__AccountId__c = testAccount.Id;
            appobj.Writing_Broker_Email_ID__c = WRITING_BR_EMAIL;
            insert appobj;
            
            Map<String,Object> inputMap = new Map<String, Object>{ACCOUNTID => testAccount.Id};
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{APP_ID => appobj.Id, ACCOUNTNAME => testAccount.Name, STATE => 'CO', EFFECTIVEDATE => Date.newInstance(2022,9,10)}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(METHOD_NAME,inputMap, outMap, options);
            Test.stopTest();
        }
    }
}