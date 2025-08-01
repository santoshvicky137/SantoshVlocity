/*@author :      Accenture IDC 
@date :          02/01/2018
@name :          SGA_AP63_BrokerRelatedAgencies
@description    : This class fetches the General and Paid agencies related to a Broker
*/
global without sharing class SGA_AP63_BrokerRelatedAgencies implements vlocity_ins.VlocityOpenInterface{
    private static final String ZIPCODE= 'ZipCode3';
    private static final String ZIPCODE1 = 'ZipCode1';
    private static final String ENROLL = 'Enroll';
    private static final String IDKEY = 'IdKey';
    private static final String NAMEKEY = 'NameKey';
    private static final String TINKEY = 'TinKey';
    private static final String SEARCHKEY = 'SearchKey';
    private static final String STREETKEY = 'StreetKey';
    private static final String CITYKEY = 'CityKey';
    private static final String STATEKEY = 'StateKey';
    private static final String ZIPKEY = 'ZipKey';
    private static final String EMAILKEY = 'EmailKey';
    private static final String GA_STREET = 'GeneralAgencyStreet1';
    private static final String GA_CITY = 'GeneralAgencyCity1';
    private static final String GA_STATE = 'GeneralAgencyState1';
    private static final String GA_ZIP = 'GeneralAgencyZip1';
    private static final String GA_EMAIL = 'GeneralAgencyEmail1';
    private static final String PA_STREET = 'PaidAgencyStreet1';
    private static final String PA_CITY = 'PaidAgencyCity1';
    private static final String PA_STATE = 'PaidAgencyState1';
    private static final String PA_ZIP = 'PaidAgencyZip1';
    private static final String PA_EMAIL = 'PaidAgencyEmail1';
    private static final String AGENCY_METHODNAME='getAgencyList';
    private static final String METHODNAME_QUOTEINITIALIZATION='sgQuoteInitialization';
    private static final String EMPTY='';
    private static final String ENROLLSTATE='qState';
    private static final string AGENCY_TYPE='AgencyType';
    private static final String AGENCY_NAME = 'AgencyName';
    private static final String GENERAL_AGENCY='General Agency';
    private static final String GA_ID='GeneralAgencyId';
    private static final String GACY='GeneralAgency';
    private static final String GA_TIN='GeneralAgencyTIN';
    private static final String GA_SEARCH='GeneralAgencySearch';
    private static final String PAID_AGENCY='Paid Agency';
    private static final String PA_ID='PaidAgencyId';
    private static final String PACY='PaidAgency';
    private static final String PA_TIN='PaidAgencyTIN';
    private static final String PA_SEARCH='PaidAgencySearch';
    private static final String OBDRESP='OBDRresp';
    private static final String STEP_NAME='Step';
    private static final String BROKER_TYPEAHEAD='TypeAheadBroker-Block';
    private static final String BROKERCONID='BrokerId';
    private static final String RELATIONSHIP_STATUS='Active for New Business';
    private static final String ERROR_CODE='error';
    private static final String GET_VENDORLIST='getVendorList';
    private static final String BROKERAGE='Brokerage';
    private static final String ERROR_MSG='Please select a valid Broker/Zipcode to get the agencies';
    private static final String CLASSNAME = SGA_AP63_BrokerRelatedAgencies.class.getName();
    private static final String SELECT_GEOGRAPHIC = 'SELECT Id, Zip_Code__c, State__c FROM\n'+
        'Geographical_Info__c where Zip_Code__c =:zipcode LIMIT 1';      
    private static final String AGENCY_SEARCH_QUERY='Select vlocity_ins__TargetPartyId__c, vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__c,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.Name,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.AccountTypeAhead__c,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BR_Encrypted_TIN__c,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingStreet,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingCity,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingState,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingPostalCode,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.vlocity_ins__Email__c,\n'+
        'vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.AgencyType__c from \n'+
        'vlocity_ins__PartyRelationship__c';
    private static final String AGENCY_WHERECLAUSE=SG01_Constants.SPACE+'WHERE vlocity_ins__RelationshipTypeId__r.vlocity_ins__TargetRole__c=:agencyType \n'+
        'AND vlocity_ins__SourcePartyId__r.vlocity_ins__AccountId__c=:brokerAccId AND \n'+
        ' SGA_Relationship_State__c=:geoState AND SGA_RelationshipStatus__c=:relationshipStatus';
    private static final String EXISTINGAGENCY_WHERECLAUSE = SG01_Constants.SPACE + 'AND vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__c=:agencyName \n';
    private static final String BROKERACC_SEARCH_QUERY='SELECT AccountId from Contact Where Id=:conId LIMIT 1';
    private static final String LOGGEDIN_USER_QUERY='SELECT contact.AccountId,contact.Account.AgencyType__c,contact.Account.Name,contact.Account.BR_Encrypted_TIN__c,contact.Account.AccountTypeAhead__c,contact.Account.BillingStreet,contact.Account.BillingCity,contact.Account.BillingState,contact.Account.BillingPostalCode,contact.Account.vlocity_ins__Email__c FROM User WHERE Id=:userId';
    @testVisible private List<Map<String, String>> returnList = new List<Map<String,String>>();
    @testVisible private Map<string,Object> blockMap;
    private AgencyDetails agentKeys;
    /*Implementation of invokeMEthod from VlocityOpenInterface2 interface.*/
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {                          
        if(AGENCY_METHODNAME.equalsIgnoreCase(methodName)) {
            getAgencyList(inputMap, outMap, options);
        }else if(METHODNAME_QUOTEINITIALIZATION.equalsIgnoreCase(methodName)) {
            outMap = sgQuoteInitialization(inputMap,options);
        }   
        else if(GET_VENDORLIST.equalsIgnoreCase(methodName)) {
            getVendorList(inputMap,outMap,options);
        }   
        
        return true;
    }
    /****************************************************************************************************
Method Name : sgQuoteInitialization
Parameters  : inputMap,options
Return type : Map<String,Object>
Description : Update User Profile Information by using Dataraptor SG_QuoteInitialization
******************************************************************************************************/
    public Map<String,Object> sgQuoteInitialization(Map<String,Object> inputMap,Map<String,Object> options){
        String drName=(String) options.get('dataRaptorName');
        vlocity_ins.DRProcessResult result = vlocity_ins.DRGlobal.processObjectsJSON(JSON.serialize(inputMap), drName);
        return result.convertToMap();
    }
    
    
    
    /************************************************************************************
Method Name : getVendorList
Return type : void
Date: 07/07/2021
author: Prasanna
Description : This method is to fetches the Vendor Partner details.
*************************************************************************************/ 
    @RemoteAction
    global static List<BRPSGCRealTimeDataModels.VendorPartner> getVendorList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String OauthId = '';
        String SearchVendorKey = (options.get('VendorSearchKey')!=null && options.get('VendorSearchKey')!=EMPTY) ?(String)options.get('VendorSearchKey'):null;
        system.debug('SearchVendorKey =>'+SearchVendorKey);
        if (!Test.isRunningTest())
        {
            OauthId = BRPOauthForSGC.GetOauthToken();
        }
        
        HttpRequest req = new HttpRequest();
        HttpResponse response;
        List<BRPSGCRealTimeDataModels.VendorPartner> vendorPartners;
        try{
            req =  BRPOauthForSGC.GetHttpReqForAppVendorList(OauthId,'GetVendorList');
            system.debug('--- getVendorList req = '+req);
            
            Http ht = new Http();
            response = new HttpResponse();
            //If (reqMsg != null) 
            //req.setBody(reqMsg);
            if(!Test.isRunningTest())
            {   
                if (!String.isBlank(req.getEndpoint()))
                {
                    response = ht.send(req);
                }
            }
            else
            {
                response.setHeader('Content-Type', 'application/json');
                response.setBody('[{"partnerName":"Nymi","partnerId":"459","partnerType":"Female"},{"partnerName":"Prasanna","partnerId":"444","partnerType":"Male"}]');
                response.setStatusCode(200);
            }     
            system.debug('response  ==>'+response);
            vendorPartners = (List<BRPSGCRealTimeDataModels.VendorPartner>) System.JSON.deserialize(response.getBody(),List<BRPSGCRealTimeDataModels.VendorPartner>.class);
            system.debug('vendorPartners  ==>'+vendorPartners);
            
            List<Map<String, String>> vendorMapList = new List<Map<String,String>>();
            Map<String, String> vendorMap ; 
            for(BRPSGCRealTimeDataModels.VendorPartner vendor : vendorPartners){
                if(vendor.partnerName.toUppercase().contains(SearchVendorKey.toUppercase())){
                    vendorMap = new Map<String, String>();
                    vendorMap.put('VendorPartnerName', vendor.partnerName);
                    // vendorMap.put('partnerId', vendor.partnerId);
                    // vendorMap.put('partnerType', vendor.partnerType);
                    vendorMap.put('Vendor', vendor.partnerName);
                    vendorMapList.add(vendorMap);
                }   
            }
            outMap.put('vendorList',vendorMapList);
            //getVendorResponse = (BRPSGCRealTimeDataModels.GetVendorListResponse) System.JSON.deserialize(response.getBody(), BRPSGCRealTimeDataModels.GetVendorListResponse.class); 
        }
        catch(Exception e){
            System.debug('error message in getVendorList ::'+e.getMessage());
            // outMap.put('error','Provide correct vendor details');
        }
        return vendorPartners;
    }
    
    
    /************************************************************************************
Method Name : getAgencyList
Return type : List
Date: 02/01/2018
author: IDC Offshore
Description : This method is to fetches the general and Paid agencies of a broker.
*************************************************************************************/ 
    global void getAgencyList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        Geographical_Info__c  geoGraphicInfo=null;        
        
        try{  
            String agencyType=(String)options.get(AGENCY_TYPE);
            String agencyName=(String)options.get(AGENCY_NAME);
            system.debug('agencyName : '+ agencyName + ' : isBlank' + String.isBlank(agencyName));
            Map<String,Object> stepMap = null;
            String brokerContId = null;
            String strZip = inputMap.get(ZIPCODE)!=null && inputMap.get(ZIPCODE)!=EMPTY?(String)inputMap.get(ZIPCODE):null;
            strZip= strZip==null&&inputMap.get(ZIPCODE1)!=null&&inputMap.get(ZIPCODE1)!=EMPTY?(String)inputMap.get(ZIPCODE1):strZip;
            SGA_UTIL17_AccessGeographicData.zipcode = strZip;
            String strState = options.get(ENROLLSTATE)!=null && options.get(ENROLLSTATE)!=EMPTY?(String)options.get(ENROLLSTATE):null;
            boolean enroll = options.get(ENROLL)!=null && options.get(ENROLL)!=EMPTY?(boolean)options.get(ENROLL):false;
            string outMapIdKey = options.get(IDKEY)!=null && options.get(IDKEY)!=EMPTY?(string)options.get(IDKEY):null;
            string outMapNameKey = options.get(NAMEKEY)!=null && options.get(NAMEKEY)!=EMPTY?(string)options.get(NAMEKEY):null;
            string outMapTinKey = options.get(TINKEY)!=null && options.get(TINKEY)!=EMPTY?(string)options.get(TINKEY):null;
            string outMapSearchKey = options.get(SEARCHKEY)!=null && options.get(SEARCHKEY)!=EMPTY?(string)options.get(SEARCHKEY):null;
            string outMapStreetKey = options.get(STREETKEY)!=null && options.get(STREETKEY)!=EMPTY?(string)options.get(STREETKEY):null;
            string outMapCityKey = options.get(CITYKEY)!=null && options.get(CITYKEY)!=EMPTY?(string)options.get(CITYKEY):null;
            string outMapStateKey = options.get(STATEKEY)!=null && options.get(STATEKEY)!=EMPTY?(string)options.get(STATEKEY):null;
            string outMapZipKey = options.get(ZIPKEY)!=null && options.get(ZIPKEY)!=EMPTY?(string)options.get(ZIPKEY):null;
            string outMapEmailKey = options.get(EMAILKEY)!=null && options.get(EMAILKEY)!=EMPTY?(string)options.get(EMAILKEY):null;   
            
            /******SetAgent Keys to add Omniscript Outputmap************/
            if(enroll){
                agentKeys = new AgencyDetails(outMapIdKey,outMapNameKey,outMapTinKey,outMapSearchKey,outMapStreetKey,outMapCityKey,outMapStateKey,outMapZipKey,outMapEmailKey);
            }else{
                agentKeys = new AgencyDetails(GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_ID:PA_ID,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GACY:PACY,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_TIN:PA_TIN,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_SEARCH:PA_SEARCH,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_STREET:PA_STREET,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_CITY:PA_CITY,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_STATE:PA_STATE,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_ZIP:PA_ZIP,GENERAL_AGENCY.equalsIgnoreCase(agencyType)?GA_EMAIL:PA_EMAIL);
            }
            
            /******Get BrokerContactId from License Validation Omniscript************/
            if(inputMap.containsKey(STEP_NAME))  {
                stepMap = (Map<string,Object>)inputMap.get(STEP_NAME);
                
                System.debug('++++++++stepMap++++'+stepMap);
                if(stepMap.containsKey(BROKER_TYPEAHEAD)){
                    blockMap = (Map<string,Object>)stepMap.get(BROKER_TYPEAHEAD);               
                    brokerContId=(String)blockMap.get(BROKERCONID);
                }
            }
            else{
                /*****Get BrokerContactId from Enrollment Omniscript*************/
                brokerContId=options.get(BROKERCONID)!=null && options.get(BROKERCONID)!=EMPTY?(String)options.get(BROKERCONID):null;
            }
            
            /**Query Geographical_Info__c object to get State***/
            System.debug('**strState---' + strState);
            System.debug('**strZip---' + strZip);
            geoGraphicInfo = strState==null?SGA_UTIL17_AccessGeographicData.queryGeoInfo(SELECT_GEOGRAPHIC):null;
            
            /**Query User details and Contact object***/
            getContact_UserDetails(agencyType,brokerContId); 
            system.debug('brokerContId---'+brokerContId+'  strState---'+strState+'  strZip---'+strZip+'  strZip---'+strZip+'  geoGraphicInfo---'+geoGraphicInfo);
            
            /**Query Party Relationship Object***/
            if(returnList.isEmpty()){
                SGA_Util19_VlcPartyRelationshipDAHelper.agencyType=agencyType;
                SGA_Util19_VlcPartyRelationshipDAHelper.agencyName=agencyName;
                SGA_Util19_VlcPartyRelationshipDAHelper.relationshipStatus=RELATIONSHIP_STATUS;
                SGA_Util19_VlcPartyRelationshipDAHelper.geoState=strState==null?geoGraphicInfo.state__c:strState; 
                system.debug('&&AGENCY_SEARCH_QUERY---'+AGENCY_SEARCH_QUERY);
                system.debug('**AGENCY_WHERECLAUSE---'+AGENCY_WHERECLAUSE);
                
                Map<ID,vlocity_ins__PartyRelationship__c> agencyMap = null;
                if((String.isNotBlank(agencyName))){
                    agencyMap = SGA_Util19_VlcPartyRelationshipDAHelper.partyRelationshipsMap(AGENCY_SEARCH_QUERY,AGENCY_WHERECLAUSE + EXISTINGAGENCY_WHERECLAUSE, SG01_Constants.BLANK, SG01_Constants.LIMIT_1);
                }else{
                    agencyMap = SGA_Util19_VlcPartyRelationshipDAHelper.partyRelationshipsMap(AGENCY_SEARCH_QUERY,AGENCY_WHERECLAUSE, SG01_Constants.BLANK, SG01_Constants.LIMIT_100);
                }
                
                system.debug('agencyMap---'+agencyMap);
                if(agencyMap != NULL && !agencyMap.isEmpty()){
                    Integer agencySize = agencyMap.values().size();
                    if(agencyType == GENERAL_AGENCY){
                        outMap.put('GAAgencySize',agencySize);
                        
                    }else if(agencyType == PAID_AGENCY){
                        outMap.put('PAAgencySize',agencySize);
                        
                    }
                    for(vlocity_ins__PartyRelationship__c act:agencyMap.values()){ 
                        
                        if(String.isBlank(agencyName) || (String.isNotBlank(agencyName) && act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__c == agencyName)) {
                            
                            returnList.add(assignOutputMap(act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__c,act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.Name,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BR_Encrypted_TIN__c,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.AccountTypeAhead__c,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingStreet,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingCity,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingState,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.BillingPostalCode,
                                                           act.vlocity_ins__TargetPartyId__r.vlocity_ins__AccountId__r.vlocity_ins__Email__c,
                                                           agencyType));
                        }
                    }
                }
                
            }
            else{                
                if(agencyType == GENERAL_AGENCY && !returnList.isEmpty()){
                    outMap.put('GAAgencySize',returnList.size());                    
                }            
            }
            system.debug('returnList : '+ returnList);
            outMap.put(OBDRESP, returnList);                        
        }
        catch(Exception excn){
            UTIL_LoggingService.logHandledException(excn, null, null, 
                                                    CLASSNAME,AGENCY_METHODNAME,null,LoggingLevel.ERROR); 
            outMap.put(ERROR_CODE, ERROR_MSG); 
        }      
    }
    
    
    /************************************************************************************
Method Name : getContact_UserDetails
Return type : void
Date: 06/07/2018
author: IDC Offshore
Description : This methos is called in getAgencyList to query User details and Contact object.
*************************************************************************************/ 
    private void getContact_UserDetails(string agencyType1,String brokerConId){
        /*if(stepMap1 != null && stepMap1.containsKey(BROKER_TYPEAHEAD))  {            
blockMap = (Map<string,Object>)stepMap1.get(BROKER_TYPEAHEAD);           
} */              
        SGA_Util24_UserDataAccessHelper.userId = userInfo.getUserId();
        User userRec = SGA_Util24_UserDataAccessHelper.getUserDetails(LOGGEDIN_USER_QUERY); 
        
        if(userRec.contact.Account.AgencyType__c != null && !userRec.contact.Account.AgencyType__c.equalsIgnoreCase(PAID_AGENCY) && !userRec.contact.Account.AgencyType__c.equalsIgnoreCase(BROKERAGE) && GENERAL_AGENCY.equalsIgnoreCase(agencyType1))
        {            
            returnList.add(assignOutputMap(userRec.contact.AccountId,userRec.contact.Account.Name,userRec.contact.Account.BR_Encrypted_TIN__c,userRec.contact.Account.AccountTypeAhead__c,userRec.contact.Account.BillingStreet,userRec.contact.Account.BillingCity,userRec.contact.Account.BillingState,userRec.contact.Account.BillingPostalCode,userRec.contact.Account.vlocity_ins__Email__c,agencyType1));
        }
        else{ 
            if(brokerConId != null && brokerConId != '') {              
                SGA_Util20_ContactDataAccessHelper.conId=brokerConId; 
                Contact con = [select AccountId from contact where id =: brokerConId];
                //  Contact con=SGA_Util20_ContactDataAccessHelper.fetchAccountId(BROKERACC_SEARCH_QUERY);
                SGA_Util19_VlcPartyRelationshipDAHelper.brokerAccId=con.AccountId;
            }
        }  
    }
    
    /************************************************************************************
Method Name : assignOutputMap
Return type : Map<String,String>
Date: 06/08/2018
author: IDC Offshore
Description : This method is to create a map for Output map.
*************************************************************************************/
    @TestVisible
    private Map<String,String> assignOutputMap(Id GeneralAgencyId, string GeneralAgency,string GeneralAgencyTIN,string GeneralAgencySearch, string GeneralAgencyStreet,string GeneralAgencyCity,string GeneralAgencyState,string GeneralAgencyZip, string GeneralAgencyEmail, string agencyType1){
        Map<String,String> tempMap = new Map<String,String>();
        if(agentKeys.idKey != null){
            tempMap.put(agentKeys.idKey, GeneralAgencyId);
        }
        if(agentKeys.nameKey != null){
            tempMap.put(agentKeys.nameKey, GeneralAgency);
        }
        if(agentKeys.tinKey != null){
            tempMap.put(agentKeys.tinKey, GeneralAgencyTIN);
        }
        if(agentKeys.searchKey != null){
        tempMap.put(agentKeys.searchKey, GeneralAgencySearch);
        }        
        if(agentKeys.StreetKey!= null){
            tempMap.put(agentKeys.StreetKey, GeneralAgencyStreet);
        }
        if(agentKeys.CityKey != null){
            tempMap.put(agentKeys.CityKey, GeneralAgencyCity);
        }
        if(agentKeys.StateKey != null){
            tempMap.put(agentKeys.StateKey, GeneralAgencyState);
        }
        if(agentKeys.ZipKey != null){
            tempMap.put(agentKeys.ZipKey, GeneralAgencyZip);
        }
        if(agentKeys.EmailKey != null){
            tempMap.put(agentKeys.EmailKey, GeneralAgencyEmail);
        }
        //tempMap.put(GA_STREET,GeneralAgencyStreet);
        //tempMap.put(GA_CITY,GeneralAgencyCity);
        //tempMap.put(GA_STATE,GeneralAgencyState);
        //tempMap.put(GA_ZIP,GeneralAgencyZip);
        //tempMap.put(GA_EMAIL,GeneralAgencyEmail);
        return tempMap;
    }
    
    
    
    /************************************************************************************
Class Name : AgencyDetails    
Date: 11/02/2018
author: IDC Offshore
Description : This is a wrapper clas for Agency Details
*************************************************************************************/
    public class AgencyDetails {
        private string idKey;
        private string nameKey;
        private string tinKey;
        private string searchKey;
        private string StreetKey;
        private string CityKey;
        private string StateKey;
        private string ZipKey;
        private string EmailKey;
        
        public AgencyDetails(string id,string agentName,string tin,string agentSearch, string agentStreet,string agentCity,string agentState,string agentZip,string agentEmail) {
            this.idKey = id;
            this.nameKey = agentName;
            this.tinKey = tin;
            this.searchKey = agentSearch;
            this.StreetKey = agentStreet;
            this.CityKey = agentCity;
            this.StateKey = agentState;
            this.ZipKey = agentZip;
            this.EmailKey = agentEmail;
            
        }
    }
    
}