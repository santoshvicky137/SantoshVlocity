global with sharing class ApplicationLoader implements vlocity_ins.VlocityOpenInterface{
 
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String,Object> options)
    {
        if (methodName == 'loadData'){
            return loadData(inputMap, outputMap) ;
        }
        return false;
    }

    public Boolean loadData(Map<String,Object> tempinputMap, Map<String,Object> outputMap){
        Id applcationId = (Id)tempinputMap.get('ContextId');
        String dataJSON = [SELECT vlocity_ins__JSONData__c FROM vlocity_ins__Application__c WHERE ID =: applcationId LIMIT 1].vlocity_ins__JSONData__c;
        
        System.debug('The dataJSON is: ' + dataJSON);
        if(dataJSON == 'OmniScript Attachment'){
             Blob AttachedFile = [SELECT Id, Name, Body, ContentType FROM Attachment WHERE ParentId = :applcationId AND NAME='OmniScriptDataJSON.json' LIMIT 1].body;
            System.debug('The AttachedFile is: ' + AttachedFile.toString());
            dataJSON = AttachedFile.toString();
        }
        
        Map<String,Object> inputMap = (Map<String, Object>) JSON.deserializeUntyped(dataJSON);
        // Loading Renewal date for Resend 
        if(inputMap.get('QuoteRenewalDate') != null)
        outputMap.put('QuoteRenewalDate',inputMap.get('QuoteRenewalDate'));
        //
        if(inputMap.get(SGA_APResendConstants.CVRGOPTIONS) != null)
        outputMap.put(SGA_APResendConstants.CVRGOPTIONS,inputMap.get(SGA_APResendConstants.CVRGOPTIONS));
        if(inputMap.get(SGA_APResendConstants.EFFECTIVEDATE) != null)
        outputMap.put(SGA_APResendConstants.EFFECTIVEDATE,inputMap.get(SGA_APResendConstants.EFFECTIVEDATE));
        if(inputMap.get(SGA_APResendConstants.COINFO) != null)
        outputMap.put(SGA_APResendConstants.COINFO,inputMap.get(SGA_APResendConstants.COINFO));
        if(inputMap.get(SGA_APResendConstants.MEDCOVERAGE) != null)
        outputMap.put(SGA_APResendConstants.MEDCOVERAGE,inputMap.get(SGA_APResendConstants.MEDCOVERAGE));
        if(inputMap.get(SGA_APResendConstants.MEDCOVERAGENQ) != null)
        outputMap.put(SGA_APResendConstants.MEDCOVERAGENQ,inputMap.get(SGA_APResendConstants.MEDCOVERAGENQ));
        if(inputMap.get(SGA_APResendConstants.DENCOVERAGE) != null)
        outputMap.put(SGA_APResendConstants.DENCOVERAGE,inputMap.get(SGA_APResendConstants.DENCOVERAGE));
        if(inputMap.get(SGA_APResendConstants.DENCOVERAGENQ) != null)
        outputMap.put(SGA_APResendConstants.DENCOVERAGENQ,inputMap.get(SGA_APResendConstants.DENCOVERAGENQ));
        if(inputMap.get(SGA_APResendConstants.VISCOVERAGE) != null)
        outputMap.put(SGA_APResendConstants.VISCOVERAGE,inputMap.get(SGA_APResendConstants.VISCOVERAGE));
        if(inputMap.get(SGA_APResendConstants.VISCOVERAGENQ) != null)
        outputMap.put(SGA_APResendConstants.VISCOVERAGENQ,inputMap.get(SGA_APResendConstants.VISCOVERAGENQ));
        if(inputMap.get(SGA_APResendConstants.LDCOVERAGE) != null)
        outputMap.put(SGA_APResendConstants.LDCOVERAGE,inputMap.get(SGA_APResendConstants.LDCOVERAGE));
        if(inputMap.get(SGA_APResendConstants.ELIGIBLITY) != null)
        outputMap.put(SGA_APResendConstants.ELIGIBLITY,inputMap.get(SGA_APResendConstants.ELIGIBLITY));
        if(inputMap.get(SGA_APResendConstants.AGENYBROKERAGE) != null)
        outputMap.put(SGA_APResendConstants.AGENYBROKERAGE,inputMap.get(SGA_APResendConstants.AGENYBROKERAGE));
        if(inputMap.get(SGA_APResendConstants.ELECTRONICACCESS_NO_SPACE) != null)
        outputMap.put(SGA_APResendConstants.ELECTRONICACCESS_NO_SPACE,inputMap.get(SGA_APResendConstants.ELECTRONICACCESS_NO_SPACE));
        if(inputMap.get(SGA_APResendConstants.CONTRIBUTION) != null)
        outputMap.put(SGA_APResendConstants.CONTRIBUTION,inputMap.get(SGA_APResendConstants.CONTRIBUTION));
        if(inputMap.get(SGA_APResendConstants.MAPPEDCODE) != null)
        outputMap.put(SGA_APResendConstants.MAPPEDCODE,inputMap.get(SGA_APResendConstants.MAPPEDCODE));
        if(inputMap.get(SGA_APResendConstants.APPLICATIONTYPE) != null)
        outputMap.put(SGA_APResendConstants.APPLICATIONTYPE,inputMap.get(SGA_APResendConstants.APPLICATIONTYPE));
        if(inputMap.get(SGA_APResendConstants.GENERALTERMSANDAGREEMENT) != null)
        outputMap.put(SGA_APResendConstants.GENERALTERMSANDAGREEMENT,inputMap.get(SGA_APResendConstants.GENERALTERMSANDAGREEMENT));
        if(inputMap.get(SGA_APResendConstants.RATINGAREA) != null)
        outputMap.put(SGA_APResendConstants.RATINGAREA,inputMap.get(SGA_APResendConstants.RATINGAREA));
         if(inputMap.get(SGA_APResendConstants.BRAND) != null)
        outputMap.put(SGA_APResendConstants.BRAND,inputMap.get(SGA_APResendConstants.BRAND));
        
        if(inputMap.get(SGA_APResendConstants.BrokerCertification) != null)
        outputMap.put(SGA_APResendConstants.BrokerCertification,inputMap.get(SGA_APResendConstants.BrokerCertification));
       
       
       if(inputMap.get('Set_MedicalPercentEmpAndSpouse') != null)
            outputMap.put('Set_MedicalPercentEmpAndSpouse', inputMap.get('Set_MedicalPercentEmpAndSpouse'));
        if(inputMap.get('Set_MedicalPercentEmployeeAndChildren') != null)
            outputMap.put('Set_MedicalPercentEmployeeAndChildren', inputMap.get('Set_MedicalPercentEmployeeAndChildren'));
        if(inputMap.get('Set_MedicalPercentEmployeeOnly') != null)
            outputMap.put('Set_MedicalPercentEmployeeOnly', inputMap.get('Set_MedicalPercentEmployeeOnly'));
        if(inputMap.get('Set_MedicalPercentFamily') != null)
            outputMap.put('Set_MedicalPercentFamily', inputMap.get('Set_MedicalPercentFamily'));
        if(inputMap.get('Set_MedicalPlanContractCode1') != null)
            outputMap.put('Set_MedicalPlanContractCode1', inputMap.get('Set_MedicalPlanContractCode1'));
        if(inputMap.get('Set_MedicalPlanContractCode2') != null)
            outputMap.put('Set_MedicalPlanContractCode2', inputMap.get('Set_MedicalPlanContractCode2'));
        if(inputMap.get('Set_MedicalPlanContractCode3') != null)
            outputMap.put('Set_MedicalPlanContractCode3', inputMap.get('Set_MedicalPlanContractCode3'));
        if(inputMap.get('Set_MedicalPlanContractCode4') != null)
            outputMap.put('Set_MedicalPlanContractCode4', inputMap.get('Set_MedicalPlanContractCode4'));
       
        Map<String,Object> CompanyInformationField = (Map<String,Object>) inputMap.get('CompanyInformation');
        String YEARField = (String)CompanyInformationField.get('AppEffectiveDateYear');
        
        System.debug('The YEARField is: ' + YEARField);
        
        if(YEARField != null)
            outputMap.put('YEAR', YEARField);
        if(inputMap.get('AgencyName') != null)
            outputMap.put('AgencyName', inputMap.get('AgencyName'));
         if(inputMap.get('AuthorizationCheck') != null)
            outputMap.put('AuthorizationCheck', inputMap.get('AuthorizationCheck'));
        if(inputMap.get('Application Id') != null)
            outputMap.put('Application Id', inputMap.get('Application Id'));
        if(inputMap.get('BrokerId') != null)
            outputMap.put('BrokerId', inputMap.get('BrokerId'));
        if(inputMap.get('BrokerName') != null)
            outputMap.put('BrokerName', inputMap.get('BrokerName'));
        if(inputMap.get('NewEnrollment') != null)
            outputMap.put('NewEnrollment', inputMap.get('NewEnrollment'));
        if(inputMap.get('RequestedEffectiveDateEnText') != null)
            outputMap.put('RequestedEffectiveDateEnText', inputMap.get('RequestedEffectiveDateEnText'));
        if(inputMap.get('Class2NumberofEE+Children') != null)
            outputMap.put('Class2NumberofEE+Children', inputMap.get('Class2NumberofEE+Children'));
        if(inputMap.get('Class2NumberofEE+Spouse') != null)
            outputMap.put('Class2NumberofEE+Spouse', inputMap.get('Class2NumberofEE+Spouse'));
        if(inputMap.get('Class2NumberofFamily') != null)
            outputMap.put('Class2NumberofFamily', inputMap.get('Class2NumberofFamily'));
        if(inputMap.get('Class2NumberofSingles(EE)') != null)
            outputMap.put('Class2NumberofSingles(EE)', inputMap.get('Class2NumberofSingles(EE)'));
        if(inputMap.get('Class3NumberofEE+Children') != null)
            outputMap.put('Class3NumberofEE+Children', inputMap.get('Class3NumberofEE+Children'));
        if(inputMap.get('Class3NumberofEE+Spouse') != null)
            outputMap.put('Class3NumberofEE+Spouse', inputMap.get('Class3NumberofEE+Spouse'));
        if(inputMap.get('Class3NumberofFamily') != null)
            outputMap.put('Class3NumberofFamily', inputMap.get('Class3NumberofFamily'));
        if(inputMap.get('Class3NumberofSingles (EE)') != null)
            outputMap.put('Class3NumberofSingles (EE)', inputMap.get('Class3NumberofSingles (EE)'));

        if(inputMap.get('GroupName') != null)
            outputMap.put('GroupName', inputMap.get('GroupName'));
        if(inputMap.get('MappedCode') != null)
            outputMap.put('MappedCode', inputMap.get('MappedCode'));
        if(inputMap.get('MinInfo') != null)
            outputMap.put('MinInfo', inputMap.get('MinInfo'));
        if(inputMap.get('MinState') != null)
            outputMap.put('MinState', inputMap.get('MinState'));
        if(inputMap.get('NoDentalCoverage') != null)
            outputMap.put('NoDentalCoverage', inputMap.get('NoDentalCoverage'));
        if(inputMap.get('PartyAccountId') != null)
            outputMap.put('PartyAccountId', inputMap.get('PartyAccountId'));
        if(inputMap.get('QuotePreparedFor') != null)
            outputMap.put('QuotePreparedFor', inputMap.get('QuotePreparedFor'));
      /*  if(inputMap.get('SIC') != null)
            outputMap.put('SIC', inputMap.get('SIC'));*/
        if(inputMap.get('SICCode') != null)
            System.debug('The SICCode is: ' + inputMap.get('SICCode'));
            outputMap.put('SIC', inputMap.get('SIC'));
        if(inputMap.get('SelectMedicalCoverage') != null)
            outputMap.put('SelectMedicalCoverage', inputMap.get('SelectMedicalCoverage'));
        if(inputMap.get('VisionOptions') != null)
            outputMap.put('VisionOptions', inputMap.get('VisionOptions'));
        if(inputMap.get('ZipCode') != null)
            outputMap.put('ZipCode', inputMap.get('ZipCode'));
        if(inputMap.get('error') != null)
            outputMap.put('error', inputMap.get('error'));
        if(inputMap.get('id') != null)
            outputMap.put('id', inputMap.get('id'));
        if(inputMap.get('plan') != null)
            outputMap.put('plan', inputMap.get('plan'));
        if(inputMap.get('qOpportunityName') != null)
            outputMap.put('qOpportunityName', inputMap.get('qOpportunityName'));
        if(inputMap.get('qQuote Name') != null)
            outputMap.put('qQuote Name', inputMap.get('qQuote Name'));
        if(inputMap.get('sInstanceId') != null)
            outputMap.put('sInstanceId', inputMap.get('sInstanceId'));
        if(inputMap.get('textNode') != null)
            outputMap.put('textNode', inputMap.get('textNode'));
        if(inputMap.get('textNode2') != null)
            outputMap.put('textNode2', inputMap.get('textNode2'));
        if(inputMap.get('textNode3') != null)
            outputMap.put('textNode3', inputMap.get('textNode3'));
        if(inputMap.get('timeStamp') != null)
            outputMap.put('timeStamp', inputMap.get('timeStamp'));
        if(inputMap.get('userName') != null)
            outputMap.put('userName', inputMap.get('userName'));
        if(inputMap.get('userProfile') != null)
            outputMap.put('userProfile', inputMap.get('userProfile'));
        if(inputMap.get('vlcPersistentComponent') != null)
            outputMap.put('vlcPersistentComponent', inputMap.get('vlcPersistentComponent'));
        if(inputMap.get('NYProductName1') != null)
            outputMap.put('NYProductName1', inputMap.get('NYProductName1'));
        if(inputMap.get('NYProductName2') != null)
            outputMap.put('NYProductName2', inputMap.get('NYProductName2'));
        if(inputMap.get('NYProductName3') != null)
            outputMap.put('NYProductName3', inputMap.get('NYProductName3'));
        //Added by ravi
         if(inputMap.get('finalForm550Value') != null)
            outputMap.put('finalForm550Value', inputMap.get('finalForm550Value'));

         return true;
    }

}