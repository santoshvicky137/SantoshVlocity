/****************************************************************************************************
* Class Name  : CACO_ApplicationLoader
* Description : This is the class used for omniscript validations
* Developed By: IDC Offshore Team
* ***************************************************************************************************/   
global with sharing class CACO_ApplicationLoader implements vlocity_ins.VlocityOpenInterface{
    
    public static final string LOADDATA = 'loadData';
    public static final string CONTEXTID = 'ContextId';
    public static final string REQ_EFF_DATE = 'requestedEffectiveDate1';
    public static final string OMNSATTACHMENT = 'OmniScript Attachment';
    public static final string OMNSDATAJSON = 'OmniScriptDataJSON.json';
    public static final string COINFO = 'CompanyInformation';
    public static final string MEDCOVERAGE = 'MedicalCoverage';
    public static final string MEDCOVERAGENQ = 'MedicalCoverageNQ';
    public static final string DENCOVERAGE = 'DentalCoverage';
    public static final string DENCOVERAGENQ = 'DentalCoverageNQ';
    public static final string VISCOVERAGE = 'VisionCoverage';
    public static final string VISCOVERAGENQ = 'VisionCoverageNQ';
    public static final string LDCOVERAGE = 'SelectedLAndDCoverage';
    public static final string ELIGIBLITY = 'Eligibility';
    public static final string OWNERSHIP = 'Ownership';
    public static final string OWNERSHIP1 = 'Ownership1';
    public static final string LOA = 'LeaveOfAbsense';
    public static final string PRIORCOVERAGE = 'PriorCoverage';
    public static final string WORKERCOMP = 'Workers Compensation';
    public static final string CALCOBRAQUES = 'CalCOBRACOBRAQuestionnaire';
    public static final string CALCOBRAQUES2019 = 'CalCOBRACOBRAQuestionnaire2019';
    public static final string ELECTRONICACCESS = 'ElectronicAccess';
    public static final string GENERALAGREEMENT = 'GeneralAgreement';
     public static final string GENERALAGREEMENT1 = 'GeneralAgreement1';
    public static final string AGENYBROKERAGE = 'Agent/Producer/BrokerCert';
    public static final string CLASSNAME = 'CACO_ApplicationLoader';
    public static final string METHODNAME = 'invokeMethod';
    public static final string SELECTED_CA_MED_PLANS = 'CASelectedMedical';
    private static final string EMP_SPON_CHECK = 'EmployeeSponsoredCheck';
    private static final string NO_DEN_COV = 'NoDentalCoverage1'; 
    private static final string NO_VIS_COV = 'NoVisionCoverage1';
    private static final string NO_LIFE = 'NoLife';
    private static final string NO_LIFE_CHECK = 'NoLifeCheck';
    private static final string NO_DISABILITY_CHECK = 'NoDisabilityCheck';
    private static final string VIS_EMP_CHECK = 'VisionEmployeecheck';
    private static final string VIS_VOL_CHECK = 'VisionVoluntaryCheck';
    private static final string VOL_CHECK = 'VoluntaryCheck';
    private static final string VIS_EMP_SPON = 'VisionEmployerSponsership';
    private static final string VIS_VOL_PROD = 'VisionVoluntaryProduct';
    private static final string VOL_PROD_VIS = 'VoluntaryProductVision';
    private static final string DEN_EMP_SPON = 'DentalEmployerSponsership';
    private static final string DEN_VOL_PROD = 'DentalVoluntaryProduct';
    private static final string VOL_PROD_DEN = 'VoluntaryProductDental';
    private static final string SEL_DEN_PLAN_TYPES = 'SelectedDentalPlanTypes';
    private static final string CAL_HMO_CHECK = 'CaliforniaHMOCheckbox';
    private static final string PRUD_BUYER_CHECK = 'PrudentBuyerCheckbox';
    private static final string SEL_HMO_CHECK = 'SelectHMOcheckbox';
    private static final string SEL_PPO_CHECK = 'SelectPPOCheckbox';
    public static final string EFFECTIVEDATE = 'EffectiveDateYear';
    public static final string CO_MED_PROD1 = 'SelectedMedicalPlanName';
    public static final string CO_MED_PROD2 = 'CO_MED_PROD2';
    public static final string CO_MED_PROD3 = 'CO_MED_PROD3';
    public static final string CO_MED_PROD4 = 'CO_MED_PROD4';
    public static final string PRUDENTEPO = 'PrudentEPO';
    public static final string PRUDENTPPO = 'PrudentPPO';
    private static final string WITHQUOTE = 'WithQuote';
    private static final string ISABF = 'IsABF';
    private static final string BROKERID ='BrokerId';
    public static final string FORM5500VALUES = 'finalForm550Value';
    public String dataJSON = '';
    
    /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/   
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String,Object> options)
    {
        try{
            if (methodName == LOADDATA){
                return loadData(inputMap, outputMap) ;
            }
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, CLASSNAME, METHODNAME,SG01_Constants.SPACE, Logginglevel.ERROR);}
        
        return false;
    }
    
    /***************************************************************************************************************
    * Method Name : loadData
    * Params      : Map<String,Object> tempinputMap, Map<String,Object> outputMap
    * Return type : Boolean
    * Description : This method is used to fetch the Omniscript data Json for CA/CO resend application omniscript
    * *************************************************************************************************************/   
    public Boolean loadData(Map<String,Object> tempinputMap, Map<String,Object> outputMap){
        
        Id applcationId = (Id)tempinputMap.get(CONTEXTID);
        vlocity_ins__Application__c applicationObj = [Select id, OmniscriptInstanceId__c, name from vlocity_ins__Application__c where ID =: applcationId  LIMIT 1];
        if(String.isNotBlank(applicationObj.OmniscriptInstanceId__c)){
            Blob AttachedFile = [SELECT Id, Name, Body, ContentType FROM Attachment WHERE ParentId = :applicationObj.OmniscriptInstanceId__c AND NAME=:OMNSDATAJSON LIMIT 1].body;
            dataJSON = AttachedFile.toString();
        }
        
        Map<String,Object> inputMap = (Map<String, Object>) JSON.deserializeUntyped(dataJSON);
        if(inputMap.get(COINFO) != null)
            outputMap.put(COINFO, inputMap.get(COINFO));
        if(inputMap.get(MEDCOVERAGE) != null)
            outputMap.put(MEDCOVERAGE, inputMap.get(MEDCOVERAGE));
        if(inputMap.get(MEDCOVERAGENQ) != null)
            outputMap.put(MEDCOVERAGENQ, inputMap.get(MEDCOVERAGENQ));
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
        if(inputMap.get(OWNERSHIP) != null)
            outputMap.put(OWNERSHIP, inputMap.get(OWNERSHIP));
        if(inputMap.get(OWNERSHIP1) != null)
            outputMap.put(OWNERSHIP1, inputMap.get(OWNERSHIP1));
        if(inputMap.get(LOA) != null)
            outputMap.put(LOA, inputMap.get(LOA));
        if(inputMap.get(PRIORCOVERAGE) != null)
            outputMap.put(PRIORCOVERAGE, inputMap.get(PRIORCOVERAGE));
        if(inputMap.get(WORKERCOMP) != null)
            outputMap.put(WORKERCOMP, inputMap.get(WORKERCOMP));
        if(inputMap.get(CALCOBRAQUES) != null)
            outputMap.put(CALCOBRAQUES, inputMap.get(CALCOBRAQUES));
        if(inputMap.get(CALCOBRAQUES2019) != null)
            outputMap.put(CALCOBRAQUES2019, inputMap.get(CALCOBRAQUES2019));
        if(inputMap.get(ELECTRONICACCESS) != null)
            outputMap.put(ELECTRONICACCESS, inputMap.get(ELECTRONICACCESS));
        if(inputMap.get(GENERALAGREEMENT) != null)
            outputMap.put(GENERALAGREEMENT, inputMap.get(GENERALAGREEMENT));
        if(inputMap.get(GENERALAGREEMENT1) != null)
            outputMap.put(GENERALAGREEMENT1, inputMap.get(GENERALAGREEMENT1));
        if(inputMap.get(AGENYBROKERAGE) != null)
            outputMap.put(AGENYBROKERAGE, inputMap.get(AGENYBROKERAGE));
        if(inputMap.get(SELECTED_CA_MED_PLANS) != null)
            outputMap.put(SELECTED_CA_MED_PLANS, inputMap.get(SELECTED_CA_MED_PLANS));
        if(inputMap.get(EMP_SPON_CHECK) != null)
            outputMap.put(EMP_SPON_CHECK, inputMap.get(EMP_SPON_CHECK)); 
        if(inputMap.get(NO_DEN_COV) != null)
            outputMap.put(NO_DEN_COV, inputMap.get(NO_DEN_COV)); 
        if(inputMap.get(NO_VIS_COV) != null)
            outputMap.put(NO_VIS_COV, inputMap.get(NO_VIS_COV)); 
        if(inputMap.get(NO_LIFE) != null)
            outputMap.put(NO_LIFE, inputMap.get(NO_LIFE)); 
        if(inputMap.get(NO_LIFE_CHECK) != null)
            outputMap.put(NO_LIFE_CHECK, inputMap.get(NO_LIFE_CHECK)); 
        if(inputMap.get(NO_DISABILITY_CHECK) != null)
            outputMap.put(NO_DISABILITY_CHECK, inputMap.get(NO_DISABILITY_CHECK)); 
        if(inputMap.get(VIS_EMP_CHECK) != null)
            outputMap.put(VIS_EMP_CHECK, inputMap.get(VIS_EMP_CHECK)); 
        if(inputMap.get(VIS_VOL_CHECK) != null)
            outputMap.put(VIS_VOL_CHECK, inputMap.get(VIS_VOL_CHECK)); 
        if(inputMap.get(VOL_CHECK) != null)
            outputMap.put(VOL_CHECK, inputMap.get(VOL_CHECK)); 
        if(inputMap.get(VIS_EMP_SPON) != null)
            outputMap.put(VIS_EMP_SPON, inputMap.get(VIS_EMP_SPON)); 
        if(inputMap.get(VIS_VOL_PROD) != null)
            outputMap.put(VIS_VOL_PROD, inputMap.get(VIS_VOL_PROD)); 
        if(inputMap.get(VOL_PROD_VIS) != null)
            outputMap.put(VOL_PROD_VIS, inputMap.get(VOL_PROD_VIS)); 
        if(inputMap.get(DEN_EMP_SPON) != null)
            outputMap.put(DEN_EMP_SPON, inputMap.get(DEN_EMP_SPON)); 
        if(inputMap.get(DEN_VOL_PROD) != null)
            outputMap.put(DEN_VOL_PROD, inputMap.get(DEN_VOL_PROD)); 
        if(inputMap.get(VOL_PROD_DEN) != null)
            outputMap.put(VOL_PROD_DEN, inputMap.get(VOL_PROD_DEN)); 
        if(inputMap.get(SEL_DEN_PLAN_TYPES) != null)
            outputMap.put(SEL_DEN_PLAN_TYPES, inputMap.get(SEL_DEN_PLAN_TYPES));    
        if(inputMap.get(CAL_HMO_CHECK) != null)
            outputMap.put(CAL_HMO_CHECK, inputMap.get(CAL_HMO_CHECK)); 
        if(inputMap.get(PRUD_BUYER_CHECK) != null)
            outputMap.put(PRUD_BUYER_CHECK, inputMap.get(PRUD_BUYER_CHECK)); 
        if(inputMap.get(SEL_HMO_CHECK) != null)
            outputMap.put(SEL_HMO_CHECK, inputMap.get(SEL_HMO_CHECK)); 
        if(inputMap.get(SEL_PPO_CHECK) != null)
            outputMap.put(SEL_PPO_CHECK, inputMap.get(SEL_PPO_CHECK)); 
        if(inputMap.get(EFFECTIVEDATE) != null)
            outputMap.put(EFFECTIVEDATE, inputMap.get(EFFECTIVEDATE));
        if(inputMap.get(CO_MED_PROD1) != null)
            outputMap.put(CO_MED_PROD1, inputMap.get(CO_MED_PROD1));
        if(inputMap.get(CO_MED_PROD2) != null)
            outputMap.put(CO_MED_PROD2, inputMap.get(CO_MED_PROD2));
        if(inputMap.get(CO_MED_PROD3) != null)
            outputMap.put(CO_MED_PROD3, inputMap.get(CO_MED_PROD3));
        if(inputMap.get(PrudentEPO) != null)     
            outputMap.put(PrudentEPO, inputMap.get(PrudentEPO));
        if(inputMap.get(PrudentPPO) != null)     
            outputMap.put(PrudentPPO, inputMap.get(PrudentPPO));
        if(inputMap.get(WITHQUOTE) != null)     
            outputMap.put(WITHQUOTE, inputMap.get(WITHQUOTE));
        if(inputMap.get(ISABF) != null)     
            outputMap.put(ISABF, inputMap.get(ISABF));
        if(inputMap.get(REQ_EFF_DATE) != null)     
            outputMap.put(REQ_EFF_DATE, inputMap.get(REQ_EFF_DATE)); 
        if(inputMap.get(BROKERID) != null)     
            outputMap.put(BROKERID, inputMap.get(BROKERID));
        if(inputMap.get(FORM5500VALUES) != null)     
            outputMap.put(FORM5500VALUES, inputMap.get(FORM5500VALUES));  
        return true;
    }
    
}