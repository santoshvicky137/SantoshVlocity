/****************************************************************************************************
* Class Name  : SGA_AP88_TransformValues_Test
* Created By  : IDC Offshore
* Description : This is the test class used for SGA_AP88_TransformValues GAVAMO omniscript data 
                transformations
* ***************************************************************************************************/
@isTest(seeAllData=false)
private without sharing class SGA_AP88_TransformValues_Test {
    private final static string WITHQUOTING = 'WithQuoting';
    private final static string TRANSFORMM_MTHD = 'transformGAMedProducts';
    private final static string TRANSFORMM_MTHD_KY = 'transformKYMedProducts';
    private final static string TRANSFORMM_MTHD_MO = 'transformMOMedProducts';
    private final static string TRANSFORMM_MTHD_NH = 'transformNHMedProducts';
    private final static string TRANSFORMM_MTHD_WI = 'transformWIMedProducts';
    private final static string QSTATE = 'qState';
    private final static string CA_STATE = 'CA';
    private final static string NH_STATE = 'NH';
    private final static string CO_STATE = 'CO';
    private final static string TRANSFORMM_MTHD_CACO = 'transformCACOMedProducts';
    private final static string TRANSFORM_MTHD_NY = 'transformNYMedProducts';
    private final static string TRANSFORM_MTHD_ME = 'transformMEMedProducts';
    private final static string TRANSFORM_MTHD_VA = 'transformABFMedProducts';
    
    
    
    /***********************************************************
     * Method Name : transformTestValuesWithQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesGAWithQuote() {
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();        
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD, inputMap, outputMap, optionsMap));
        }
    }
    
    /***********************************************************
     * Method Name : transformTestValuesWithOutQuote
     * Description : test method for Non Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesGAWithOutQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD, inputMap, outputMap, optionsMap));
        }
    }
    
    /************************************************************************
     * Method Name : transformTestValuesWithOutQuote
     * Description : test method for Non Quoting/Quoting data transformation
     ***********************************************************************/
    private testMethod static void transTestValuesCA(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(QSTATE,CA_STATE);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_CACO, inputMap, outputMap, optionsMap));
        }
    }
    
    /*************************************************************************
     * Method Name : transformTestValuesWithOutQuote
     * Description : test method for Non Quoting/Quoting data transformation
     ************************************************************************/
    private testMethod static void transTestValuesCO(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(QSTATE,CO_STATE);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_CACO, inputMap, outputMap, optionsMap));
        }
    }
    /***********************************************************
     * Method Name : transformTestValuesKYWithQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesKYWithQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_KY, inputMap, outputMap, optionsMap));
        }
    }
    /***********************************************************
     * Method Name : transformTestValuesKYWithOutQuote
     * Description : test method for Non Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesKYWithOutQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_KY, inputMap, outputMap, optionsMap));
        }
    }
    
/***********************************************************
     * Method Name : transformTestValuesMOWithQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesMOWithQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_MO, inputMap, outputMap, optionsMap));
        }
    }
    /***********************************************************
     * Method Name : transformTestValuesMOWithOutQuote
     * Description : test method for Non Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesMOWithOutQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_MO, inputMap, outputMap, optionsMap));
        }
    }
    /*************************************************************************
     * Method Name : transformTestValuesWithOutQuote
     * Description : test method for Non Quoting/Quoting data transformation
     ************************************************************************/
    private testMethod static void transTestValuesNH(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(QSTATE,NH_STATE);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_NH, inputMap, outputMap, optionsMap));
        }
    }
    /***********************************************************
     * Method Name : transformTestValuesWIWithQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesWIWithQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_WI, inputMap, outputMap, optionsMap));
        }
    }
    /***********************************************************
     * Method Name : transformTestValuesWIWithOutQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformTestValuesWIWithOutQuote(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD_WI, inputMap, outputMap, optionsMap));
        }
    }
    
    /***********************************************************
     * Method Name : transformTestValuesWIWithOutQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformNYMedProductsMethod(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        //optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORM_MTHD_NY, inputMap, outputMap, optionsMap));
        }
    }
    
    /***********************************************************
     * Method Name : transformMEMedProductsWithOutQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformMEMedProductsWithOutQuoteMethod(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORM_MTHD_ME, inputMap, outputMap, optionsMap));
        }
    }
    
    /***********************************************************
     * Method Name : transformMEMedProductsWithQuote
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void transformMEMedProductsWithQuoteMethod(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORM_MTHD_ME, inputMap, outputMap, optionsMap));
        }
    }
    
        /***********************************************************
     * Method Name : forException
     * Description : test method for Quoting data transformation
     ************************************************************/
    private testMethod static void forException(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        //optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        System.AssertEquals(true, transformObj.invokeMethod(TRANSFORMM_MTHD, inputMap, outputMap, null));
        }
    }
        /***********************************************************
     * Method Name : validateEPOPPOCANQTest
     * Description : test method for EPO,PPO checkbox CA WithOutQuote
     ************************************************************/    
    private testmethod static void validateEPOPPOCANQTest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Prudent Buyer PPO',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA',vlocity_ins__SubType__c = 'EPO');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Prudent Buyer PPO',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA', vlocity_ins__SubType__c = 'PPO');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Prudent Buyer PPO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA', vlocity_ins__SubType__c = 'HSA');        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        MedicalCoverage.put('MedicalPlansCount',2);
        String innerSelectMed = '[{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeMedical": "3005","SelectProductCodeLookupMedical": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "InputContractCodeMedical": "3006","SelectProductCodeLookupMedical": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(innerSelectMed));        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);        
        inputMap.put('MedicalCoverageNQ', MedicalCoverage);
        inputMap.put('qState','CA');
		inputMap.put('WithQuote', false);        
        optionsMap.put(QSTATE,CA_STATE);                     
        test.startTest();        
        SGA_AP88_TransformValues vss1 = new SGA_AP88_TransformValues();        
        Boolean transformCACOMedProducts = vss1.invokeMethod(TRANSFORMM_MTHD_CACO,inputMap, outMap, optionsMap);        
        test.stopTest();                
    }
        /***********************************************************
     * Method Name : validateEPOPPOCANQTest
     * Description : test method for EPO,PPO checkbox CA WithQuote
     ************************************************************/    
    private testmethod static void validateEPOPPOCATest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Prudent Buyer PPO',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA',vlocity_ins__SubType__c = 'EPO');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Prudent Buyer PPO',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA', vlocity_ins__SubType__c = 'PPO');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Prudent Buyer PPO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA', vlocity_ins__SubType__c = 'HSA');        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;        
        Map<String,Object> MedicalCoverage = new Map<String,Object>(); 
        Map<String,Object> SelectMedicalCoverage = new Map<String,Object>();       
        MedicalCoverage.put('MedicalAccounts', prodList);
        inputMap.put('MedicalCoverage', MedicalCoverage);
        SelectMedicalCoverage.put('output2', prodList);        
        inputMap.put('qState','CA');
		inputMap.put('WithQuote', true);        
        optionsMap.put(QSTATE,CA_STATE);                     
        test.startTest();        
        SGA_AP88_TransformValues vss1 = new SGA_AP88_TransformValues();        
        Boolean transformCACOMedProducts = vss1.invokeMethod(TRANSFORMM_MTHD_CACO,inputMap, outMap, optionsMap);        
        test.stopTest();                
    }
    /***********************************************************
     * Method Name : transformABFMedProducts
     * Description : test method for with quote data transformation
     ************************************************************/
    private testMethod static void transformABFMedProductsWithQuoteMethod(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,true);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORM_MTHD_VA, inputMap, outputMap, optionsMap));
        }
    }
    
    /***********************************************************
     * Method Name : transformABFMedProducts
     * Description : test method for without quote data transformation
     ************************************************************/
    private testMethod static void transformABFMedProductsWithOutQuoteMethod(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outputMap = new Map<String,Object>();
        Map<String,Object> optionsMap = new Map<String,Object>();
        optionsMap.put(WITHQUOTING,false);
        user testuser = Util02_TestData.createUser();   
        System.runAs(testuser){
        Test.startTest();
        SGA_AP88_TransformValues transformObj = new SGA_AP88_TransformValues();
        Test.stopTest();
        system.AssertEquals(true, transformObj.invokeMethod(TRANSFORM_MTHD_VA, inputMap, outputMap, optionsMap));
        }
    }
}