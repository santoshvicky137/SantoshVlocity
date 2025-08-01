/****************************************************************************************************
* Class Name  : SGA_AP108_FetchProducts_Test
* Description : This is the test class for SGA_AP108_FetchProducts class
* Developed By: IDC Offshore Team
* ***************************************************************************************************/   
@isTest(SeeAllData=false)
private class SGA_AP108_FetchProducts_Test{
    private static string DATAJSN = '';
    private static final string STATEVALUE = 'StateValue';
    private static final string PRODYEAR = 'ProdYear';
    private static final string PRODTYPE = 'ProductType';
    private static final string EFFECTIVEDATE = 'ReqEffectiveDateWOQuote';
    private static final string FETCHMDCLDNTVSNPRODS = 'fetchMdclDentVsnProds';
    private static final string ISABF ='IsABF';
    
    /****************************************************************************************************
    * Method Name : fetchProductsTestMethod
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is medical and effective date is not provided
    * ***************************************************************************************************/    
    static testMethod void fetchProductsTestMethod(){
        
        
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            insert prodList; 
                                    
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>();
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '2018',PRODTYPE => 'Medical'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }
    
    /****************************************************************************************************
    * Method Name : fetchProductsTestMethod2
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is medical and effective date is provided
    * ***************************************************************************************************/    
    static testMethod void fetchProductsTestMethod2(){
        
        
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            for(Product2 prod: prodList ){
                prod.vlocity_ins__EffectiveDate__c = date.parse('04/04/2019');
                prod.vlocity_ins__EndDate__c = date.parse('04/04/2019');
            }
            insert prodList; 
                                  
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>();
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '2018',PRODTYPE => 'Medical', EFFECTIVEDATE => '04/04/2019'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }
    
    /****************************************************************************************************
    * Method Name : fetchProductsDntlVsnTestMethod
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is Dental and effective date is not provided
    * ***************************************************************************************************/        
    static testMethod void fetchProductsDntlVsnTestMethod(){
        
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            insert prodList;
                        
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>();
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '2018',PRODTYPE => 'Dental'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }
    
    /****************************************************************************************************
    * Method Name : fetchProductsDntlVsnTestMethod2
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is Dental and effective date is provided
    * ***************************************************************************************************/        
    static testMethod void fetchProductsDntlVsnTestMethod2(){
        
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            for(Product2 prod: prodList ){
                prod.vlocity_ins__EffectiveDate__c = date.parse('04/04/2019');
                prod.vlocity_ins__EndDate__c = date.parse('04/04/2019');
            }
            insert prodList;
                        
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>();
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '2018',PRODTYPE => 'Dental', EFFECTIVEDATE => '04/04/2019'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    } 

      /****************************************************************************************************
    * Method Name : fetchProductsTestMethod2
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is medical and effective date is provided
    * ***************************************************************************************************/    
    static testMethod void fetchProductsTestMethod3(){
        
        
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            for(Product2 prod: prodList ){
                prod.vlocity_ins__EffectiveDate__c = date.parse('04/04/2021');
                prod.vlocity_ins__EndDate__c = date.parse('04/05/2022');
                prod.ABF__c = true;
            }
            insert prodList; 
                                  
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>{ISABF => 'true'};
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '2022',PRODTYPE => 'Medical', EFFECTIVEDATE => '04/04/2022'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }

     /****************************************************************************************************
    * Method Name : fetchProductsTestMethod
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is medical and effective date is not provided
    * ***************************************************************************************************/    
    static testMethod void fetchProductsTestMethod4(){
        
        
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
            for(Product2 prod: prodList ){
                prod.ABF__c = true;
            }
            insert prodList; 
                                    
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>{ISABF => true};
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'CA' ,PRODYEAR => '20122',PRODTYPE => 'Medical'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }
  
