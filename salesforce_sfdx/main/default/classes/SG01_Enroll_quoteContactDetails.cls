global  without sharing class SG01_Enroll_quoteContactDetails implements vlocity_ins.VlocityOpenInterface2, vlocity_ins.VlocityOpenInterface  
{
    public final String Contact_SobjectType = 'Contact';
    public final String Contact_RecordType = 'Contact';
    private static string QUOTEOPTYCONTACTINFO = 'DRExtractQuoteOptyContactInfo';
    private static string CREATEGRPCONTACT = 'CreateGroupContact';
    public final string BROKERINFOJSONPATH = 'Agent/Producer/BrokerCert';
    public final string UPDATEBROKERCONTACTNY = 'updateBrokerContactNY';
    public final string UPDATEBROKERDETAILS = 'updateBrokerDetails';
    public final string GETBRANDBYZIPCODE = 'getBrandByZipcode';
    public final string STEP_LAVALIDATION = 'LCValidation';
    public final string LABEL_COUNTYONACCOUNT = 'CountyOnAccount';
    public final string LABEL_ZIPCODEONACCOUNT  ='ZipCodeOnAccountScreen';
    public final string LABEL_ZIPCODE = 'zipCode';
    public final string LABEL_REQJSON ='reqJSON';
    public final string METHOD_getZipcodeFromSGC = 'getZipcodeFromSGC';
    public final string METHOD_RESJSON = 'resJSON';
    public final string LABEL_COUNTYLIST = 'countyList';
    public final string LABEL_COUNTYNAME = 'countyName';
    public final string LABEL_BRAND = 'brand';
    public Static final string CONTACTRECORDTYPE = 'Contact';
    public final string LABEL_ACCOUNTCOUNTY =  'AccountCounty';
    public final string LABEL_CONTEXTZIP = 'ContextZip'; 
    public final string  updateAdditionalBroker ='updateAdditionalBroker'; 
    public final string BrokerLastName = 'BrokerLastName';
    public final string BrokerEmailAddress = 'BrokerEmailAddress';
    public final string BrokerPhoneNumber= 'BrokerPhoneNumber';
    public final string BrokerAccountId = 'BrokerAccountId'; 
    public final string  BrokerFirstName = 'BrokerFirstName';
    public final string  ConvertForm550Value = 'convertForm550Value';
    
  global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outMap, Map<String, Object> optns) {
      try
      {
          if (QUOTEOPTYCONTACTINFO.equalsIgnoreCase(methodName)) 
          {
               DRExtractQuoteOptyContactInfo(inputMap, outMap);
          }
          else if(CREATEGRPCONTACT.equalsIgnoreCase(methodName))
          {
              CreateGroupContact(inputMap, outMap);
          }
          else if(UPDATEBROKERDETAILS.equalsIgnoreCase(methodName))
          {
             updateBrokerDetails(inputMap, outMap,  optns);
          }
          else if(methodName.equalsIgnoreCase(GETBRANDBYZIPCODE))
          {
              getBrandByZipcode(inputMap, outMap);
          }
          else if(methodName.equalsIgnoreCase(UPDATEBROKERCONTACTNY))
          {
              updateBrokerContactNY(inputMap, outMap,  optns);
          }
          else if(methodName.equals(updateAdditionalBroker)){
              updateAdditionalBroker(inputMap, outMap,  optns);
          }
          else if(methodName.equals(ConvertForm550Value)){
              ConvertForm550Value(inputMap, outMap,  optns);
          }
        
      
          
      }
      catch(exception ex)
      {
          
      }
      return true;
  }

/*public void setoptionsforPicklist(Map<String,Object> inputMap,Map<String,Object> outMap)
{

    List<Map<String, String>> RequestCoverageEffectiveDates = new List<Map<String,String>>(); 
    Map<string, string> optionvalues = new Map<string, string>();
    optionvalues.put('name' , 'None(Date of Hire)');
    optionvalues.put('value' , 'None(Date of Hire)');
    RequestCoverageEffectiveDates.add(optionvalues);
    optionvalues= new Map<string, string>();
    optionvalues.put('name' , '90 days');
    optionvalues.put('value' , '90 days');
    RequestCoverageEffectiveDates.add(optionvalues);
    outMap.put('options', RequestCoverageEffectiveDates);
 
 }*/
  
