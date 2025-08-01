/************************************************************************************************
* Class Name  : SGA_AP100_CustomTypeAheadBroker
* Created By  : IDC Offshore
* Created Date: 02/05/2018
* Description : It is used to get the broker and agency information from omniscript through Remote action
* History:
* 2019-03-25: Muthu R: Modified insertAccountTeamMembers method to skip insert if the account team member list already has the contacts
* 
**************************************************************************************************/

global without sharing class SGA_AP100_CustomTypeAheadBroker implements vlocity_ins.VlocityOpenInterface{
    private static final string GETBROKERLIST ='getBrokerList';
      private static final string GETBROKERLIST2 ='getBrokerList2';
    private static final string UPDATEBROKERLIST ='updateBrokerList';
    private static final string FETCHAGENCIESLIST ='fetchAgenciesList';
    private static final string APPIDVAL = 'applicationidval';
    private static final string MEMENROLL = 'memberenrollment';
    private static final string CRMID = 'CRMid';
    private static final string ACCNTBROKERID = 'accountbrokerid';
    private static final string ACCNTBROKERIDVA = 'accountbrokeridVA';
    private static final string GENAGNCYACNTID = 'UpdateGeneralAgencyAccId';
    private static final string GENAGNCYCONTID = 'UpdateGeneralAgencyContactId';
    private static final string PAIDAGNCYACNTID = 'UpdatePaidAgencyAccountId';
    private static final string PAIDAGNCYACNTID2 = 'UpdatePaidAgency2AccountId';
    private static final string READ = 'Read';
    private static final string SEARCHSTRING = 'searchString';
    private static final string BROKERAGE ='Brokerage';
    private static final string GENERALAGENCY='General Agency';
    private static final string PAIDAGENCY='Paid Agency';
    private static final string OBDRresp = 'OBDRresp';
    private static final string BROKERId = 'BrokerId';
    private static final string BROKER = 'Broker';
    private static final string BROKER2 = 'Broker2';
    private static final string BROKER19 = 'Broker19';
    private static final string BROKERNAME = 'Brokername';
    private static final string BROKERTIN = 'BrokerTIN';
    private static final string BROKERTIN2 = 'BrokerTIN2';
    private static final string BROKERTIN19 = 'BrokerTIN19';
    private static final string BROKERSEARCH = 'BrokerSearch';
    private static final string BROKERSEARCHVA = 'BrokerSearchVA';
    private static final string BROKER2ACCOUNTID = 'Broker2AccountId';
    private static final string BROKER2ACCOUNTID2 = 'Broker2AccountId2';
    private static final string BROKER2ACCOUNTIDVA = 'Broker2AccountIdVA';
    private static final string BROKER2ACCOUNTIDMO = 'Broker2AccountIdMO';
    private static final string BROKER2ACCOUNTID19 = 'Broker2AccountId19';
    private static final string BROKERVA = 'BrokerVA';
    private static final string BROKERTINVA = 'BrokerTINVA';
    private static final string NAME = 'Name';
    private static final string ETIN = 'ETIN__c';
    private static final string UPDATEOP = 'update';
    private static final string INSERTOP = 'insert';
    private static final string ENROLLSTAGEID = 'EnrollStageID';
    private static final string ENROLLQUOTEID = 'EnrollQuoteId';
    private static final string GNAGNCYID = 'GeneralAgencyId';
    private static final string GNAGNCYNME = 'Generalagent/producer/brokername';
    private static final string GNAGNCYCTY = 'GeneralAgencyCity';
    private static final string GNAGNCYCZPCDE = 'GeneralAgencyZIPCode';
    private static final string GNAGNCYSTA = 'GeneralAgencyState';
    private static final string GNAGNCYSTR = 'GeneralAgentStreetaddress';
    private static final string GNAGNCYETN = 'Agent/producer/brokerIDno';
    private static final string GNAGNCYEML = 'GeneralAgencyEmail';
    private static final string GNAGNCYPHN = 'GeneralAgencyPhone';
    private static final string GNAGNCYFAX = 'GeneralAgencyFax';
    private static final string PAAGNCYID = 'PaidAgencyId';
    private static final string PAAGNCYNME = 'AgencyName1';
  private static final string PAAGNCYETN = 'AgencyTIN1';
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        boolean success = true;
        try{
            if(methodName == GETBROKERLIST) {
                getBrokerList(inputMap, outMap, options);
            }
            else if(methodName == UPDATEBROKERLIST){
                updateBrokerList(inputMap, outMap, options);
            }
            else if(methodName == FETCHAGENCIESLIST){
                fetchAgenciesList(inputMap, outMap, options);
            }
            else if(methodName == GETBROKERLIST2) {
                getBrokerList2(inputMap, outMap, options);
            }
        }catch(Exception e){
            success = false;
            throw e;
        }
        return success;
    }
    
    /****************************************************************************************************
    Method Name : updateBrokerList
    return type   : None
    Description : 1. This method is to update broker writing agent2 on salesforce applicaiton through remote action.
                  
    ******************************************************************************************************/
    global static void updateBrokerList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        
        string appId = (string)options.get(APPIDVAL);
        string memEnroll = (string)options.get(MEMENROLL);   
        string crmid = (string)options.get(CRMID);  
        system.debug('crmid ---'+crmid);  
       // string vendorPartnerId = (string)options.get('vendorPartnerIdVal');  
        string accId = options.get(ACCNTBROKERID) != null ? (string)options.get(ACCNTBROKERID) :(string)options.get(ACCNTBROKERIDVA);
        string generalAccId = (string)options.get(GENAGNCYACNTID);
        string generalConId = null;
        string paidAccId = (string)options.get(PAIDAGNCYACNTID);
        
        string paidAccId2 = (string)options.get(PAIDAGNCYACNTID2);
        string appAccId = (string)options.get('appAccId');
        string VendorValue = (string)options.get('VendorValue');
        system.debug('>>>VendorValue:'+VendorValue);
        // string memMaintananceVendor = (string)options.get('memMaintananceVendor');
        VlocityApplicationTriggerHandler.isFirstRunAfterUpdate = true;
        if(String.isNotBlank(appId)&&String.isNotBlank(generalAccId)){
    List<Contact> genteralAgencyConQueryList = [SELECT Id,Account.AgencyType__c,AccountId FROM Contact WHERE AccountId =:generalAccId Limit 1];
       for(Contact generalconAssign :genteralAgencyConQueryList){     
             generalConId=string.valueOf(generalconAssign.Id);
       }
        } 
        try{
        if(String.isNotBlank(appId) && appId != 'NA'){
        
          if(string.isNotBlank(generalAccId) || string.isNotBlank(paidAccId) ){
                updateGeneralPaidAgency(appId,generalAccId,generalConId,paidAccId);              
            }
            if(String.isNotBlank(accId)){
              /* vlocity_ins__Application__c updateApp = New vlocity_ins__Application__c(id = appId,Broker_Writing_Agent_Name_2__c =accId,Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid,
                                                                                        Member_Maintenance_Vendor__c = memMaintananceVendor,Vendor__c = VendorValue,Vendor_PartnerId__c = vendorPartnerId);
                SGA_Util03_ApplicationDataAccessHelper.dmlApplicationlist(new list<vlocity_ins__Application__c>{updateApp},UPDATEOP);
                Account accountnew = new Account(Id=appAccId , Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid,
                                                                                        Member_Maintenance_Vendor__c = memMaintananceVendor,Vendor__c = VendorValue);*/
                vlocity_ins__Application__c updateApp = New vlocity_ins__Application__c(id = appId,Broker_Writing_Agent_Name_2__c =accId,Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid);
                
                if(paidAccId2 != null)
                updateApp.Paid_Agency_Name2__c = paidAccId2;
                
                SGA_Util03_ApplicationDataAccessHelper.dmlApplicationlist(new list<vlocity_ins__Application__c>{updateApp},UPDATEOP);
                Account accountnew = new Account(Id=appAccId , Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid);
                Database.update(new list<Account>{accountnew});
                insertAccountTeamMembers(accId,null,null);
            }
            else{
                /*vlocity_ins__Application__c updateAppmem = New vlocity_ins__Application__c(id = appId,Member_Enrollment_Type__c =memEnroll, CRM_ID__c=crmid,Vendor_PartnerId__c = vendorPartnerId,
                                                                                          Member_Maintenance_Vendor__c = memMaintananceVendor,Vendor__c = VendorValue); 
                system.debug('app to be updated -'+updateAppmem);
                 Account accountnew = new Account(Id=appAccId , Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid,
                                                                                        Member_Maintenance_Vendor__c = memMaintananceVendor,Vendor__c = VendorValue);*/
                 vlocity_ins__Application__c updateAppmem = New vlocity_ins__Application__c(id = appId,Member_Enrollment_Type__c =memEnroll, CRM_ID__c=crmid); 
                system.debug('app to be updated -'+updateAppmem);
                 Account accountnew = new Account(Id=appAccId , Member_Enrollment_Type__c =memEnroll,CRM_ID__c=crmid);
                Database.update(new list<Account>{accountnew});                
                SGA_Util03_ApplicationDataAccessHelper.dmlApplicationlist(new list<vlocity_ins__Application__c>{updateAppmem},UPDATEOP);
            }
          
        }
        }
        catch(Exception e){
            system.debug('error message :'+e.getMessage());
            
        }
    }
    
    
    /****************************************************************************************************
    Method Name : updateGeneralPaidAgency
    return type   : None
    Description : 1. This method is to update General Agency and Paid Agency on salesforce applicaiton through remote action.
    ******************************************************************************************************/
    @Testvisible
    private static void updateGeneralPaidAgency(string applicId,string GAAccId, string GAConId, string PAAccId){        
        vlocity_ins__Application__c updateAppGAPAAgncy = New vlocity_ins__Application__c();
            updateAppGAPAAgncy.id = applicId;
        //if((string.isNotBlank(GAAccId) && string.isNotBlank(GAConId))){  //commented becuase we don't want to update General_Agency_Contact__c 
        if((string.isNotBlank(GAAccId))){
            updateAppGAPAAgncy.General_Agency_Name1__c =GAAccId;
            //updateAppGAPAAgncy.General_Agency_Contact__c =GAConId;  //SMGR-51438
        }
        if(string.isNotBlank(PAAccId)){
            updateAppGAPAAgncy.Paid_Agency_Name1__c =PAAccId;
            system.debug('----------------------------------------- paid agency'+updateAppGAPAAgncy.Paid_Agency_Name1__c);
        } 
   
        SGA_Util03_ApplicationDataAccessHelper.dmlApplicationlist(new list<vlocity_ins__Application__c>{updateAppGAPAAgncy},UPDATEOP);
        system.debug('----------------------------------------- paid agency');
        if(string.isNotBlank(GAAccId) || string.isNotBlank(PAAccId)){
            insertAccountTeamMembers(null,GAAccId,PAAccId);
        }   
        
    }
    
    /****************************************************************************************************
    Method Name : insertAccountTeamMembers
    return type   : None
    Description : 1. This method is to insert Broker writing Agent 1 as Team member to Broker Writing Agent 2, General Agency and Paid Agency   on salesforce through remote action.
                 
    ******************************************************************************************************/
    private static void insertAccountTeamMembers(string brokAcntId,string GenAgncyAccId, string PaidAgncyAccId){
        list<AccountTeamMember> insertAccTeam = new list<AccountTeamMember>();
        Id idUserId = Userinfo.getUserId();
        List <AccountTeamMember> queryAccTeam;
        if(string.isNotBlank(brokAcntId)){ 
            queryAccTeam = [select id from AccountTeamMember where AccountId = :brokAcntId and UserId = :idUserId Limit 1];
            if (queryAccTeam.isEmpty()) {
                insertAccTeam.add(getAccountTeamMember(brokAcntId,Userinfo.getUserId()));
            }
            queryAccTeam = null;
        }           
        if(string.isNotBlank(GenAgncyAccId)){ 
            queryAccTeam = [select id from AccountTeamMember where AccountId = :GenAgncyAccId and UserId = :idUserId Limit 1];
            if (queryAccTeam.isEmpty()) {
                insertAccTeam.add(getAccountTeamMember(GenAgncyAccId,Userinfo.getUserId())); 
            }
            queryAccTeam = null;
        }
        if(string.isNotBlank(PaidAgncyAccId)){
            queryAccTeam = [select id from AccountTeamMember where AccountId = :PaidAgncyAccId and UserId = :idUserId Limit 1];
            if (queryAccTeam.isEmpty()) {
                insertAccTeam.add(getAccountTeamMember(PaidAgncyAccId,Userinfo.getUserId()));
            }
            queryAccTeam = null;
        }   
        if(!insertAccTeam.isempty()){
             SGA_Util16_AccountTeamDataAccessHelper.dmlOnAccountTeamMember(insertAccTeam,INSERTOP);
        }
    }

    /**************************************************************************************************************
    Method Name : getBrokerList
    return type   : List
    Description : 1. This method is to get the broker writing agent list when broker enters ETIN on Vlocity Screen
    *****************************************************************************************************************/
    private static List<Contact> getBrokerList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        string searchName = (String) options.get(SEARCHSTRING);
        string searchETIN = '%'+searchName+'%';
        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Contact> cntList = new List<Contact>();
        set<Contact> cntSet = new set<Contact>();
        if(searchName.length() > 1){
            List<Contact> cntFetchList = [SELECT Id, Name, ContactTypeAhead__c, ETIN__c, AgencyType__c,AccountId,Account.Name FROM Contact WHERE (ETIN__c like:searchETIN AND (Account.AgencyType__c =:BROKERAGE  OR Account.AgencyType__c =:PAIDAGENCY  OR Account.AgencyType__c =:GENERALAGENCY)) Limit 2000];
            cntSet.addAll(cntFetchList);
            cntList.addAll(cntSet);
            if(cntList != null && cntList.size() > 0){
                Map<String,String> tempMap = new Map<String,String>();
                for (Contact a : cntList){
                    tempMap.put(BROKERId, a.Id);
                    tempMap.put(BROKER, (String)a.get(NAME));
                     tempMap.put(BROKER2, (String)a.get(NAME));
                    tempMap.put(BROKERNAME, (String)a.get(NAME));
                    tempMap.put(BROKER19, (String)a.get(NAME));
                    tempMap.put(BROKERTIN, (String)a.get(ETIN));
                    tempMap.put(BROKERTIN2, (String)a.get(ETIN));
                    tempMap.put(BROKERTIN19, (String)a.get(ETIN));
                    tempMap.put(BROKERSEARCH, (String)a.get(ETIN));
                    tempMap.put(BROKERSEARCHVA, (String)a.get(ETIN));
                    tempMap.put(BROKER2ACCOUNTID,a.AccountId);
                    tempMap.put(BROKER2ACCOUNTID2,a.AccountId);
                    tempMap.put(BROKER2ACCOUNTIDVA,a.AccountId);
                    tempMap.put(BROKER2ACCOUNTIDMO,a.AccountId);
                    tempMap.put(BROKER2ACCOUNTID19,a.AccountId);
                    tempMap.put(BROKERVA, (String)a.get(NAME));
                    tempMap.put(BROKERTINVA, (String)a.get(ETIN));
                    returnList.add(tempMap);
                }
            }         
            outMap.put(OBDRresp, returnList);
        }
        system.debug('this is --------------'+ cntList);
        return cntList;
        
    }
    @RemoteAction
    global static List<Contact> getBrokerList2(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');
        String searchETIN = '%'+searchName+'%';

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Contact> cntList = new List<Contact>();
        Set<Contact> cntSet = new Set<Contact>();

        if(searchName.length() > 1){
          List<List<Contact>> cntQueryList = search.query('FIND \''+ searchName +  '*\' IN Name FIELDS RETURNING Contact(Id, Name, AccountId,MailingStreet, MailingCity, MailingState, MailingPostalCode, Email,Phone,Fax, ContactTypeAhead__c, ETIN__c, AgencyType__c WHERE AgencyType__c = \'Brokerage\') LIMIT 5');
          cntSet.addAll(((List<Contact>)cntQueryList[0]));
          System.debug('The cntList is: ' + cntQueryList);

          List<Contact> cntFetchList = [SELECT Id,AccountId, Name,MailingStreet,MailingCity,MailingState,MailingPostalCode,Email,Phone,Fax,ContactTypeAhead__c, ETIN__c, AgencyType__c FROM Contact WHERE (ETIN__c LIKE :searchETIN AND AgencyType__c = 'Brokerage')];
          cntSet.addAll(cntFetchList);
          System.debug('The cntFetchList is: ' + cntFetchList);

          //cntList = ((List<SObject>)cntQueryList[0]);
          cntList.addAll(cntSet);
          if(cntList != null && cntList.size() > 0){
              for (Contact a : cntList){

                  if((String)a.get('AgencyType__c') == 'Brokerage'){
                    Map<String,String> tempMap = new Map<String,String>();
                   
                    tempMap.put('Broker2Name', (String)a.get('Name'));
                    tempMap.put('Broker', (String)a.get('Name'));
                    tempMap.put('BrokerTIN', (String)a.get('ETIN__c'));
                    tempMap.put('BrokerSearch', (String)a.get('ContactTypeAhead__c'));
                    tempMap.put('Broker2AccountId', (String)a.get('AccountId'));
                    tempMap.put('Broker2Id', a.Id);
                    tempMap.put('Broker2Streetaddress', (String)a.get('MailingStreet'));
                    tempMap.put('Broker2City', (String)a.get('MailingCity'));
                    tempMap.put('Broker2State', (String)a.get('MailingState'));
                    tempMap.put('Broker2ZipCode', (String)a.get('MailingPostalCode'));
                    tempMap.put('Broker2Phone', (String)a.get('Phone'));
                    tempMap.put('Broker2Email', (String)a.get('Email')); 
                    tempMap.put('Broker2Faxno', (String)a.get('Fax'));

                    
                    returnList.add(tempMap);
                  }

              }
          }
          System.debug('The accMap is: ' + returnList);
          outMap.put('OBDRresp', returnList);
        }

        //cntList.sort();
        return cntList;
    }
    
    /**************************************************************************************************************
    Method Name : getAccountTeamMember
    return type   : AccountTeamMember
    Description : 1. This method is to initialize AccountTeamMember.
    *****************************************************************************************************************/
    private static AccountTeamMember getAccountTeamMember(Id accntId, Id userId) {
        return new AccountTeamMember(AccountId=accntId,TeamMemberRole=BROKER,AccountAccessLevel = READ,OpportunityAccessLevel = READ,CaseAccessLevel = READ,UserId = userId);
    }
    
    
    /**************************************************************************************************************
    Method Name : fetchAgenciesList
    return type   : AccountTeamMember
    Description : 1. This method is to initialize AccountTeamMember.
    *****************************************************************************************************************/
    public static void fetchAgenciesList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        list<SGA_QuoteEnrollmentStage__c> stageList = new list<SGA_QuoteEnrollmentStage__c>();
        list<Quote> quoteList = new list<Quote>();      
        string enrStageId = (string)options.get(ENROLLSTAGEID);
        string enrQuoteId = (string)options.get(ENROLLQUOTEID);        
        Id paId = null;
        Id gaId = null; 
        if(string.isNotBlank(enrStageId)){          
            stageList = [SELECT Id,GeneralAgency__c,PaidAgency__c FROM SGA_QuoteEnrollmentStage__c WHERE Id =:enrStageId  Limit 1];
            if(!stageList.isEmpty() && (!String.isEmpty(stageList[0].GeneralAgency__c) || !String.isEmpty(stageList[0].PaidAgency__c))){                
                paId = stageList[0].PaidAgency__c != null ? Id.valueOf(stageList[0].PaidAgency__c):null;
                gaId = stageList[0].GeneralAgency__c != null? Id.valueOf(stageList[0].GeneralAgency__c):null;                
            }
        }
        else if(string.isNotBlank(enrQuoteId)){         
            quoteList = [SELECT Id,General_Agency_Name__c,Paid_Agency_Name__c FROM Quote WHERE Id =:enrQuoteId Limit 1];
            if(!quoteList.isEmpty() && (!String.isEmpty(quoteList[0].General_Agency_Name__c) || !String.isEmpty(quoteList[0].Paid_Agency_Name__c))){
                paId = quoteList[0].Paid_Agency_Name__c;
                gaId = quoteList[0].General_Agency_Name__c;
            }            
        }
        if(paId != null || gaId != null){
            for(Account acc : [select Id,Name,BillingCity,BillingPostalCode,BillingState,BillingStreet,BR_Encrypted_TIN__c,vlocity_ins__Email__c,AgencyType__c, Phone, Fax from Account where ID = :paId OR ID = :gaId]){
               if(acc.Id == gaId){
                   outMap.put(GNAGNCYID,acc.Id);
                   outMap.put(GNAGNCYNME,acc.Name); 
                   outMap.put(GNAGNCYCTY,acc.BillingCity); 
                   outMap.put(GNAGNCYCZPCDE,acc.BillingPostalCode); 
                   outMap.put(GNAGNCYSTA,acc.BillingState); 
                   outMap.put(GNAGNCYSTR,acc.BillingStreet); 
                   outMap.put(GNAGNCYETN,acc.BR_Encrypted_TIN__c);
                   outMap.put(GNAGNCYEML,acc.vlocity_ins__Email__c);
                   outMap.put(GNAGNCYPHN,acc.Phone);
                   outMap.put(GNAGNCYFAX,acc.Fax);
               }
               if(acc.Id == paId){
                   outMap.put(PAAGNCYID,acc.Id);
                   outMap.put(PAAGNCYNME,acc.Name); 
                   outMap.put(PAAGNCYETN,acc.BR_Encrypted_TIN__c);
               }         
            }
        }
    }
}