/************************************************************************
Class Name   : QueryUser_Test
Date Created : 15-June-2017
Created By   : IDC Offshore
Description  : 1. This is a test class for QueryUser
**************************************************************************/
@isTest
private class QueryUser_Test {
    private Static Final String staffMem_Constant = 'GetStaffMember';
    private Static Final String coverageBrokerDate_Constant = 'GetRequestCoverageBrokerDates';
    private Static Final String coverageNonBrokerDates_Constant = 'GetRequestCoverageNonBrokerDates';
	private Static Final String coverageEmployerDates_Constant = 'GetRequestCoverageEmployerDates';
	private Static Final String coverageNonEmployerDates_Constant = 'GetRequestCoverageNonEmployerDates';
    private Static Final String ABFcoverageBrokerDate_Constant = 'GetABFRequestCoverageBrokerDates';
	
    /************************************************************************************
    Method Name : getStaffMemberTest
    Parameters  : None
    Return type : void
    Description : This is the testmethod for getStaffMember
    *************************************************************************************/
    private static testMethod void getStaffMemberTest(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = staffMem_Constant;
    	Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }
       
    
    
    /************************************************************************************
    Method Name : getRequestCoverageBrokerDatesTest
    Parameters  : None
    Return type : void
    Description : This is the testmethod for Broker Quote Effective date
    *************************************************************************************/
    private static testMethod void getRequestCoverageBrokerDatesTest(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = coverageBrokerDate_Constant;
        inputMap.put('ActionButton','quote');
        inputMap.put('SelectedState','NY');
        List<Broker_Date_Settings__c> brokerDatesCSList = Util02_TestData.createBrokerDatesCustomSettings();
        insert brokerDatesCSList;
        Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }
    
     /************************************************************************************
    Method Name : CoverageBrokerDatesEnrollTest
    Parameters  : None
    Return type : void
    Description : This is the testmethod for Broker Enroll Effective date
    *************************************************************************************/
    private static testMethod void CoverageBrokerDatesEnrollTest(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = coverageBrokerDate_Constant;
        inputMap.put('ActionButton','enroll');
        inputMap.put('SelectedState','CA');        
        List<SGA_CS11_Enrollment_Date_Settings__c> EnrollDatesCSList = Util02_TestData.createEnrollmentDatesCustomSettings();
        insert EnrollDatesCSList;
        Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }
	 /************************************************************************************
    Method Name : getABFRequestCoverageBrokerDatesTest
    Parameters  : None
    Return type : void
    Description : This is the testmethod for Broker Quote Effective date
    *************************************************************************************/
    private static testMethod void getABFRequestCoverageBrokerDatesTest(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = ABFcoverageBrokerDate_Constant;
        inputMap.put('ActionButton','abfquote');
        inputMap.put('SelectedState','CO');
        List<ABF_Broker_Date_Settings__c> brokerDatesCSList = createBrokerDatesCustomSettings();
        insert brokerDatesCSList;
        Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    } 
    public static List<ABF_Broker_Date_Settings__c> createBrokerDatesCustomSettings(){
        ABF_Broker_Date_Settings__c brokerCS001 = new ABF_Broker_Date_Settings__c ();
        brokerCS001.Name = 'NonNY';
        brokerCS001.ABF_Broker_Date_Span__c = 550;
        brokerCS001.ABF_Broker_Skip_Days__c = -30;
        brokerCS001.ABF_EffectiveDateStartYear__c = 2019;
        brokerCS001.ABF_Internal_users_days_span__c = 150;
        brokerCS001.ABF_Internal_Users_Past_Days_Span__c = -720;
        brokerCS001.ABF_RequestedDates__c='1';
		List<ABF_Broker_Date_Settings__c> brokerCS001List = new List<ABF_Broker_Date_Settings__c>();
        brokerCS001List.add(brokerCS001);
        return brokerCS001List;
    }
    /************************************************************************************
    Method Name : getRequestCoverageNonBrokerDates
    Parameters  : None
    Return type : void
    Description : This is the testmethod for Internal User Quote Effective date
    *************************************************************************************/
    private static testMethod void getRequestCoverageNonBrokerDates(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = coverageNonBrokerDates_Constant;
        inputMap.put('ActionButton','quote');
        inputMap.put('SelectedState','NY');
        List<Broker_Date_Settings__c> brokerDatesCSList = Util02_TestData.createBrokerDatesCustomSettings();
        insert brokerDatesCSList;
        Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }
 /************************************************************************************
    Method Name : CoverageNonBrokerEnrollDates
    Parameters  : None
    Return type : void
    Description : This is the testmethod for Internal User Enroll Effective date
    *************************************************************************************/
    private static testMethod void CoverageNonBrokerEnrollDates(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = coverageNonBrokerDates_Constant;
        inputMap.put('ActionButton','enroll');
        inputMap.put('SelectedState','CA');
        List<SGA_CS11_Enrollment_Date_Settings__c> EnrollDatesCSList = Util02_TestData.createEnrollmentDatesCustomSettings();
        insert EnrollDatesCSList; 
        Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }    
/************************************************************************************
    Method Name : GetRequestCoverageEmployerDates
    Parameters  : None
    Return type : void
    Description : This is the testmethod for CoverageEmployerDates
    *************************************************************************************/
    private static testMethod void GetRequestCoverageEmployerDates(){
        QueryUser qUser = new QueryUser();
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        String methodName = coverageEmployerDates_Constant;
        List<Employer_Date_Settings__c> EmplDatesCSList = Util02_TestData.createEmployerDatesCustomSettings();
        insert EmplDatesCSList;
    	Test.startTest();
        qUser.invokeMethod(methodName, inputMap, outMap, options);
        Test.stopTest();
    }
}