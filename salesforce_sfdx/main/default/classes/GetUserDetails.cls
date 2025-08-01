global with sharing class GetUserDetails implements vlocity_ins.VlocityOpenInterface{
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        Boolean success = true;
        
        try{
            if(methodName == 'getBrokerUserId') {
                getBrokerUserId(inputMap, outMap, options);
            }
            else if(methodName == 'getGeneralAgencyContactUserId') {
                getGeneralAgencyContactUserId(inputMap, outMap, options);
            }
            else if(methodName == 'getPaidAgencyContactUserId') {
                getPaidAgencyContactUserId(inputMap, outMap, options);
            }
        }catch(Exception e){
            System.debug(' exception '+e);
            success = false;
            throw e;
        }
        
        return success;
        
    }
    
    public void getBrokerUserId(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> Step = (Map<String,Object>) inputMap.get('Step');
        Map<String,Object> TypeAheadBroker = (Map<String,Object>) Step.get('TypeAheadBroker-Block');
        
        if(TypeAheadBroker != null){
            String BrokerId = (String)TypeAheadBroker.get('BrokerId');
            System.debug(' The BrokerId is '+BrokerId);
            if(BrokerId != null){
                List<User> UserDetails = [SELECT Id FROM User WHERE (ContactId =: BrokerId) AND IsActive=TRUE LIMIT 1];
                if(UserDetails != null && UserDetails.size() > 0){
                    outMap.put('BrokerUserId', UserDetails[0].Id);
                }
            }
        }
    }
    
    public void getGeneralAgencyContactUserId(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String GeneralAgencyContactId = '';
        Map<String,Object> getGeneralAgencyContactUserId = (Map<String,Object>) inputMap.get('GetGeneralAgencyContactId');
        if(!getGeneralAgencyContactUserId.isEmpty()){
            GeneralAgencyContactId = (String) getGeneralAgencyContactUserId.get('GeneralAgencyContactId');
        }else{
            GeneralAgencyContactId = (String) inputMap.get('GeneralAgencyContactId');
        }
        System.debug(' The GeneralAgencyContactId is '+GeneralAgencyContactId);
        if(GeneralAgencyContactId != null){
            List<User> UserDetails = [SELECT Id FROM User WHERE (ContactId =: GeneralAgencyContactId) AND IsActive=TRUE LIMIT 1];
            if(UserDetails != null && UserDetails.size() > 0){
                outMap.put('GeneralAgencyContactUserId', UserDetails[0].Id);
            }
        }
    }
    
    public void getPaidAgencyContactUserId(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String PaidAgencyContactId='';
        Map<String,Object> GetPaidAgencyContactId = (Map<String,Object>) inputMap.get('GetPaidAgencyContactId');
        system.debug('---'+GetPaidAgencyContactId);
        if(!GetPaidAgencyContactId.isEmpty()){
            PaidAgencyContactId = (String)GetPaidAgencyContactId.get('PaidAgencyContactId');
        }else{
            PaidAgencyContactId = (String) inputMap.get('PaidAgencyContactId');
        }
        System.debug(' The PaidAgencyContactId is '+PaidAgencyContactId);
        if(PaidAgencyContactId != null){
            List<User> UserDetails = [SELECT Id FROM User WHERE (ContactId =: PaidAgencyContactId) AND IsActive=TRUE LIMIT 1];
            system.debug('UserDetails--'+UserDetails);
            if(UserDetails != null && UserDetails.size() > 0){
                outMap.put('PaidAgencyContactUserId', UserDetails[0].Id);
            }
        }
    }
    
}