/****************************************************************************************************
* Class Name  : SGA_AP114_FetchABFEnrollProducts
* Created Date : 12-10-2018
* Created By  : IDC Offshore
* Description : This is the class used to fetch products for ALL STATES
* History:
* Modified by Muthu on 20201009 for the defect SMGR-38600 to skip 2020 ABF Plans for ROUTT
* Modified by Ram on 21-10-2020 for the story SMGR - 38641.
* ***************************************************************************************************/
global without sharing class SGA_AP114_FetchABFEnrollProducts implements vlocity_ins.VlocityOpenInterface{
    
    private static final string FETCHABFMEDPROD = 'fetchABFMedProds';
    private static final string ACTIVE = 'Active';
    private static final string STATEVALUE = 'StateValue';
    private static final string PRODYEAR = 'ProdYear';
    private static final string PRODTYPE = 'ProductType';
    private static final string MEDICALPROD= 'MedicalProducts';
    private static final string ABFENRLPRODS= 'ABFMedproducts';
    private static final string PLANNAME = 'PlanName';
    private static final string CONTRACTCODE = 'ContractCode';
    private static final string CLASSNAME= 'SGA_AP114_FetchABFEnrollProducts';
    private static final string ABFPRODSELQUERY='SELECT Id, ProductCode, Name,Tech_Rider_Options__c, vlocity_ins__Type__c, vlocity_ins__SubType__c,FundingType__c FROM Product2 WHERE ';
    private static final string WHERE_SRVCAREA=' AND vlocity_ins__MarketSegment__c IN :marketSegment AND Service_Area__c IN :serviceAreaList';
    private static final string COUNTY_QUERY='SELECT County_Code__c,Service_Area__c FROM Geographical_Info__c where Zip_Code__c =: zipcode AND County_Code__c =:countycode LIMIT 1';
    private static final string LIMITCLAUSE=' LIMIT 5000';
    private static final string SEARCHCRITERIA='productSearchCriteria';
    private static final string MARKET_SEGMENT='GroupSpecification';
    private static final string OMNI_SMALLGROUP='SMALLGROUP';
    private static final string OMNI_LARGEGROUP='LARGEGROUP';       
    private static final string SMALL_GRP='Small Group';
    private static final string LARGE_GRP='Large Group';
    private static final string BOTH_GRPS='Large Group;Small Group';
    private static final string ZIPCODE='zipcode';
    private static final string COUNTYCODE='countycode';
    private static final string LIKE_Percent_SYM='%';
    private static final string COMMA_STR=',';    
    private static final string EMPTY='';
    private static final string ENDDATE='EndDate';
    private static final string ABFSTATE='ABFState';
    /****************************************************************************************************
* Method Name : invokeMethod
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This is the interface method to invoke the method based on the provided remote method
* ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        
        try{   
            if(methodName == FETCHABFMEDPROD){
                fetchABFMedProds(inputMap,outMap,options);
            }           
        }
        Catch(Exception ex){
            UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,CLASSNAME, SG01_Constants.INVOKEMETHOD, SG01_Constants.SPACE, Logginglevel.ERROR);
        }
        
        return true;
    }
    
    /****************************************************************************************************
* Method Name : fetchABFMedProds
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to get the ABF medical products for the respective state
* ***************************************************************************************************/    
    public void fetchABFMedProds(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        
        List<Product2> prodList = new List<Product2>();
        List<abfMedProdWrapper> abfMedPrdJsonList = new List<abfMedProdWrapper>();                
        List<Map<String,String>> contractCodeList = new List<Map<String,String>>();
        List<Supported_Service_Area__c> SuppservicesareaList = new List<Supported_Service_Area__c>();
        String prodquery = ABFPRODSELQUERY;
        
        // SMGR-38600 changes to pull effective date
        Map<String,Object> EmpInfo = (Map<String,Object>)inputMap.get('EmployerInformation');
        String strEffectiveDate = (String)EmpInfo.get('AppEffectiveDateFormula');
        String searchSpec = (String)options.get(SEARCHCRITERIA);
        String MarketSegSpef=(String)options.get(MARKET_SEGMENT);
        string zipcode=(String)options.get(ZIPCODE);
        string countycode=(String)options.get(COUNTYCODE);
        String abfState = (String)inputMap.get(ABFSTATE);
        // countycode =LIKE_Percent_SYM+county;
        Set<String> marketSegment;      
        if(OMNI_SMALLGROUP.equalsIgnoreCase(MarketSegSpef)){
            marketSegment= new Set<String>{SMALL_GRP,BOTH_GRPS};           
        }
        else if(OMNI_LARGEGROUP.equalsIgnoreCase(MarketSegSpef)){                               
            marketSegment= new Set<String>{LARGE_GRP,BOTH_GRPS};
        }  
        if(searchSpec !=null && searchSpec!=EMPTY){                        
            prodquery +=searchSpec;
        }
        SGA_UTIL17_AccessGeographicData.zipcode=zipcode;
        SGA_UTIL17_AccessGeographicData.countycode=countycode;
        Geographical_Info__c geo=SGA_UTIL17_AccessGeographicData.queryGeoInfo(COUNTY_QUERY);
        Id GeoInfoId = geo.id;
        Date EffectiveDate = Date.parse( strEffectiveDate );
        // Querying on child object instead of using service code field on geographical info as part of SMGR-38641 - RAM
         SuppservicesareaList = [select id, Start_Date__c , Geographical_Info__r.Zip_Code__c,End_Date__c , Geographical_Info__c,Geographical_Info__r.County_Code__c, Service_Area_Code__c from Supported_Service_Area__c 
         where Start_Date__c <= :EffectiveDate and End_Date__c >= :EffectiveDate AND Geographical_Info__r.Zip_Code__c = :zipcode AND Geographical_Info__r.County_Code__c LIKE :countycode];
        String serviceArea=geo.Service_Area__c;
        System.debug('List--' +SuppservicesareaList);
        // SMGR-38600 changes to remove ABFCOS002 for ROUTT
        System.debug('strEffectiveDate:' + strEffectiveDate + '; countycode: '+ countycode + '; serviceArea before:' + serviceArea);
        
        
        List<String> serviceAreaList = new List<String>();
        if(SuppservicesareaList.size() > 0){
        for(Supported_Service_Area__c sa : SuppservicesareaList){
        serviceAreaList.add(sa.Service_Area_Code__c);
        }
        }
        /*
        if(serviceArea.contains(COMMA_STR)){
            serviceAreaList=serviceArea.split(COMMA_STR);
        }
        else{
            serviceAreaList.add(serviceArea);   
        }
        */  // commented out after introducing child object - Ram
        if( (String.isEmpty(abfState) || abfState != 'IN') && (!serviceAreaList.isEmpty() || !marketSegment.isEmpty())){
              prodquery +=WHERE_SRVCAREA;
        } 
        
        prodquery +=LIMITCLAUSE; 
        SGA_Util28_Product2AccessHelper.marketSegment=marketSegment;
        SGA_Util28_Product2AccessHelper.serviceAreaList=serviceAreaList;
        prodList=SGA_Util28_Product2AccessHelper.fetchProductList(prodquery,null,null);
        system.debug('prodList size: ******'+prodList.size());
        
        for(Product2 prod : prodList){ 
                
                abfMedPrdJsonList.add(new abfMedProdWrapper(prod.id,prod.name,prod.ProductCode,prod.Tech_Rider_Options__c)); //Story SMGR-52192 
                
                Map<String,String> contractCodeMap = new Map<String,String>();
                contractCodeMap.put(CONTRACTCODE,prod.ProductCode );               
                contractCodeList.add(contractCodeMap);
            }
            outMap.put(ABFENRLPRODS, new ABFMedwrapJson(contractCodeList , abfMedPrdJsonList ));    
        
    }
    
    /****************************************************************************************************
    * Class Name  : ABFMedwrapJson
    * Description : This is the wrapper class used to return ABF medical products in JSON format
    * ***************************************************************************************************/
    public without sharing class ABFMedwrapJson{
        
        public List<Map<String,String>> ContractCodes;
        public List<abfMedProdWrapper> ProductsDetails;
        
        public ABFMedwrapJson(List<Map<String,String>> code , List<abfMedProdWrapper> plans){
            ContractCodes = code;
            ProductsDetails = plans;
        }
    }
     /****************************************************************************************************
    * Class Name  : abfMedProdWrapper
    * Description : This is the class used to populate list of abf medical products for ALL STATES
    * ***************************************************************************************************/
    public without sharing class abfMedProdWrapper{
        
        public Id ProdId;
        public string Name;
        public String ContractCode; 
        public string TechRiderOptions; //Story SMGR-52192 
        /****************************************************************************************************
        * Method Name : abfMedProdWrapper
        * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
        * Return type : Boolean
        * Description : constructor method to create list of dental, vision products for the respective state
        * ***************************************************************************************************/ 
        public abfMedProdWrapper(Id id, string prodName, String CC,string tro){
            ProdId = id;
            //Name = prodName;
            Name = CC+'-'+prodName; //Story SMGR-53912
            ContractCode = CC;
            TechRiderOptions = tro; //Story SMGR-52192 
        }
    }

}