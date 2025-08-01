/****************************************************************************************************
* Class Name  : SGA_AP108_FetchProducts
* Created By  : IDC Offshore
* Description : This is the class used to fetch products for ALL STATES
* 2019-04-10  : Modified by Muthu R to implement product fetch based on effective date for story SMGR-25783
* 2019 Oct 23rd : Modified by Harshini - SMGR-27609 [NY Narrow EPO Online Enrollment.]
* ***************************************************************************************************/
global without sharing class SGA_AP108_FetchProducts implements vlocity_ins.VlocityOpenInterface{
    
    private static final string FETCHDENVISPROD = 'fetchMdclDentVsnProds';
    private static final string ACTIVE = 'Active';
    private static final string STATEVALUE = 'StateValue';
    private static final string PRODYEAR = 'ProdYear';
    private static final string PRODTYPE = 'ProductType';
    private static final string MEDICALPROD= 'MedicalProducts';
    private static final string EFFECTIVEDATE = 'ReqEffectiveDateWOQuote';
    private static final string DNTLVISIONPROD= 'Products';
    private static final string MEDICAL = 'Medical';
    private static final string DENTAL = 'Dental';
    private static final string VISION = 'Vision';
    private static final string PLANNAME = 'PlanName';
    private static final string CONTRACTCODE = 'ContractCode';
    private static final string CLASSNAME= 'SGA_AP108_FetchProducts';
    private static final string percent= '%';
    private static final string BRAND = 'Brand';
    private static final string BRANDTYPE ='EBC';
    private static final string ISABF ='IsABF';

    
    /****************************************************************************************************
* Method Name : invokeMethod
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This is the interface method to invoke the method based on the provided remote method
* ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        
        try{   
            if(methodName == FETCHDENVISPROD){
                fetchMdclDentVsnProds(inputMap,outMap,options);
            }           
        }
        Catch(Exception ex){
            System.debug('ExceptionEX:' + String.valueOf(ex));
            UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,CLASSNAME, SG01_Constants.INVOKEMETHOD, SG01_Constants.SPACE, Logginglevel.ERROR);
        }
        return true;
    }
    
    /****************************************************************************************************
* Method Name : fetchMdclDentVsnProds
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to get the medical, dental, vision products for the respective state
* ***************************************************************************************************/    
    public void fetchMdclDentVsnProds(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        System.debug('inside fetchMdclDentVsnProds');
        List<Product2> prodList = new List<Product2>();        
        List<DentalVsnwrapJson> dntlJsonList = new List<DentalVsnwrapJson>(); 
        List<MedicalwrapJson> mdclJsonList = new List<MedicalwrapJson>();
        List<mdclProductWrapper> prodJsonList = new List<mdclProductWrapper>();
        List<dntlVsnProductWrapper> dntlProdJsonList = new List<dntlVsnProductWrapper>();                
        List<Map<String,String>> contractCodeList = new List<Map<String,String>>();
        List<Map<String,String>> medContractCodeList = new List<Map<String,String>>();                
        
        string selectedState = (String)options.get(STATEVALUE);
        string effDateYear =    string.valueOf(options.get(PRODYEAR));
        string productType= (String)options.get(PRODTYPE);
        string strEffectiveDate = (String)options.get(EFFECTIVEDATE);
        Boolean IsABF = (Boolean)inputMap.get(ISABF) == null? false : true;
        string brand = (String)options.get(BRAND); //HBasani : SMGR : 27609
        string nyUpstateExclusiveServiceArea = 'NY0001EPO';

        system.debug('IsABF'+IsABF);
        Date dtEffectiveDate;
        string tempDate = percent+ effDateYear + percent;
        
        if(String.isNotBlank(selectedState) && String.isNotBlank(productType) && String.isNotBlank(effDateYear) && (productType == DENTAL || productType == VISION ) ){
            if (String.isNotBlank(strEffectiveDate)) {
                dtEffectiveDate = Date.parse(strEffectiveDate);
                prodList = [Select id, name, HIOS_ID__c, ProductCode, vlocity_ins__Type__c, VoluntaryProduct__c, Tech_Rider_Options__c,Network__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c =: selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c =: productType and Portfolio_Type__c = 'SG'];
            } else {
                prodList = [Select id, name, HIOS_ID__c, ProductCode, vlocity_ins__Type__c, VoluntaryProduct__c, Tech_Rider_Options__c,Network__c from Product2 where (Tech_EffectiveDate_Year__c LIKE :tempDate ) and vlocity_ins__Availability__c =: selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c =: productType and Portfolio_Type__c = 'SG'];
            }
            
        }
        else if(String.isNotBlank(selectedState) && String.isNotBlank(productType) && String.isNotBlank(effDateYear) && productType == MEDICAL ){
            if(IsABF == false){
                if (String.isNotBlank(strEffectiveDate)) {             
                    dtEffectiveDate = Date.parse(strEffectiveDate);
                    if(selectedState.toUpperCase()=='NY' && brand.toUpperCase() ==BRANDTYPE )
                    {
                        prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and service_area__C != :nyUpstateExclusiveServiceArea];
                    }
                    else     
                    {
                        //SMGR-50376 - Updated the logic for KY ACA. Pathways HMO plans should no longer be offered in the Owensboro area
                        if(selectedState.toUpperCase() =='KY'){
                            Boolean isOwensboroArea = false;
                            String zipcodeKY = (String)inputMap.get('AccZip');
                            String county;
                            Map<String,Object> companyInfo = inputMap.get('CompanyInformation')!=null?(Map<String,Object>)inputMap.get('CompanyInformation'):null;
                            if(companyInfo != null){
                                county = companyInfo.get('County') != null?(String)companyInfo.get('County'):null;
                            }                            
                            String searchText;
                            if(county != null && zipcodeKY != null){
                                searchText = zipcodeKY + ' - '+ county;                            
                                List<Geographical_Info__c> lstGeographicalInfo = [SELECT Id  from Geographical_Info__c WHERE State__c = 'KY' AND SearchField__c =:searchText  AND  RatingAreaText__c = 'Owensboro'];
                                if(!lstGeographicalInfo.isEmpty()){
                                    isOwensboroArea = true;
                                }
                            }
                            if(isOwensboroArea){
                                prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and Portfolio_Type__c = 'SG' and Network__c != 'Pathway HMO'];
                            }
                            else{
                                prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and Portfolio_Type__c = 'SG'];
                            }    
                        }
                        else{
                            prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and Portfolio_Type__c = 'SG'];
                        }
                    }
                } else {
                    if(selectedState.toUpperCase()=='NY' && brand.toUpperCase() ==BRANDTYPE )
                    {
                        prodList = [Select id, name, Product2.Plan_Family__c,ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where (Tech_EffectiveDate_Year__c LIKE :tempDate ) and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and service_area__C != :nyUpstateExclusiveServiceArea ];            
                    }
                    else   
                    {
                        prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where (Tech_EffectiveDate_Year__c LIKE :tempDate ) and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and ABF__c = false and Portfolio_Type__c = 'SG'];            
                    }
                }
            }else{
                if (String.isNotBlank(strEffectiveDate)) {             
                    dtEffectiveDate = Date.parse(strEffectiveDate);
                    prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where vlocity_ins__EffectiveDate__c <= :dtEffectiveDate and vlocity_ins__EndDate__c >= :dtEffectiveDate and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and Portfolio_Type__c = 'ABF' ];

                } else {
                    prodList = [Select id, name,Product2.Plan_Family__c, ProductCode,Exchange_Indicator__c, Tech_Calendar_Or_Plan__c, Tech_Prod_Code_Name_WI_Medical__c, TECH_ProdCodeName__c, Tech_Rider_Options__c,Network__c,vlocity_ins__SubType__c from Product2 where (Tech_EffectiveDate_Year__c LIKE :tempDate ) and vlocity_ins__Availability__c = :selectedState and vlocity_ins__Status__c =: ACTIVE and vlocity_ins__Type__c = :productType and Portfolio_Type__c = 'ABF'];            
                }
            }            
        }  
        
        if(!prodList.isEmpty() && (productType == DENTAL  || productType == VISION )){ 
            
            for(Product2 prod : prodList){ 
                
                dntlProdJsonList.add(new dntlVsnProductWrapper(prod.HIOS_ID__c,prod.id,prod.name,prod.ProductCode, prod.vlocity_ins__Type__c, prod.VoluntaryProduct__c ));
                
                Map<String,String> contractCodeMap = new Map<String,String>();
                contractCodeMap.put(CONTRACTCODE,prod.ProductCode );               
                contractCodeList.add(contractCodeMap);
            }
            outMap.put(DNTLVISIONPROD, new DentalVsnwrapJson(contractCodeList , dntlProdJsonList ));  
            
        }
        else if(!prodList.isEmpty() && productType == MEDICAL){
            
            for(Product2 prod1 : prodList){
                
                prodJsonList.add(new mdclProductWrapper(prod1.id,prod1.name,prod1.ProductCode, prod1.Tech_Calendar_Or_Plan__c, prod1.Tech_Prod_Code_Name_WI_Medical__c, prod1.Tech_Rider_Options__c, prod1.Network__c, prod1.vlocity_ins__SubType__c,prod1.Exchange_Indicator__c,prod1.Plan_Family__c)); 
                
                Map<String,String> medContractCodeMap = new Map<String,String>(); 
                medContractCodeMap.put(PLANNAME, prod1.TECH_ProdCodeName__c );
                medContractCodeMap.put(CONTRACTCODE, prod1.ProductCode);                
                medContractCodeList.add(medContractCodeMap);
            } 
            outMap.put(MEDICALPROD, new MedicalwrapJson(medContractCodeList, prodJsonList));            
        }
    }
    
    /****************************************************************************************************
    * Class Name  : DentalVsnwrapJson
    * Description : This is the wrapper class used to return dental, vision products in JSON format
    * ***************************************************************************************************/
    public without sharing class DentalVsnwrapJson{
        
        public List<Map<String,String>> ContractCodes;
        public List<dntlVsnProductWrapper> ProductsDetails;
        
        public DentalVsnwrapJson(List<Map<String,String>> code , List<dntlVsnProductWrapper> plans){
            ContractCodes = code;
            ProductsDetails = plans;
        }
    }
    
    /****************************************************************************************************
    * Class Name  : mdclProductWrapper
    * Description : This is the wrapper class used to return medical products in JSON format
    * ***************************************************************************************************/
    public without sharing class MedicalwrapJson{
        public List<Map<String,String>> MedicalContractCodes;
        public List<mdclProductWrapper> ProductsDetails;
        
        public MedicalwrapJson(List<Map<String,String>> medCC, List<mdclProductWrapper> medPlanCode){
            MedicalContractCodes = medCC;
            ProductsDetails = medPlanCode;
        }
    }
    /****************************************************************************************************
    * Class Name  : mdclProductWrapper
    * Description : This is the wrapper class used to populate list of medical products for ALL STATES
    * ***************************************************************************************************/
    
    public without sharing class mdclProductWrapper{
        public Id ProdId;
        public string Name;
        public String ContractCode;
        public String CalendarPlanYear;
        public String MedicalCYPYIDName;
        public String RiderOption;
        public String Network;
        public String SubType;
        public string PlanFamily;
        public String ExchangeIndicator;
        /****************************************************************************************************
        * Method Name : mdclProductWrapper
        * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
        * Return type : Boolean
        * Description : constructor method to create list of medical products for the respective state
        * ***************************************************************************************************/ 
        public mdclProductWrapper(Id id, string prodName, String CC, String CPYear, String MdclCYPYIDName, String RiderOptn, String ntwrk, String type,String ExchngIndicator, String planfamily){
            
            ProdId = id;
            Name = prodName;
            ContractCode = CC;
            CalendarPlanYear = CPYear;
            MedicalCYPYIDName = MdclCYPYIDName;
            RiderOption = RiderOptn;
            Network = ntwrk;
            SubType = type;
           ExchangeIndicator= ExchngIndicator;
           this.PlanFamily = planfamily;
            
        }
    }
     /****************************************************************************************************
    * Class Name  : dntlVsnProductWrapper
    * Description : This is the class used to populate list of dental, vision products for ALL STATES
    * ***************************************************************************************************/
    public without sharing class dntlVsnProductWrapper{
        public string OrthoPlan;
        public Id ProdId;
        public string Name;
        public String ContractCode;
        public String Type;
        public String VoluntaryPlan;        
        /****************************************************************************************************
        * Method Name : dntlVsnProductWrapper
        * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
        * Return type : Boolean
        * Description : constructor method to create list of dental, vision products for the respective state
        * ***************************************************************************************************/ 
        public dntlVsnProductWrapper(String orthoPln, Id id, string prodName, String CC, String type, String volPlan ){
            
            OrthoPlan = orthoPln;
            ProdId = id;
            Name = prodName;
            ContractCode = CC;
            Type = type;
            VoluntaryPlan = volPlan;          
            
        }
    }

}