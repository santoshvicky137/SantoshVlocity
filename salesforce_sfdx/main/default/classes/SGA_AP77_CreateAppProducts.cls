/****************************************************************************************************
* Class Name  : SGA_AP77_CreateAppProducts
* Created By  : IDC Offshore
* Description : This is the class used for creating the application products for CA state
* ***************************************************************************************************/  
global without sharing class SGA_AP77_CreateAppProducts implements vlocity_ins.VlocityOpenInterface {
  private static final string APPLICATIONNAME = 'Anthem SG';
    private static final string CLS_CREATEAPPPRODUCTS = 'SGA_AP77_CreateAppProducts';
    private static final string INVOKEMETHOD = 'invokeMethod';
    private static final string SPACE = ' ';
    private static final string CREATE_APPPROD = 'createApplicationProducts';
    private static final string MEDICAL_COVERAGE = 'MedicalCoverageNQ';
    private static final string SELECTED_NETWORKS = 'SelectedNetworks';
    private static final string SELECTED_RIDERS = 'SelectedRiders';
    private static final string MED_APP_ID = 'applicationId';
    private static final string MEDICAL = 'Medical';
    private static final string CA_STATE = 'CA';
    private static final string RIDERS = 'Riders';
    private static final string COMMA = ',';
    private static final string BLANK = '';
    private static final string SELECTED_MEDICAL = 'CASelectedMedical';
    private Boolean isExistsContributionPlan = false;
    private String medicalAppId = BLANK;
    List<Application_Product__c> medicalAppProdList = new List<Application_Product__c>();
    String productNames = BLANK;
    Map<ID,Product2> prodMap = new Map<ID,Product2>();
    List<Product2> prodList = new List<Product2>();
    /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/   
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        try{
            if (CREATE_APPPROD.equalsIgnoreCase(methodName))
            {
                return createApplicationProducts(inputMap,outMap,options);
            }
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, UserInfo.getOrganizationId(), APPLICATIONNAME,CLS_CREATEAPPPRODUCTS, INVOKEMETHOD, SPACE, Logginglevel.ERROR);}
        return true;
    }
     /****************************************************************************************************
    * Method Name : createApplicationProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is used to create Application Products, if Select All Products Checkbox is Selected in Medical Coverage Page
    * ***************************************************************************************************/
    public Boolean createApplicationProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        system.debug('selectCoverageMap '+selectCoverageMap);
        String selectedNetworksinOS = (String)selectCoverageMap.get(SELECTED_NETWORKS);
        system.debug('selectedNetworksinOS '+selectedNetworksinOS);
        //splitting the networks 
        List<String> networkList = selectedNetworksinOS.split(COMMA);
        system.debug('networkList '+networkList);
        String selectedRiders = (String)selectCoverageMap.get(SELECTED_RIDERS);
        system.debug('selectedRiders '+selectedRiders);
        medicalAppId = (String)inputMap.get(MED_APP_ID);
        system.debug('medicalAppId '+medicalAppId);
        //fetching the products based on the selected networks for CA state
        prodList = [SELECT ID,Name,ProductCode FROM PRODUCT2 WHERE Network__c IN :networkList AND vlocity_ins__Availability__c INCLUDES (:CA_STATE) AND 
                                   vlocity_ins__Type__c = :MEDICAL AND IsActive = TRUE AND Tech_Rider_Options__c =:selectedRiders LIMIT 10000];
        system.debug('prodMap '+prodMap);
        
        for(product2 prd: prodList){
            productNames+= prd.Name +COMMA;
            Application_Product__c appProd = new Application_Product__c();
            appProd.Application_Name__c = medicalAppId;
            appProd.Product__c = prd.id;
             medicalAppProdList.add(appProd);
        }
        system.debug('medicalAppProdList '+medicalAppProdList);
        if(!medicalAppProdList.isEmpty()){
            outMap.put(SELECTED_MEDICAL,productNames);
            List<Database.SaveResult>  updateResults = database.insert(medicalAppProdList, false);
            for(Integer i=0;i<updateResults.size();i++){
                if (updateResults.get(i).isSuccess()){
                    updateResults.get(i).getId();
                    system.debug('Success '+updateResults.get(i).getId());
                }else if (!updateResults.get(i).isSuccess()){
                    // DML operation failed
                    Database.Error error = updateResults.get(i).getErrors().get(0);
                    String failedDML = error.getMessage();
                    system.debug('error '+error);
                    system.debug('error.getMessage() '+error.getMessage());
                 }
            }
        }
        return true;
    } 
}