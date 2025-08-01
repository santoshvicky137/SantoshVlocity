/****************************************************************************************************
* Class Name  : SGA_AP98_ApplicationLoader
* Description : This is the class used for Resend DocuSign Functionality of all states except NY, CA and CO
* Developed By: IDC Offshore Team
* ***************************************************************************************************/ 
global with sharing class SGA_AP98_ApplicationLoader implements vlocity_ins.VlocityOpenInterface{
    private static final string OMNSATTACHMENT = 'OmniScript Attachment';
    private static final string OMNSDATAJSON = 'OmniScriptDataJSON.json';
    private static final string CLASSNAME = 'SGA_AP98_ApplicationLoader';
    public String dataJSON = '';
    public static final string LOADDATA = 'loadData';
    public static final string CONTEXTID = 'ContextId';
    private static final string QSTATE = 'qState';
       
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
    * Description : This method is used to fetch the Omniscript data Json for All States except NY/CA/CO resend application omniscript
    * *************************************************************************************************************/ 
    public Boolean loadData(Map<String,Object> tempinputMap, Map<String,Object> outputMap){         
        Map<String,String> variableMap = new Map<string,String>();
        //Adding common variables in the map for all the states except CA/CO and NY
        variableMap.put(SGA_APResendConstants.COINFO,SGA_APResendConstants.COINFO);
        variableMap.put(SGA_APResendConstants.RATING_TYPE_CHECK,SGA_APResendConstants.RATING_TYPE_CHECK);
        variableMap.put(SGA_APResendConstants.MEDCOVERAGE,SGA_APResendConstants.MEDCOVERAGE);
        variableMap.put(SGA_APResendConstants.MEDCOVERAGENQ,SGA_APResendConstants.MEDCOVERAGENQ);
        variableMap.put(SGA_APResendConstants.DENCOVERAGE,SGA_APResendConstants.DENCOVERAGE);
        variableMap.put(SGA_APResendConstants.DENCOVERAGENQ,SGA_APResendConstants.DENCOVERAGENQ);
        variableMap.put(SGA_APResendConstants.VISCOVERAGE,SGA_APResendConstants.VISCOVERAGE);
        variableMap.put(SGA_APResendConstants.VISCOVERAGENQ,SGA_APResendConstants.VISCOVERAGENQ);
        variableMap.put(SGA_APResendConstants.LDCOVERAGE,SGA_APResendConstants.LDCOVERAGE);
        variableMap.put(SGA_APResendConstants.ELIGIBLITY,SGA_APResendConstants.ELIGIBLITY);
        variableMap.put(SGA_APResendConstants.OWNERSHIP,SGA_APResendConstants.OWNERSHIP);
        variableMap.put(SGA_APResendConstants.OWNERSHIP1,SGA_APResendConstants.OWNERSHIP1);
        variableMap.put(SGA_APResendConstants.GENERALAGREEMENT,SGA_APResendConstants.GENERALAGREEMENT);
        variableMap.put(SGA_APResendConstants.ELECTRONICACCESS,SGA_APResendConstants.ELECTRONICACCESS);
        variableMap.put(SGA_APResendConstants.AGENYBROKERAGE,SGA_APResendConstants.AGENYBROKERAGE);
        variableMap.put(SGA_APResendConstants.CVRGOPTIONS,SGA_APResendConstants.CVRGOPTIONS);
        variableMap.put(SGA_APResendConstants.VIS_EMP_SPON,SGA_APResendConstants.VIS_EMP_SPON);
        
        variableMap.put(SGA_APResendConstants.VIS_VOL_PROD,SGA_APResendConstants.VIS_VOL_PROD);
        variableMap.put(SGA_APResendConstants.VOL_PROD_VIS,SGA_APResendConstants.VOL_PROD_VIS);
        variableMap.put(SGA_APResendConstants.DEN_EMP_SPON,SGA_APResendConstants.DEN_EMP_SPON);
        variableMap.put(SGA_APResendConstants.DEN_VOL_PROD,SGA_APResendConstants.DEN_VOL_PROD);
        variableMap.put(SGA_APResendConstants.NO_DNTL_CVRG,SGA_APResendConstants.NO_DNTL_CVRG);
        variableMap.put(SGA_APResendConstants.NO_DNTL_CVRG_CHKBX,SGA_APResendConstants.NO_DNTL_CVRG_CHKBX);
        variableMap.put(SGA_APResendConstants.NO_VSN_CVRG_CHKBX,SGA_APResendConstants.NO_VSN_CVRG_CHKBX);
        variableMap.put(SGA_APResendConstants.WITHQUOTE,SGA_APResendConstants.WITHQUOTE);
        variableMap.put(SGA_APResendConstants.EFFECTIVEDATE,SGA_APResendConstants.EFFECTIVEDATE);        
        variableMap.put(SGA_APResendConstants.CO_MED_PROD1,SGA_APResendConstants.CO_MED_PROD1);
        variableMap.put(SGA_APResendConstants.CO_MED_PROD2,SGA_APResendConstants.CO_MED_PROD2);
        variableMap.put(SGA_APResendConstants.CO_MED_PROD3,SGA_APResendConstants.CO_MED_PROD3);
        variableMap.put(SGA_APResendConstants.CO_MED_PROD4,SGA_APResendConstants.CO_MED_PROD4);
        //Adding VA/GA/MO variables in the map
        variableMap.put(SGA_APResendConstants.HMO_PRD_NAME1,SGA_APResendConstants.HMO_PRD_NAME1);
        variableMap.put(SGA_APResendConstants.HMO_PRD_NAME2,SGA_APResendConstants.HMO_PRD_NAME2);
        variableMap.put(SGA_APResendConstants.HMO_PRD_NAME3,SGA_APResendConstants.HMO_PRD_NAME3);
        variableMap.put(SGA_APResendConstants.POS_BLUE_PROD_NM1,SGA_APResendConstants.POS_BLUE_PROD_NM1);
        variableMap.put(SGA_APResendConstants.POS_BLUE_PROD_NM2,SGA_APResendConstants.POS_BLUE_PROD_NM2);
        variableMap.put(SGA_APResendConstants.POS_BLUE_PROD_NM3,SGA_APResendConstants.POS_BLUE_PROD_NM3);
        variableMap.put(SGA_APResendConstants.POS_PTHWY_PRD_NM1,SGA_APResendConstants.POS_PTHWY_PRD_NM1);
        variableMap.put(SGA_APResendConstants.POS_PTHWY_PRD_NM2,SGA_APResendConstants.POS_PTHWY_PRD_NM2);
        variableMap.put(SGA_APResendConstants.POS_PTHWY_PRD_NM3,SGA_APResendConstants.POS_PTHWY_PRD_NM3);
        variableMap.put(SGA_APResendConstants.PRD_CODE1,SGA_APResendConstants.PRD_CODE1);
        variableMap.put(SGA_APResendConstants.PRD_CODE2,SGA_APResendConstants.PRD_CODE2);
        variableMap.put(SGA_APResendConstants.PRD_CODE3,SGA_APResendConstants.PRD_CODE3);
        variableMap.put(SGA_APResendConstants.PRD_NM1,SGA_APResendConstants.PRD_NM1);
        variableMap.put(SGA_APResendConstants.PRD_NM2,SGA_APResendConstants.PRD_NM2);
        variableMap.put(SGA_APResendConstants.PRD_NM3,SGA_APResendConstants.PRD_NM3);
        variableMap.put(SGA_APResendConstants.PRD_NTWRK1,SGA_APResendConstants.PRD_NTWRK1);
        variableMap.put(SGA_APResendConstants.PRD_NTWRK2,SGA_APResendConstants.PRD_NTWRK2);
        variableMap.put(SGA_APResendConstants.PRD_NTWRK3,SGA_APResendConstants.PRD_NTWRK3);
        variableMap.put(SGA_APResendConstants.MOBLUE_ACCS_PRD_NM1,SGA_APResendConstants.MOBLUE_ACCS_PRD_NM1);
        variableMap.put(SGA_APResendConstants.MOBLUE_ACCS_PRD_NM2,SGA_APResendConstants.MOBLUE_ACCS_PRD_NM2);
        variableMap.put(SGA_APResendConstants.MOBLUE_ACCS_PRD_NM3,SGA_APResendConstants.MOBLUE_ACCS_PRD_NM3);
        variableMap.put(SGA_APResendConstants.MDCL_PLAN1,SGA_APResendConstants.MDCL_PLAN1);
        variableMap.put(SGA_APResendConstants.MO_PLAN2,SGA_APResendConstants.MO_PLAN2);
        variableMap.put(SGA_APResendConstants.EMP_SPNSRD_CHK,SGA_APResendConstants.EMP_SPNSRD_CHK);
        variableMap.put(SGA_APResendConstants.VSN_EMP_CHK,SGA_APResendConstants.VSN_EMP_CHK);
        variableMap.put(SGA_APResendConstants.VSN_VOL_CHK,SGA_APResendConstants.VSN_VOL_CHK);
        variableMap.put(SGA_APResendConstants.VOL_CHK,SGA_APResendConstants.VOL_CHK);
        variableMap.put(SGA_APResendConstants.NO_VSN_CVRG1,SGA_APResendConstants.NO_VSN_CVRG1);
        variableMap.put(SGA_APResendConstants.VOL_PRD_DENTAL,SGA_APResendConstants.VOL_PRD_DENTAL);
        variableMap.put(SGA_APResendConstants.GA_PLAN2,SGA_APResendConstants.GA_PLAN2);
        variableMap.put(SGA_APResendConstants.GA_PLAN3,SGA_APResendConstants.GA_PLAN3);
        variableMap.put(SGA_APResendConstants.Final5500Values,SGA_APResendConstants.Final5500Values); //added by ravi
        //Adding IN/KY/OH variables in the map
        variableMap.put(SGA_APResendConstants.BLUE_ACCS_PRD_NM1,SGA_APResendConstants.BLUE_ACCS_PRD_NM1);
        variableMap.put(SGA_APResendConstants.BLUE_ACCS_PRD_NM2,SGA_APResendConstants.BLUE_ACCS_PRD_NM2);
        variableMap.put(SGA_APResendConstants.BLUE_ACCS_PRD_NM3,SGA_APResendConstants.BLUE_ACCS_PRD_NM3);
        variableMap.put(SGA_APResendConstants.BLUE_PTHWY_PRD_NM1,SGA_APResendConstants.BLUE_PTHWY_PRD_NM1);
        variableMap.put(SGA_APResendConstants.BLUE_PTHWY_PRD_NM2,SGA_APResendConstants.BLUE_PTHWY_PRD_NM2);
        variableMap.put(SGA_APResendConstants.BLUE_PTHWY_PRD_NM3,SGA_APResendConstants.BLUE_PTHWY_PRD_NM3);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_PRD_NM1,SGA_APResendConstants.HMO_PTHWY_PRD_NM1);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_PRD_NM2,SGA_APResendConstants.HMO_PTHWY_PRD_NM2);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_PRD_NM3,SGA_APResendConstants.HMO_PTHWY_PRD_NM3);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM1,SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM1);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM2,SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM2);
        variableMap.put(SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM3,SGA_APResendConstants.HMO_PTHWY_TRNS_PRD_NM3);
        variableMap.put(SGA_APResendConstants.MDCL_PRODS,SGA_APResendConstants.MDCL_PRODS);
        variableMap.put(SGA_APResendConstants.CONTRACTCODE,SGA_APResendConstants.CONTRACTCODE);
        variableMap.put(SGA_APResendConstants.PLANNAME,SGA_APResendConstants.PLANNAME);
        variableMap.put(SGA_APResendConstants.IN_PLAN1,SGA_APResendConstants.IN_PLAN1);
        variableMap.put(SGA_APResendConstants.IN_PLAN2,SGA_APResendConstants.IN_PLAN2);
        variableMap.put(SGA_APResendConstants.LV_OF_ABSNC,SGA_APResendConstants.LV_OF_ABSNC);
        variableMap.put(SGA_APResendConstants.WRKRS_CMPNSTN,SGA_APResendConstants.WRKRS_CMPNSTN);
        variableMap.put(SGA_APResendConstants.GENERALAGREEMENT2019,SGA_APResendConstants.GENERALAGREEMENT2019);
        variableMap.put(SGA_APResendConstants.VSN_SLCTD,SGA_APResendConstants.VSN_SLCTD);
        variableMap.put(SGA_APResendConstants.NO_DNTL_CVRG_TIME,SGA_APResendConstants.NO_DNTL_CVRG_TIME);
        variableMap.put(SGA_APResendConstants.NO_VSN_CVRG_TIME,SGA_APResendConstants.NO_VSN_CVRG_TIME);
        
        //Adding CT/NH/ME variables in the map
        variableMap.put(SGA_APResendConstants.NH_MED_CCODE1,SGA_APResendConstants.NH_MED_CCODE1);
        variableMap.put(SGA_APResendConstants.NH_MED_CCODE2,SGA_APResendConstants.NH_MED_CCODE2);
        variableMap.put(SGA_APResendConstants.NH_MED_CCODE3,SGA_APResendConstants.NH_MED_CCODE3);
        variableMap.put(SGA_APResendConstants.NH_MED_CCODE4,SGA_APResendConstants.NH_MED_CCODE4);
        variableMap.put(SGA_APResendConstants.NH_MED_PROD1,SGA_APResendConstants.NH_MED_PROD1);
        variableMap.put(SGA_APResendConstants.NH_MED_PROD2,SGA_APResendConstants.NH_MED_PROD2);
        variableMap.put(SGA_APResendConstants.NH_MED_PROD3,SGA_APResendConstants.NH_MED_PROD3);
        variableMap.put(SGA_APResendConstants.NH_MED_PROD4,SGA_APResendConstants.NH_MED_PROD4);
        
        variableMap.put(SGA_APResendConstants.ME_PLAN1,SGA_APResendConstants.ME_PLAN1);
        variableMap.put(SGA_APResendConstants.ME_PLAN2,SGA_APResendConstants.ME_PLAN2);
        variableMap.put(SGA_APResendConstants.ME_PLAN3,SGA_APResendConstants.ME_PLAN3);
        variableMap.put(SGA_APResendConstants.ME_PLAN4,SGA_APResendConstants.ME_PLAN4);
        variableMap.put(SGA_APResendConstants.ME_PLAN5,SGA_APResendConstants.ME_PLAN5);
        variableMap.put(SGA_APResendConstants.ME_PLAN6,SGA_APResendConstants.ME_PLAN6);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME1,SGA_APResendConstants.ME_PROD_NAME1);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME2,SGA_APResendConstants.ME_PROD_NAME2);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME3,SGA_APResendConstants.ME_PROD_NAME3);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME4,SGA_APResendConstants.ME_PROD_NAME4);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME5,SGA_APResendConstants.ME_PROD_NAME5);
        variableMap.put(SGA_APResendConstants.ME_PROD_NAME6,SGA_APResendConstants.ME_PROD_NAME6);
        variableMap.put(SGA_APResendConstants.VIS_EMP_SPONS,SGA_APResendConstants.VIS_EMP_SPONS);
        variableMap.put(SGA_APResendConstants.EMP1_CHK,SGA_APResendConstants.EMP1_CHK);
        variableMap.put(SGA_APResendConstants.VOL1_CHK,SGA_APResendConstants.VOL1_CHK);
        variableMap.put(SGA_APResendConstants.ELECTRONIC_ACCESS,SGA_APResendConstants.ELECTRONIC_ACCESS);
        variableMap.put(SGA_APResendConstants.NO_LIFE_CHK,SGA_APResendConstants.NO_LIFE_CHK);
        variableMap.put(SGA_APResendConstants.NO_DISBLTY_CHK,SGA_APResendConstants.NO_DISBLTY_CHK);

        //Adding WI/NV variables in the map
        variableMap.put(SGA_APResendConstants.PROD_CODE1,SGA_APResendConstants.PROD_CODE1);
        variableMap.put(SGA_APResendConstants.PROD_CODE2,SGA_APResendConstants.PROD_CODE2);
        variableMap.put(SGA_APResendConstants.PROD_CODE3,SGA_APResendConstants.PROD_CODE3);
        variableMap.put(SGA_APResendConstants.PROD_NAME1,SGA_APResendConstants.PROD_NAME1);
        variableMap.put(SGA_APResendConstants.PROD_NAME2,SGA_APResendConstants.PROD_NAME2);
        variableMap.put(SGA_APResendConstants.PROD_NAME3,SGA_APResendConstants.PROD_NAME3);
        variableMap.put(SGA_APResendConstants.PROD_NETWORK1,SGA_APResendConstants.PROD_NETWORK1);
        variableMap.put(SGA_APResendConstants.PROD_NETWORK2,SGA_APResendConstants.PROD_NETWORK2);
        variableMap.put(SGA_APResendConstants.PROD_NETWORK3,SGA_APResendConstants.PROD_NETWORK3);
        variableMap.put(SGA_APResendConstants.WIBLUEACCESS_PROD1,SGA_APResendConstants.WIBLUEACCESS_PROD1);
        variableMap.put(SGA_APResendConstants.WIBLUEACCESS_PROD2,SGA_APResendConstants.WIBLUEACCESS_PROD2);
        variableMap.put(SGA_APResendConstants.WIBLUEACCESS_PROD3,SGA_APResendConstants.WIBLUEACCESS_PROD3);
        variableMap.put(SGA_APResendConstants.WIPOSBLUE_PROD1,SGA_APResendConstants.WIPOSBLUE_PROD1);
        variableMap.put(SGA_APResendConstants.WIPOSBLUE_PROD2,SGA_APResendConstants.WIPOSBLUE_PROD2);
        variableMap.put(SGA_APResendConstants.WIPOSBLUE_PROD3,SGA_APResendConstants.WIPOSBLUE_PROD3);
        variableMap.put(SGA_APResendConstants.WIPREFFERED_PROD1,SGA_APResendConstants.WIPREFFERED_PROD1);
        variableMap.put(SGA_APResendConstants.WIPREFFERED_PROD2,SGA_APResendConstants.WIPREFFERED_PROD2);
        variableMap.put(SGA_APResendConstants.WIPREFFERED_PROD3,SGA_APResendConstants.WIPREFFERED_PROD3);
                                    
        Id applcationId = (Id)tempinputMap.get(CONTEXTID);
        vlocity_ins__Application__c applicationObj = [Select id, OmniscriptInstanceId__c, name from vlocity_ins__Application__c where ID =: applcationId  LIMIT 1];
        if(String.isNotBlank(applicationObj.OmniscriptInstanceId__c)){
            Blob AttachedFile = [SELECT Id, Name, Body, ContentType FROM Attachment WHERE ParentId = :applicationObj.OmniscriptInstanceId__c AND NAME=:OMNSDATAJSON LIMIT 1].body;
            dataJSON = AttachedFile.toString();
        }                
        Map<String,Object> inputMap = (Map<String, Object>) JSON.deserializeUntyped(dataJSON);                
        for(String k:variableMap.keySet()){
            if(inputMap.containsKey(k) && inputMap.get(k) != null){
                outputMap.put(k, inputMap.get(k));
                if (k == SGA_APResendConstants.ME_PLAN1
                   || k == SGA_APResendConstants.ME_PLAN2
                   || k == SGA_APResendConstants.ME_PLAN3
                   || k == SGA_APResendConstants.ME_PLAN4
                   || k == SGA_APResendConstants.ME_PLAN5
                   || k == SGA_APResendConstants.ME_PLAN6) {
                  String str1= (string)  inputMap.get(k) ;
                    outputMap.put(k, str1.replace(SGA_APResendConstants.PERCENTAGE_SIGN, SGA_APResendConstants.BLANK_STR));
                }
                
            }            
        }         
        return true;        
    }        
}