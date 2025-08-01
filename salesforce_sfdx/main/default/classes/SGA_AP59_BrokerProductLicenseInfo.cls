/**********************************************************************************
Class Name :   SGA_AP59_BrokerProductLicenseInfo
Date Created : 11-Dec-2017
Created By   : IDC Offshore
Description  : This class is the to check the license of products in a particular state*/
global with sharing class SGA_AP59_BrokerProductLicenseInfo implements vlocity_ins.VlocityOpenInterface2{
    private static final String BROKERCONID= 'BrokerContactId';
    private static final String BROKERACCIDNY= 'BrokerAccountIdNY'; //Prasanna
    private static final String BROKERETIN= 'BrokerETIN';
    private static final String BROKERETINO= 'BrokerETIN';
    private static final String BROKERNAME1= 'Agentproducer/brokername1';    
    private static final String BROKERETIN1= 'Agent/producer/brokerIDno.1';
    private static final String BROKERETIN2020= 'Agent/producer/brokerIDno.1_2020';
    private static final String BROKERETIN2021= 'Agent/producer/brokerIDno.1_2021';
    private static final String BROKERSTREE1= 'Writer1Streetaddress';
    private static final String BROKERCITY1= 'Writer1City';
    private static final String BROKERSTATE1= 'Writer1State';
    private static final String BROKERZIP1= 'Writer1ZipCode';
    private static final String BROKERPHONE1= 'Writer1Phone';
    private static final String BROKERFAX1= 'Writer1Faxno.';
    private static final String BROKEREMAIL1= 'Writer1Email';
    private static final String BROKERNAMEABF = 'BrokerName';    
    private static final String BrokerTaxIDABF = 'BrokerTaxID';
    private static final String BROKEREMAILABF= 'BrokerEmail';
    private static final String BROKEREStreetABF= 'BrokerStreetAddress';
    private static final String BROKERECityABF= 'BrokerCity';
    private static final String BROKEREStateABF= 'BrokerState';
    private static final String BROKEREZipABF= 'BrokerZipCode';
    private static final String BROKEREContactNoABF= 'BrokerContactNo';
    private static final String BROKERELicenseNoABF= 'BrokerLicenseNo';
        
    private static final String BUSINESSTRACK= 'SGQUOTING';
    private static final String HEALTHLCNS= 'Health';
    private static final String LIFELCNS= 'Life';
    private static final String HEALTHLIFE= 'Health & Life';
    private static final String ZIPCODE= 'ZipCode3';
    private static final String ZIP= 'ZipCode';
    private static final string LICENSE_VAL='License'; 
    public static final String CLASSNAME = SGA_AP59_BrokerProductLicenseInfo.class.getName();
    public static final string NODENAME='ProductLicense';
    public static final String GETSTATEPRODUCTLICENSE = 'getStateProductLicense';
    private static final String NOPRODLICENSE='NoProdLicense';
    private static final String EMPTY='';
    private static final String BROKERAGE ='Brokerage';
    private static final String SELECT_GEOGRAPHIC = 'SELECT Id, Zip_Code__c, State__c FROM\n'+
                                                     'Geographical_Info__c where Zip_Code__c =:zipcode LIMIT 1';
    private static final string LICENSE_SELECT_QUERY = 'SELECT Id,BR_Type__c,BR_Start_Date__c,BR_End_Date__c,BR_Status__c,SGA_ProdType__c FROM License_Appointment__c';
    private static final string LICENSE_QUERY_WHERE = SG01_Constants.SPACE+'Where SGA_Provider__c=:contactId AND Tech_Businesstrack__c=:businessTrack AND BR_State__c =:state AND BR_Type__c=:licenseVal AND SGA_ProdType__c IN :idSet LIMIT 100';
    private static final string LNC_QUERY_WHERE = SG01_Constants.SPACE+'Where SGA_Provider__c=:contactId AND Tech_Businesstrack__c=:businessTrack AND BR_State__c =:state AND BR_State__c != null AND (BR_Type__c=:licenseVal OR (BR_Type__c=:contractVal AND SGA_ContractType__c=:contactTypeVal)) LIMIT 100';
    private static final String GETLICENSEFORNYENROLL='getLicenseForNYEnroll';
    private static final String BROKERID='BrokerId';
    private static final String COVERAGE_OPTIONS='CoverageOptions';
    public static final String FAILED_MSG='You are not actively licensed and contracted in the given state.';
    public static final String ADDBROKER_FAILED_MSG='The selected Broker is not actively licensed or contracted.';
    public static final String PROD_FAILED_MSG='You are not actively licensed for any available product categories.';
    private static final String ERROR_CODE='error';
    private static final string LIC_INVALID='LicenseInvalid';
    private static final String PROD_INVALID='ProdLicInvalid';
    private static final string CONTRACT_VAL='Contract';
    private static final String CONTRACT_TYPE='Small Group';
    private static final String LCNODENAME='LicenseStatus';
    private static final String BROKERDETAILS='BrokerDetails';
    private static final string VALID_STATUS='Valid';
    private static final string INVALID_STATUS='Invalid';
    private static final string ZIPCODE_ERROR='Please Enter a Valid ZipCode';
    private static final String VALIDATEBROKERSTATELICENSE='validateBrokerStateLicense';
    private static final String VALIDATEANDADDBROKER='validateAndAddBroker';
    private static final String ZIPCODE1= 'ZipCode1';
    private static final String ABFENROLL = 'checkEnroll';
    private static final String GETPARENTENTITYDETIALS = 'GetParentEntityDetails';
    private boolean checkABFEnroll = false;
    private static final String  BROKERNAME = 'BrokerName';
    private static final String  BROKERSTREET = 'MailingStreet';
    private static final String  BROKERSTATE = 'MailingState';
    private static final String  BROKERCITY = 'MailingCity';
    private static final String  BROKERZIP = 'MailingPostalCode';
    private static final String  BROKERPHONE = 'BrokerPhone';
    private static final String  BROKERFAX = 'BrokerFax';
    private static final String  BROKEREMAIL = 'BrokerEmail';
    /*Implementation of invokeMEthod from VlocityOpenInterface2 interface.*/
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,
                                Object> outMap,Map<String,Object> optns) {
        checkABFEnroll = optns.get(ABFENROLL)!=null&&optns.get(ABFENROLL)!=EMPTY?(Boolean)optns.get(ABFENROLL):false;
        if(GETSTATEPRODUCTLICENSE.equalsIgnoreCase(methodName)){
               getStateProductLicense(inputMap, outMap, optns);
        }
        if(GETLICENSEFORNYENROLL.equalsIgnoreCase(methodName))
        {            
            if(optns.get(COVERAGE_OPTIONS)!=null && optns.get(COVERAGE_OPTIONS)!=''){            
                getLicenseForNYEnroll(inputMap, outMap, optns);
            }
            else{            
                validateBrokerStateLicense(inputMap, outMap, optns);            
            }
        }
        if(VALIDATEBROKERSTATELICENSE.equalsIgnoreCase(methodName)){
            validateBrokerStateLicense(inputMap, outMap, optns);
        }  

        if(VALIDATEANDADDBROKER.equalsIgnoreCase(methodName)){
            validateAndAddBroker(inputMap, outMap, optns);
        }
        if(GETPARENTENTITYDETIALS.equalsIgnoreCase(methodName)){
            GetParentEntityDetails(inputMap, outMap, optns);
        }
        return true;
    }
    /*This method validates the license of products in state for the selected broker.*/       
    global void getStateProductLicense(Map<String,Object> input, Map<String, Object> outMap, Map<String, Object> optns) {
        String licenseStatus=EMPTY;
        try{
            Id contactId = input.get(BROKERCONID)!=null&&input.get(BROKERCONID)!=EMPTY?(Id)input.get(BROKERCONID):(Id)optns.get(BROKERCONID);
            String zipcode1 = input.get(ZIPCODE)!=null&&input.get(ZIPCODE)!=EMPTY?(String)input.get(ZIPCODE):(input.get(ZIPCODE1)!=null&&input.get(ZIPCODE1)!=EMPTY?(String)input.get(ZIPCODE1):(String)optns.get(ZIPCODE1));
            if(contactId!=null && zipcode1!=null){
                licenseStatus=validateProdLicense(zipcode1,contactId);
            }  else{licenseStatus=EMPTY;}         
            outMap.put(NODENAME,licenseStatus); 
        }
        catch(Exception excn){
             UTIL_LoggingService.logHandledException(excn, null, null, 
             CLASSNAME, GETSTATEPRODUCTLICENSE,null,LoggingLevel.ERROR); 
        }                                  
    }
    /*This is a generic method for validating the product licenses*/
    public static String validateProdLicense(String zipcode1,Id contactId){
        String license=EMPTY;
        List<License_Appointment__c> productLcns=new List<License_Appointment__c>();
        Geographical_Info__c  geoGraphicInfo;
        set<string> plSet = new set<string>();
        Set<String> productType = new Set<String>{HEALTHLCNS,LIFELCNS};
        SGA_UTIL17_AccessGeographicData.zipcode = zipcode1;
        geoGraphicInfo = SGA_UTIL17_AccessGeographicData.queryGeoInfo(SELECT_GEOGRAPHIC);             
        SGA_Util18_LicenseDataAccessHelper.businessTrack=BUSINESSTRACK;
        SGA_Util18_LicenseDataAccessHelper.state=geoGraphicInfo.State__c;
        SGA_Util18_LicenseDataAccessHelper.licenseVal=LICENSE_VAL;
        SGA_Util18_LicenseDataAccessHelper.contactId = contactId;
        SGA_Util18_LicenseDataAccessHelper.idSet = productType;            
        productLcns = SGA_Util18_LicenseDataAccessHelper.fetchLicenseList(LICENSE_SELECT_QUERY,LICENSE_QUERY_WHERE);
        if(!productLcns.isEmpty()){
            for(License_Appointment__c pl:productLcns){
                if(pl.BR_Start_Date__c<=Date.Today() && pl.BR_End_Date__c>=Date.Today()){
                    plSet.add(pl.SGA_ProdType__c);
                }
            }
            if(!plSet.isEmpty()){            
                if (plSet.contains(HEALTHLCNS) && !(plSet.contains(LIFELCNS))){
                    license = HEALTHLCNS;                   
                }
                else if (plSet.contains(HEALTHLCNS) && plSet.contains(LIFELCNS)){
                    license = HEALTHLIFE;
                }
                else if (plSet.contains(LIFELCNS) &&!(plSet.contains(HEALTHLCNS))){
                    license=LIFELCNS;
                } 
                else{}
            } 
            else{          
                license=NOPRODLICENSE;               
            }  
        }
        else{
            license= NOPRODLICENSE; 
        }
        return license;
    }