    /****************************************************************************************************
    * Method Name : dntlVsnProductWrapperTestMethod
    * Description : This is the test method to test dntlVsnProductWrapper Constructor
    * ***************************************************************************************************/ 
    static testMethod void dntlVsnProductWrapperTestMethod() {
        string OrthoPlan;
        Id ProdId;
        string Name;
        String ContractCode;
        String Type;
        String VoluntaryPlan;  
        
        Test.startTest();

        SGA_AP108_FetchProducts.dntlVsnProductWrapper dntlVsnProductWrapperInstance = new SGA_AP108_FetchProducts.dntlVsnProductWrapper(OrthoPlan, ProdId, Name, ContractCode, Type, VoluntaryPlan);
        
        Test.stopTest();   
     }
    
    /****************************************************************************************************
    * Method Name : mdclProductWrapper
    * Description : This is the test method to test mdclProductWrapper Constructor
    * ***************************************************************************************************/ 
    static testMethod void mdclProductWrapperTestMethod() {
        Id ProdId;
        string Name;
        String ContractCode;
        String CalendarPlanYear;
        String MedicalCYPYIDName;
        String RiderOption;
        String Network;
        String SubType; 
        String ExchngIndicator;
        String planfamily; 
        
        Test.startTest();

        SGA_AP108_FetchProducts.mdclProductWrapper mdclProductWrapperInstance = new SGA_AP108_FetchProducts.mdclProductWrapper(ProdId, Name, ContractCode, CalendarPlanYear, MedicalCYPYIDName, RiderOption, Network, SubType, ExchngIndicator, planfamily);
        
        Test.stopTest();   
     }
    
    /****************************************************************************************************
    * Method Name : MedicalwrapJson
    * Description : This is the test method to test MedicalwrapJson Constructor
    * ***************************************************************************************************/ 
    static testMethod void MedicalwrapJsonTestMethod() {
        List<Map<String,String>> MedicalContractCodes;
        List<SGA_AP108_FetchProducts.mdclProductWrapper> ProductsDetails;
        
        Test.startTest();

        SGA_AP108_FetchProducts.MedicalwrapJson MedicalwrapJsonInstance = new SGA_AP108_FetchProducts.MedicalwrapJson(MedicalContractCodes, ProductsDetails);
        
        Test.stopTest();   
     }
    
    /****************************************************************************************************
    * Method Name : DentalVsnwrapJson
    * Description : This is the test method to test DentalVsnwrapJson Constructor
    * ***************************************************************************************************/ 
    static testMethod void DentalVsnwrapJsonTestMethod() {
        List<Map<String,String>> ContractCodes;
        List<SGA_AP108_FetchProducts.dntlVsnProductWrapper> ProductsDetails;
        
        Test.startTest();

        SGA_AP108_FetchProducts.DentalVsnwrapJson DentalVsnwrapJsonInstance = new SGA_AP108_FetchProducts.DentalVsnwrapJson(ContractCodes, ProductsDetails);
        
        Test.stopTest();   
     }
    
    /****************************************************************************************************
    * Method Name : fetchProductsTestMethodKY
    * Description : This is the test method to test the fetchProduct functionality for all states if product type is medical and effective date is provided
    * ***************************************************************************************************/    
    static testMethod void fetchProductsTestMethodKY(){
        
        
        User testUser = Util02_TestData.createUser();
        
        System.runAs(testUser){
            List<Product2> prodList = Util02_TestData.createProductsForFetchLogic();
          
            for(Product2 prod: prodList ){
                prod.vlocity_ins__EffectiveDate__c = date.parse('04/04/2019');
                prod.vlocity_ins__EndDate__c = date.parse('04/04/2019');
                prod.vlocity_ins__Availability__c = 'KY';
                prod.Portfolio_Type__c = 'SG';
            }
            insert prodList; 
                                  
            SGA_AP108_FetchProducts app = new SGA_AP108_FetchProducts();                                 
            Map<String,Object> inputMap = new Map<String, Object>();
            inputMap.put('zipcodeKY','42215');
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>{STATEVALUE => 'KY' ,PRODYEAR => '2018',PRODTYPE => 'Medical', EFFECTIVEDATE => '04/04/2019'}; 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(FETCHMDCLDNTVSNPRODS, inputMap, outMap, options);
            Test.stopTest();
        }

    }
}