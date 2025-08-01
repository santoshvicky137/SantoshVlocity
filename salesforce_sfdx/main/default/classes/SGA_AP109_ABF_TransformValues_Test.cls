/****************************************************************************************************
* Class Name  : SGA_AP109_ABF_TransformValues_Test
* Created By  : IDC Offshore
* Description : This is the test class used for SGA_AP109_ABF_TransformValues omniscript data 
                transformations
* ***************************************************************************************************/
@isTest(seeAllData=false)
private without sharing class SGA_AP109_ABF_TransformValues_Test {
    private final static string WITHQUOTING = 'WithQuoting';
    private final static string TRANS_MED = 'transformABFMedProducts';
   
    /***********************************************************
     * Method Name : transformTestValuesWithOutQuote
     * Description : test method for Non Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesWithOutQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP109_ABF_TransformValues transformObj = new SGA_AP109_ABF_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANS_MED, inputMap, outputMap, optionsMap));
        }
    }
      private testMethod static void transformTestValuesWithQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP109_ABF_TransformValues transformObj = new SGA_AP109_ABF_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANS_MED, inputMap, outputMap, optionsMap));
        }
    }
}