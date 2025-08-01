global with Sharing class QueryUser implements vlocity_ins.VlocityOpenInterface
{
    public Static Final String stateVal = 'NY';
    public Static Final String dateFormat = 'MMM d yyyy';
    public Static Final String date_format_aps = 'MMM d, yyyy';
    public Static Final String name_constant = 'name';
    public Static Final String value_constant = 'value';
    public Static Final String options_constant = 'options';
    public Static Final String SELECTED_STATE ='SelectedState';
    public Static Final String NON_NY ='NonNY';
    public static final String QUOTE ='quote';
    public static final String ABFQUOTE ='abfquote';
    public static final String ENROLL ='enroll';
    public static final string BROKERU_CS ='Broker_Date_Settings__c';
    public static final string INTERNALU_CS ='SGA_CS11_Enrollment_Date_Settings__c';
    public Static Final String GETSTAFFMEMBER ='GetStaffMember';
    public Static Final String GETREQUESTCOVERAGEBROKERDATES ='GetRequestCoverageBrokerDates';
    public Static Final String GETABFREQUESTCOVERAGEBROKERDATES ='GetABFRequestCoverageBrokerDates';
    public Static Final String GETREQUESTCOVERAGENONBROKERDATES ='GetRequestCoverageNonBrokerDates';
    public Static Final String GETREQUESTCOVERAGEEMPLOYERDATES ='GetRequestCoverageEmployerDates';
    public Static Final String EFFECTIVEDATE_START_YEAR ='EffectiveDate_Start_Year__c';
    public Static Final String BROKER_SKIP_DAYS ='Broker_Skip_Days__c';
    public Static Final String BROKER_DATE_SPAN ='Broker_Date_Span__c';
    public Static Final String INTERNAL_USERS_PAST_DAYS_SPAN ='Internal_Users_Past_Days_Span__c';
    public Static Final String INTERNAL_USERS_DAYS_SPAN ='Internal_users_days_span__c';
    public Static Final String REQUESTEDDATESS ='RequestedDates__c';
    public Static Final String ENROLLMENTYEAR ='EnrollmentYear__c';
    public Static Final String ABF_BROKER_SKIP_DAYS = 'ABF_Broker_Skip_Days__c';
    public Static Final String ABF_BROKER_DATE_SPAN='ABF_Broker_Date_Span__c';
    public Static Final String ABF_EFFECTIVEDATE_STARTYEAR='ABF_EffectiveDateStartYear__c';
    public Static Final String ABF_REQUESTEDDATES='ABF_RequestedDates__c';
    public Static Final String TYPEAHEADBROKER = 'TypeAheadBroker';
    public Static Final String TYPEAHEADBROKER_BLOCK = 'TypeAheadBroker-Block';
    public Static Final String MININFO = 'MinInfo';  
    private static final string ABFENROLL='abfenroll';
    private String strAction;
    global QueryUser(){
        
        system.debug('This is constructor');
        
    }
    
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) 
    {
        Boolean result = true;
        String state=(String)inputMap.get(SELECTED_STATE);
        Map<String,Object> productSelection = (Map<String,Object>)inputMap?.get('ProductSelection');
        Map<String,Object> productQuoteType = (Map<String,Object>)productSelection?.get('ProductQuoteType');
        String portfolioType = (String)productQuoteType?.get('selection');
        system.debug('portfolioType : ' + portfolioType);
        
        if (String.isBlank(state)) {
            state = (String) inputMap.get('qState');//Added by Muthu and Surya for SMGR-37088
        } 
        
        String actionButton=(String)inputMap.get('ActionButton');  
        if(QUOTE.equalsIgnoreCase(actionButton)){
            String ptType = '';
            switch on portfolioType {
                when 'MEWASelection' {  
                    portfolioType = 'MEWA';
                }   
                when 'ACASelection' {       
                    portfolioType = 'ACA';
                }
                when 'ABFSelection' {       
                    portfolioType = 'ABF';
                }
                when 'SpecialtyOnlySelection' {     
                    portfolioType = 'ACA';
                }
                when else {     
                    
                }
            }
        }
        outMap.put('portfolioType',portfolioType);
        
        strAction = actionButton;
        try
        {
            if (methodName.equalsIgnoreCase(GETSTAFFMEMBER)){
                GetStaffMember(inputMap,outMap);
            }
            else if(methodName.equalsIgnoreCase(GETREQUESTCOVERAGEBROKERDATES)){
                
                GetRequestCoverageBrokerDates(actionButton,outMap,state);
                
            }
            else if(methodName.equalsIgnoreCase(GETREQUESTCOVERAGENONBROKERDATES)){
                
                GetRequestCoverageNonBrokerDates(actionButton,outMap,state);
                
            }
            else if(methodName.equalsIgnoreCase(GETREQUESTCOVERAGEEMPLOYERDATES)){
                GetRequestCoverageEmployerDates(outMap,state);
            }
            else if(methodName.equalsIgnoreCase(GETABFREQUESTCOVERAGEBROKERDATES)){
                GetABFRequestCoverageBrokerDates(actionButton,outMap,NON_NY,state);
            }
            
        } 
        catch(Exception e)
        {
            System.debug('QueryUser:invokeMethod -> exception: '+e);
            result = false;
        }        
        return result;
    }
    
    void GetStaffMember(Map<String, Object> inputMap, Map<String, Object> outMap)
    {
        String sUserName = (String)inputMap.get('userName');
        
        List<User> Con =[select FederationIdentifier from User where Username = :sUserName limit 1];
        
        if(Con != null && Con.size() > 0)
        {
            Map<String, Object> stepNode = new Map<String, Object>();
            stepNode.put(TYPEAHEADBROKER, Con[0].FederationIdentifier);
            outMap.put(TYPEAHEADBROKER_BLOCK, stepNode);
            outMap.put(MININFO, stepNode);
            System.debug('This is the Staff Member Name: ' + Con[0].name);
        } 
        else
        {
            outMap.put('BrokerError', 'NOT FOUND');
        }
    }
    
    /************************************************************************************
Method Name : GetRequestCoverageBrokerDates(Broker_Date_Settings__c)
Description : This method is created to display broker (External User) effective dates for quote and enroll
************************************************************************************/
    void GetRequestCoverageBrokerDates(String actionButton,Map<String, object> outMap,String state)
    {
        date mydate;
        mydate = system.today();
        integer x = 1;  
        if(state == NULL || String.isBlank(state)){
            state = stateVal;
        }
        String portfolioType = (String)outMap.get('portfolioType');
        if(QUOTE.equalsIgnoreCase(actionButton)){
            Broker_Date_Settings__c bds = null;
            if(String.isNotBlank(portfolioType)){
                bds = Broker_Date_Settings__c.getValues(state +'_'+portfolioType);
            }
            if(bds == null){
                bds = Broker_Date_Settings__c.getValues(state);
            }
             
            List<Map<String, String>> quoteRequestCoverageEffectiveDates = new List<Map<String,String>>();      
            quoteRequestCoverageEffectiveDates=CoverageBrokerDates(mydate,bds);
            outMap.put(options_constant, quoteRequestCoverageEffectiveDates);
        }
        if(ENROLL.equalsIgnoreCase(actionButton) || ABFENROLL.equalsIgnoreCase(strAction)){//Merged ABF flow with enroll button
            string sState = state.toUpperCase();
            SGA_CS11_Enrollment_Date_Settings__c eds = SGA_CS11_Enrollment_Date_Settings__c.getValues(sState);
            List<Map<String, String>> enrollRequestCoverageEffectiveDates = new List<Map<String,String>>();      
            enrollRequestCoverageEffectiveDates=CoverageBrokerDates(mydate,eds);
            outMap.put(options_constant, enrollRequestCoverageEffectiveDates);
        }
        
        
    }  
    /************************************************************************************
Method Name : GetABFRequestCoverageBrokerDates(ABF_Broker_Date_Settings__c,state)
Description : This method is created to display broker (External User) ABF effective dates for quote
************************************************************************************/
    void GetABFRequestCoverageBrokerDates(String actionButton,Map<String, object> outMap,String nonNY, String state)
    {
        date mydate;
        mydate = system.today();
        integer x = 1;      
        if(ABFQUOTE.equalsIgnoreCase(actionButton) || ABFENROLL.equalsIgnoreCase(actionButton)){
            ABF_Broker_Date_Settings__c abs = ABF_Broker_Date_Settings__c.getValues(nonNY);
            List<Map<String, String>> quoteRequestCoverageEffectiveDates = new List<Map<String,String>>();      
            quoteRequestCoverageEffectiveDates=ABFCoverageBrokerDates(mydate,abs,state);
            outMap.put(options_constant, quoteRequestCoverageEffectiveDates);               
        }
    }
    /************************************************************************************
Method Name : GetRequestCoverageNonBrokerDates(SGA_CS11_Enrollment_Date_Settings__c)
Description : This method is created to display Internal User effective dates
************************************************************************************/
    void GetRequestCoverageNonBrokerDates(String actionButton,Map<String, object> outMap,String state)
    {
        date mydate;
        mydate = system.today();
        integer x = 1; 
        String portfolioType = (String)outMap.get('portfolioType');
        if(QUOTE.equalsIgnoreCase(actionButton)){
            Broker_Date_Settings__c bds = null;
            if(String.isNotBlank(portfolioType)){
                bds = Broker_Date_Settings__c.getValues(state +'_'+portfolioType);
            }
            if(bds == null){
                bds = Broker_Date_Settings__c.getValues(state);
            }
            
            List<Map<String, String>> quoteRequestCoverageEffectiveDates = new List<Map<String,String>>();      
            quoteRequestCoverageEffectiveDates=CoverageNonBrokerDates(mydate,bds);
            outMap.put(options_constant, quoteRequestCoverageEffectiveDates);
        }
        if(ENROLL.equalsIgnoreCase(actionButton) || ABFENROLL.equalsIgnoreCase(strAction)){//Merged ABF flow with enroll button
            string sState = state.toUpperCase();
            SGA_CS11_Enrollment_Date_Settings__c eds = SGA_CS11_Enrollment_Date_Settings__c.getValues(sState);
            List<Map<String, String>> enrollRequestCoverageEffectiveDates = new List<Map<String,String>>();      
            enrollRequestCoverageEffectiveDates=CoverageNonBrokerDates(mydate,eds);
            outMap.put(options_constant, enrollRequestCoverageEffectiveDates);
        }
        
    }    
    /*****************This logic displays Coverage effective dates for brokers****************/
    public List<Map<String, String>> CoverageBrokerDates(date mydate,sObject obj){
        List<Map<String, String>> RequestCoverageEffectiveDates = new List<Map<String,String>>();  
        String strEnrollYear = '';
        set<String> setEnrollYear = null;
        if (ENROLL.equalsIgnoreCase(strAction) || ABFENROLL.equalsIgnoreCase(strAction)) { //Merged ABF flow with enroll button
            strEnrollYear = (String)obj.get(ENROLLMENTYEAR);
            setEnrollYear = new set<String>(strEnrollYear.split(','));
        }
        
        for(Integer i=Integer.valueOf(obj.get(BROKER_SKIP_DAYS)); i<=Integer.valueOf(obj.get(BROKER_DATE_SPAN)); i++){
            Datetime newDateTime =mydate.addDays(i);
            if(newDateTime.yearGmt() < Integer.valueOf(obj.get(EFFECTIVEDATE_START_YEAR))){
                continue;
            }
            Map<String, String> tempMap = new Map<String, String>();
            String formatted = newDateTime.formatGMT(dateFormat);
            Integer reqDate = newDateTime.dayGmt();
            String requestedDates=(String)obj.get(REQUESTEDDATESS);
            set<String> RequestedDatesset= new set<String>(requestedDates.split(','));
            
            // added by Muthu on Sep 12, 2019 for SMGR-30654
            // to restrict effective dates based on enrollment year
            Integer intReqYear = newDateTime.yearGmt();
            
            if(RequestedDatesset.contains(String.valueOf(reqDate)) && ((setEnrollYear!=null && setEnrollYear.contains(String.valueOf(intReqYear)))||QUOTE.equalsIgnoreCase(strAction))){
                //           if(RequestedDatesset.contains(String.valueOf(reqDate))){
                tempMap.put(name_constant, formatted );
                tempMap.put(value_constant, formatted );
                RequestCoverageEffectiveDates.add(tempMap);
                
            }
        }
        return RequestCoverageEffectiveDates;              
    }  
    
    /*****************This logic displays ABF Coverage effective dates for brokers****************/
    public List<Map<String, String>> ABFCoverageBrokerDates(date mydate,sObject obj, String state){
        List<Map<String, String>> RequestCoverageEffectiveDates = new List<Map<String,String>>();  
        for(Integer i=Integer.valueOf(obj.get(ABF_BROKER_SKIP_DAYS)); i<Integer.valueOf(obj.get(ABF_BROKER_DATE_SPAN)); i++){
            Datetime newDateTime =mydate.addDays(i);
            if(newDateTime.yearGmt() < Integer.valueOf(obj.get(ABF_EFFECTIVEDATE_STARTYEAR))){
                continue;
            }
            Map<String, String> tempMap = new Map<String, String>();
            String formatted = newDateTime.formatGMT(dateFormat);
            Integer reqDate = newDateTime.dayGmt();
            String requestedDates=(String)obj.get(ABF_REQUESTEDDATES);
            //Integer ABF_REQDATE =1;
            // String x= String.valueOf(ABF_REQDATE);
            if(requestedDates.contains(String.valueOf(reqDate)) && (state != 'KY' || (state == 'KY' && newDateTime.yearGmt() >= 2020)) ){// Added by Muthu and Surya for SMGR-37088(To remove 2021 picklist dates for KY in effective date)
                tempMap.put(name_constant, formatted );
                tempMap.put(value_constant, formatted );
                RequestCoverageEffectiveDates.add(tempMap);
                
            }
        }
        System.debug('abfDATES :'+RequestCoverageEffectiveDates);
        return RequestCoverageEffectiveDates;              
    } 
    /*****************This logic displays Coverage effective dates for Internal users****************/
    public List<Map<String, String>> CoverageNonBrokerDates(date mydate,sObject obj){
        List<Map<String, String>> RequestCoverageEffectiveDates = new List<Map<String,String>>();  
        String strEnrollYear = '';
        set<String> setEnrollYear = null;
        if (ENROLL.equalsIgnoreCase(strAction) || ABFENROLL.equalsIgnoreCase(strAction) ) {//Merged ABF flow with enroll button
            strEnrollYear = (String)obj.get(ENROLLMENTYEAR);
            setEnrollYear = new set<String>(strEnrollYear.split(','));
        }
        
        //stName = (string)obj.get(NAME_ST);    
        for(Integer i=Integer.valueOf(obj.get(INTERNAL_USERS_PAST_DAYS_SPAN)); i<=Integer.valueOf(obj.get(INTERNAL_USERS_DAYS_SPAN)); i++){
            Datetime newDateTime =mydate.addDays(i);
            if(newDateTime.yearGmt() < Integer.valueOf(obj.get(EFFECTIVEDATE_START_YEAR))){
                continue;
            }
            Map<String, String> tempMap = new Map<String, String>();
            String formatted = newDateTime.formatGMT(dateFormat);
            Integer reqDate = newDateTime.dayGmt();
            String requestedDates=(String)obj.get(REQUESTEDDATESS);
            set<String> RequestedDatesset= new set<String>(requestedDates.split(','));           
            
            // added by Muthu on Sep 12, 2019 for SMGR-30654
            // to restrict effective dates based on enrollment year
            Integer intReqYear = newDateTime.yearGmt();
            
            if(RequestedDatesset.contains(String.valueOf(reqDate)) && ((setEnrollYear!=null && setEnrollYear.contains(String.valueOf(intReqYear)))||QUOTE.equalsIgnoreCase(strAction))){
                //            if(RequestedDatesset.contains(String.valueOf(reqDate))){
                tempMap.put(name_constant, formatted );
                tempMap.put(value_constant, formatted );
                RequestCoverageEffectiveDates.add(tempMap);
                
            }
        }
        return RequestCoverageEffectiveDates;              
    } 
    
    
    /************************************************************************************
Method Name : GetRequestCoverageEmployerDates
Description : This method is created to display Employer Dates
************************************************************************************/
    
    public void GetRequestCoverageEmployerDates(Map<String, object> outMap,String state)
    {
        date mydate;
        mydate = system.today();
        integer x = 1;
        integer u = 0; 
        
        Employer_Date_Settings__c eds = Employer_Date_Settings__c.getValues(state);
        
        List<Map<String, String>> RequestCoverageEffectiveDates = new List<Map<String,String>>();   
        for(Integer i=Integer.valueOf(eds.Employer_Skip_Days__c); i<Integer.valueOf(eds.Employer_Date_Span__c); i++){
            Datetime newDateTime = mydate.addDays(i);
            if(newDateTime.yearGmt() < Integer.valueOf(eds.EffectiveDate_Start_Year__c)){
                continue;
            }
            Map<String, String> tempMap = new Map<String, String>();
            String formatted_aps = newDateTime.formatGMT(date_format_aps);
            String formatted = newDateTime.formatGMT(dateFormat);
            Integer reqDate = newDateTime.dayGmt();
            Integer reqmonth = mydate.month();
            Integer reqmon = newDateTime.monthgmt();
            if(reqDate ==1 || reqDate ==15){
                if(reqmonth != reqmon ){
                    
                    if(u==6){
                        
                        break;
                        
                    }
                    tempMap.put(name_constant, formatted_aps );
                    tempMap.put(value_constant, formatted );
                    RequestCoverageEffectiveDates.add(tempMap);
                    
                    U++;                                
                }
                
            }
        }  
        
        System.debug('DATES :'+RequestCoverageEffectiveDates);
        outMap.put(options_constant, RequestCoverageEffectiveDates);
    }
}