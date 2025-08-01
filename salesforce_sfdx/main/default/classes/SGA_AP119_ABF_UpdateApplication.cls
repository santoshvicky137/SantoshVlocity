/*********************************************************************************************
Class Name   : SGA_AP119_ABF_UpdateApplication
Date Created : 18-August-2022
Created By   : Vikings Offshore Team
Description  : This class updates the application
*********************************************************************************************/

global without sharing class SGA_AP119_ABF_UpdateApplication implements vlocity_ins.VlocityOpenInterface{
    private static final string METHOD_NAME='updateAbfApplication';
    private static final string ROOT='rootPath';
    private static final String CLASSNAME = SGA_AP119_ABF_UpdateApplication.class.getName();
    private static final String ACCOUNTID = 'AccountId';
    private static final String ABFAPPNAME = System.Label.SG157_ABF_APP_NAME;
    private static final String ONLINE = 'Online';
    private static final String APPLICATIONID = 'applicationId';
    private static string accountNameFull = '';
    private static final String SPACE = ' ';
    private static final String ACCOUNTNAME = 'AccountName';
    private static final String EFFECTIVEDATE = 'EffectiveDate';
    private static final Boolean TRUEVALUE = true;
    private static final String FOR_TAG = 'For';
    private static final String EFFECTIVE = 'Effective:';
    private static final String ISDENTAL = 'IsDental';
    private static final String ISVISION = 'IsVision';
    private static final String ISLANDD = 'IsLAndD';
    private static final String ISSHORTTERMD = 'IsShortTermD';
    private static final String ISMEDICAL = 'IsMedical';
    private static final String STATE = 'State';
    
    
    /************************************************************************************
    Method Name : invokeMethod
    Parameters: inputMap
    Description : Implementation of invokeMEthod from VlocityOpenInterface2 interface.
    *************************************************************************************/    
    public Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean success = true;
        try{        
            if(METHOD_NAME.equalsIgnoreCase(methodName)){
                updateAbfApplication(inputMap, outMap, options);
                success = false;
            }       
           }catch(Exception excn){
                string method = (String)options.get(METHOD_NAME);
                UTIL_LoggingService.logHandledException(excn, null, null, CLASSNAME,method,null,LoggingLevel.ERROR);
            }
        return success;     
    }
    
    /************************************************************************************
    Method Name : updateAbfApplication
    Parameters: inputMap,outMap,options
    Description : This updates the application
    *************************************************************************************/
    
    private void updateAbfApplication(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        try{
        vlocity_ins__Application__c app = new vlocity_ins__Application__c();
        app.Id = (id)options.get(APPLICATIONID);
        app.vlocity_ins__Type__c = ONLINE;
        accountNameFull = ABFAPPNAME;
        if(options.get(ACCOUNTNAME) != null){
            accountNameFull = accountNameFull+SPACE+FOR_TAG;
            accountNameFull = accountNameFull +SPACE+ options.get(ACCOUNTNAME);
        }
        if(options.get(EffectiveDate)!= null){
            accountNameFull = accountNameFull+SPACE+EFFECTIVE;
            accountNameFull = accountNameFull+SPACE+options.get(EFFECTIVEDATE);
        } 
        //app.name = accountNameFull;
        app.name = accountNameFull.left(80);//Added by Surya for SMGR-32830
        app.ABF_Indicator__c = TRUEVALUE;
        app.vlocity_ins__AccountId__c = (id)inputMap.get(ACCOUNTID);
        app.Medical__c = options.get(ISMEDICAL) != null && options.get(ISMEDICAL) != '' ? (boolean)options.get(ISMEDICAL) : false;
        app.Dental__c = options.get(ISDENTAL) != null && options.get(ISDENTAL) != '' ? (boolean)options.get(ISDENTAL) : false;
        app.Vision__c = options.get(ISVISION) != null && options.get(ISVISION) != '' ? (boolean)options.get(ISVISION) : false;
        app.LTD_VLTD__c = options.get(ISLANDD) != null && options.get(ISLANDD) != '' ? (boolean)options.get(ISLANDD) : false;
        app.STD_VSTD__c = options.get(ISSHORTTERMD) != null && options.get(ISSHORTTERMD) != '' ? (boolean)options.get(ISSHORTTERMD) : false;
        app.State__c = options.get(State) != null && options.get(State) != '' ? (String)options.get(State) : '';
        app.vlocity_ins__Status__c='Submitted';
        update app;
        outMap.put(APPLICATIONID,app.Id);
        }catch(Exception ex){
                UTIL_LoggingService.logHandledException(ex, null, null,SG01_Constants.SGA_AP115_CreateApplication, null, SG01_Constants.BLANK, Logginglevel.ERROR);
        }
    }
}