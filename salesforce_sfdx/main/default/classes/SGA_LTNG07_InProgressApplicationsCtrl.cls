/*
* Class Name   : SGA_LTNG07_InProgressApplicationsCtrl
* Created Date : 5/5/2017
* Created By   : IDC Offshore
* Description  :  1. Apex Controller to handle In SGA_LTNG07_OmpniInProgressApplications Component
*                 2. Used to get the In Process Application details for the particular record and construct
*                    the vlocity_ins__OmniScriptInstance__c list and return back to component.
**/
public with sharing class SGA_LTNG07_InProgressApplicationsCtrl {  
    public Account acct{get;set;}
    public static final String FAILED_MSG='You are not actively licensed and contracted in the given state.';
    public static final String PROD_FAILED_MSG='You are not actively licensed for any available product categories.';    
    public static final String VALID_STATUS='Valid';
    public static final String NAME='OmniScriptDataJSON.json';
    private static final String NOPRODLICENSE='NoProdLicense';
    private static final String HEALTHLCNS= 'Health';
    private static final String LIFELCNS= 'Life';
    private static final String HEALTHLIFE= 'Health & Life';
    private static final String MEDICAL_VAL='Medical';
    private static final String DENTAL_VAL='Dental';
    private static final String VISION_VAL='Vision';
    private static final String SEMICOLON=';';
    private static final String OMNI_SUBTYPE_CONSTANT='CA_CO';
    private static final String OMNI_SUBTYPE_CONSTANTWINV='WI_NV';
    private static final String OMNI_SUBTYPE_CONSTANTCTNHME='CT_NH_ME';
    private static final String OMNI_SUBTYPE_CONSTANTCTGAVAMO='GA_VA_MO';
    private static final String OMNI_SUBTYPE_CONSTANTCTINKYOH='IN_KY_OH';
    private static final String OMNI_SUBTYPE_CONSTANT_MEWA_IN_GA='MEWA_IN_GA';
    private static final String OMNI_TYPE_CONSTANT='Enrollment';
    private static final String ENROLL_BTN='enroll';
    private static final String SELECT_ATTACH = 'Select Id, Name, Body FROM Attachment \n'+
        'WHERE ParentId =:parentId1 AND Name =:name1 LIMIT 1';
    private static final String GET_ACCOUNT_STATE = 'getAccountState';
    private static final string ABFOMNI_SUBTYPE_CONSTANT='ABF';
    private static final string ABF_CA_OMNI_SUBTYPE_CONSTANT='ABF_CA';
    private static final string ABF_CA_OMNI_SUBTYPE_CONSTANT_2024='ABF_CA_2024';
    private static final string ABFENROLL_BTN='abfenroll';
    /****************************************************************************************************
Method Name : sga_LTNG07_InProgressApplicationsCtrl
Parameters  : ApexPages.StandardController
Return type : 
Description : This is Parameterized Constructor to intialize Account data
******************************************************************************************************/
    public sga_LTNG07_InProgressApplicationsCtrl(ApexPages.StandardController controller) {
        this.acct = (Account)controller.getRecord();
    }
    
    @AuraEnabled
    /****************************************************************************************************
Method Name : inProgressApplications
Parameters  : String accId
Return type : List<vlocity_ins__OmniScriptInstance__c>
Description : This method is used to fetch the Applications record based on Account Id and OmniScriptType
******************************************************************************************************/
    public static List<vlocity_ins__OmniScriptInstance__c> inProgressApplications(String accId) {
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts1 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts2 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts3 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts4 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts5 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts6 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts7 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts8 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscripts9 = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> savedOmniscriptsMEWA = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> abfSavedOmniscripts = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> validABFSavedOmniscripts = new List<vlocity_ins__OmniScriptInstance__c>();
        List<vlocity_ins__OmniScriptInstance__c> abfCASavedOmniscripts = new List<vlocity_ins__OmniScriptInstance__c>();
        List<string> statusList= new List<string>();
        statusList.add(SG01_Constants.STATUSCANCELLED); 
        statusList.add(SG01_Constants.STATUSINPROGRESS);
        try {
            if(!String.isBlank(accId)) {
                //call applications for SUBTYPE= ENROLLMENT and TYPE= SG Quoting 
                savedOmniscripts1= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,SG01_Constants.SUBTYPE_ENROLLMENT,SG01_Constants.SG_QUOTING,accId);
                //call applications for SUBTYPE= New_York and TYPE= ENROLLMENT  
                savedOmniscripts2= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,SG01_Constants.SUBTYPE_NEWYORK1,SG01_Constants.TYPE_ENROLLMENT,accId);
                //call applications for SUBTYPE= CA_CO and TYPE= Enrollment  
                savedOmniscripts3= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANT,OMNI_TYPE_CONSTANT,accId);
                //call applications for SUBTYPE= License and TYPE= Validation  
                savedOmniscripts4= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,SG01_Constants.SG_VALIDATION,SG01_Constants.SG_LICENSE,accId);
                //call applications for SUBTYPE= WI_NV and TYPE= Enrollment  
                savedOmniscripts6= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANTWINV,OMNI_TYPE_CONSTANT,accId);
                //call applications for SUBTYPE= CT_NH_ME and TYPE= Enrollment  
                savedOmniscripts7= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANTCTNHME,OMNI_TYPE_CONSTANT,accId);
                
                //call applications for SUBTYPE= GA_VA_MO and TYPE= Enrollment  
                savedOmniscripts8= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANTCTGAVAMO,OMNI_TYPE_CONSTANT,accId);
                //call applications for SUBTYPE= IN_KY_OH and TYPE= Enrollment  
                savedOmniscripts9= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANTCTINKYOH,OMNI_TYPE_CONSTANT,accId);
                
                //call applications for SUBTYPE= MEWA_IN_GA and TYPE= Enrollment  
                savedOmniscriptsMEWA= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,OMNI_SUBTYPE_CONSTANT_MEWA_IN_GA,OMNI_TYPE_CONSTANT,accId);
                
                //call applications for SUBTYPE= ABF and TYPE= Enrollment  
                abfSavedOmniscripts= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,ABFOMNI_SUBTYPE_CONSTANT,OMNI_TYPE_CONSTANT,accId);
                system.debug('##abfSavedOmniscripts:'+abfSavedOmniscripts);
                
                //call applications for SUBTYPE= ABF_CA and TYPE= Enrollment  
                abfCASavedOmniscripts= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,ABF_CA_OMNI_SUBTYPE_CONSTANT,OMNI_TYPE_CONSTANT,accId);
                system.debug('##abfCASavedOmniscripts:'+abfCASavedOmniscripts);
                
                //call applications for SUBTYPE= ABF_CA and TYPE= Enrollment  
                abfCASavedOmniscripts= SGA_LTNG03_AccountRelatedListQueryHelper.getInProcessQuotesList(SG01_Constants.ACCOUNT,SG01_Constants.STATUSINPROGRESS,statusList,ABF_CA_OMNI_SUBTYPE_CONSTANT_2024,OMNI_TYPE_CONSTANT,accId);
                system.debug('##abfCASavedOmniscripts:'+abfCASavedOmniscripts);
                
                //prepare final list to be displayed combining both
                if(!savedOmniscripts1.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts1); 
                }
                if(!savedOmniscripts2.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts2);
                }
                if(!savedOmniscripts3.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts3);
                }
                if(!savedOmniscripts4.isEmpty()){
                    savedOmniscripts5 = SGA_LTNG04_InProgressController.getValidInstances(savedOmniscripts4,ENROLL_BTN);
                    if(!savedOmniscripts5.isEmpty()){
                        savedOmniscripts.addAll(savedOmniscripts5);}
                }
                if(!savedOmniscripts6.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts6);
                }
                if(!savedOmniscripts7.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts7);
                }
                if(!savedOmniscripts8.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts8);
                }
                if(!savedOmniscripts9.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscripts9);
                }
                if(!savedOmniscriptsMEWA.isEmpty()){
                    savedOmniscripts.addAll(savedOmniscriptsMEWA);
                }
                if(!savedOmniscripts4.isEmpty()){
                    system.debug('##in if:'+savedOmniscripts4);
                    validABFSavedOmniscripts = SGA_LTNG04_InProgressController.getValidInstances(savedOmniscripts4,ABFENROLL_BTN);
                    system.debug('##validABFSavedOmniscripts:'+validABFSavedOmniscripts);
                    savedOmniscripts.addAll(validABFSavedOmniscripts);
                }
                if(!abfSavedOmniscripts.isEmpty()){
                    savedOmniscripts.addAll(abfSavedOmniscripts);
                } 
                if(!abfCASavedOmniscripts.isEmpty()){
                    savedOmniscripts.addAll(abfCASavedOmniscripts);
                }           
                
            } 
        }
        Catch(Exception ex) { UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, SG01_Constants.CLS_SGA_LTNG07_INPROGRESSAPPCTRL, SG01_Constants.INPROCESSQUOTESLIST, SG01_Constants.BLANK, Logginglevel.ERROR); }
        return savedOmniscripts;
    }
    
    /****************************************************************************************************
Method Name : getCurrentUserProfile
Parameters  : None
Return type : String
Description : This method is used to fetch the current Logged In user Profile and returns Profile Name
******************************************************************************************************/
    @AuraEnabled
    public static String getCurrentUserProfile() {
        String profileName=SG01_Constants.BLANK;
        Try{
            Map<Id,Profile> profileMap=new Map<Id,Profile>();
            // Select clause for Profile            
            String appSelectClause=SG01_Constants.PROFILE_QUERY;
            // Where clause for Profile
            String profileWhereClause = SG01_Constants.WHERE_CLAUSE+SG01_Constants.SPACE+SG01_Constants.ID+SG01_Constants.EQUALS_SLASH+String.escapeSingleQuotes(userinfo.getProfileId())+SG01_Constants.BACK_SLASH; 
            // fetch the Profile details from SGA_Util10_ProfileDataAccessHelper
            profileMap = SGA_Util10_ProfileDataAccessHelper.fetchProfileMap(appSelectClause,profileWhereClause,SG01_Constants.BLANK,SG01_Constants.LIMIT_1 );
            if(!profileMap.isEmpty() ){
                profileName = profileMap.get(userinfo.getProfileId()).Name;    
            }
        }Catch(Exception ex){ UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, SG01_Constants.CLS_SGA_LTNG07_INPROGRESSAPPCTRL, SG01_Constants.GETCURRENTUSERPROFILE, SG01_Constants.BLANK, Logginglevel.ERROR);}
        
        return profileName;
    }
    
    /****************************************************************************************************
Method Name : inProgressApplicationLicense
Parameters  : String Zipcode, Id BrokerContatcId
Return type : String
Description : This method is used to check the license and contract for In Progress Applications record based on Zipcode and Broker
******************************************************************************************************/
    @AuraEnabled
    public static String inProgressApplicationLicense(String parentId){
        String status=SG01_Constants.BLANK;
        Attachment attach;
        try{
            SGA_UTIL21_AccessAttachment.parentId1 = parentId;
            system.debug('##parentId:'+parentId);
            SGA_UTIL21_AccessAttachment.name1 = Name;
            attach = SGA_UTIL21_AccessAttachment.queryAttachment(SELECT_ATTACH);
            string str = attach.Body.toString(); 
            SGA_AP60_ParseApplicationJSON jsonObj = SGA_AP60_ParseApplicationJSON.parse(str);            
            string brokerId = String.isEmpty(jsonObj.BrokerId)?jsonObj.BrokerContactId:jsonObj.BrokerId;  
            system.debug('##brokerId:'+brokerId);
            if(!String.isEmpty(brokerId))
            {  
                string zip = jsonObj.CompanyInformation!=null ? jsonObj.CompanyInformation.Zip : jsonObj.ZipCode3!=null ? jsonObj.ZipCode3 :null;
                string coverageOptions = jsonObj.CoverageOptions!=null?jsonObj.CoverageOptions:MEDICAL_VAL;
                system.debug('##zip:'+zip);
                system.debug('##coverageOptions:'+coverageOptions);
                if(!String.isEmpty(zip)){
                    status= checkLicenseforApplications(zip,brokerId,coverageOptions);}
                system.debug('##status:'+status);
            }
            
        }
        Catch(Exception ex){ 
            UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, SG01_Constants.CLS_SGA_LTNG07_INPROGRESSAPPCTRL, SG01_Constants.INPROCESSQUOTESLIST, SG01_Constants.BLANK, Logginglevel.ERROR);
            status= FAILED_MSG;
        }
        return status;
    }
    
    /****************************************************************************************************
Method Name : checkLicenseforApplications
Parameters  : String Zipcode, String BrokerContatcId,String coverageOptions
Return type : String
Description : This method is used to check the license, contract & Product License for In Progress Applications/Quotes record based on Zipcode and Broker
******************************************************************************************************/
    @RemoteAction
    public static String checkLicenseforApplications(String zip,String brokerId,String coverageOptions)
    {
        String licStatus;
        String prodLicStatus;
        String coverageStatus;
        String aplnstatus=SG01_Constants.BLANK;
        if(coverageOptions != null){
            set<string> coverageOptSet = new set<string>(coverageOptions.split(SEMICOLON));
            if(coverageOptSet.contains(MEDICAL_VAL) || coverageOptSet.contains(DENTAL_VAL) || coverageOptSet.contains(VISION_VAL)){
                coverageStatus = coverageOptSet.contains(LIFELCNS)?HEALTHLIFE:HEALTHLCNS;
            }            
            else if(coverageOptSet.contains(LIFELCNS)){
                coverageStatus=LIFELCNS;}
        }
        if(brokerId != null && zip != null){
            licStatus=GeographyInfo.getStateLicenseStatus(zip,brokerId);
            if(VALID_STATUS.equalsIgnoreCase(licStatus) && coverageStatus != null){
                prodLicStatus=SGA_AP59_BrokerProductLicenseInfo.validateProdLicense(zip,brokerId);
                if(NOPRODLICENSE.equalsIgnoreCase(prodLicStatus)){
                    aplnstatus= PROD_FAILED_MSG;
                }
                else {aplnstatus = prodLicStatus.indexOf(coverageStatus) != -1?prodLicStatus:PROD_FAILED_MSG;
                     }
            }
            else{               
                aplnstatus= VALID_STATUS.equalsIgnoreCase(licStatus)?PROD_FAILED_MSG:FAILED_MSG;
            }
        }
        return aplnstatus;
    }
    
    /****************************************************************************************************
Method Name : cancelInProgressApplications
Parameters  : String accId String Aid
Return type : List<vlocity_ins__OmniScriptInstance__c>
Description : This method is used to get the state and state related help text from the custom setting.
******************************************************************************************************/
    @AuraEnabled
    public static SGA_CS12_State_HelpText__c getAccountState(String accId) {
        SGA_CS12_State_HelpText__c stateHelpTxtObj = new SGA_CS12_State_HelpText__c();
        String accountState = null;
        Map<String, String> stateHelpMap = new Map<String, String>();
        try{
            if(accId != null){
                
                Account accObj = [Select id, Company_State__c from Account where Id =:accId LIMIT 1];
                accountState = accObj.Company_State__c;
                if(!String.isEmpty(accountState) || accountState != null){
                    Map<String, SGA_CS12_State_HelpText__c> allHelpTxts = SGA_CS12_State_HelpText__c.getAll();
                    for(String key : allHelpTxts.keySet()){
                        if(String.isNotBlank(key) && accountState.equalsIgnoreCase(key)){
                            stateHelpTxtObj.Name = allHelpTxts.get(key).Name;
                            stateHelpTxtObj.Email__c = allHelpTxts.get(key).Email__c;
                        }
                    }
                }
            }
        }Catch(Exception ex){ UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, SG01_Constants.CLS_SGA_LTNG07_INPROGRESSAPPCTRL, GET_ACCOUNT_STATE, SG01_Constants.BLANK, Logginglevel.ERROR);}
        return stateHelpTxtObj;
    }
}