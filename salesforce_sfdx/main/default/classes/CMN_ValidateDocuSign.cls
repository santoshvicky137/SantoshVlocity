/*
** Modified by Muthu R on June 22, 2019. Added DocuSignSigInternalAction docusign element
*/
global with sharing class CMN_ValidateDocuSign implements vlocity_ins.VlocityOpenInterface2{
    public Object invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options) {
        Boolean success = true;

        try{
            if(methodName == 'validateDocuSignPrint') {
                validateDocuSignPrint(inputMap, outMap, options);
            }
            if(methodName == 'validateDocuSignPrintABFSpeciality') {
                validateDocuSignPrintABFSpeciality(inputMap, outMap, options);
            }
            if(methodName == 'validateDocuSignPrintABFCASpeciality') {
                validateDocuSignPrintABFCASpeciality(inputMap, outMap, options);
            }
        }catch(Exception e){
            System.debug(' exception '+e);
            success = false;
            throw e;
        }
        
        return success;
    }
    
    public void validateDocuSignPrint(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean isComplete = false;
        for(String s:inputMap.keyset()) {
            if(s.contains('SignAction') || s.contains('DocuSign Signature Action') || s.containsIgnoreCase('DocuSignSigInternalAction') || s.containsIgnoreCase('DocuSignSignatureAction') || s.containsIgnoreCase('DocuSignSignature') || s.containsIgnoreCase('InternalDocuSignSignatureAction')) {
                for(Object docusignObject:(List<Object>)inputMap.get(s)) {
                    Map<String,Object> docuSignMap = (Map<String,Object>)docusignObject;
                    if(docuSignMap != null && docuSignMap.containsKey('status') && (((String)docuSignMap.get('status')).equalsIgnoreCase('Completed')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signing_compl')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signing_complete')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signing_')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signing_c')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signi')
                      || ((String)docuSignMap.get('status')).equalsIgnoreCase('signing_comp'))){
                        isComplete = true;
                        system.debug('isComplete '+isComplete);
                    }
                }
            }
        }
        if(isComplete == false){
            system.debug('Error If'+isComplete);
            outMap.put('error','Please open the application and complete the signing process before continuing.');
        }
    }
    
    public void validateDocuSignPrintABFSpeciality(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean isComplete = false;
        Map<String,Object> PrintSignNowABFSpeciality = new Map<String,Object>();
        for(String s:inputMap.keyset()){
            if(s.contains('PrintSignNowBeneMod')){
                PrintSignNowABFSpeciality = (Map<String,Object>)inputMap.get(s);
                //if((Boolean)PrintSignNowABFSpeciality.get('isEmployerAppPrintSign-EmpAppBeneMod') == true) {
                if(((Boolean)PrintSignNowABFSpeciality.get('isEmployerAppPrintSign-EmpAppBeneMod') == true) || ((Boolean)PrintSignNowABFSpeciality.get('isEmployerAppPrintSign-EmployerApp_AnthemClient') == true)) {
                    isComplete = true;
                    system.debug('isComplete '+isComplete);
                }
            }
        }
        if(isComplete == false){
            system.debug('Error If'+isComplete);
            outMap.put('error','Please open the application and complete the signing process before continuing.');
        }
    }
    
    public void validateDocuSignPrintABFCASpeciality(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean isComplete = false;
        Map<String,Object> PrintSignNowABFSpeciality = new Map<String,Object>();
        for(String s:inputMap.keyset()){
            system.debug(s);
            if(s.contains('PrintSignNowOptionBeneMod')){
                system.debug(s);
                PrintSignNowABFSpeciality = (Map<String,Object>)inputMap.get(s);
                system.debug(PrintSignNowABFSpeciality);
                system.debug((Boolean)PrintSignNowABFSpeciality.get('isEmployerAppPrintSign_EmpApp_BeneMod_LandD'));
                if((Boolean)PrintSignNowABFSpeciality.get('isEmployerAppPrintSign_EmpApp_BeneMod_LandD') == true) {
                    isComplete = true;
                    system.debug('isComplete '+isComplete);
                }
            }
        }
        if(isComplete == false){
            system.debug('Error If'+isComplete);
            outMap.put('error','Please open the application and complete the signing process before continuing.');
        }
    }
}