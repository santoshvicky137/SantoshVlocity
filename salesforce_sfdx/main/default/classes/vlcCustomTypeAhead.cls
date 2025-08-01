global with sharing class vlcCustomTypeAhead implements vlocity_ins.VlocityOpenInterface{
  private static final String ZIPCODE= 'ZipCode3';
  private static final String SELECT_GEOGRAPHIC = 'SELECT Id, Zip_Code__c, State__c FROM\n'+
                                                     'Geographical_Info__c where Zip_Code__c =:zipcode LIMIT 1';
  private static final String NY_STATE='NY';
  public static final String CLASSNAME = vlcCustomTypeAhead.class.getName();
  private static final String ERROR_CODE='error';
  private static final String AGENCY_METHODNAME='getAllStatesBrokerList';
  private static final String ERROR_MSG='Please provide valid Zipcode to select broker.';

     public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        Boolean success = true;

        try{
            if(methodName == 'getAccountsList') {
                getAccountsList(inputMap, outMap, options);
            }
            if(methodName == 'getGeneralAgencyList') {
                getGeneralAgencyList(inputMap, outMap, options);
            }
            if(methodName == 'getPaidAgencyList') {
                getPaidAgencyList(inputMap, outMap, options);
            }
            if(methodName == 'getAllStatesBrokerList') {
                getAllStatesBrokerList(inputMap, outMap, options);
            }
            if(methodName == 'getBrokerList') {
                getBrokerList(inputMap, outMap, options);
            }
            if(methodName == 'getBrokerAccountsList') {
                getBrokerAccountsList(inputMap, outMap, options);
            }
            
        }catch(Exception e){
            System.debug(' exception '+e);
            success = false;
            throw e;
        }
        return success;
     }


    @RemoteAction
    global static List<Account> getAccountsList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Account> accList = new List<Account>();       
        string zipc = inputMap.get('ZipCode3') != null && inputMap.get('ZipCode3') != ''?(String)inputMap.get('ZipCode3'):(String)inputMap.get('ContextZip'); 
        
        if(searchName.length() > 1){
          List<List<Account>> accQueryList = search.query('FIND \''+ searchName +  '*\' IN NAME FIELDS RETURNING Account(Id, Name, Employer_EIN__c, Sic,Temp_SIC__c,Phone_Number__c,Company_Street__c,Company_City__c,Primary_Contact__c,Prior_Group_Case_Number__c, ' + 
                                                          'Type,General_Agency__c,General_Agency__r.Name,General_Agency__r.BR_Encrypted_TIN__c,General_Agency__r.AccountTypeAhead__c,Association_Name__c, ' + 
                                                          'Paid_Agency__c,Paid_Agency__r.Name,Paid_Agency__r.BR_Encrypted_TIN__c,Paid_Agency__r.AccountTypeAhead__c where Company_Zip__c = :zipc)');
          System.debug('The accList is: ' + accQueryList);

          accList = ((List<Account>)accQueryList[0]);
          Set<String> sicSet = new Set<String>();
          Set<Id> accIds = new Set<Id>();
            List<String> accIdList = new List<String>();
          Set<Id> contactIds = new Set<Id>();
          if(accList != null && accList.size() > 0){
              for (Account a : accList){
                  sicSet.add((String)a.get('Sic'));
                  accIds.add((String)a.get('Id'));
                  accIdList.add((String)a.get('Id'));
                  contactIds.add((Id)a.get('Primary_Contact__c'));
              }
              
              //Group Conv Check Logic Added
              AP_AccountUtils ap = new AP_AccountUtils();
              inputMap.put('accountIdList', accIdList);
              options.put('checkGrpConvOnly', true);
              Map<String,Boolean> accGrpConMap = ap.getAccConvGroups(inputMap, outMap, options);
              system.debug('accGrpConMap'+accGrpConMap);
              system.debug('accountIdList'+accIdList);
              //End(0)
              
              System.debug('accIds is: ' + accIds);
              System.debug('sicSet is' + sicSet);
              Map<Id, Contact> contactsMap = new Map<Id, Contact>([SELECT Id, Title, Phone, Email, Name FROM Contact WHERE Id IN :contactIds]);
              List<SmallGroupSIC__c> sicList = [SELECT Id, SIC__c, SIC_CODE__c, SIC_Numeric__c FROM SmallGroupSIC__c WHERE SIC_CODE__c IN :sicSet];
              Map<String, SmallGroupSIC__c> sicCodeToValuesMap = new Map<String, SmallGroupSIC__c>();
              for(SmallGroupSIC__c sic: sicList) {
                  sicCodeToValuesMap.put(sic.SIC_CODE__c, sic);
              }
              List<Quote> quoteList = [SELECT Id,AccountId,Total_Eligible_Employees__c,Quote_Contact_Email__c,Quote_Contact_Name__c,Quote_Contact_Phone__c FROM Quote WHERE Status != 'Draft' AND AccountId IN: accIds ORDER BY AccountId ASC, CreatedDate DESC];
              Map<Id,Quote> accQuoteMap = new Map<Id,Quote>();
              System.debug('quoteList is: ' + quoteList);
              for(Quote q:quotelist){
                  if(!accQuoteMap.containsKey(q.AccountId)){
                      accQuoteMap.put(q.AccountId,q);
                  }
              }
              
              List<Associations__c> assocList = [SELECT Id, Name,Assoc_Id__c, Association_Id__c FROM Associations__c];
              Map<String, Associations__c> nameToAssocMap = new Map<String, Associations__c>();
              for(Associations__c assoc: assocList) {
                  nameToAssocMap.put(assoc.Name, assoc);
              }
              
              List<Opportunity> opportunityList = [SELECT Id,Name,PaidAgency__c,GeneralAgency__c,AccountId,PaidAgency__r.Name,PaidAgency__r.BR_Encrypted_TIN__c,PaidAgency__r.AccountTypeAhead__c,GeneralAgency__r.Name,GeneralAgency__r.BR_Encrypted_TIN__c,GeneralAgency__r.AccountTypeAhead__c 
                                                   FROM Opportunity WHERE Type = 'New Sales' AND AccountId IN: accIds ORDER BY AccountId ASC, CreatedDate DESC];
              Map<Id,Opportunity> accOpportunityMap = new Map<Id,Opportunity>();
              System.debug('opportunityList is: ' + opportunityList);
              for(Opportunity o: opportunitylist){
                  if(!accOpportunityMap.containsKey(o.AccountId)){
                      accOpportunityMap.put(o.AccountId,o);
                  }
              }
              System.debug('accQuoteMap is: ' + accQuoteMap);
              for (Account a : accList){
                  Map<String,String> tempMap = new Map<String,String>();
                  tempMap.put('ExistingAccountId', a.Id);
                  tempMap.put('ExistingAccountName', (String)a.get('Name'));
                  tempMap.put('GroupETIN', (String)a.get('Employer_EIN__c'));
                  tempMap.put('AccountSearch', (String)a.get('Name'));
                  tempMap.put('StreetAddress', (String)a.get('Company_Street__c'));
                  tempMap.put('City', (String)a.get('Company_City__c'));
                  tempMap.put('PrimaryPhone', (String)a.get('Phone_Number__c'));
                  tempMap.put('ExistingAnthemClientNumber', (String)a.get('Prior_Group_Case_Number__c'));
                  SmallGroupSIC__c sic = sicCodeToValuesMap.get((String)a.get('Sic'));
                  Contact con = contactsMap.get((String)a.get('Primary_Contact__c'));
                  Associations__c assoc = nameToAssocMap.get((String)a.get('Association_Name__c'));
                  if(accGrpConMap.get(a.Id) !=null){
                      tempMap.put('isExistingConvGrp', String.valueOf(accGrpConMap.get(a.Id)));
                  }
                  
                  if(sic != null) {
                      tempMap.put('AccountSIC_TXT', sic.SIC__c);
                      tempMap.put('AccountSicCode', sic.SIC_CODE__c);
                  }
                  
                  if(con != null) {
                      tempMap.put('Title', con.Title);
                      tempMap.put('ContactPhone', con.Phone);
                      tempMap.put('ContactEmail', con.Email);
                      tempMap.put('ContactName', con.Name);
                  }
                  
                  if(accQuoteMap.containsKey(a.Id)){
                      Quote quoteRec = accQuoteMap.get(a.Id);
                      tempMap.put('TotalEligibleEmployees', quoteRec.Total_Eligible_Employees__c);
                      tempMap.put('QuoteContactEmail', quoteRec.Quote_Contact_Email__c);
                      tempMap.put('QuoteContactName', quoteRec.Quote_Contact_Name__c);
                      tempMap.put('QuoteContactPhone', quoteRec.Quote_Contact_Phone__c);
                  }
                  if(a.Type == 'Enrolled') {
                      tempMap.put('PAId', a.Paid_Agency__c);
                      tempMap.put('PAName', a.Paid_Agency__r.Name);
                      tempMap.put('PATin', a.Paid_Agency__r.BR_Encrypted_TIN__c);
                      tempMap.put('PASearch', a.Paid_Agency__r.AccountTypeAhead__c);
                      tempMap.put('PaidAgencySearch', a.Paid_Agency__r.AccountTypeAhead__c);
                      tempMap.put('GAId', a.General_Agency__c);
                      tempMap.put('GAName', a.General_Agency__r.Name);
                      tempMap.put('GATin', a.General_Agency__r.BR_Encrypted_TIN__c);
                      tempMap.put('GASearch', a.General_Agency__r.AccountTypeAhead__c);
                      tempMap.put('GeneralAgencySearch', a.General_Agency__r.AccountTypeAhead__c);
                  } else if(accOpportunityMap.containsKey(a.Id)) {
                      Opportunity oppRec = accOpportunityMap.get(a.Id);
                      tempMap.put('PAId', oppRec.PaidAgency__c);
                      tempMap.put('PAName', oppRec.PaidAgency__r.Name);
                      tempMap.put('PATin', oppRec.PaidAgency__r.BR_Encrypted_TIN__c);
                      tempMap.put('PASearch', oppRec.PaidAgency__r.AccountTypeAhead__c);
                      tempMap.put('PaidAgencySearch', oppRec.PaidAgency__r.AccountTypeAhead__c);
                      tempMap.put('GAId', oppRec.GeneralAgency__c);
                      tempMap.put('GAName', oppRec.GeneralAgency__r.Name);
                      tempMap.put('GATin', oppRec.GeneralAgency__r.BR_Encrypted_TIN__c);
                      tempMap.put('GASearch', oppRec.GeneralAgency__r.AccountTypeAhead__c);
                      tempMap.put('GeneralAgencySearch', oppRec.GeneralAgency__r.AccountTypeAhead__c);
                  }
                  if(assoc != null) {
                      tempMap.put('AssocName', assoc.Name);
                      tempMap.put('AssocId', String.valueOf(assoc.Assoc_Id__c));
                      tempMap.put('AssociationId', String.valueOf(assoc.Association_Id__c));
                      tempMap.put('ExistingAcc_AssociationId', String.valueOf(assoc.Association_Id__c));
                      
                  }
                  returnList.add(tempMap);
              }
          }
          System.debug('The accMap is: ' + returnList);
          outMap.put('OBDRresp', returnList);
        }

        System.debug('The accList is: ' + accList);
        //accList.sort();
        return accList;
    }


    @RemoteAction
    global static List<Account> getGeneralAgencyList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');
        String searchETIN = '%'+searchName+'%';

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Account> accList = new List<Account>();
        Set<Account> accSet = new Set<Account>();

        if(searchName.length() > 1){
          List<List<Account>> accQueryList = search.query('FIND \''+ searchName +  '*\'  IN Name FIELDS RETURNING Account(Id, Name, AccountTypeAhead__c, BR_Encrypted_TIN__c, AgencyType__c WHERE AgencyType__c = \'General Agency\')');
          accSet.addAll(((List<Account>)accQueryList[0]));
          System.debug('The accList is: ' + accQueryList);

          List<Account> accFetchList = [SELECT Id, Name, AccountTypeAhead__c, BR_Encrypted_TIN__c, AgencyType__c FROM Account WHERE (BR_Encrypted_TIN__c LIKE :searchETIN AND AgencyType__c = 'General Agency')];
          accSet.addAll(accFetchList);
          System.debug('The accFetchList is: ' + accFetchList);

          //accList = ((List<SObject>)accQueryList[0]);
          accList.addAll(accSet);
          if(accList != null && accList.size() > 0){
              for (Account a : accList){

                  if((String)a.get('AgencyType__c') == 'General Agency'){
                    Map<String,String> tempMap = new Map<String,String>();
                    tempMap.put('GeneralAgencyId', a.Id);
                    tempMap.put('GeneralAgency', (String)a.get('Name'));
                    tempMap.put('GeneralAgencyTIN', (String)a.get('BR_Encrypted_TIN__c'));
                    tempMap.put('GeneralAgencySearch', (String)a.get('AccountTypeAhead__c'));
                    returnList.add(tempMap);
                  }
              }
          }
          System.debug('The accMap is: ' + returnList);
          outMap.put('OBDRresp', returnList);
        }

        //accList.sort();
        return accList;
    }

    @RemoteAction
    global static List<Account> getPaidAgencyList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');
        String searchETIN = '%'+searchName+'%';

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Account> accList = new List<Account>();
        Set<Account> accSet = new Set<Account>();

        if(searchName.length() > 1){
          List<List<Account>> accQueryList = search.query('FIND \''+ searchName +  '*\' IN Name FIELDS RETURNING Account(Id, Name, AccountTypeAhead__c, BR_Encrypted_TIN__c, AgencyType__c WHERE AgencyType__c = \'Paid Agency\')');
          accSet.addAll(((List<Account>)accQueryList[0]));
          System.debug('The accList is: ' + accQueryList);

          List<Account> accFetchList = [SELECT Id, Name, AccountTypeAhead__c, BR_Encrypted_TIN__c, AgencyType__c FROM Account WHERE (BR_Encrypted_TIN__c LIKE :searchETIN AND AgencyType__c = 'Paid Agency')];
          accSet.addAll(accFetchList);
          System.debug('The accFetchList is: ' + accFetchList);

          //accList = ((List<SObject>)accQueryList[0]);
          accList.addAll(accSet);
          if(accList != null && accList.size() > 0){
              for (Account a : accList){

                  if((String)a.get('AgencyType__c') == 'Paid Agency'){
                    Map<String,String> tempMap = new Map<String,String>();
                    tempMap.put('PaidAgencyId', a.Id);
                    tempMap.put('PaidAgency', (String)a.get('Name'));
                    tempMap.put('PaidAgencyTIN', (String)a.get('BR_Encrypted_TIN__c'));
                    tempMap.put('PaidAgencySearch', (String)a.get('AccountTypeAhead__c'));
                    returnList.add(tempMap);
                  }

              }
          }
          System.debug('The accMap is: ' + returnList);
          outMap.put('OBDRresp', returnList);
        }

        //accList.sort();
        return accList;
    }

    @RemoteAction
    global static List<Contact> getAllStatesBrokerList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        return SGA_AllStatesBrokers.getAllStatesBrokerList(inputMap, outMap, options);
        // Complete Logic is moved to SGA_AllStatesBrokers class
        
    /*List<List<Contact>> cntQueryList= new List<List<Contact>>(); 
    List<Contact> cntFetchList= new List<Contact>();
    String searchName = (String) options.get('searchString');
    String searchETIN = '%'+searchName+'%';
    String zipcode1 = inputMap.get(ZIPCODE)!=null?(String)inputMap.get(ZIPCODE):(String)options.get(ZIPCODE);
    Geographical_Info__c  geoGraphicInfo;
    List<Map<String, String>> returnList = new List<Map<String,String>>();
    List<Contact> cntList = new List<Contact>();
    Set<Contact> cntSet = new Set<Contact>();
    try{
      SGA_UTIL17_AccessGeographicData.zipcode = zipcode1;
      geoGraphicInfo = SGA_UTIL17_AccessGeographicData.queryGeoInfo(SELECT_GEOGRAPHIC);
      String state= geoGraphicInfo.State__c;
      
      if(searchName.length() > 1){
        if(state.equalsIgnoreCase(NY_STATE)){
          cntQueryList = search.query('FIND \''+ searchName +  '*\' IN Name FIELDS RETURNING Contact(Id, Name, AccountId,ContactTypeAhead__c, ETIN__c, AgencyType__c,RecordType.Name WHERE AgencyType__c = \'Brokerage\')');
          cntFetchList = [SELECT Id, Name, ContactTypeAhead__c,AccountId,ETIN__c, AgencyType__c,RecordType.Name FROM Contact WHERE (ETIN__c LIKE :searchETIN AND AgencyType__c = 'Brokerage')];
        }
        else {
          cntQueryList = search.query('FIND \''+ searchName +  '*\' IN Name FIELDS RETURNING Contact(Id, Name, AccountId,ContactTypeAhead__c, ETIN__c,AgencyType__c, RecordType.Name WHERE RecordType.Name = \'Producer\')');
          cntFetchList = [SELECT Id, Name, ContactTypeAhead__c, ETIN__c,AgencyType__c,AccountId, RecordType.Name FROM Contact WHERE (ETIN__c LIKE :searchETIN AND RecordType.Name = 'Producer')];
        }
        cntSet.addAll(((List<Contact>)cntQueryList[0]));
        cntSet.addAll(cntFetchList);
        cntList.addAll(cntSet);
        if(cntList != null && cntList.size() > 0){
          for (Contact a : cntList){
            if((String)a.get('AgencyType__c') == 'Brokerage' || a.RecordType.Name == 'Producer'){
              Map<String,String> tempMap = new Map<String,String>();
              tempMap.put('BrokerId', a.Id);
              tempMap.put('Broker', (String)a.get('Name'));
              tempMap.put('BrokerTIN', (String)a.get('ETIN__c'));
              tempMap.put('BrokerSearch', (String)a.get('ContactTypeAhead__c'));
              tempMap.put('LCBrokerId', a.Id);
              tempMap.put('LCBrokerName', (String)a.get('Name'));
              tempMap.put('LCBrokerETIN', (String)a.get('ETIN__c'));
              tempMap.put('LCBrokerAccountId', (String)a.get('AccountId'));
              returnList.add(tempMap);
            }
          }
        }
        outMap.put('OBDRresp', returnList);
      }

    }
    catch(Exception excn){
      UTIL_LoggingService.logHandledException(excn, null, null, 
      CLASSNAME,AGENCY_METHODNAME,null,LoggingLevel.ERROR); 
      outMap.put(ERROR_CODE, ERROR_MSG); 
    }
    return cntList;*/
    }
    @RemoteAction
    global static List<Contact> getBrokerList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');
        String searchETIN = '%'+searchName+'%';

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Contact> cntList = new List<Contact>();
        Set<Contact> cntSet = new Set<Contact>();

        if(searchName.length() > 1){
          List<List<Contact>> cntQueryList = search.query('FIND \''+ searchName +  '*\' IN Name FIELDS RETURNING Contact(Id, Name, MailingStreet, MailingCity, MailingState, MailingPostalCode, Email,Phone,Fax, ContactTypeAhead__c, ETIN__c, AgencyType__c WHERE AgencyType__c = \'Brokerage\')');
          cntSet.addAll(((List<Contact>)cntQueryList[0]));
          System.debug('The cntList is: ' + cntQueryList);

          List<Contact> cntFetchList = [SELECT Id, Name,MailingStreet,MailingCity,MailingState,MailingPostalCode,Email,Phone,Fax,ContactTypeAhead__c, ETIN__c, AgencyType__c FROM Contact WHERE (ETIN__c LIKE :searchETIN AND AgencyType__c = 'Brokerage')];
          cntSet.addAll(cntFetchList);
          System.debug('The cntFetchList is: ' + cntFetchList);

          //cntList = ((List<SObject>)cntQueryList[0]);
          cntList.addAll(cntSet);
          if(cntList != null && cntList.size() > 0){
              for (Contact a : cntList){

                  if((String)a.get('AgencyType__c') == 'Brokerage'){
                    Map<String,String> tempMap = new Map<String,String>();
                    tempMap.put('BrokerId', a.Id);
                    tempMap.put('Broker', (String)a.get('Name'));                    
                    tempMap.put('BrokerTIN', (String)a.get('ETIN__c'));
                    tempMap.put('BrokerSearch', (String)a.get('ContactTypeAhead__c'));
                    tempMap.put('Broker2_Name', (String)a.get('Name'));
                    tempMap.put('Broker2_ETIN', (String)a.get('ETIN__c'));
                    tempMap.put('Broker2_Street', (String)a.get('MailingStreet'));
                    tempMap.put('Broker2_City', (String)a.get('MailingCity'));
                    tempMap.put('Broker2_State', (String)a.get('MailingState'));
                    tempMap.put('Broker2_Zip', (String)a.get('MailingPostalCode'));
                    tempMap.put('Broker2_Email', (String)a.get('Email'));
                    tempMap.put('Broker2_Phone', (String)a.get('Phone'));
                    tempMap.put('Broker2_FaxNumber', (String)a.get('Fax'));
                    
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
    @RemoteAction
    global static List<Account> getBrokerAccountsList(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        String searchName = (String) options.get('searchString');

        List<Map<String, String>> returnList = new List<Map<String,String>>();
        List<Account> accList = new List<Account>();

        if(searchName.length() > 1){
          List<List<Account>> accQueryList = search.query('FIND \''+searchName+'*\' IN NAME FIELDS RETURNING Account(Id, Name, Employer_EIN__c,AgencyType__c,Recordtype.Name WHERE AgencyType__c = \'Brokerage\' AND Recordtype.Name= \'Agency/Brokerage\')');
          System.debug('The accList is: ' + accQueryList);

          accList = ((List<Account>)accQueryList[0]);
          if(accList != null && accList.size() > 0){
              for (Account a : accList){

                  Map<String,String> tempMap = new Map<String,String>();
                  tempMap.put('ExistingAccountId', a.Id);
                  tempMap.put('ExistingAccountName', (String)a.get('Name'));
                  tempMap.put('GroupETIN', (String)a.get('Employer_EIN__c'));
                  tempMap.put('AccountSearch', (String)a.get('Name'));
                  returnList.add(tempMap);
              }
          }
          System.debug('The accMap is: ' + returnList);
          outMap.put('OBDRresp', returnList);
        }

        System.debug('The accList is: ' + accList);
        //accList.sort();
        return accList;
    }
}