/*This method validates the license of broker for products in state for the selected quote for Enrollment in NY state.*/       
    global void getLicenseForNYEnroll(Map<String,Object> input, Map<String, Object> outMap, Map<String, Object> optns) {    
        String status=SG01_Constants.BLANK;
        String licStatus;
        try{
            Id brokerConId = (Id)optns.get(BROKERCONID); 
            String zipcode = (String)optns.get(ZIPCODE); 
            String coverageOptions=(String)optns.get(COVERAGE_OPTIONS);       
            status=SGA_LTNG07_InProgressApplicationsCtrl.checkLicenseforApplications(zipcode,brokerConId,coverageOptions);
            if(FAILED_MSG.equalsIgnoreCase(status)){                
                licStatus=FAILED_MSG;
            }
            else if(PROD_FAILED_MSG.equalsIgnoreCase(status)){                
                licStatus=PROD_FAILED_MSG;
            }
            if(licStatus!=null){
                outMap.put(ERROR_CODE,licStatus);
            }        
        }
        catch(Exception excn){
            UTIL_LoggingService.logHandledException(excn, null, null, 
            CLASSNAME, GETLICENSEFORNYENROLL,null,LoggingLevel.ERROR);
        }
    }
    /*This method verifies the license of broker based on state.*/
    global void validateBrokerStateLicense(Map<String,Object> input, Map<String, Object> outMap, Map<String, Object> optns) {
        String status=EMPTY;        
        try{
            string brokerVal = (String)optns.get(BROKERCONID);
            String zipcode1 = optns.get(ZIPCODE)!=null && optns.get(ZIPCODE)!=EMPTY?(String)optns.get(ZIPCODE):(String)input.get(ZIPCODE);            
            string outNodeName = checkABFEnroll?LCNODENAME:ERROR_CODE;
            if(String.isBlank(zipcode1)){
                outMap.put(outNodeName,ZIPCODE_ERROR); 
            }
            else{
                status = (!String.isBlank(brokerVal) && !String.isBlank(zipcode1))?GeographyInfo.getStateLicenseStatus(zipcode1,(Id)brokerVal):EMPTY;
                if(INVALID_STATUS.equalsIgnoreCase(status)) {
                    outMap.put(outNodeName,FAILED_MSG);  
                } else {
                    outMap.put(LCNODENAME,status); 
                }
            }
        }
        catch(Exception excn){
             UTIL_LoggingService.logHandledException(excn, null, null, 
             CLASSNAME, VALIDATEBROKERSTATELICENSE,null,LoggingLevel.ERROR);
        }  
    }
    
    /*This method verifies the license of broker based on state and add selected broker in Agent page*/
    global void validateAndAddBroker(Map<String,Object> input, Map<String, Object> outMap, Map<String, Object> optns) {
        String status=EMPTY;        
        try{
            string brokerVal = (String)optns.get(BROKERCONID);
            string brokerETIN = (String)optns.get(BROKERETIN);
            String zipcode1 = optns.get(ZIPCODE)!=null && optns.get(ZIPCODE)!=EMPTY?(String)optns.get(ZIPCODE):(String)input.get(ZIPCODE);            
            string outNodeName = checkABFEnroll?LCNODENAME:ERROR_CODE;
            List<Contact> cntList = new List<Contact>();
            Set<Contact> cntSet = new Set<Contact>();
        
            if(String.isBlank(zipcode1)){
                outMap.put(outNodeName,ZIPCODE_ERROR); 
            }
            else{
                status = (!String.isBlank(brokerVal) && !String.isBlank(zipcode1))?GeographyInfo.getStateLicenseStatus(zipcode1,(Id)brokerVal):EMPTY;
                if(INVALID_STATUS.equalsIgnoreCase(status)) {
                    outMap.put(outNodeName,ADDBROKER_FAILED_MSG);  
                } else {
                    if(!String.isBlank(brokerETIN)) {
                        List<Contact> cntFetchList = [SELECT Id,AccountId, Name, ETIN__c, MailingStreet, MailingState, MailingCity, MailingPostalCode, Phone, Fax, Email FROM Contact WHERE (ETIN__c =:brokerETIN ) Limit 1];
                        
                        Map<String,String> tempMap = new Map<String,String>();
                        tempMap.put(BROKERNAME, cntFetchList[0].Name);
                        tempMap.put(BROKERETINO, cntFetchList[0].ETIN__c);
                        tempMap.put(BROKERSTREET, cntFetchList[0].MailingStreet);
                        tempMap.put(BROKERSTATE, cntFetchList[0].MailingState);
                        tempMap.put(BROKERCITY, cntFetchList[0].MailingCity);
                        tempMap.put(BROKERZIP, cntFetchList[0].MailingPostalCode);
                        tempMap.put(BROKERPHONE, cntFetchList[0].Phone);
                        tempMap.put(BROKERFAX, cntFetchList[0].Fax);
                        tempMap.put(BROKEREMAIL, cntFetchList[0].Email);
                        
                        outMap.put(BROKERCONID,cntFetchList[0].Id);
                        outMap.put(BROKERID,cntFetchList[0].Id);
                        outMap.put(BROKERNAME1,cntFetchList[0].Name);
                        outMap.put(BROKERNAMEABF,cntFetchList[0].Name);
                        outMap.put(BROKERETIN1,cntFetchList[0].ETIN__c);
                        outMap.put(BROKERETIN2020,cntFetchList[0].ETIN__c); // Ram Added
                        outMap.put(BROKERETIN2021,cntFetchList[0].ETIN__c); // Ram added
                        outMap.put(BROKERSTREE1,cntFetchList[0].MailingStreet);
                        outMap.put(BROKEREStreetABF,cntFetchList[0].MailingStreet);
                        outMap.put(BROKERCITY1,cntFetchList[0].MailingCity);
                        outMap.put(BROKERECityABF,cntFetchList[0].MailingCity);                        
                        outMap.put(BROKERSTATE1,cntFetchList[0].MailingState);
                        outMap.put(BROKEREStateABF,cntFetchList[0].MailingState);
                        outMap.put(BROKERZIP1,cntFetchList[0].MailingPostalCode);
                        outMap.put(BROKEREZipABF,cntFetchList[0].MailingPostalCode);    
                        outMap.put(BROKERPHONE1,cntFetchList[0].Phone);
                        outMap.put(BROKEREContactNoABF,cntFetchList[0].Phone);
                        outMap.put(BROKERFAX1,cntFetchList[0].Fax);
                        outMap.put(BROKEREMAIL1,cntFetchList[0].Email);
                        outMap.put(BROKEREMAILABF,cntFetchList[0].Email);
                        outMap.put(BrokerTaxIDABF,cntFetchList[0].ETIN__c);
                        outMap.put(BROKERELicenseNoABF,cntFetchList[0].ETIN__c);
                        outMap.put(BROKERACCIDNY,cntFetchList[0].AccountId); //prasanna
                        outMap.put(LCNODENAME,status); 
                        outMap.put(BROKERDETAILS,tempMap);
                    }
                }
            }
        }
        catch(Exception excn){
             UTIL_LoggingService.logHandledException(excn, null, null, 
             CLASSNAME, VALIDATEBROKERSTATELICENSE,null,LoggingLevel.ERROR);
        }  
    }
    
    global void GetParentEntityDetails(Map<String,Object> inputmap, Map<String, Object> outMap, Map<String, Object> options) {
         
        try{
            String State = (String)options.get('State'); 
            String PortfolioType = (String)options.get('PortfolioType'); 
            String PaidAgencyName1 = (String)options.get('PaidAgencyName1');
            String PaidAgencyName2 = (String)options.get('PaidAgencyName2'); 
            system.debug('PaidAgencyName2 -->'+options.get('PaidAgencyName2'));
            String BrokerAgentName1 = (String)options.get('BrokerAgentName1'); 
            String BrokerAgentName2 = (String)options.get('BrokerAgentName2'); 
            String GeneralAgencyName = (String)options.get('GeneralAgencyName');
            system.debug('State  ==>'+State);
            system.debug('PortfolioType  ==>'+PortfolioType);
            system.debug('PaidAgencyName1  ==>'+PaidAgencyName1);
            system.debug('PaidAgencyName2  ==>'+PaidAgencyName2);
            system.debug('BrokerAgentName1  ==>'+BrokerAgentName1);
            system.debug('BrokerAgentName2  ==>'+BrokerAgentName2);
            system.debug('GeneralAgencyName  ==>'+GeneralAgencyName);
            String ParentAgentAgency1 = '';
            String ParentAgentAgency2 = '';
        
            if((PortfolioType == 'ACA' &&(State == 'CT' ||State == 'IN' ||State == 'KY' ||State == 'MO' ||
                                    State == 'NH' ||State == 'ME' ||State == 'OH' ||State == 'VA' ||State == 'WI' ||State == 'CA' || State == 'CO' ||State == 'NV') ) || (PortfolioType == 'MEWA' && State != 'GA')){
                                    
                if(( BrokerAgentName1 != '') && ( GeneralAgencyName!='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 = 'GeneralAgency';
                } 
                if(( BrokerAgentName2!='') && (GeneralAgencyName!='')){
                    ParentAgentAgency2 = 'GeneralAgency';
                } 
                if(( BrokerAgentName1!='') && ( PaidAgencyName1=='') &&  ( GeneralAgencyName=='')){
                    ParentAgentAgency1 = 'BrokerWritingAgent1';
                }
                if(( BrokerAgentName2!='') && ( PaidAgencyName2=='' )&&  ( GeneralAgencyName=='')){
                    ParentAgentAgency2 = 'BrokerWritingAgent2';
                }
                if(( BrokerAgentName1!='') && ( PaidAgencyName1!='' ) &&  ( GeneralAgencyName=='')){
                    ParentAgentAgency1 = 'PaidAgency1';
                }
                if((BrokerAgentName2!='') && ( PaidAgencyName2!='') && ( GeneralAgencyName=='')){
                    ParentAgentAgency2 = 'PaidAgency2';
                }
                                        
                                        
                /*if((BrokerAgentName1!=null || BrokerAgentName1 != '') && (GeneralAgencyName!=null || GeneralAgencyName!='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 = 'GeneralAgency';
                } 
                if((BrokerAgentName2!=null || BrokerAgentName2!='') && (GeneralAgencyName!=null || GeneralAgencyName!='')){
                    ParentAgentAgency2 = 'GeneralAgency';
                } 
                if((BrokerAgentName1!=null || BrokerAgentName1!='') && (PaidAgencyName1 == null || PaidAgencyName1=='') &&  (GeneralAgencyName == null || GeneralAgencyName=='')){
                    ParentAgentAgency1 = 'BrokerWritingAgent1';
                }
                if((BrokerAgentName2!=null || BrokerAgentName2!='') && (PaidAgencyName2 == null || PaidAgencyName2=='' )&&  (GeneralAgencyName == null || GeneralAgencyName=='')){
                    ParentAgentAgency2 = 'BrokerWritingAgent2';
                }
                if((BrokerAgentName1!=null || BrokerAgentName1!='') && (PaidAgencyName1!=null || PaidAgencyName1!='' ) &&  (GeneralAgencyName == null || GeneralAgencyName=='')){
                    ParentAgentAgency1 = 'PaidAgency1';
                }
                if((BrokerAgentName2!=null ||BrokerAgentName2!='') && (PaidAgencyName2!=null || PaidAgencyName2!='') && (GeneralAgencyName == null || GeneralAgencyName=='')){
                    ParentAgentAgency2 = 'PaidAgency2';
                }*/
                
    
            }
            else if((PortfolioType == 'ACA' && (State == 'NY' || State == 'GA') ) || (PortfolioType == 'MEWA' && State == 'GA' )){
        
                if((BrokerAgentName1!='') && ( PaidAgencyName1 == '') && ( GeneralAgencyName!='' )){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'BrokerWritingAgent1';
                }
                if((BrokerAgentName2!='') && (PaidAgencyName2=='') && (GeneralAgencyName!='')){
                    ParentAgentAgency2 =    'BrokerWritingAgent2';
                }
                
                if((BrokerAgentName1!='') && ( PaidAgencyName1!='') && ( GeneralAgencyName!='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'PaidAgency1';
                }
                if(( BrokerAgentName2!='') && ( PaidAgencyName2!='') && ( GeneralAgencyName!='')){
                    ParentAgentAgency2 =    'PaidAgency2';
                }
                
                if(( BrokerAgentName1!='') && ( PaidAgencyName1 == '') && (GeneralAgencyName=='' )){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'BrokerWritingAgent1';
                }
                if(( BrokerAgentName2!='') && ( PaidAgencyName2 == '') && (GeneralAgencyName=='' )){ 
                    ParentAgentAgency2 =    'BrokerWritingAgent2';
                }
                
                if(( BrokerAgentName1!='')  && ( PaidAgencyName1!='') && (GeneralAgencyName=='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'PaidAgency1';
                }
                if(( BrokerAgentName2!='')  && (PaidAgencyName2!='') && (GeneralAgencyName=='')){
                    ParentAgentAgency2 =    'PaidAgency2';
                }
                
                
                /*if((BrokerAgentName1!=null || BrokerAgentName1!='') && (PaidAgencyName1 == null || PaidAgencyName1 == '') && (GeneralAgencyName!=null || GeneralAgencyName!='' )){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'BrokerWritingAgent1';
                }
                if((BrokerAgentName2!=null || BrokerAgentName2!='') && (PaidAgencyName2 == null || PaidAgencyName2=='') && (GeneralAgencyName!=null || GeneralAgencyName!='')){
                    ParentAgentAgency2 =    'BrokerWritingAgent2';
                }
                
                if((BrokerAgentName1!=null ||BrokerAgentName1!='') && (PaidAgencyName1!=null || PaidAgencyName1!='') && (GeneralAgencyName!=null || GeneralAgencyName!='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'PaidAgency1';
                }
                if((BrokerAgentName2!=null || BrokerAgentName2!='') && (PaidAgencyName2!=null || PaidAgencyName2!='') && (GeneralAgencyName!=null || GeneralAgencyName!='')){
                    ParentAgentAgency2 =    'PaidAgency2';
                }
                
                if((BrokerAgentName1!=null || BrokerAgentName1!='') && (PaidAgencyName1 == null || PaidAgencyName1 == '') && (GeneralAgencyName == null ||GeneralAgencyName=='' )){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'BrokerWritingAgent1';
                }
                if((BrokerAgentName2!=null || BrokerAgentName2!='') && (PaidAgencyName2 == null || PaidAgencyName2 == '') && (GeneralAgencyName == null ||GeneralAgencyName=='' )){ 
                    ParentAgentAgency2 =    'BrokerWritingAgent2';
                }
                
                if((BrokerAgentName1!=null || BrokerAgentName1!='')  && (PaidAgencyName1!=null || PaidAgencyName1!='') && (GeneralAgencyName == null ||GeneralAgencyName=='')){  //It will satisfy first 2 scenarios
                    ParentAgentAgency1 =    'PaidAgency1';
                }
                if((BrokerAgentName2!=null || BrokerAgentName2!='')  && (PaidAgencyName2!=null || PaidAgencyName2!='') && (GeneralAgencyName == null ||GeneralAgencyName=='')){
                    ParentAgentAgency2 =    'PaidAgency2';
                }*/
                
            }
            
            system.debug('ParentAgentAgency1  ==>'+ParentAgentAgency1);
            system.debug('ParentAgentAgency2  ==>'+ParentAgentAgency2);
            outMap.put('ParentAgentAgency1',ParentAgentAgency1); 
            outMap.put('ParentAgentAgency2',ParentAgentAgency2);
        }
        catch(Exception excn){
             UTIL_LoggingService.logHandledException(excn, null, null, 
             CLASSNAME, GETPARENTENTITYDETIALS,null,LoggingLevel.ERROR);
        }  
        
        
        
    }
    
    
}