public void getBrandByZipcode(Map<String,Object> inputMap,Map<String,Object> outMap)
{
    try {
    
           
        Map<string, object> lcvalidationmap = (Map<string, object>) inputMap.get(STEP_LAVALIDATION);
         String countyName = lcvalidationmap != null ? (String) lcvalidationmap.get(LABEL_COUNTYONACCOUNT) : (String) inputMap.get(LABEL_ACCOUNTCOUNTY)  ;
        String zipCode = lcvalidationmap != null ?  (String) lcvalidationmap.get(LABEL_ZIPCODEONACCOUNT) : (String) inputMap.get(LABEL_CONTEXTZIP) ;
        Map<string, string> reqJSONmap = new map<string,string>();
        reqJSONmap.put(LABEL_ZIPCODE, zipCode);
        reqJSONmap.put('targetSystem','APS');
        reqJSONmap.put('productType','Medical');
        inputMap.put(LABEL_REQJSON, reqJSONmap );
        OMN_ERERating OmniERERating = new OMN_ERERating();
       Map<String,Object> outMap_new = new Map<String,Object> ();
        OmniERERating.invokemethod(METHOD_getZipcodeFromSGC, inputMap, outMap_new, null);
        System.debug('output OmniERERating Response ' + outMap);
        map<string, object> resJsonMap = (map<string, object>) outMap_new.get(METHOD_RESJSON);
        
        list<object> countyList = (list<object>) resJsonMap.get(LABEL_COUNTYLIST);
        
        for(Object obj : countyList) {
        
        Map<string, object> countyInstance = (map<string,object>) obj;
        
        if ( countyName.equalsIgnoreCase((string)countyInstance.get(LABEL_COUNTYNAME)))
        {
        String brand = (string)countyInstance.get(LABEL_BRAND); 
        
         outMap.put('Brand' , brand);
        break;
        
        }
        
        }
       //outMap.put(METHOD_RESJSON, null);
        
    } 
    catch(exception ex)
    {
     System.debug('System.excpetion ' + ex.getmessage());
         outMap.put('error' ,'exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage() + ' Line Number >>> ' + ex.getLineNumber());
    }

}
public void DRExtractQuoteOptyContactInfo(Map<String,Object> inputMap,Map<String,Object> outMap)
{
    try
    {
        
        string quoteid=(string) inputMap.get('QuoteId');
        Quote quote1; 
        Contact con1;
        if (String.isBlank(quoteid) != true){
            quote1 = [SELECT id,Name, Benefit_Period__c, Broker_Writing_Agent_Name_1__c,Paid_Agency_ETIN__c , ContactId, General_Agency_Name__c,  General_Agency_ETIN__c , OpportunityId, Paid_Agency_Name__c, Phone FROM Quote WHERE id =: quoteid LIMIT 1];
            if (quote1.contactId  != null )
            {
                con1 = [SELECT id, Email, Fax, Name,Title  FROM Contact WHERE Id=: quote1.contactId LIMIT 1];
                outMap.put('EmailAddress', con1.Email );
                outMap.put('PrimaryFax', con1.Fax );
                outMap.put('CompanyContactName', con1.Name );
                outMap.put('Title',  con1.Title );
            }
            map<string, Object> medicalcoverage1= new Map<string, Object>();
            medicalcoverage1.put('BenefitPeriod' ,quote1.Benefit_Period__c  );
            outMap.put('MedicalCoverage', medicalcoverage1 );
            outMap.put('BrokerId',  quote1.Broker_Writing_Agent_Name_1__c);
            outMap.put('QuoteContactId', quote1.ContactId );
            outMap.put('QuoteOpportunityId',  quote1.OpportunityId );
            outMap.put('QuoteName',  quote1.Name );
            outMap.put('PaidAgencyId' , Quote1.Paid_Agency_Name__c);
            outMap.put('PaidAgencyETIN' , Quote1.Paid_Agency_ETIN__c );
            outMap.put('GeneralAgencyId',  quote1.General_Agency_Name__c );
            outMap.put('GeneralAgencyETIN' , Quote1.General_Agency_ETIN__c);
            outMap.put('PaidAgencyId' , Quote1.Paid_Agency_Name__c);
            outMap.put('PrimaryPhone',  quote1.Phone );
        }
        
       
       
        
    
    }
    catch(exception ex)
    {
        System.debug('exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage());
    }
}
      public void CreateGroupContact(Map<String,Object> inputMap,Map<String,Object> outMap)
    {
    try
    {
        map<string,object> companyInfo = (map<string,object>) inputMap.get('CompanyInformation');
        string CompanyContactName = (string) companyInfo.get('CompanyContactName');
        string EmailAddress = (String) companyInfo.get('EmailAddress');
        string PrimaryPhone = (String) companyInfo.get('PrimaryPhone');
        string QuoteAccountId = (string) inputMap.get('QuoteAccountId');
        string QuoteContactId = (string) inputMap.get('QuoteContactId');
        //********Story@SMGR-36640*********
        List<Contact> ConList = New List<Contact>();
        RecordType contactRecordType  = [SELECT Id, SobjectType, Name, DeveloperName FROM RecordType WHERE SobjectType =: Contact_SobjectType and DeveloperName=: Contact_RecordType LIMIT 1]; 
        string State = (string) inputMap.get('qState');
        string AdditionalContactName,AdditionalEmailAddress,AdditionalPhone, AdditionalContactId;
         
        if(State == 'NV'||State == 'WI'){
        AdditionalContactName = (string) companyInfo.get('AdditionalContact19');
        AdditionalEmailAddress = (string) companyInfo.get('EmailAddress1');
        }
        else if(State == 'NH'){
        AdditionalContactName = (string) companyInfo.get('NHOtherContact');
        AdditionalEmailAddress = (string) companyInfo.get('AdditionalContactEmail');
        }
        else{
        AdditionalContactName = (string) companyInfo.get('AdditionalContact');
        AdditionalEmailAddress = (string) companyInfo.get('AdditionalContactEmail');
        if(State == 'ME'||State == 'CT'){
            AdditionalPhone = (string) companyInfo.get('AddiitonalContactPhone');
        }
        }
      
        //----------------
        System.debug('EmailAddress  ' + EmailAddress + ' PrimaryPhone ' + PrimaryPhone  + ' QuoteAccountId' + QuoteAccountId + ' QuoteContactId ' + QuoteContactId);
        
        /* Admin Contact Create or update */
        Account groupAccount = [Select id, Group_Admin__c  FROM Account Where id=: QuoteAccountId LIMIT 1];
        
        
       Contact con = new contact(LastName = CompanyContactName, email =EmailAddress, Phone=PrimaryPhone, RecordTypeId= contactRecordType.id  );
        if (! string.isBlank(QuoteAccountId)){
            con.AccountId =QuoteAccountId;
        }
        
        if (! string.isBlank(QuoteContactId)){
            System.debug('quotecontact Id >>> ' + QuoteContactId);
            con.Id =QuoteContactId;
        }
        else if(! string.isBlank(groupAccount.Group_Admin__c))
        {
            System.debug('groupAccount.Group_Admin__c >>> ' + groupAccount.Group_Admin__c);
            con.Id =groupAccount.Group_Admin__c;
        } 
        ConList.add(con); // Added primary contact to List
        
      /* Secondary Contact Create or update */
        
          IF(!string.isBlank(AdditionalEmailAddress)){
        //contact SecondCon = [Select Id FROM Contact WHERE Email =: AdditionalEmailAddress Order by CreatedDate desc LIMIT 1];
         List<List<sObject>> searchList = [FIND :AdditionalEmailAddress IN ALL FIELDS RETURNING Contact (Id WHERE RecordTypeId =: contactRecordType.id AND IsPersonAccount = false)];                
         List<Contact> contactList = searchList[0];
           if(contactList.Size()>0){    
                AdditionalContactId = contactList[0].Id;
                ConList.add(contactList[0]);   
             }
            else{
                contact newCon = New Contact(LastName = AdditionalContactName, Email = AdditionalEmailAddress, RecordTypeId= contactRecordType.id );
                ConList.add(newCon);        
                }
        }
        
        upsert ConList;
        
        system.debug('contact id >>> ' + ConList[0].id);
        outMap.put('ContactId', ConList[0].id);
        if ( ConList.size() > 1){
            AdditionalContactId = AdditionalContactId != null ? AdditionalContactId : ConList[1].id;
            if(AdditionalContactId != null)outMap.put('AdditionalContactId', AdditionalContactId); }
    }
    catch(exception ex)
    {
    System.debug('exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage() + ' Line Number >>> ' + ex.getLineNumber());
         outMap.put('error' ,'exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage() + ' Line Number >>> ' + ex.getLineNumber());
    }
    
    
    }
   
    public void updateAdditionalBroker(Map<String,Object> inputMap,Map<String,Object> outMap, Map<String,Object> options){
        
        try {
          
            RecordType contactRecordType  = [SELECT Id, SobjectType, Name, DeveloperName FROM RecordType WHERE SobjectType =: Contact_SobjectType and DeveloperName=: Contact_RecordType LIMIT 1];
                
            String quoteadditionalconLastName = (String) options.get(BrokerLastName);
               String quoteadditionalconFirstName = (String) options.get(BrokerFirstName);
            String quoteadditionalconEmail = (String) options.get(BrokerEmailAddress);
            String quoteadditionalconPhone = (String) options.get(BrokerPhoneNumber);
            String BrokerAccountId = (String) options.get(BrokerAccountId);
           string AdditionalContactId;
            List<contact> ConList =  new list<Contact>();
           IF(!string.isBlank(quoteadditionalconEmail)){ 
                List<List<sObject>> searchList = [FIND :quoteadditionalconEmail IN ALL FIELDS RETURNING Contact (Id WHERE RecordTypeId =: contactRecordType.id AND IsPersonAccount = false) ];                
                List<Contact> contactList = searchList[0];
                System.debug('contactList ' + searchList[0]);
                if(contactList.Size()>0){
                    AdditionalContactId = contactList[0].Id;
                    contact newCon = New Contact(id =AdditionalContactId, AccountId= BrokerAccountId, FirstName= quoteadditionalconFirstName ,  LastName = quoteadditionalconLastName, Phone =quoteadditionalconPhone, Email = quoteadditionalconEmail );
                    ConList.add(newCon); 
                }
                else {
                    contact newCon = New Contact(AccountId=BrokerAccountId ,FirstName= quoteadditionalconFirstName , LastName = quoteadditionalconLastName, Phone =quoteadditionalconPhone, Email = quoteadditionalconEmail, RecordTypeId= contactRecordType.id );
                    ConList.add(newCon);     
                }
            }
            
            upsert ConList;
            if ( ConList.size() > 0){
                AdditionalContactId = AdditionalContactId != null ? AdditionalContactId : ConList[0].id;
                outMap.put('QuoteAdditionalContactId', AdditionalContactId);
            }
            
            
            
        }
        catch(exception ex){
                System.debug('exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage() + ' Line Number >>> ' + ex.getLineNumber());
                outMap.put('error' ,'exception causes by >>>> ' + ex.getCause() + '  >>>' + ex.getMessage() + ' Line Number >>> ' + ex.getLineNumber());
        }
    }
    public void updateBrokerDetails(Map<String,Object> inputMap,Map<String,Object> outMap, Map<String,Object> options){
        
        try{
            string applicationId = (string) options.get('applicationidval') ;
            string broker2Id = (string) options.get('accountbrokerid') ; 
             string paidAgencyId2= (string) options.get('UpdatePaidAgency2AccountId')  ;
            string paidAgencyId= (string) options.get('UpdatePaidAgencyAccountId')  ;
            string generalAgencyId= (string) options.get('UpdateGeneralAgencyAccId') ;
            if (! string.IsBlank(ApplicationId) )
            {
                vlocity_ins__Application__c application = new vlocity_ins__Application__c(id= ApplicationId);
                if (!string.IsBlank(paidAgencyId2))
                {
                  application.Paid_Agency_Name2__c = paidAgencyId2;
                }
                if (!string.IsBlank(broker2Id))
                {
                  application.Broker_Writing_Agent_Name_2__c = broker2Id;
                }
                if (!string.IsBlank(paidAgencyId))
                {
                    application.Paid_Agency_Name1__c =paidAgencyId;
                }
                
                if (!string.IsBlank(generalAgencyId))
                {
                    contact grpContact = [SELECT Id,Account.AgencyType__c,AccountId FROM Contact WHERE AccountId =:generalAgencyId Limit 1];
                    application.General_Agency_Name1__c  =generalAgencyId;
                    if (grpContact != null)
                    {   //SMGR-51438    
                        //application.General_Agency_Contact__c =grpContact.id;
                    }
                 }
                update application;
            }
           
         }
        catch(exception ex)
        {
            system.debug('exception caused by ' + ex.getCause()); 
             system.debug('exception message ' + ex.getMessage() + ' Line number >>> ' + ex.getLineNumber());
        }
        
    }
 
    public static void updateBrokerContactNY(Map<string, object> inputmap, Map<string, object> outputmap,Map<string, object> options ){
        try{

           RecordType contactRecordType = [SELECT Id FROM RecordType WHERE SobjectType =: CONTACTRECORDTYPE AND DeveloperName =: CONTACTRECORDTYPE];
            Contact cont1 = new contact();
            cont1.Lastname = String.isNotBlank((string) options.get('Lastname')) ? (string) options.get('Lastname') : null;
            cont1.Email = String.isNotBlank((string) options.get('EmailAddress')) ? (string) options.get('EmailAddress') : null;   //'EmailAddress'
            cont1.Phone = String.isNotBlank((string) options.get('Phone')) ? (string) options.get('Phone') : null;
            cont1.AccountId = String.isNotBlank((string) options.get('AccountId')) ? (string) options.get('AccountId') : null;
            cont1.Id = String.isNotBlank((string) options.get('ConId')) ? (string) options.get('ConId') : null;
            cont1.RecordTypeId = contactRecordType.id;
            upsert cont1;
            //Added by Surya for SMGR-34043
            outputmap.put('QuoteContactId', cont1.id);
              
        }
        catch(exception ex)
        {
             System.debug('error by ' + ex.getMessage() + ' Line number ' +ex.getLineNumber() );
              System.debug('error caused by ' +  ex.getCause());

        }

    }
    // Added by Vijay for form550
      public static void convertForm550Value(Map<string, object> inputmap, Map<string, object> outputmap,Map<string, object> options ){
        try{
            String originalForm550Value = String.isNotBlank((string) options.get('Form550Value')) ? (string) options.get('Form550Value') : null;
            String finalForm550Value='';
            Integer sizeOfForm550Value=0;
            String DuplicateYesOrNo='No';
            list<string>listOf550Values= new list<string>();
            
            
            If(String.isNotBlank(originalForm550Value) && originalForm550Value!= null ){
                sizeOfForm550Value=originalForm550Value.length();
                For(Integer i=0;i<=(sizeOfForm550Value-3);i=i+3){
                    if(i<(sizeOfForm550Value-3))
                        finalForm550Value= finalForm550Value+ originalForm550Value.substring(i,i+3)+',';
                     else
                       finalForm550Value= finalForm550Value+ originalForm550Value.substring(i,i+3);
                    }
                 listOf550Values = finalForm550Value.split(',');
                set<string>setOf550Values= new set<string>(listOf550Values);
                if(setOf550Values.size() !=listOf550Values.size())
                {
                    DuplicateYesOrNo='Yes';
                }
            }
               
            system.debug('***'+sizeOfForm550Value);
            outputmap.put('finalForm550Value',finalForm550Value);
            outputmap.put('DuplicateForm550YesOrNo',DuplicateYesOrNo);
            if(DuplicateYesOrNo=='Yes')
              outputmap.put('Form5500DupErrorMes','Duplicate values found,please correct or remove to continue');
            
        }
        catch(exception ex)
        {
             System.debug('error by ' + ex.getMessage() + ' Line number ' +ex.getLineNumber() );
              System.debug('error caused by ' +  ex.getCause());

        }

    }

}