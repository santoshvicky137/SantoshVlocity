/*********************************************************************************************
Class Name   : SGA_AP99_ABF_ApplicationLoader
Date Created : 06-August-2022
Created By   : Vikings Offshore Team
Description  : This is the class used for omniscript validations
*********************************************************************************************/

global with sharing class SGA_AP99_ABF_ApplicationLoader implements vlocity_ins.VlocityOpenInterface{
    
    public static final string LOADDATA = 'loadData';
    public static final string CONTEXTID = 'ContextId';
    public static final string APPID = 'applicationId';
    public static final string CLASSNAME = 'SGA_AP99_ABF_ApplicationLoader';
    public static final string METHODNAME = 'invokeMethod';
    public static final string OMNIATTACH = 'OmniScript Attachment';    
    public static final string EMPINFO = 'EmployerInformation';
    public static final string COVBENEDESIGN = 'CoverageBenefitDesign';
    public static final string DENCOVERAGE = 'DentalCoverage';
    public static final string DENCOVERAGENQ = 'DentalCoverageNQ';
    public static final string VISCOVERAGE = 'VisionCoverage';
    public static final string VISCOVERAGENQ = 'VisionCoverageNQ';
    public static final string LDCOVERAGE = 'SelectedLAndDCoverage';
    public static final string ELIGIBLITY = 'Eligibility';
    public static final string APPINFO = 'ApplicationInfo';
    public static final string BROKERSALESINFO = 'BrokerSalesInformation';
    public static final string GENAGRVACLIENT = 'GeneralAgreementVA_AnthemClient';
    public static final string OWNERSHIP1 = 'Ownership1';
    public static final string EMPSPONCHECK = 'EmployeeSponsoredCheck';
    public static final string NODENTALCOVERAGE1 = 'NoDentalCoverage1';
    public static final string NOLIFE = 'NoLife';
    public static final string NOVISCOVERAGE1 = 'NoVisionCoverage1';
    public static final string VISEMPCHECK = 'VisionEmployeecheck';
    public static final string VISEMPSPON = 'VisionEmployerSponsership';
    public static final string VISVOLCHECK = 'VisionVoluntaryCheck';
    public static final string VISVOLPRODUCT = 'VisionVoluntaryProduct';
    public static final string VOLCHECK = 'VoluntaryCheck';
    private static final string WITHQUOTE = 'WithQuote';
    private static final string ABFSTATE = 'ABFState';
    private static final string MEDPLAN1 = 'MedicalPlan1';
    private static final string MEDPLAN2 = 'MedicalPlan2';
    private static final string MEDPLAN3 = 'MedicalPlan3';
    private static final string MEDPLAN4 = 'MedicalPlan4';
    private static final string MEDPLAN5 = 'MedicalPlan5';
    private static final string MEDPLAN6 = 'MedicalPlan6';
    private static final string MEDPLANNQ1 = 'MedicalPlanNQ1';
    private static final string MEDPLANNQ2 = 'MedicalPlanNQ2';
    private static final string MEDPLANNQ3 = 'MedicalPlanNQ3';
    private static final string MEDPLANNQ4 = 'MedicalPlanNQ4';
    private static final string MEDPLANNQ5 = 'MedicalPlanNQ5';
    private static final string MEDPLANNQ6 = 'MedicalPlanNQ6';
    private static final string COUNTYCODE = 'CountyCode';
    private static final string ANTHEMCLIENTCHECK = 'checkAnthemClientOrNot';
    private static final string QUOTEID = 'QuoteId';
    private static final string CONBLOCK1 = 'ContributionBlock1';
    private static final string CONBLOCK2 = 'ContributionBlock2';
    private static final string CONBLOCK3 = 'ContributionBlock3';
    private static final string CONBLOCK4 = 'ContributionBlock4';
    private static final string CONBLOCK5 = 'ContributionBlock5';
    private static final string CONBLOCK6 = 'ContributionBlock6';
    //added by Subhani for effectiveDateYear for resend option
    private static final string EFFECTIVEDATEYEAR= 'EffectiveDateYear';
    private static final string BROKERID = 'BrokerId';
    private static final string BROKERCONTACTID1= 'BrokerContactId1';
    private static final string QSTATE= 'qState';

    
    
     /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName, Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/   
    
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String,Object> options)
    {    
        try{
            if (methodName == LOADDATA){
                return loadData(inputMap, outputMap) ;
            }
        }Catch(Exception ex){
            UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, CLASSNAME, METHODNAME,SG01_Constants.SPACE, Logginglevel.ERROR);
        }
        
        return false;
    }
    
     /***************************************************************************************************************
    * Method Name : loadData
    * Params      : Map<String,Object> tempinputMap, Map<String,Object> outputMap
    * Return type : Boolean
    * Description : This method is used to fetch the Omniscript data Json for ABF resend application omniscript
    * *************************************************************************************************************/   
        
    public Boolean loadData(Map<String,Object> tempinputMap, Map<String,Object> outputMap){
        Id applcationId = (Id)tempinputMap.get(CONTEXTID);
        String dataJSON = [SELECT vlocity_ins__JSONData__c FROM vlocity_ins__Application__c WHERE ID =: applcationId LIMIT 1].vlocity_ins__JSONData__c;
        
        if(dataJSON == OMNIATTACH){
            Blob AttachedFile = [SELECT Id, Name, Body, ContentType FROM Attachment WHERE ParentId = :applcationId AND NAME='OmniScriptDataJSON.json' LIMIT 1].body;
            dataJSON = AttachedFile.toString();
        }
        
        if(!String.isBlank(dataJSON)){
            Map<String,Object> inputMap = (Map<String, Object>) JSON.deserializeUntyped(dataJSON);
            
            if(tempinputMap.get(CONTEXTID) != null)
            outputMap.put(APPID, tempinputMap.get(CONTEXTID));
            if(inputMap.get(EMPINFO) != null)
            outputMap.put(EMPINFO, inputMap.get(EMPINFO));
            if(inputMap.get(COVBENEDESIGN) != null)
            outputMap.put(COVBENEDESIGN, inputMap.get(COVBENEDESIGN));
            if(inputMap.get(DENCOVERAGE) != null)
            outputMap.put(DENCOVERAGE, inputMap.get(DENCOVERAGE));
            if(inputMap.get(DENCOVERAGENQ) != null)
            outputMap.put(DENCOVERAGENQ, inputMap.get(DENCOVERAGENQ));
            if(inputMap.get(VISCOVERAGE) != null)
            outputMap.put(VISCOVERAGE, inputMap.get(VISCOVERAGE));
            if(inputMap.get(VISCOVERAGENQ) != null)
            outputMap.put(VISCOVERAGENQ, inputMap.get(VISCOVERAGENQ));
            if(inputMap.get(LDCOVERAGE) != null)
            outputMap.put(LDCOVERAGE, inputMap.get(LDCOVERAGE));
            if(inputMap.get(ELIGIBLITY) != null)
            outputMap.put(ELIGIBLITY, inputMap.get(ELIGIBLITY));
            if(inputMap.get(APPINFO) != null)
            outputMap.put(APPINFO, inputMap.get(APPINFO));
            if(inputMap.get(BROKERSALESINFO) != null)
            outputMap.put(BROKERSALESINFO, inputMap.get(BROKERSALESINFO));
            if(inputMap.get(GENAGRVACLIENT) != null)
            outputMap.put(GENAGRVACLIENT, inputMap.get(GENAGRVACLIENT));
            if(inputMap.get(OWNERSHIP1) != null)
            outputMap.put(OWNERSHIP1, inputMap.get(OWNERSHIP1));
            if(inputMap.get(EMPSPONCHECK) != null)
            outputMap.put(EMPSPONCHECK, inputMap.get(EMPSPONCHECK));            
            if(inputMap.get(NODENTALCOVERAGE1) != null)
            outputMap.put(NODENTALCOVERAGE1, inputMap.get(NODENTALCOVERAGE1));            
            if(inputMap.get(NOLIFE) != null)
            outputMap.put(NOLIFE, inputMap.get(NOLIFE));            
            if(inputMap.get(NOVISCOVERAGE1) != null)
            outputMap.put(NOVISCOVERAGE1, inputMap.get(NOVISCOVERAGE1));           
            if(inputMap.get(VISEMPCHECK) != null)
            outputMap.put(VISEMPCHECK, inputMap.get(VISEMPCHECK));            
            if(inputMap.get(VISEMPSPON) != null)
            outputMap.put(VISEMPSPON, inputMap.get(VISEMPSPON));           
            if(inputMap.get(VISVOLCHECK) != null)
            outputMap.put(VISVOLCHECK, inputMap.get(VISVOLCHECK));           
            if(inputMap.get(VISVOLPRODUCT) != null)
            outputMap.put(VISVOLPRODUCT, inputMap.get(VISVOLPRODUCT));            
            if(inputMap.get(VOLCHECK) != null)
            outputMap.put(VOLCHECK, inputMap.get(VOLCHECK));
            if(inputMap.get(WITHQUOTE) != null)     
            outputMap.put(WITHQUOTE, inputMap.get(WITHQUOTE));
            if(inputMap.get(ABFSTATE) != null)     
            outputMap.put(ABFSTATE, inputMap.get(ABFSTATE));            
            if(inputMap.get(MEDPLAN1) != null)     
            outputMap.put(MEDPLAN1, inputMap.get(MEDPLAN1));
            if(inputMap.get(MEDPLAN2) != null)     
            outputMap.put(MEDPLAN2, inputMap.get(MEDPLAN2));
            if(inputMap.get(MEDPLAN3) != null)     
            outputMap.put(MEDPLAN3, inputMap.get(MEDPLAN3));
            if(inputMap.get(MEDPLAN4) != null)     
            outputMap.put(MEDPLAN4, inputMap.get(MEDPLAN4));
            if(inputMap.get(MEDPLAN5) != null)     
            outputMap.put(MEDPLAN5, inputMap.get(MEDPLAN5));
            if(inputMap.get(MEDPLAN6) != null)     
            outputMap.put(MEDPLAN6, inputMap.get(MEDPLAN6));
            if(inputMap.get(MEDPLANNQ1) != null)     
            outputMap.put(MEDPLANNQ1, inputMap.get(MEDPLANNQ1));
            if(inputMap.get(MEDPLANNQ2) != null)     
            outputMap.put(MEDPLANNQ2, inputMap.get(MEDPLANNQ2));
            if(inputMap.get(MEDPLANNQ3) != null)     
            outputMap.put(MEDPLANNQ3, inputMap.get(MEDPLANNQ3));
            if(inputMap.get(MEDPLANNQ4) != null)     
            outputMap.put(MEDPLANNQ4, inputMap.get(MEDPLANNQ4));
            if(inputMap.get(MEDPLANNQ5) != null)     
            outputMap.put(MEDPLANNQ5, inputMap.get(MEDPLANNQ5));
            if(inputMap.get(MEDPLANNQ6) != null)     
            outputMap.put(MEDPLANNQ6, inputMap.get(MEDPLANNQ6));
            if(inputMap.get(COUNTYCODE) != null)     
            outputMap.put(COUNTYCODE, inputMap.get(COUNTYCODE));
            if(inputMap.get(ANTHEMCLIENTCHECK) != null)     
            outputMap.put(ANTHEMCLIENTCHECK, inputMap.get(ANTHEMCLIENTCHECK));
            if(inputMap.get(QUOTEID) != null)     
            outputMap.put(QUOTEID, inputMap.get(QUOTEID));
            if(inputMap.get(CONBLOCK1) != null)     
            outputMap.put(CONBLOCK1, inputMap.get(CONBLOCK1));
            if(inputMap.get(CONBLOCK2) != null)     
            outputMap.put(CONBLOCK2, inputMap.get(CONBLOCK2));
            if(inputMap.get(CONBLOCK3) != null)     
            outputMap.put(CONBLOCK3, inputMap.get(CONBLOCK3));
            if(inputMap.get(CONBLOCK4) != null)     
            outputMap.put(CONBLOCK4, inputMap.get(CONBLOCK4));
            if(inputMap.get(CONBLOCK5) != null)     
            outputMap.put(CONBLOCK5, inputMap.get(CONBLOCK5));
            if(inputMap.get(CONBLOCK6) != null)     
            outputMap.put(CONBLOCK6, inputMap.get(CONBLOCK6));
            //added by Subhani for effectiveDateYear for resend option
             if(inputMap.get(EFFECTIVEDATEYEAR) != null)
            outputMap.put(EFFECTIVEDATEYEAR, inputMap.get(EFFECTIVEDATEYEAR));
             if(inputMap.get(BROKERID) != null)
            outputMap.put(BROKERID, inputMap.get(BROKERID));
            if(inputMap.get(BROKERCONTACTID1) != null)
            outputMap.put(BROKERCONTACTID1, inputMap.get(BROKERCONTACTID1));
            if(inputMap.get(ABFSTATE) != null)     
            outputMap.put(QSTATE, inputMap.get(ABFSTATE));
                        
        }
        return true;
    }
    
}