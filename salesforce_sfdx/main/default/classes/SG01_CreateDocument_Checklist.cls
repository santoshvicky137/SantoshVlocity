global without sharing class SG01_CreateDocument_Checklist implements vlocity_ins.VlocityOpenInterface2{

public final string CREATEDOCCHECKLIST = 'createDocCheckList';

 global Boolean invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outMap, Map<String, Object> optns) {

     try{

          if(CREATEDOCCHECKLIST.equalsIgnoreCase(methodName))
          {
             createDocCheckList(inputMap, outMap,  optns);
          }

     }catch(Exception ex){


     }
    return true;
 }

 public void createDocCheckList(Map<String,Object> inputMap,Map<String,Object> outMap, Map<String,Object> options){
         try{
            string applicationId = (string) options.get('applicationidval') ;
             BRPSGCMakeRESTAPICallToSGC sgcCallout = new BRPSGCMakeRESTAPICallToSGC();
            Object respObj ;
            BRPSGCRealTimeDataModels.DocumentListResponse docChekrespObj = new BRPSGCRealTimeDataModels.DocumentListResponse();
            BRPSGCRealTimeDataModels.APIExceptions docCheckExceptions = new BRPSGCRealTimeDataModels.APIExceptions();
            List<BRPSGCRealTimeDataModels.DocChecklist> docCheckList = new List<BRPSGCRealTimeDataModels.DocChecklist>();
            String whereClause = SG01_Constants.SPACE+SG01_Constants.WHERE_CLAUSE+SG01_Constants.ID +SG01_Constants.EQUALS_SLASH+String.escapeSingleQuotes(applicationId)+SG01_Constants.BACK_SLASH;
            Map<ID,vlocity_ins__Application__c> applicationMap = SGA_Util03_ApplicationDataAccessHelper.fetchApplicationMap(SG01_Constants.SGA_AP06_APPLICATIONOBJQUERY, whereClause, SG01_Constants.BLANK, SG01_Constants.LIMIT_1); 
            vlocity_ins__Application__c applicationObj = applicationMap.get(applicationId);
            ApexPages.StandardController sc = new ApexPages.standardController(applicationObj);
            CMN_DocChklst_FileUploadController processDocs = new CMN_DocChklst_FileUploadController(sc);
           try{
            respObj = sgcCallout.GetDocumentCheckListwithOutEIN(applicationObj.Application_Number__c); 

             if(respObj instanceof BRPSGCRealTimeDataModels.DocumentListResponse){
            docChekrespObj = (BRPSGCRealTimeDataModels.DocumentListResponse) respObj;
            }
            
            if(respObj instanceof BRPSGCRealTimeDataModels.APIExceptions){
              docCheckExceptions = (BRPSGCRealTimeDataModels.APIExceptions) respObj;
            }

            System.debug('@@@@@@@@@@@@@@@respObj '+respObj );
            System.debug('@@@@@@@@@@@@@@@docCheckExceptions '+docCheckExceptions);
            //outMap.put('response1', (String)respObj);
               System.debug('docChekrespObj.docChecklist'+ docChekrespObj.docChecklist);
            if(docChekrespObj.docChecklist != null){ 
                docCheckList = docChekrespObj.docChecklist;

                processDocs.processDocChecklists(docCheckList,applicationObj,false);
                 //outMap.put('response2','afterprocesscall');
            }else{
                CalloutException e = new CalloutException();
                e.setMessage(docCheckExceptions.exceptions[0].message);
                throw e;
            }

            }catch(Exception ex){
                 UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME, SG01_Constants.CLS_SGA_AP06_VLOCITYAPPTRIGG, SG01_Constants.CLS_SGA_AP06_VLOCITYAPPTRIGG, SG01_Constants.BLANK, Logginglevel.ERROR);
            }

         }catch(Exception ex){


     }

 }



}