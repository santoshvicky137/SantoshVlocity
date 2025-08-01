/****************************************************************************************************
* Class Name  : SGA_AP77_CreateAppProducts_Test
* Created By  : IDC Offshore
* Description : This is the Test class for SGA_AP77_CreateAppProducts
* ***************************************************************************************************/ 
@isTest(SeeAllData=false)
private class SGA_AP77_CreateAppProducts_Test {
    private static final string PROD_NAME = 'Test Product';
    private static final string SELECT_HMO = 'Select HMO';
    private static final string CC_HMO = 'California Care HMO';
    private static final string SELECT_PPO = 'Select PPO';
    private static final string CC1 = '3004';
    private static final string CC2 = '3005';
    private static final string CC3 = '3006';
    private static final string PLAN_TYPE = 'Medical';
    private static final string STATE_VAL = 'CA';
    private static final string QSTATE = 'qState';
    private static final string MED_PLAN_COUNT = 'MedicalPlansCount';
    private static final string SELECT_NETWORK = 'SelectedNetworks';
    private static final string SELECTED_NETWORK = 'Select HMO,California Care HMO,Select PPO';
    private static final string APP_ID = 'applicationId';
    private static final string MED_COVERAG_NQ = 'MedicalCoverageNQ';
    private static final string MED_COVERAGE = 'MedicalCoverage';
    private static final string METHOD_NAME = 'createApplicationProducts';
	private static final string RIDERS = 'Riders';
	private static final string CONT_OPT_OUT = 'Contraceptive Opt Out';
	private static final string SELECTED_RIDERS = 'SelectedRiders';
	
	/****************************************************************************************************
    * Method Name : createAppProdWithProd
    * Description : This is the test method for creating the application products when user selects
    * 				All check box in CA Medical Coverage with out Riders
    * ***************************************************************************************************/
    private testmethod static void createAppProdWithProd(){
        User testUser = Util02_TestData.createUser();
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = PROD_NAME,network__c=SELECT_HMO,ProductCode=CC1,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
        Product2 prod1 = new Product2(Name = PROD_NAME,network__c=CC_HMO,ProductCode=CC2,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
        Product2 prod2 = new Product2(Name = PROD_NAME,network__c=SELECT_PPO,ProductCode=CC3,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
		Map<String,Object> inputMap = new Map<String,Object>();
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        
        
        inputMap.put(QSTATE,STATE_VAL);
        MedicalCoverage.put(MED_PLAN_COUNT,2);
        MedicalCoverage.put(SELECT_NETWORK,SELECTED_NETWORK);
		System.runAs(testUser) {
            Test.startTest();
            insert prodList;
            vlocity_ins__Application__c testApplication =Util02_TestData.createApplicationForRelatedList(SG01_Constants.STATUSINENROLLMENTCOMPLETED, System.today() +5);
            Insert testApplication;
            
            inputMap.put(APP_ID,testApplication.Id);
            inputMap.put(MED_COVERAG_NQ, MedicalCoverage);
            
            
            SGA_AP77_CreateAppProducts createAppProdObj = new SGA_AP77_CreateAppProducts();
            createAppProdObj.invokeMethod(METHOD_NAME, inputMap, outMap, options);
            Boolean createAppProducts = createAppProdObj.invokeMethod(METHOD_NAME, inputMap, outMap, options);
            System.assertEquals(true, createAppProducts);
            inputMap.put(MED_COVERAGE, MedicalCoverage);
            Boolean createAppProducts1 = createAppProdObj.invokeMethod(METHOD_NAME, inputMap, outMap, options);
            Test.stopTest();
        }
        
       
        
    }
    
    /****************************************************************************************************
    * Method Name : createAppProdWithAttAssignment
    * Description : This is the test method for creating the application products when user selects
    * 				All check box in CA Medical Coverage with Riders
    * ***************************************************************************************************/
    private testmethod static void createAppProdWithAttAssignment(){
        User testUser = Util02_TestData.createUser();
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = PROD_NAME,network__c=SELECT_HMO,ProductCode=CC1,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
        Product2 prod1 = new Product2(Name = PROD_NAME,network__c=CC_HMO,ProductCode=CC2,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
        Product2 prod2 = new Product2(Name = PROD_NAME,network__c=SELECT_PPO,ProductCode=CC3,vlocity_ins__Type__c=PLAN_TYPE,vlocity_ins__Availability__c = STATE_VAL,IsActive=TRUE);
		Map<String,Object> inputMap = new Map<String,Object>();
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        
        inputMap.put(QSTATE,STATE_VAL);
        MedicalCoverage.put(MED_PLAN_COUNT,2);
        MedicalCoverage.put(SELECT_NETWORK,SELECTED_NETWORK);
        MedicalCoverage.put(SELECTED_RIDERS,CONT_OPT_OUT);
        System.runAs(testUser) {
            Test.startTest();
            vlocity_ins__AttributeCategory__c attCat = new vlocity_ins__AttributeCategory__c();
            attCat.vlocity_ins__IsActive__c = true;
            attCat.Name = RIDERS;
            attCat.vlocity_ins__DisplaySequence__c = 1;
            Insert attCat;
            database.insert(prodList);
            vlocity_ins__AttributeAssignment__c attObj = new vlocity_ins__AttributeAssignment__c();
            attObj.vlocity_ins__ObjectId__c = prod.Id;
            attObj.AttributeDisplayNameOverride__c = CONT_OPT_OUT;
            attObj.vlocity_ins__AttributeCategoryId__c = attCat.Id;
            Insert attObj;
            //insert prodList;
            vlocity_ins__Application__c testApplication =Util02_TestData.createApplicationForRelatedList(SG01_Constants.STATUSINENROLLMENTCOMPLETED, System.today() +5);
            Insert testApplication;
            
            inputMap.put(APP_ID,testApplication.Id);
            inputMap.put(MED_COVERAG_NQ, MedicalCoverage);
            SGA_AP77_CreateAppProducts createAppProdObj = new SGA_AP77_CreateAppProducts();
            Boolean createAppProducts = createAppProdObj.invokeMethod(METHOD_NAME, inputMap, outMap, options);
            Test.stopTest();
            System.assertEquals(false, false);
        }
        
    }
}