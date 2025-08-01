global without sharing class SGA_AP109_ABF_TransformValues  implements vlocity_ins.VlocityOpenInterface{
    private static final string TRANS_MED = 'transformABFMedProducts';
    private static final string BLANK = '';
    private static final string PERCENT = '%';
    private static final string TEXT_NODE = '%Ptgsymbol%';
    private static final string TASK_TYPE = 'TaskType';
    private static final string WITH_QUOTING = 'WithQuoting';
    private static final string SEND = 'Send';
    private static final string PLAN1 = 'MedicalPlan1';
    private static final string PLAN2 = 'MedicalPlan2';
    private static final string PLAN3 = 'MedicalPlan3';
    private static final string PLAN4 = 'MedicalPlan4';
    private static final string PLAN5 = 'MedicalPlan5';
    private static final string PLAN6 = 'MedicalPlan6';
    private static final string PLAN_NQ1 = 'MedicalPlanNQ1';
    private static final string PLAN_NQ2 = 'MedicalPlanNQ2';
    private static final string PLAN_NQ3 = 'MedicalPlanNQ3';
    private static final string PLAN_NQ4 = 'MedicalPlanNQ4';
    private static final string PLAN_NQ5 = 'MedicalPlanNQ5';
    private static final string PLAN_NQ6 = 'MedicalPlanNQ6';
    private String taskType = BLANK;
    
    
    /****************************************************************************************************
* Method Name : invokeMethod
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This is the interface method to invoke the method based on the provided remote method
* ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        try{
            if (TRANS_MED.equalsIgnoreCase(methodName))
            {
                return transformABFMedProducts(inputMap,outMap,options);
            }
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.INVOKEMETHOD, SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    
    /****************************************************************************************************
* Method Name : transformABFMedProducts
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is calling from GAVAMO Ominscript to transform the GA Medical Plans
* ***************************************************************************************************/        
    private Boolean transformABFMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        Boolean withQuote = (Boolean)options.get(WITH_QUOTING)!=null?(Boolean)options.get(WITH_QUOTING):false;
        if(withQuote)  {
            transformDataWithQuote(inputMap,outMap,options);
        }else{
            transformDataWithOutQuote(inputMap,outMap,options);
        }     
        return true;
    }
    /****************************************************************************************************
* Method Name : transformDataWithQuote
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is inner method to transform the data
* ***************************************************************************************************/    
    private void transformDataWithQuote(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(PLAN1,String.isNotBlank((String)options.get(PLAN1)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN1));
        outMap.put(PLAN2,String.isNotBlank((String)options.get(PLAN2)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN2)); 
        outMap.put(PLAN3,String.isNotBlank((String)options.get(PLAN3)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN3)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN3)); 
        outMap.put(PLAN4,String.isNotBlank((String)options.get(PLAN4)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN4)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN4)); 
        outMap.put(PLAN5,String.isNotBlank((String)options.get(PLAN5)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN5)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN5)); 
        outMap.put(PLAN6,String.isNotBlank((String)options.get(PLAN6)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN6)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN6)); 
        
        
    }
     /****************************************************************************************************
* Method Name : transformDataWithOutQuote
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is inner method to transform the data
* ***************************************************************************************************/    
    private void transformDataWithOutQuote(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(PLAN_NQ1,String.isNotBlank((String)options.get(PLAN_NQ1)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ1));
        outMap.put(PLAN_NQ2,String.isNotBlank((String)options.get(PLAN_NQ2)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ2)); 
        outMap.put(PLAN_NQ3,String.isNotBlank((String)options.get(PLAN_NQ3)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ3)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ3)); 
        outMap.put(PLAN_NQ4,String.isNotBlank((String)options.get(PLAN_NQ4)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ4)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ4)); 
        outMap.put(PLAN_NQ5,String.isNotBlank((String)options.get(PLAN_NQ5)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ5)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ5)); 
        outMap.put(PLAN_NQ6,String.isNotBlank((String)options.get(PLAN_NQ6)) && (SEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PLAN_NQ6)).replace(PERCENT,TEXT_NODE) : (String)options.get(PLAN_NQ6)); 
        
        
    }
}