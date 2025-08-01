/*@author :      Accenture IDC 
@date :          05/14/2018
@name :          SGA_AP76_PAGATeamMembers
@description    : This class is to create team member in PA and GA Accounts and update on Stage record.
*/
global without sharing class SGA_AP76_PAGATeamMembers implements vlocity_ins.VlocityOpenInterface{
    
    private static final String GA_ID='GeneralAgencyId';
    private static final String DRID_STAGE='DRId_SGA_QuoteEnrollmentStage__c';
    private static final String BROKER_USERID='userId';    
    private static final String PA_ID='PaidAgencyId';    
    public static final String CLASSNAME = SGA_AP63_BrokerRelatedAgencies.class.getName();
    private static final String AGENCY_METHODNAME='upadatePAGAonStage';
    private static final String STEP_NAME='Step';   
    private static final String BROKER_GATYPEAHEAD='TypeAheadGeneralAgency-Block';
    private static final String BROKER_PATYPEAHEAD='TypeAheadPaidAgency-Block';
    private static final String ERROR_CODE='error';
    private static final String ERROR_MSG='Please select a valid Broker/Zipcode to get the agencies';
    private static final String BROKER='Broker';
    private static final String READ='Read';    
   
    @testVisible
    private Map<string,Object> blockMap;
    /*Implementation of invokeMEthod from VlocityOpenInterface2 interface.*/
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {                          
        if(AGENCY_METHODNAME.equalsIgnoreCase(methodName)) {
            upadatePAGAonStage(inputMap, outMap, options);
        }                 
    return true;
    }
    /************************************************************************************
    Method Name : upadatePAGAonStage
    Return type : void
    Date: 05/14/2018
    author: IDC Offshore
    Description : This methos is to create team member in PA and GA Accounts and update on Stage record.
    *************************************************************************************/ 
    global void upadatePAGAonStage(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {       
                
        List<Map<String, String>> returnList = new List<Map<String,String>>();        
        try{  
            String paidAgencyId;
            String gerneralAgencyId;
            AccountTeamMember atmr;
            String stageId=(String)inputMap.get(DRID_STAGE);
            String BrokerUserId=(String)inputMap.get(BROKER_USERID);
            List<AccountTeamMember> insertTeamList = new List<AccountTeamMember>();            
            
            Map<String,Object> stepMap = (Map<string,Object>)inputMap.get(STEP_NAME);                
            if(stepMap != null && !String.isBlank(BrokerUserId))   {            
                if(stepMap.containsKey(BROKER_GATYPEAHEAD)){
                    blockMap = (Map<string,Object>)stepMap.get(BROKER_GATYPEAHEAD);
                    gerneralAgencyId = (String)blockMap.get(GA_ID);
                    if(!String.isBlank(gerneralAgencyId)){
                        atmr = getTeamMember(gerneralAgencyId,BrokerUserId);
                        if(atmr.AccountId != null){
                        insertTeamList.add(atmr);}
                    }
                }
                if(stepMap.containsKey(BROKER_PATYPEAHEAD)){
                    blockMap = (Map<string,Object>)stepMap.get(BROKER_PATYPEAHEAD);
                    paidAgencyId = (String)blockMap.get(PA_ID);
                    if(!String.isBlank(paidAgencyId)){
                        atmr = getTeamMember(paidAgencyId,BrokerUserId);
                        if(atmr.AccountId != null){                 
                        insertTeamList.add(atmr);}
                    }                   
                }                       
            }
           
            if(!insertTeamList.isEmpty())
            {
                insert insertTeamList;
                SGA_QuoteEnrollmentStage__c stageRec;
                if(insertTeamList.size()==1){
                stageRec =  new SGA_QuoteEnrollmentStage__c(Id=stageId,PATeamMemberId__c=insertTeamList[0].Id);}
                else{
                stageRec =  new SGA_QuoteEnrollmentStage__c(Id=stageId,GATeamMemberId__c=insertTeamList[0].Id,PATeamMemberId__c=insertTeamList[1].Id);}                                
                update stageRec;
            }                                      
        }   
        catch(Exception excn){
             UTIL_LoggingService.logHandledException(excn, null, null, 
             CLASSNAME,AGENCY_METHODNAME,null,LoggingLevel.ERROR); 
             outMap.put(ERROR_CODE, ERROR_MSG); 
        }          
    }

    /************************************************************************************
    Method Name : getTeamMember
    Return type : void
    Date: 05/14/2018
    author: IDC Offshore
    Description : This methos is called in upadatePAGAonStage to create AccountTeamMember.
    *************************************************************************************/ 
    private AccountTeamMember getTeamMember(string agencyId, string userId){
        List<AccountTeamMember> accTeamList = [SELECT Id from AccountTeamMember where AccountId =:agencyId AND UserId = :userId];
        AccountTeamMember atm = new AccountTeamMember();
        if(accTeamList.isEmpty()){          
            atm.AccountId = agencyId;
            atm.UserId  = userId;
            atm.TeamMemberRole  = BROKER;
            atm.AccountAccessLevel  = READ;                   
        }
        return atm;    
    }
}