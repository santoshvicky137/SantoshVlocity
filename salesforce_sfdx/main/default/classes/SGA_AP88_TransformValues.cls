/****************************************************************************************************
* Class Name  : SGA_AP88_TransformValues
* Description : This is the class used for GAVAMO omniscript data transformations
* ***************************************************************************************************/
global without sharing class SGA_AP88_TransformValues implements vlocity_ins.VlocityOpenInterface{
    
    private static final string TRANS_GA_MED = 'transformGAMedProducts';
    private static final string TRANS_CACO_MED = 'transformCACOMedProducts';
    private static final string TRANS_KY_MED = 'transformKYMedProducts';
    private static final string TRANS_ME_MED = 'transformMEMedProducts';
    private static final string TRANS_NH_MED = 'transformNHMedProducts';
    private static final string BLUE_CHOICE_HMO_CODE1 = 'BlueChoiceHMOCode1';
    private static final string BLUE_CHOICE_HMO_CODE2 = 'BlueChoiceHMOCode2';
    private static final string BLUE_CHOICE_HMO_CODE3 = 'BlueChoiceHMOCode3';
    private static final string BLUE_CHOICE_HMO_FML1 = 'BlueChoiceHMOFML1';
    private static final string BLUE_CHOICE_HMO_FML2 = 'BlueChoiceHMOFML2';
    private static final string BLUE_CHOICE_HMO_FML3 = 'BlueChoiceHMOFML3';
    private static final string BLUE_POS_FML1 = 'BluePOSFML1';
    private static final string BLUE_POS_FML2 = 'BluePOSFML2';
    private static final string BLUE_POS_FML3 = 'BluePOSFML3';
    private static final string PATHWAY_CODE1 = 'PathwayCode1';
    private static final string PATHWAY_CODE2 = 'PathwayCode2';
    private static final string PATHWAY_CODE3 = 'PathwayCode3';
    private static final string PATHWAY_FML11 = 'PathwayFML11';
    private static final string PATHWAY_FML2 = 'PathwayFML2';
    private static final string PATHWAY_FML3 = 'PathwayFML3';
    private static final string BLUE_CODE1 = 'BlueCode1';
    private static final string BLUE_CODE2 = 'BlueCode2';
    private static final string BLUE_CODE3 = 'BlueCode3';
    private static final string INPROD_CODE1 = 'INProductCode1';
    private static final string INPROD_CODE2 = 'INProductCode2';
    private static final string IN_PLAN1 = 'INPlan1';
    private static final string IN_PLAN2 = 'INPlan2';
    private static final string IN_PLAN3 = 'INPlan3';
    private static final string GA_PLAN1 = 'GAPlan1';
    private static final string GA_PLAN2 = 'GAPlan2';
    private static final string GA_PLAN3 = 'GAPlan3';
    private static final string ME_PLAN1 = 'MEPlan1';
    private static final string ME_PLAN2 = 'MEPlan2';
    private static final string ME_PLAN3 = 'MEPlan3';
    private static final string ME_PLAN4 = 'MEPlan4';
    private static final string ME_PLAN5 = 'MEPlan5';
    private static final string ME_PLAN6 = 'MEPlan6';
    private static final string MO_PLAN1 = 'MOPlan1';
    private static final string MO_PLAN2 = 'MOPlan2';
    
    private static final string PROD_CODE1 = 'ProductCode1';
    private static final string PROD_CODE2 = 'ProductCode2';
    private static final string PROD_CODE3 = 'ProductCode3';
    
    private static final string PROD_NAME1 = 'ProductName1';
    private static final string PROD_NAME2 = 'ProductName2';
    private static final string PROD_NAME3 = 'ProductName3';
    private static final string ME_PROD_NAME1 = 'MEProductName1';
    private static final string ME_PROD_NAME2 = 'MEProductName2';
    private static final string ME_PROD_NAME3 = 'MEProductName3';
    private static final string ME_PROD_NAME4 = 'MEProductName4';
    private static final string ME_PROD_NAME5 = 'MEProductName5';
    private static final string ME_PROD_NAME6 = 'MEProductName6';
    private static final string PROD_NETWORK1 = 'ProductNetwork1';
    private static final string PROD_NETWORK2 = 'ProductNetwork2';
    private static final string PROD_NETWORK3 = 'ProductNetwork3';
    
    private static final string BLUE_ACCESS_PPO = 'Blue Open Access POS';
    private static final string PATHWAY_ENHANCED = 'Pathway Enhanced';
    private static final string BLUE_CHOICE_HMO = 'BlueChoice HMO';
    
    private static final string BLANK = '';
    private static final string PERCENT = '%';
    private static final string TEXT_NODE = '%textNode%';
    private static final string TEXT_NODE3 = '%textNode3%';
    
    private static final string HMO_PROD1 = 'HMOProdName1';
    private static final string HMO_PROD2 = 'HMOProdName2';
    private static final string HMO_PROD3 = 'HMOProdName3';
    private static final string POSBLUE_PROD1 = 'POSBlueProdName1';
    private static final string POSBLUE_PROD2 = 'POSBlueProdName2';
    private static final string POSBLUE_PROD3 = 'POSBlueProdName3';
    private static final string POSAPTHWAY_PROD1 = 'POSPathwayProdName1';
    private static final string POSAPTHWAY_PROD2 = 'POSPathwayProdName2';
    private static final string POSAPTHWAY_PROD3 = 'POSPathwayProdName3';
    private static final string TASK_TYPE = 'TaskType';
    private static final string WITH_QUOTING = 'WithQuoting';
    private static final string SEND = 'Send';
    private static final string CA_MED_PROD1 = 'CA_MED_PROD1';
    private static final string CA_MED_PROD2 = 'CA_MED_PROD2';
    private static final string CA_MED_PROD3 = 'CA_MED_PROD3';
    private static final string CA_MED_PROD4 = 'CA_MED_PROD4';
    private static final string CA_MED_PROD5 = 'CA_MED_PROD5';
    private static final string CA_MED_PROD6 = 'CA_MED_PROD6';
    private static final string CA_MED_PROD7 = 'CA_MED_PROD7';
    private static final string CA_MED_PROD8 = 'CA_MED_PROD8';
    private static final string CA_MED_PROD9 = 'CA_MED_PROD9';
    private static final string CA_MED_PROD10 = 'CA_MED_PROD10';
    
    private static final string CO_MED_PROD1 = 'CO_MED_PROD1';
    private static final string CO_MED_PROD2 = 'CO_MED_PROD2';
    private static final string CO_MED_PROD3 = 'CO_MED_PROD3';
    private static final string CO_MED_PROD4 = 'CO_MED_PROD4';
    private static final string CO_MED_PROD5 = 'CO_MED_PROD5';
    private static final string CO_MED_PROD6 = 'CO_MED_PROD6';
    private static final string QSTATE = 'qState';
    private static final string CA_STATE = 'CA';
    private static final string RESEND = 'Resend';
    private static final string BLUE_ACCESS = 'Blue Access';
    private static final string PATHWAY = 'Pathway';
    private static final string PATHWAY_HMO = 'Pathway HMO';
    private static final string PATHWAY_TRANS_HMO = 'Pathway Transition HMO';
    
    private static final string NH_MED_PROD1 = 'NH_MED_PROD1';
    private static final string NH_MED_PROD2 = 'NH_MED_PROD2';
    private static final string NH_MED_PROD3 = 'NH_MED_PROD3';
    private static final string NH_MED_PROD4 = 'NH_MED_PROD4';
    private static final string NH_MED_CCODE1 = 'NH_MED_CCODE1';
    private static final string NH_MED_CCODE2 = 'NH_MED_CCODE2';
    private static final string NH_MED_CCODE3 = 'NH_MED_CCODE3';
    private static final string NH_MED_CCODE4 = 'NH_MED_CCODE4';
    private static final string NH_STATE = 'NH';
    
    private static final string BLUE_ACCESS_POS_CODE1 = 'BlueAccessPOSCode1';
    private static final string BLUE_ACCESS_POS_CODE2 = 'BlueAccessPOSCode2';
    private static final string BLUE_ACCESS_POS_CODE3 = 'BlueAccessPOSCode3';
    
    private static final string BLUE_ACCESS_POS_PLAN1 = 'BlueAccessPOSPlan1';
    private static final string BLUE_ACCESS_POS_PLAN2 = 'BlueAccessPOSPlan2';  
    private static final string BLUE_ACCESS_POS_PLAN3 = 'BlueAccessPOSPlan3';
    
    private static final string PATHWAY_POS_CODE1 = 'PathwayPOSCode1';
    private static final string PATHWAY_POS_CODE2 = 'PathwayPOSCode2';
    private static final string PATHWAY_POS_CODE3 = 'PathwayPOSCode3';
    
    private static final string PATHWAY_POS_PLAN1 = 'PathwayPOSPlan1';
    private static final string PATHWAY_POS_PLAN2 = 'PathwayPOSPlan2';
    private static final string PATHWAY_POS_PLAN3 = 'PathwayPOSPlan3';
    
    private static final string PATHWAY_HMO_CODE1 = 'PathwayHMOCode1';
    private static final string PATHWAY_HMO_CODE2 = 'PathwayHMOCode2';
    private static final string PATHWAY_HMO_CODE3 = 'PathwayHMOCode3';
    private static final string PATHWAY_HMO_PLAN1 = 'PathwayHMOPlan1';
    private static final string PATHWAY_HMO_PLAN2 = 'PathwayHMOPlan2';
    private static final string PATHWAY_HMO_PLAN3 = 'PathwayHMOPlan3';
    
    private static final string PATHWAY_TRANS_CODE1 = 'PathwayTransitionCode1';
    private static final string PATHWAY_TRANS_CODE2 = 'PathwayTransitionCode2';
    private static final string PATHWAY_TRANS_CODE3 = 'PathwayTransitionCode3';

    private static final string PATHWAY_TRANS_PLAN1 = 'PathwayTransitionPlan1';
    private static final string PATHWAY_TRANS_PLAN2 = 'PathwayTransitionPlan2';
    private static final string PATHWAY_TRANS_PLAN3 = 'PathwayTransitionPlan3';
    
    private static final string BLUEACCESS_PROD1 = 'BLUEAccessProdName1';
    private static final string BLUEACCESS_PROD2 = 'BLUEAccessProdName2';
    private static final string BLUEACCESS_PROD3 = 'BLUEAccessProdName3';
    private static final string BLUEPATHWAY_PROD1 = 'BLUEPathwayProdName1';
    private static final string BLUEPATHWAY_PROD2 = 'BLUEPathwayProdName2';
    private static final string BLUEPATHWAY_PROD3 = 'BLUEPathwayProdName3';
    private static final string HMOAPTHWAY_PROD1 = 'HMOPathwayProdName1';
    private static final string HMOAPTHWAY_PROD2 = 'HMOPathwayProdName2';
    private static final string HMOAPTHWAY_PROD3 = 'HMOPathwayProdName3';
    private static final string HMOAPTHWAYTRANS_PROD1 = 'HMOPathwayTransProdName1';
    private static final string HMOAPTHWAYTRANS_PROD2 = 'HMOPathwayTransProdName2';
    private static final string HMOAPTHWAYTRANS_PROD3 = 'HMOPathwayTransProdName3';
    
    private static final string TRANS_MO_MED = 'transformMOMedProducts';
    private static final string BLUE_ACCESS_CHOICE = 'Blue Access Choice';
    private static final string BLUE_PREFFERED = 'Blue Preferred';
    private static final string BLUE_PREFFERED_PPO = 'Blue Preferred PPO-MO';
    private static final string MOBLUE_ACCESS_POS_CODE1 = 'MOBlueAccessPOSCode1';
    private static final string MOBLUE_ACCESS_POS_CODE2 = 'MOBlueAccessPOSCode2';
    private static final string MOBLUE_ACCESS_POS_CODE3 = 'MOBlueAccessPOSCode3';
    
    private static final string MOBLUE_ACCESS_POS_PLAN1 = 'MOBlueAccessPOSPlan1';
    private static final string MOBLUE_ACCESS_POS_PLAN2 = 'MOBlueAccessPOSPlan2';  
    private static final string MOBLUE_ACCESS_POS_PLAN3 = 'MOBlueAccessPOSPlan3';
    
    private static final string MOBLUEACCESS_PROD1 = 'MOBLUEAccessProdName1';
    private static final string MOBLUEACCESS_PROD2 = 'MOBLUEAccessProdName2';
    private static final string MOBLUEACCESS_PROD3 = 'MOBLUEAccessProdName3';
    
    private static final string BLUE_ACCESS_CHOICE_CODE1 = 'blueAccesschoicecode1';
    private static final string BLUE_ACCESS_CHOICE_CODE2 = 'blueAccesschoicecode2';
    private static final string BLUE_ACCESS_CHOICE_CODE3 = 'blueAccesschoicecode3';
    
    private static final string BLUE_ACCESS_CHOICE_PLAN1 = 'blueAccesschoiceplan1';
    private static final string BLUE_ACCESS_CHOICE_PLAN2 = 'blueAccesschoiceplan2';
    private static final string BLUE_ACCESS_CHOICE_PLAN3 = 'blueAccesschoiceplan3';
    
    private static final string BLUE_PREFFERED_CODE1 = 'blueprefferedcode1';
    private static final string BLUE_PREFFERED_CODE2 = 'blueprefferedcode2';
    private static final string BLUE_PREFFERED_CODE3 = 'blueprefferedcode3';
    
    private static final string BLUE_PREFFERED_PLAN1 = 'blueprefferedplan1';
    private static final string BLUE_PREFFERED_PLAN2 = 'blueprefferedplan2';
    private static final string BLUE_PREFFERED_PLAN3 = 'blueprefferedplan3';
    
    private static final string BLUE_PREFFERED_PPO_CODE1 = 'blueprefferedppocode1';
    private static final string BLUE_PREFFERED_PPO_CODE2 = 'blueprefferedppocode2';
    private static final string BLUE_PREFFERED_PPO_CODE3 = 'blueprefferedppocode3';
    
    private static final string BLUE_PREFFERED_PPO_PLAN1 = 'blueprefferedppoplan1';
    private static final string BLUE_PREFFERED_PPO_PLAN2 = 'blueprefferedppoplan2';
    private static final string BLUE_PREFFERED_PPO_PLAN3 = 'blueprefferedppoplan3';
    
    private static final string TRANS_WI_MED = 'transformWIMedProducts';
    private static final string BLUE_PRIORTY = 'Blue Priority - WI';  

    private static final string WIBLUE_ACCESS_POS_CODE1 = 'WIBlueAccessPOSCode1';
    private static final string WIBLUE_ACCESS_POS_CODE2 = 'WIBlueAccessPOSCode2';
    private static final string WIBLUE_ACCESS_POS_CODE3 = 'WIBlueAccessPOSCode3';
    
    private static final string WIBLUE_ACCESS_POS_PLAN1 = 'WIBlueAccessPOSPlan1';
    private static final string WIBLUE_ACCESS_POS_PLAN2 = 'WIBlueAccessPOSPlan2';  
    private static final string WIBLUE_ACCESS_POS_PLAN3 = 'WIBlueAccessPOSPlan3';
    
    private static final string BLUE_PRIORTY_CODE1 = 'bluePriortycode1';
    private static final string BLUE_PRIORTY_CODE2 = 'bluePriortycode2';
    private static final string BLUE_PRIORTY_CODE3 = 'bluePriortycode3';
    
    private static final string BLUE_PRIORTY_PLAN1 = 'bluePriortyplan1';
    private static final string BLUE_PRIORTY_PLAN2 = 'bluePriortyplan2';
    private static final string BLUE_PRIORTY_PLAN3 = 'bluePriortyplan3';
    
    private static final string WIBLUE_PREFFERED_CODE1 = 'WIblueprefferedcode1';
    private static final string WIBLUE_PREFFERED_CODE2 = 'WIblueprefferedcode2';
    private static final string WIBLUE_PREFFERED_CODE3 = 'WIblueprefferedcode3';
    
    private static final string WIBLUE_PREFFERED_PLAN1 = 'WIblueprefferedplan1';
    private static final string WIBLUE_PREFFERED_PLAN2 = 'WIblueprefferedplan2';
    private static final string WIBLUE_PREFFERED_PLAN3 = 'WIblueprefferedplan3';   

    private static final string WIBLUEACCESS_PROD1 = 'WIBLUEAccessProdName1';
    private static final string WIBLUEACCESS_PROD2 = 'WIBLUEAccessProdName2';
    private static final string WIBLUEACCESS_PROD3 = 'WIBLUEAccessProdName3';
    private static final string WIPREFFERED_PROD1 = 'WIPrefferedName1';
    private static final string WIPREFFERED_PROD2 = 'WIPrefferedName2';
    private static final string WIPREFFERED_PROD3 = 'WIPrefferedName3';
    private static final string WIPOSBLUE_PROD1 = 'WIPOSBlueProdName1';
    private static final string WIPOSBLUE_PROD2 = 'WIPOSBlueProdName2';
    private static final string WIPOSBLUE_PROD3 = 'WIPOSBlueProdName3';
    
    private static final string WIPlan1 = 'WIPlan1';
    private static final string WIPlan2 = 'WIPlan2';
    
    private static final string NYPRODNAME1 = 'NYProdName1';
    private static final string NYPRODNAME2 = 'NYProdName2';
    private static final string NYPRODNAME3 = 'NYProdName3';
    private static final string NYPRODNAME4 = 'NYProdName4';
    private static final string NYPRODNAME5 = 'NYProdName5';
    private static final string NYPRODNAME6 = 'NYProdName6';
    
    private static final string NY_PROD_NAME1 = 'NYProductName1';
    private static final string NY_PROD_NAME2 = 'NYProductName2';
    private static final string NY_PROD_NAME3 = 'NYProductName3';
    private static final string NY_PROD_NAME4 = 'NYProductName4';
    private static final string NY_PROD_NAME5 = 'NYProductName5';
    private static final string NY_PROD_NAME6 = 'NYProductName6';    
    private static final string TRANS_NY_MED = 'transformNYMedProducts';    
    private static final string PrudentTRUE = 'true';   
    
    
    
    private static final string TRANS_ABF_MED = 'transformABFMedProducts'; 
    private static final string PERCENTSIGN = '%PercentSign%';
    private static final string ABFMEDPLAN1= 'MedicalPlan1';
    private static final string ABFMEDPLAN2= 'MedicalPlan2';
    private static final string ABFMEDPLAN3= 'MedicalPlan3';
    private static final string ABFMEDPLAN4= 'MedicalPlan4';
    private static final string ABFMEDPLAN5= 'MedicalPlan5';
    private static final string ABFMEDPLAN6= 'MedicalPlan6';
    private static final string NQABFMEDPLAN1 = 'MedicalPlanNQ1';
    private static final string NQABFMEDPLAN2 = 'MedicalPlanNQ2';
    private static final string NQABFMEDPLAN3 = 'MedicalPlanNQ3';
    private static final string NQABFMEDPLAN4 = 'MedicalPlanNQ4';
    private static final string NQABFMEDPLAN5 = 'MedicalPlanNQ5';
    private static final string NQABFMEDPLAN6 = 'MedicalPlanNQ6';
    private static final string PRINT = 'Print';
    private static final string FINALMEDPLN1 = 'FinalMedicalPlan1';
    private static final string FINALMEDPLN2 = 'FinalMedicalPlan2';
    private static final string FINALMEDPLN3 = 'FinalMedicalPlan3';
    private static final string FINALMEDPLN4 = 'FinalMedicalPlan4';
    private static final string FINALMEDPLN5 = 'FinalMedicalPlan5';
    private static final string FINALMEDPLN6 = 'FinalMedicalPlan6';

 
    private String WIblueAccessPOSCode1,WIblueAccessPOSCode2,WIblueAccessPOSCode3,WIblueAccessPOSPlan1,WIblueAccessPOSPlan2,WIblueAccessPOSPlan3,bluePriortycode1,bluePriortycode2,bluePriortycode3,bluePriortyplan1,bluePriortyplan2,bluePriortyplan3,WIblueprefferedcode1,WIblueprefferedcode2,WIblueprefferedcode3,WIblueprefferedplan1,WIblueprefferedplan2,
    WIblueprefferedplan3 = BLANK ;
    
    
private String MOblueAccessPOSCode1,MOblueAccessPOSCode2,MOblueAccessPOSCode3,MOblueAccessPOSPlan1,MOblueAccessPOSPlan2,MOblueAccessPOSPlan3,blueAccesschoicecode1,blueAccesschoicecode2,
    blueAccesschoicecode3,blueAccesschoiceplan1,blueAccesschoiceplan2,
    blueAccesschoiceplan3,blueprefferedcode1,blueprefferedcode2,blueprefferedcode3,blueprefferedplan1,blueprefferedplan2,
    blueprefferedplan3,blueprefferedppocode1,blueprefferedppocode2,blueprefferedppocode3,blueprefferedppoplan1,
    blueprefferedppoplan2,blueprefferedppoplan3 = BLANK ;
   
     private String blueAccessPOSCode1,blueAccessPOSCode2,blueAccessPOSCode3,blueAccessPOSPlan1,blueAccessPOSPlan2,blueAccessPOSPlan3,
                   pathwayPOSCode1,pathwayPOSCode2,pathwayPOSCode3,pathwayPOSPlan1,pathwayPOSPlan2,pathwayPOSPlan3,pathwayHMOCode1,pathwayHMOCode2,
                   pathwayHMOCode3,pathwayHMOPlan1,pathwayHMOPlan2,pathwayHMOPlan3,
                   pathwayTransitionCode1,pathwayTransitionCode2,pathwayTransitionCode3,
                   pathwayTransitionPlan1,pathwayTransitionPlan2,pathwayTransitionPlan3 = BLANK;
    private String blueChoiceHMOCode1,blueChoiceHMOPlan1,blueChoiceHMOCode2,blueChoiceHMOPlan2,blueChoiceHMOCode3,blueChoiceHMOPlan3,
        blueChoicePPOCode1,blueChoicePPOPlan1,blueChoicePPOCode2,blueChoicePPOPlan2,blueChoicePPOCode3,blueChoicePPOPlan3,pathwayEnhancedCode1,
        pathwayEnhancedPlan1,pathwayEnhancedCode2,pathwayEnhancedPlan2,pathwayEnhancedCode3,pathwayEnhancedPlan3,taskType = BLANK;
   
    /****************************************************************************************************
    * Method Name : invokeMethod
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This is the interface method to invoke the method based on the provided remote method
    * ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        try{
            if (TRANS_GA_MED.equalsIgnoreCase(methodName))
            {
                return transformGAMedProducts(inputMap,outMap,options);
            }else if(TRANS_CACO_MED.equalsIgnoreCase(methodName))
            {
                return transformCACOMedProducts(inputMap,outMap,options);
            }
             else if(TRANS_KY_MED.equalsIgnoreCase(methodName))
            {
                return transformKYMedProducts(inputMap,outMap,options);
            }
            else if(TRANS_MO_MED.equalsIgnoreCase(methodName))
            {
                return transformMOMedProducts(inputMap,outMap,options);
            }
             else if(TRANS_WI_MED.equalsIgnoreCase(methodName))
            {
                return transformWIMedProducts(inputMap,outMap,options);
            }
            else if(TRANS_NH_MED.equalsIgnoreCase(methodName))
            {
                return transformNHMedProducts(inputMap,outMap,options);
            }
            else if(TRANS_ME_MED.equalsIgnoreCase(methodName))
            {
                return transformMEMedProducts(inputMap,outMap,options);
            }
            else if(TRANS_NY_MED.equalsIgnoreCase(methodName))
            {
                return transformNYMedProducts(inputMap,outMap,options);
            }
            else if(TRANS_ABF_MED.equalsIgnoreCase(methodName))
            {
                return transformABFMedProducts(inputMap,outMap,options);
            }
       
       
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.INVOKEMETHOD, SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    /****************************************************************************************************
    * Method Name : transformGAMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is calling from GAVAMO Ominscript to transform the GA Medical Plans
    * ***************************************************************************************************/        
    private Boolean transformGAMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            getRemoteValues(inputMap,outMap,options);
            transformDataWithQuote(inputMap,outMap,options);
        }else{
            transformDataWithOutQuote(inputMap,outMap,options);
        }     
        return true;
    }
    /****************************************************************************************************
    * Method Name : transformKYMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is calling from GAVAMO Ominscript to transform the KY Medical Plans
    * ***************************************************************************************************/        
    private Boolean transformKYMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            getRemoteValuesKY(inputMap,outMap,options);
            transformDataWithQuoteKY(inputMap,outMap,options);
        
        }else{
            transformDataWithOutQuoteKY(inputMap,outMap,options);
        } 
        return true;
    }
    /****************************************************************************************************
    * Method Name : transformMEMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is calling from GAVAMO Ominscript to transform the KY Medical Plans
    * ***************************************************************************************************/        
    private Boolean transformMEMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            getRemoteValuesKY(inputMap,outMap,options);
            transformDataWithQuoteME(inputMap,outMap,options);
        
        }else{
            transformDataWithOutQuoteME(inputMap,outMap,options);
        } 
        return true;
    }
    /****************************************************************************************************
    * Method Name : getRemoteValues
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to get the remote values
    * ***************************************************************************************************/    
    private void getRemoteValues(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        //hmo plans
        blueChoiceHMOCode1 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        blueChoiceHMOPlan1 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        blueChoiceHMOCode2 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        blueChoiceHMOPlan2 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        blueChoiceHMOCode3 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;        
        blueChoiceHMOPlan3 = BLUE_CHOICE_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        //ppo plans
        blueChoicePPOCode1 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        blueChoicePPOPlan1 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        blueChoicePPOCode2 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        blueChoicePPOPlan2 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        blueChoicePPOCode3 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        blueChoicePPOPlan3 =  BLUE_ACCESS_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        //pathway enhanced plan
        pathwayEnhancedCode1 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1): BLANK;
        pathwayEnhancedPlan1 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1): BLANK;        
        pathwayEnhancedCode2 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2): BLANK;
        pathwayEnhancedPlan2 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2): BLANK;
        pathwayEnhancedCode3 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3): BLANK;
        pathwayEnhancedPlan3 =  PATHWAY_ENHANCED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3): BLANK;
    }
    /****************************************************************************************************
    * Method Name : transformDataWithQuote
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * Modified by Muthu on May 2, 2019 to fix with quote product name issue
    * ***************************************************************************************************/    
    private void transformDataWithQuote(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(BLUE_CHOICE_HMO_CODE1,blueChoiceHMOCode1); 
        outMap.put(BLUE_CHOICE_HMO_FML1,String.isNotBlank(blueChoiceHMOPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoiceHMOPlan1.replace(PERCENT,TEXT_NODE) : blueChoiceHMOPlan1);
        outMap.put(BLUE_CHOICE_HMO_CODE2,blueChoiceHMOCode2); 
        outMap.put(BLUE_CHOICE_HMO_FML2,String.isNotBlank(blueChoiceHMOPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoiceHMOPlan2.replace(PERCENT,TEXT_NODE) : blueChoiceHMOPlan2);
        outMap.put(BLUE_CHOICE_HMO_CODE3,blueChoiceHMOCode3); 
        outMap.put(BLUE_CHOICE_HMO_FML3,String.isNotBlank(blueChoiceHMOPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoiceHMOPlan3.replace(PERCENT,TEXT_NODE) : blueChoiceHMOPlan3);
        outMap.put(BLUE_CODE1,blueChoicePPOCode1); 
        outMap.put( BLUE_POS_FML1,String.isNotBlank(blueChoicePPOPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoicePPOPlan1.replace(PERCENT,TEXT_NODE) : blueChoicePPOPlan1);
        outMap.put(BLUE_CODE2,blueChoicePPOCode2); 
        outMap.put(BLUE_POS_FML2,String.isNotBlank(blueChoicePPOPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoicePPOPlan2.replace(PERCENT,TEXT_NODE) :  blueChoicePPOPlan2);
        outMap.put(BLUE_CODE3,blueChoicePPOCode3); 
        outMap.put( BLUE_POS_FML3,String.isNotBlank(blueChoicePPOPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueChoicePPOPlan3.replace(PERCENT,TEXT_NODE) : blueChoicePPOPlan3);
        outMap.put(PATHWAY_CODE1,pathwayEnhancedCode1); 
        outMap.put(PATHWAY_FML11,String.isNotBlank(pathwayEnhancedPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayEnhancedPlan1.replace(PERCENT,TEXT_NODE) : pathwayEnhancedPlan1);
        outMap.put(PATHWAY_CODE2,pathwayEnhancedCode2); 
        outMap.put(PATHWAY_FML2,String.isNotBlank(pathwayEnhancedPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayEnhancedPlan2.replace(PERCENT,TEXT_NODE) : pathwayEnhancedPlan2);
        outMap.put(PATHWAY_CODE3,pathwayEnhancedCode3); 
        outMap.put(PATHWAY_FML3,String.isNotBlank(pathwayEnhancedPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayEnhancedPlan3.replace(PERCENT,TEXT_NODE) : pathwayEnhancedPlan3);
        outMap.put(PROD_NAME1,String.isNotBlank((String)options.get(PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME1));
        outMap.put(PROD_NAME2,String.isNotBlank((String)options.get(PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME2));
        outMap.put(PROD_NAME3,String.isNotBlank((String)options.get(PROD_NAME3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME3)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME3));        
        
    }
    /****************************************************************************************************
    * Method Name : transformDataWithOutQuote
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
    private void transformDataWithOutQuote(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        system.debug('inside transformDataWithOutQuote '+inputMap);
        outMap.put(HMO_PROD1,String.isNotBlank((String)options.get(HMO_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMO_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMO_PROD1)); 
        outMap.put(HMO_PROD2,String.isNotBlank((String)options.get(HMO_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMO_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMO_PROD2));
        outMap.put(HMO_PROD3,String.isNotBlank((String)options.get(HMO_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMO_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMO_PROD3));
        outMap.put(POSBLUE_PROD1,String.isNotBlank((String)options.get(POSBLUE_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSBLUE_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSBLUE_PROD1));
        outMap.put(POSBLUE_PROD2,String.isNotBlank((String)options.get(POSBLUE_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSBLUE_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSBLUE_PROD2));
        outMap.put(POSBLUE_PROD3,String.isNotBlank((String)options.get(POSBLUE_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSBLUE_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSBLUE_PROD3));
        outMap.put(POSAPTHWAY_PROD1,String.isNotBlank((String)options.get(POSAPTHWAY_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSAPTHWAY_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSAPTHWAY_PROD1));
        outMap.put(POSAPTHWAY_PROD2,String.isNotBlank((String)options.get(POSAPTHWAY_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSAPTHWAY_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSAPTHWAY_PROD2));
        outMap.put(POSAPTHWAY_PROD3,String.isNotBlank((String)options.get(POSAPTHWAY_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(POSAPTHWAY_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(POSAPTHWAY_PROD3));
         outMap.put(GA_PLAN1,String.isNotBlank((String)options.get(GA_PLAN1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(GA_PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(GA_PLAN1));
        outMap.put(GA_PLAN2,String.isNotBlank((String)options.get(GA_PLAN2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(GA_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(GA_PLAN2));
        outMap.put(GA_PLAN3,String.isNotBlank((String)options.get(GA_PLAN3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(GA_PLAN3)).replace(PERCENT,TEXT_NODE) : (String)options.get(GA_PLAN3));
        outMap.put(MO_PLAN1,String.isNotBlank((String)options.get(MO_PLAN1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MO_PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(MO_PLAN1));
        outMap.put(MO_PLAN2,String.isNotBlank((String)options.get(MO_PLAN2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MO_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(MO_PLAN2)); 
    }
    
    /****************************************************************************************************
    * Method Name : transformCACOMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data for CA CO States
    * ***************************************************************************************************/    
    private Boolean transformCACOMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        String stateValue = (String)options.get(QSTATE);
        boolean withQuote = (boolean)inputMap.get('WithQuote');         
        Map<String,Object> selectCoverageMap;
        Map<String,Object> selectedMedical;
        Set<String> productSet = new Set<String>();        
        List<Object> selectCoverageOutputList;
        
        if(CA_STATE.equalsIgnoreCase(stateValue)){
            if(withQuote){
                selectCoverageMap = (Map<String,Object>)inputMap.get('MedicalCoverage');            
                selectCoverageOutputList = (List<Object>)selectCoverageMap.get('MedicalAccounts');
                if(selectCoverageOutputList.size() > 0){
                    for( Object obj : selectCoverageOutputList){
                        Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;      
                        String productID = (String)selectCoverageOutputMap.get('Id');
                        productSet.add(productID);
                    }
                }
            }
            else{                
                selectCoverageMap = (Map<String,Object>)inputMap.get('MedicalCoverageNQ');
                Integer medicalCount = (Integer)selectCoverageMap.get('MedicalPlansCount');
                selectedMedical = (Map<String,Object>)selectCoverageMap.get('SelectMedical');
                if(medicalCount == 1){
                    Map<String,Object> selectCoverageOutputObj = (Map<String,Object>)selectedMedical.get('InnerSelectMedical');
                    String productID = (String)selectCoverageOutputObj.get('MedicalProductId');
                    productSet.add(productID);
                }
                else{
                    if(medicalCount > 1){
                        selectCoverageOutputList = (List<Object>)selectedMedical.get('InnerSelectMedical');                        
                        if(selectCoverageOutputList.size() > 0){
                            for( Object obj : selectCoverageOutputList){
                                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;      
                                String productID = (String)selectCoverageOutputMap.get('MedicalProductId');
                                productSet.add(productID);
                            }
                        }
                    }
                }
            }
            system.debug('product list' +productSet);
            if(!productSet.isEmpty()){
                List<Product2> productList = [select Id,Name,ProductCode,Network__c,vlocity_ins__SubType__c from Product2 Where Id IN:productSet];
                for(Product2 prodObj : productList){                
                    if(prodObj.Network__c == 'Prudent Buyer PPO' && prodObj.vlocity_ins__SubType__c == 'EPO'){                  
                        outMap.put('PrudentEPO', PrudentTRUE);                     
                    }
                    if(prodObj.Network__c == 'Prudent Buyer PPO' && (prodObj.vlocity_ins__SubType__c == 'PPO' || prodObj.vlocity_ins__SubType__c == 'HSA' || prodObj.vlocity_ins__SubType__c == 'HMO' || prodObj.vlocity_ins__SubType__c == 'POS' || prodObj.vlocity_ins__SubType__c == 'HDHP') ){                  
                        outMap.put('PrudentPPO', PrudentTRUE);                        
                    }
                }
            }       
            outMap.put(CA_MED_PROD1,String.isNotBlank((String)options.get(CA_MED_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD1)) ;  
            outMap.put(CA_MED_PROD2,String.isNotBlank((String)options.get(CA_MED_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD2));
            outMap.put(CA_MED_PROD3,String.isNotBlank((String)options.get(CA_MED_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD3));
            outMap.put(CA_MED_PROD4,String.isNotBlank((String)options.get(CA_MED_PROD4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD4)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD4));
            outMap.put(CA_MED_PROD5,String.isNotBlank((String)options.get(CA_MED_PROD5)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD5)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD5));
            outMap.put(CA_MED_PROD6,String.isNotBlank((String)options.get(CA_MED_PROD6)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD6)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD6));
            outMap.put(CA_MED_PROD7,String.isNotBlank((String)options.get(CA_MED_PROD7)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD7)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD7));
            outMap.put(CA_MED_PROD8,String.isNotBlank((String)options.get(CA_MED_PROD8)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD8)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD8));
            outMap.put(CA_MED_PROD9,String.isNotBlank((String)options.get(CA_MED_PROD9)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD9)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD9));
            outMap.put(CA_MED_PROD10,String.isNotBlank((String)options.get(CA_MED_PROD10)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CA_MED_PROD10)).replace(PERCENT,TEXT_NODE) : (String)options.get(CA_MED_PROD10));
        }else{
            outMap.put(CO_MED_PROD1,String.isNotBlank((String)options.get(CO_MED_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD1)) ;  
            outMap.put(CO_MED_PROD2,String.isNotBlank((String)options.get(CO_MED_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD2));
            outMap.put(CO_MED_PROD3,String.isNotBlank((String)options.get(CO_MED_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD3));
            outMap.put(CO_MED_PROD4,String.isNotBlank((String)options.get(CO_MED_PROD4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD4)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD4));
            outMap.put(CO_MED_PROD5,String.isNotBlank((String)options.get(CO_MED_PROD5)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD5)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD5));
            outMap.put(CO_MED_PROD6,String.isNotBlank((String)options.get(CO_MED_PROD6)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(CO_MED_PROD6)).replace(PERCENT,TEXT_NODE) : (String)options.get(CO_MED_PROD6));
            
        }
        
        return true;
    }
     /****************************************************************************************************
    // * Method Name : getRemoteValuesKY
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to get the remote values
    * ***************************************************************************************************/    
    private void getRemoteValuesKY(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        //POS plans
        blueAccessPOSCode1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        blueAccessPOSPlan1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        blueAccessPOSCode2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        blueAccessPOSPlan2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        blueAccessPOSCode3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;        
        blueAccessPOSPlan3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        //Pathway POS plans
        pathwayPOSCode1 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        pathwayPOSPlan1 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        pathwayPOSCode2 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        pathwayPOSPlan2 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        pathwayPOSCode3 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        pathwayPOSPlan3 =  PATHWAY.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
         //Pathway HMO plans
        pathwayHMOCode1 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        pathwayHMOPlan1 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        pathwayHMOCode2 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        pathwayHMOPlan2 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        pathwayHMOCode3 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        pathwayHMOPlan3 =  PATHWAY_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        //pathway Transition plan
        pathwayTransitionCode1 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1): BLANK;
        pathwayTransitionPlan1 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1): BLANK;        
        pathwayTransitionCode2 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2): BLANK;
        pathwayTransitionPlan2 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2): BLANK;
        pathwayTransitionCode3 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3): BLANK;
        pathwayTransitionPlan3 =  PATHWAY_TRANS_HMO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3): BLANK;
    }
    /****************************************************************************************************
    * Method Name : transformDataWithQuoteKY
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
    private void transformDataWithQuoteKY(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(BLUE_ACCESS_POS_CODE1,blueAccessPOSCode1); 
        outMap.put(BLUE_ACCESS_POS_PLAN1,String.isNotBlank(blueAccessPOSPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueAccessPOSPlan1.replace(PERCENT,TEXT_NODE) : blueAccessPOSPlan1);
        outMap.put(BLUE_ACCESS_POS_CODE2,blueAccessPOSCode2); 
        outMap.put(BLUE_ACCESS_POS_PLAN2,String.isNotBlank(blueAccessPOSPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueAccessPOSPlan2.replace(PERCENT,TEXT_NODE) : blueAccessPOSPlan2);
        outMap.put(BLUE_ACCESS_POS_CODE3,blueAccessPOSCode3); 
        outMap.put(BLUE_ACCESS_POS_PLAN3,String.isNotBlank(blueAccessPOSPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueAccessPOSPlan3.replace(PERCENT,TEXT_NODE) : blueAccessPOSPlan3);
        outMap.put(PATHWAY_POS_CODE1,pathwayPOSCode1); 
        outMap.put( PATHWAY_POS_PLAN1,String.isNotBlank(pathwayPOSPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayPOSPlan1.replace(PERCENT,TEXT_NODE) : pathwayPOSPlan1);
        outMap.put(PATHWAY_POS_CODE2,pathwayPOSCode2); 
        outMap.put(PATHWAY_POS_PLAN2,String.isNotBlank(pathwayPOSPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayPOSPlan2.replace(PERCENT,TEXT_NODE) :  pathwayPOSPlan2);
        outMap.put(PATHWAY_POS_CODE3,pathwayPOSCode3); 
        outMap.put( PATHWAY_POS_PLAN3,String.isNotBlank(pathwayPOSPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayPOSPlan3.replace(PERCENT,TEXT_NODE) : pathwayPOSPlan3);
        outMap.put(PATHWAY_HMO_CODE1,pathwayHMOCode1); 
        outMap.put(PATHWAY_HMO_PLAN1,String.isNotBlank(pathwayHMOPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayHMOPlan1.replace(PERCENT,TEXT_NODE) : pathwayHMOPlan1);
        outMap.put(PATHWAY_HMO_CODE2,pathwayHMOCode2); 
        outMap.put(PATHWAY_HMO_PLAN2,String.isNotBlank(pathwayHMOPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayHMOPlan2.replace(PERCENT,TEXT_NODE) : pathwayHMOPlan2);
        outMap.put(PATHWAY_HMO_CODE3,pathwayHMOCode3); 
        outMap.put(PATHWAY_HMO_PLAN3,String.isNotBlank(pathwayHMOPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayHMOPlan3.replace(PERCENT,TEXT_NODE) : pathwayHMOPlan3);
        outMap.put(PATHWAY_TRANS_CODE1,pathwayTransitionCode1); 
        outMap.put(PATHWAY_TRANS_PLAN1,String.isNotBlank(pathwayTransitionPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayTransitionPlan1.replace(PERCENT,TEXT_NODE) : pathwayTransitionPlan1);
        outMap.put(PATHWAY_TRANS_CODE2,pathwayTransitionCode2); 
        outMap.put(PATHWAY_TRANS_PLAN2,String.isNotBlank(pathwayTransitionPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayTransitionPlan2.replace(PERCENT,TEXT_NODE) : pathwayTransitionPlan2);
        outMap.put(PATHWAY_TRANS_CODE3,pathwayTransitionCode3); 
        outMap.put(PATHWAY_TRANS_PLAN3,String.isNotBlank(pathwayTransitionPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayTransitionPlan3.replace(PERCENT,TEXT_NODE) : pathwayTransitionPlan3);
        outMap.put(PROD_NAME1,String.isNotBlank((String)options.get(PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME1));
        outMap.put(PROD_NAME2,String.isNotBlank((String)options.get(PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME2));
        outMap.put(PROD_NAME3,String.isNotBlank((String)options.get(PROD_NAME3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME3)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME3));

        
    }
    
    /****************************************************************************************************
    * Method Name : transformDataWithOutQuoteKY
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
    private void transformDataWithOutQuoteKY(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(BLUEACCESS_PROD1,String.isNotBlank((String)options.get(BLUEACCESS_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEACCESS_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEACCESS_PROD1)); 
        outMap.put(BLUEACCESS_PROD2,String.isNotBlank((String)options.get(BLUEACCESS_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEACCESS_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEACCESS_PROD2));
        outMap.put(BLUEACCESS_PROD3,String.isNotBlank((String)options.get(BLUEACCESS_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEACCESS_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEACCESS_PROD3));
        outMap.put(BLUEPATHWAY_PROD1,String.isNotBlank((String)options.get(BLUEPATHWAY_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEPATHWAY_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEPATHWAY_PROD1));
        outMap.put(BLUEPATHWAY_PROD2,String.isNotBlank((String)options.get(BLUEPATHWAY_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEPATHWAY_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEPATHWAY_PROD2));
        outMap.put(BLUEPATHWAY_PROD3,String.isNotBlank((String)options.get(BLUEPATHWAY_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(BLUEPATHWAY_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(BLUEPATHWAY_PROD3));
        outMap.put(HMOAPTHWAY_PROD1,String.isNotBlank((String)options.get(HMOAPTHWAY_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAY_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAY_PROD1));
        outMap.put(HMOAPTHWAY_PROD2,String.isNotBlank((String)options.get(HMOAPTHWAY_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAY_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAY_PROD2));
        outMap.put(HMOAPTHWAY_PROD3,String.isNotBlank((String)options.get(HMOAPTHWAY_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAY_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAY_PROD3));
        outMap.put(HMOAPTHWAYTRANS_PROD1,String.isNotBlank((String)options.get(HMOAPTHWAYTRANS_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAYTRANS_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAYTRANS_PROD1));
        outMap.put(HMOAPTHWAYTRANS_PROD2,String.isNotBlank((String)options.get(HMOAPTHWAYTRANS_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAYTRANS_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAYTRANS_PROD2));
        outMap.put(HMOAPTHWAYTRANS_PROD3,String.isNotBlank((String)options.get(HMOAPTHWAYTRANS_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(HMOAPTHWAYTRANS_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(HMOAPTHWAYTRANS_PROD3));
        outMap.put(IN_PLAN1,String.isNotBlank((String)options.get(IN_PLAN1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(IN_PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(IN_PLAN1));
        outMap.put(IN_PLAN2,String.isNotBlank((String)options.get(IN_PLAN2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(IN_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(IN_PLAN2));
        outMap.put(IN_PLAN3,String.isNotBlank((String)options.get(IN_PLAN3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(IN_PLAN3)).replace(PERCENT,TEXT_NODE) : (String)options.get(IN_PLAN3));
        
    }
    /****************************************************************************************************
    * Method Name : transformDataWithOutQuoteME
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data CT,NH,ME
    * ***************************************************************************************************/    
    private void transformDataWithOutQuoteME(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        system.debug('This is input' +inputMap );
        system.debug('This is input' +inputMap.get(ME_PLAN2));
        
        /*SMGR-57589 */
        String stateValue = (String)inputMap.get(QSTATE);
        
        if(stateValue != 'NH')
        {
        outMap.put('SelectedMedicalPlanName',String.isNotBlank((String)inputMap.get('SelectedMedicalPlanName')) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)inputMap.get('SelectedMedicalPlanName')).replace(PERCENT,TEXT_NODE) : (String)inputMap.get('SelectedMedicalPlanName'));
        outMap.put(ME_PLAN1,String.isNotBlank((String)options.get(ME_PLAN1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN1));
        outMap.put(ME_PLAN2,String.isNotBlank((String)options.get(ME_PLAN2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN2));
        outMap.put(ME_PLAN3,String.isNotBlank((String)options.get(ME_PLAN3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN3)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN3));
        outMap.put(ME_PLAN4,String.isNotBlank((String)options.get(ME_PLAN4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN4));
        outMap.put(ME_PLAN5,String.isNotBlank((String)options.get(ME_PLAN5)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN5)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN5));
        outMap.put(ME_PLAN6,String.isNotBlank((String)options.get(ME_PLAN6)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PLAN6)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PLAN6));
        system.debug('This is outputmap' +outMap.get(ME_PLAN2) );
        system.debug('This is outputmap' +outMap );
        }
        else{
         String NH_PLAN1 =String.isNotBlank((String)options.get(ME_PLAN1)) ? ((String)options.get(ME_PLAN1)): '';  
         String NH_PLAN2 =String.isNotBlank((String)options.get(ME_PLAN2)) ? ((String)options.get(ME_PLAN2)): ''; 
         String NH_PLAN3 =String.isNotBlank((String)options.get(ME_PLAN3)) ? ((String)options.get(ME_PLAN3)): ''; 
         String NH_PLAN4 =String.isNotBlank((String)options.get(ME_PLAN4)) ? ((String)options.get(ME_PLAN4)): ''; 
            
         NH_PLAN1 = (String.isNotBlank(NH_PLAN1) && NH_PLAN1.length()>40) ? NH_PLAN1=NH_PLAN1.substring(0,40) : NH_PLAN1;
         NH_PLAN2 = (String.isNotBlank(NH_PLAN2) && NH_PLAN2.length()>40) ? NH_PLAN1=NH_PLAN2.substring(0,40) : NH_PLAN2;
         NH_PLAN3 = (String.isNotBlank(NH_PLAN3) && NH_PLAN3.length()>40) ? NH_PLAN1=NH_PLAN3.substring(0,40) : NH_PLAN3;
         NH_PLAN4 = (String.isNotBlank(NH_PLAN4) && NH_PLAN4.length()>40) ? NH_PLAN1=NH_PLAN4.substring(0,40) : NH_PLAN4;

         outMap.put(ME_Plan1, String.isNotBlank((String)options.get(ME_Plan1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PLAN1.replace(PERCENT,TEXT_NODE) : NH_PLAN1);
         outMap.put(ME_Plan2, String.isNotBlank((String)options.get(ME_Plan2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PLAN2.replace(PERCENT,TEXT_NODE) : NH_PLAN2);
         outMap.put(ME_Plan3, String.isNotBlank((String)options.get(ME_Plan3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PLAN3.replace(PERCENT,TEXT_NODE) : NH_PLAN3);
         outMap.put(ME_Plan4, String.isNotBlank((String)options.get(ME_Plan4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PLAN4.replace(PERCENT,TEXT_NODE) : NH_PLAN4);
        }
    }
    /****************************************************************************************************
    * Method Name : transformDataWithQuoteME
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data CT,NH,ME
    * ***************************************************************************************************/    
    private void transformDataWithQuoteME(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        /*SMGR-57589 */
        String stateValue = (String)inputMap.get(QSTATE);
        
        if(stateValue != 'NH')
        {
        outMap.put(ME_PROD_NAME1,String.isNotBlank((String)options.get(ME_PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME1)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME1));
        outMap.put(ME_PROD_NAME2,String.isNotBlank((String)options.get(ME_PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME2)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME2));
        outMap.put(ME_PROD_NAME3,String.isNotBlank((String)options.get(ME_PROD_NAME3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME3)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME3));
        outMap.put(ME_PROD_NAME4,String.isNotBlank((String)options.get(ME_PROD_NAME4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME4)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME4));
        outMap.put(ME_PROD_NAME5,String.isNotBlank((String)options.get(ME_PROD_NAME5)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME5)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME5));
        outMap.put(ME_PROD_NAME6,String.isNotBlank((String)options.get(ME_PROD_NAME6)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(ME_PROD_NAME6)).replace(PERCENT,TEXT_NODE) : (String)options.get(ME_PROD_NAME6));
        }
        else
        {
        String NH_PROD_NAME1 =String.isNotBlank((String)options.get(ME_PROD_NAME1)) ? ((String)options.get(ME_PROD_NAME1)): '';  
        String NH_PROD_NAME2 =String.isNotBlank((String)options.get(ME_PROD_NAME2)) ? ((String)options.get(ME_PROD_NAME2)): ''; 
        String NH_PROD_NAME3 =String.isNotBlank((String)options.get(ME_PROD_NAME3)) ? ((String)options.get(ME_PROD_NAME3)): ''; 
        String NH_PROD_NAME4 =String.isNotBlank((String)options.get(ME_PROD_NAME4)) ? ((String)options.get(ME_PROD_NAME4)): ''; 
        
         NH_PROD_NAME1 = (String.isNotBlank(NH_PROD_NAME1) && NH_PROD_NAME1.length()>40) ? NH_PROD_NAME1=NH_PROD_NAME1.substring(0,40) : NH_PROD_NAME1;
         NH_PROD_NAME2 = (String.isNotBlank(NH_PROD_NAME2) && NH_PROD_NAME2.length()>40) ? NH_PROD_NAME2=NH_PROD_NAME2.substring(0,40) : NH_PROD_NAME2;
         NH_PROD_NAME3 = (String.isNotBlank(NH_PROD_NAME3) && NH_PROD_NAME3.length()>40) ? NH_PROD_NAME3=NH_PROD_NAME3.substring(0,40) : NH_PROD_NAME3;
         NH_PROD_NAME4 = (String.isNotBlank(NH_PROD_NAME4) && NH_PROD_NAME4.length()>40) ? NH_PROD_NAME4=NH_PROD_NAME4.substring(0,40) : NH_PROD_NAME4;        
            
         outMap.put(ME_PROD_NAME1, String.isNotBlank((String)options.get(ME_PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PROD_NAME1.replace(PERCENT,TEXT_NODE) : NH_PROD_NAME1);
         outMap.put(ME_PROD_NAME2, String.isNotBlank((String)options.get(ME_PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PROD_NAME2.replace(PERCENT,TEXT_NODE) : NH_PROD_NAME2);
         outMap.put(ME_PROD_NAME3, String.isNotBlank((String)options.get(ME_PROD_NAME3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PROD_NAME3.replace(PERCENT,TEXT_NODE) : NH_PROD_NAME3);
         outMap.put(ME_PROD_NAME4, String.isNotBlank((String)options.get(ME_PROD_NAME4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? NH_PROD_NAME4.replace(PERCENT,TEXT_NODE) : NH_PROD_NAME4);
        }
        
    }
    
    
    
/****************************************************************************************************
    * Method Name : transformMOMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is calling from GAVAMO Ominscript to transform the KY Medical Plans
    * ***************************************************************************************************/        
    private Boolean transformMOMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            getRemoteValuesMO(inputMap,outMap,options);
            transformDataWithQuoteMO(inputMap,outMap,options);
        
        }else{
            transformDataWithOutQuoteMO(inputMap,outMap,options);
        } 
        return true;
    }
    
 /****************************************************************************************************
    // * Method Name : getRemoteValuesMO
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to get the remote values
    * ***************************************************************************************************/    
    private void getRemoteValuesMO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        
        MOblueAccessPOSCode1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        MOblueAccessPOSPlan1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        MOblueAccessPOSCode2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        MOblueAccessPOSPlan2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        MOblueAccessPOSCode3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;        
        MOblueAccessPOSPlan3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
      
       //Blue access Choice
        blueAccesschoicecode1 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        blueAccesschoiceplan1 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        blueAccesschoicecode2 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        blueAccesschoiceplan2 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        blueAccesschoicecode3 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        blueAccesschoiceplan3 =  BLUE_ACCESS_CHOICE.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
         //blue preffered
        blueprefferedcode1 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        blueprefferedplan1 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        blueprefferedcode2 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        blueprefferedplan2 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        blueprefferedcode3 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        blueprefferedplan3 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        //blue preffered ppo
        blueprefferedppocode1 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1): BLANK;
        blueprefferedppoplan1 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1): BLANK;        
        blueprefferedppocode2 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2): BLANK;
        blueprefferedppoplan2 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2): BLANK;
        blueprefferedppocode3 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3): BLANK;
        blueprefferedppoplan3 =  BLUE_PREFFERED_PPO.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3): BLANK;
      
    }
    /****************************************************************************************************
    * Method Name : transformDataWithQuoteMO
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
   private void transformDataWithQuoteMO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(MOBLUE_ACCESS_POS_CODE1,MOblueAccessPOSCode1); 
        outMap.put(MOBLUE_ACCESS_POS_PLAN1,String.isNotBlank(MOblueAccessPOSPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? MOblueAccessPOSPlan1.replace(PERCENT,TEXT_NODE) : MOblueAccessPOSPlan1);
       
        outMap.put(MOBLUE_ACCESS_POS_CODE2,MOblueAccessPOSCode2); 
        outMap.put(MOBLUE_ACCESS_POS_PLAN2,String.isNotBlank(MOblueAccessPOSPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType))? MOblueAccessPOSPlan2.replace(PERCENT,TEXT_NODE) : MOblueAccessPOSPlan2);
        outMap.put(MOBLUE_ACCESS_POS_CODE3,MOblueAccessPOSCode3); 
        outMap.put(MOBLUE_ACCESS_POS_PLAN3,String.isNotBlank(MOblueAccessPOSPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? MOblueAccessPOSPlan3.replace(PERCENT,TEXT_NODE) : MOblueAccessPOSPlan3);
        
        outMap.put(BLUE_ACCESS_CHOICE_CODE1,blueAccesschoicecode1); 
        outMap.put( BLUE_ACCESS_CHOICE_PLAN1,String.isNotBlank(blueAccesschoiceplan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? pathwayPOSPlan1.replace(PERCENT,TEXT_NODE) : blueAccesschoiceplan1);
        outMap.put(BLUE_ACCESS_CHOICE_CODE2,blueAccesschoicecode2); 
        outMap.put(BLUE_ACCESS_CHOICE_PLAN2,String.isNotBlank(blueAccesschoiceplan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueAccesschoiceplan2.replace(PERCENT,TEXT_NODE) :  blueAccesschoiceplan2);
        outMap.put(BLUE_ACCESS_CHOICE_CODE3,blueAccesschoicecode3); 
        outMap.put( BLUE_ACCESS_CHOICE_PLAN3,String.isNotBlank(blueAccesschoiceplan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueAccesschoiceplan3.replace(PERCENT,TEXT_NODE) : blueAccesschoiceplan3);
        

        outMap.put(BLUE_PREFFERED_CODE1,blueprefferedcode1); 
        outMap.put(BLUE_PREFFERED_PLAN1,String.isNotBlank(blueprefferedplan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedplan1.replace(PERCENT,TEXT_NODE) : blueprefferedplan1);
        outMap.put(BLUE_PREFFERED_CODE2,blueprefferedcode2); 
        outMap.put(BLUE_PREFFERED_PLAN2,String.isNotBlank(blueprefferedplan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedplan2.replace(PERCENT,TEXT_NODE) : blueprefferedplan2);
        outMap.put(BLUE_PREFFERED_CODE3,blueprefferedcode3); 
        outMap.put(BLUE_PREFFERED_PLAN3,String.isNotBlank(blueprefferedplan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedplan3.replace(PERCENT,TEXT_NODE) : blueprefferedplan3);
        
        outMap.put(BLUE_PREFFERED_PPO_CODE1,blueprefferedppocode1); 
        outMap.put(BLUE_PREFFERED_PPO_PLAN1,String.isNotBlank(blueprefferedppoplan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedppoplan1.replace(PERCENT,TEXT_NODE) : blueprefferedppoplan1);
        outMap.put(BLUE_PREFFERED_PPO_CODE2,blueprefferedppocode2); 
        outMap.put(BLUE_PREFFERED_PPO_PLAN2,String.isNotBlank(blueprefferedppoplan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedppoplan2.replace(PERCENT,TEXT_NODE) : blueprefferedppoplan2);
        outMap.put(BLUE_PREFFERED_PPO_CODE3,blueprefferedppocode3); 
        outMap.put(BLUE_PREFFERED_PPO_PLAN3,String.isNotBlank(blueprefferedppoplan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? blueprefferedppoplan3.replace(PERCENT,TEXT_NODE) : blueprefferedppoplan3);
        outMap.put(PROD_NAME1,String.isNotBlank((String)options.get(PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME1));
        outMap.put(PROD_NAME2,String.isNotBlank((String)options.get(PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME2)); 
    }
    /****************************************************************************************************
    * Method Name : transformDataWithOutQuoteMO
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
private void transformDataWithOutQuoteMO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(MOBLUEACCESS_PROD1,String.isNotBlank((String)options.get(MOBLUEACCESS_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MOBLUEACCESS_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(MOBLUEACCESS_PROD1)); 
        outMap.put(MOBLUEACCESS_PROD2,String.isNotBlank((String)options.get(MOBLUEACCESS_PROD2)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MOBLUEACCESS_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(MOBLUEACCESS_PROD2));
        outMap.put(MOBLUEACCESS_PROD3,String.isNotBlank((String)options.get(MOBLUEACCESS_PROD3)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MOBLUEACCESS_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(MOBLUEACCESS_PROD3));
        outMap.put(MO_PLAN1,String.isNotBlank((String)options.get(MO_PLAN1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MO_PLAN1)).replace(PERCENT,TEXT_NODE) : (String)options.get(MO_PLAN1));
        system.debug('MO_PLAN1 :' + options.get(MO_PLAN1));
        outMap.put(MO_PLAN2,String.isNotBlank((String)options.get(MO_PLAN2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(MO_PLAN2)).replace(PERCENT,TEXT_NODE) : (String)options.get(MO_PLAN2));
        system.debug('MO_PLAN2 :' + options.get(MO_PLAN2));    
}
    /****************************************************************************************************
    * Method Name : transformWIMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is calling from GAVAMO Ominscript to transform the WI Medical Plans
    * ***************************************************************************************************/        
    private Boolean transformWIMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            getRemoteValuesWI(inputMap,outMap,options);
            transformDataWithQuoteWI(inputMap,outMap,options);
        
        }else{
            transformDataWithOutQuoteWI(inputMap,outMap,options);
        } 
        return true;
    }
    
 /****************************************************************************************************
    // * Method Name : getRemoteValuesWI
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to get the remote values
    * ***************************************************************************************************/
    private void getRemoteValuesWI(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        
        WIblueAccessPOSCode1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        WIblueAccessPOSPlan1 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        WIblueAccessPOSCode2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        WIblueAccessPOSPlan2 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        WIblueAccessPOSCode3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;        
        WIblueAccessPOSPlan3 = BLUE_ACCESS.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        
      
       //blue preffered
        WIblueprefferedcode1 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        WIblueprefferedplan1 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        WIblueprefferedcode2 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        WIblueprefferedplan2 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        WIblueprefferedcode3 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        WIblueprefferedplan3 =  BLUE_PREFFERED.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
      
       //Blue Priorty
        bluePriortycode1 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_CODE1) : BLANK;
        bluePriortyplan1 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK1)) ? (String)options.get(PROD_NAME1) : BLANK;
        bluePriortycode2 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_CODE2) : BLANK;
        bluePriortyplan2 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK2)) ? (String)options.get(PROD_NAME2) : BLANK;
        bluePriortycode3 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_CODE3) : BLANK;
        bluePriortyplan3 =  BLUE_PRIORTY.equalsIgnoreCase((String)options.get(PROD_NETWORK3)) ? (String)options.get(PROD_NAME3) : BLANK;
        
        
      
    }
    /****************************************************************************************************
    * Method Name : transformDataWithQuoteWI
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/
   private void transformDataWithQuoteWI(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(WIBLUE_ACCESS_POS_CODE1,WIblueAccessPOSCode1); 
        outMap.put(WIBLUE_ACCESS_POS_PLAN1,String.isNotBlank(WIblueAccessPOSPlan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? WIblueAccessPOSPlan1.replace(PERCENT,TEXT_NODE) : WIblueAccessPOSPlan1);
        outMap.put(WIBLUE_ACCESS_POS_CODE2,WIblueAccessPOSCode2); 
        outMap.put(WIBLUE_ACCESS_POS_PLAN2,String.isNotBlank(WIblueAccessPOSPlan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType))? WIblueAccessPOSPlan2.replace(PERCENT,TEXT_NODE) : WIblueAccessPOSPlan2);
        outMap.put(WIBLUE_ACCESS_POS_CODE3,WIblueAccessPOSCode3); 
        outMap.put(WIBLUE_ACCESS_POS_PLAN3,String.isNotBlank(WIblueAccessPOSPlan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? WIblueAccessPOSPlan3.replace(PERCENT,TEXT_NODE) : WIblueAccessPOSPlan3);
       
        outMap.put(WIBLUE_PREFFERED_CODE1,WIblueprefferedcode1); 
        outMap.put(WIBLUE_PREFFERED_PLAN1,String.isNotBlank(WIblueprefferedplan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? WIblueprefferedplan1.replace(PERCENT,TEXT_NODE) : WIblueprefferedplan1);
        outMap.put(WIBLUE_PREFFERED_CODE2,WIblueprefferedcode2); 
        outMap.put(WIBLUE_PREFFERED_PLAN2,String.isNotBlank(WIblueprefferedplan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? WIblueprefferedplan2.replace(PERCENT,TEXT_NODE) : WIblueprefferedplan2);
        outMap.put(WIBLUE_PREFFERED_CODE3,WIblueprefferedcode3); 
        outMap.put(WIBLUE_PREFFERED_PLAN3,String.isNotBlank(WIblueprefferedplan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? WIblueprefferedplan3.replace(PERCENT,TEXT_NODE) : WIblueprefferedplan3);   
        
        
        outMap.put(BLUE_PRIORTY_CODE1,bluePriortycode1); 
        outMap.put( BLUE_PRIORTY_PLAN1,String.isNotBlank(bluePriortyplan1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? bluePriortyplan1.replace(PERCENT,TEXT_NODE) : bluePriortyplan1);
        outMap.put(BLUE_PRIORTY_CODE2,bluePriortycode2); 
        outMap.put(BLUE_PRIORTY_PLAN2,String.isNotBlank(bluePriortyplan2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? bluePriortyplan2.replace(PERCENT,TEXT_NODE) :  bluePriortyplan2);
        outMap.put(BLUE_PRIORTY_CODE3,bluePriortycode3); 
        outMap.put( BLUE_PRIORTY_PLAN3,String.isNotBlank(bluePriortyplan3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? bluePriortyplan3.replace(PERCENT,TEXT_NODE) : bluePriortyplan3);
        outMap.put(PROD_NAME1,String.isNotBlank((String)options.get(PROD_NAME1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME1)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME1));
        outMap.put(PROD_NAME2,String.isNotBlank((String)options.get(PROD_NAME2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(PROD_NAME2)).replace(PERCENT,TEXT_NODE) : (String)options.get(PROD_NAME2)); 
       
        
    }
    
        
    
/****************************************************************************************************
    * Method Name : transformDataWithOutQuoteWI
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
private void transformDataWithOutQuoteWI(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        outMap.put(WIBLUEACCESS_PROD1,String.isNotBlank((String)options.get(WIBLUEACCESS_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(WIBLUEACCESS_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIBLUEACCESS_PROD1)); 
        outMap.put(WIBLUEACCESS_PROD2,String.isNotBlank((String)options.get(WIBLUEACCESS_PROD2)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(WIBLUEACCESS_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIBLUEACCESS_PROD2));
        outMap.put(WIBLUEACCESS_PROD3,String.isNotBlank((String)options.get(WIBLUEACCESS_PROD3)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(WIBLUEACCESS_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIBLUEACCESS_PROD3));
        
        outMap.put(WIPREFFERED_PROD1,String.isNotBlank((String)options.get(WIPREFFERED_PROD1)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPREFFERED_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPREFFERED_PROD1));
        outMap.put(WIPREFFERED_PROD2,String.isNotBlank((String)options.get(WIPREFFERED_PROD2)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPREFFERED_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPREFFERED_PROD2));
        outMap.put(WIPREFFERED_PROD3,String.isNotBlank((String)options.get(WIPREFFERED_PROD3)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPREFFERED_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPREFFERED_PROD3));
        
        outMap.put(WIPOSBLUE_PROD1,String.isNotBlank((String)options.get(WIPOSBLUE_PROD1)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPOSBLUE_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPOSBLUE_PROD1));
        outMap.put(WIPOSBLUE_PROD2,String.isNotBlank((String)options.get(WIPOSBLUE_PROD2)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPOSBLUE_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPOSBLUE_PROD2));
        outMap.put(WIPOSBLUE_PROD3,String.isNotBlank((String)options.get(WIPOSBLUE_PROD3)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType))  ? ((String)options.get(WIPOSBLUE_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPOSBLUE_PROD3));
        
        outMap.put(WIPlan1,String.isNotBlank((String)options.get(WIPlan1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(WIPlan1)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPlan1)); 
        outMap.put(WIPlan2,String.isNotBlank((String)options.get(WIPlan2)) && (SEND.equalsIgnoreCase(taskType)|| RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(WIPlan2)).replace(PERCENT,TEXT_NODE) : (String)options.get(WIPlan2));
    }   
    
/****************************************************************************************************
    * Method Name : transformNHMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data for NH state
    * ***************************************************************************************************/    
    private Boolean transformNHMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
            outMap.put(NH_MED_PROD1,String.isNotBlank((String)options.get(NH_MED_PROD1)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(NH_MED_PROD1)).replace(PERCENT,TEXT_NODE) : (String)options.get(NH_MED_PROD1));  
            outMap.put(NH_MED_PROD2,String.isNotBlank((String)options.get(NH_MED_PROD2)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(NH_MED_PROD2)).replace(PERCENT,TEXT_NODE) : (String)options.get(NH_MED_PROD2));
            outMap.put(NH_MED_PROD3,String.isNotBlank((String)options.get(NH_MED_PROD3)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(NH_MED_PROD3)).replace(PERCENT,TEXT_NODE) : (String)options.get(NH_MED_PROD3));
            outMap.put(NH_MED_PROD4,String.isNotBlank((String)options.get(NH_MED_PROD4)) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? ((String)options.get(NH_MED_PROD4)).replace(PERCENT,TEXT_NODE) : (String)options.get(NH_MED_PROD4));
            outMap.put(NH_MED_CCODE1,(String)options.get(NH_MED_CCODE1));  
            outMap.put(NH_MED_CCODE2,(String)options.get(NH_MED_CCODE2));
            outMap.put(NH_MED_CCODE3,(String)options.get(NH_MED_CCODE3));
            outMap.put(NH_MED_CCODE4,(String)options.get(NH_MED_CCODE4));
          
          return true;        
        }
        
       
    /****************************************************************************************************
    * Method Name : transformNYMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
    private Boolean transformNYMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        taskType = (String)options.get(TASK_TYPE);
        string NYPrd1 = (String)options.get(NYPRODNAME1);
        string NYPrd2 = (String)options.get(NYPRODNAME2);
        string NYPrd3 = (String)options.get(NYPRODNAME3);
        string NYPrd4 = (String)options.get(NYPRODNAME4);
        string NYPrd5 = (String)options.get(NYPRODNAME5);
        string NYPrd6 = (String)options.get(NYPRODNAME6);
                
        outMap.put(NY_PROD_NAME1,String.isNotBlank(NYPrd1) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd1).replace(PERCENT,TEXT_NODE3) : NYPrd1);
        outMap.put(NY_PROD_NAME2,String.isNotBlank(NYPrd2) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd2).replace(PERCENT,TEXT_NODE3) : NYPrd2);
        outMap.put(NY_PROD_NAME3,String.isNotBlank(NYPrd3) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd3).replace(PERCENT,TEXT_NODE3) : NYPrd3);
        outMap.put(NY_PROD_NAME4,String.isNotBlank(NYPrd4) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd4).replace(PERCENT,TEXT_NODE3) : NYPrd4);
        outMap.put(NY_PROD_NAME5,String.isNotBlank(NYPrd5) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd5).replace(PERCENT,TEXT_NODE3) : NYPrd5);
        outMap.put(NY_PROD_NAME6,String.isNotBlank(NYPrd6) && (SEND.equalsIgnoreCase(taskType) || RESEND.equalsIgnoreCase(taskType)) ? (NYPrd6).replace(PERCENT,TEXT_NODE3) : NYPrd6);
        
        system.debug('outMap1:'+outMap.get(NY_PROD_NAME1));
        system.debug('outMap2:'+outMap.get(NY_PROD_NAME2));
        system.debug('outMap3:'+outMap.get(NY_PROD_NAME3));
        system.debug('outMap1:'+outMap.get(NY_PROD_NAME4));
        system.debug('outMap2:'+outMap.get(NY_PROD_NAME5));
        system.debug('outMap3:'+outMap.get(NY_PROD_NAME6));
        
        
        return true;
    }


    /****************************************************************************************************
    * Method Name : transformABFMedProducts
    * Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
    * Return type : Boolean
    * Description : This method is inner method to transform the data
    * ***************************************************************************************************/    
    private Boolean transformABFMedProducts(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        system.debug('inside transformABFMedProducts '+inputMap);
        taskType = (String)options.get(TASK_TYPE);
        if(options.containsKey(WITH_QUOTING) && (Boolean)options.get(WITH_QUOTING))  {
            outMap.put(FINALMEDPLN1,String.isNotBlank((String)options.get(ABFMEDPLAN1)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN1)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN1)); 
            outMap.put(FINALMEDPLN2,String.isNotBlank((String)options.get(ABFMEDPLAN2)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN2)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN2)); 
            outMap.put(FINALMEDPLN3,String.isNotBlank((String)options.get(ABFMEDPLAN3)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN3)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN3)); 
            outMap.put(FINALMEDPLN4,String.isNotBlank((String)options.get(ABFMEDPLAN4)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN4)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN4)); 
            outMap.put(FINALMEDPLN5,String.isNotBlank((String)options.get(ABFMEDPLAN5)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN5)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN5)); 
            outMap.put(FINALMEDPLN6,String.isNotBlank((String)options.get(ABFMEDPLAN6)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(ABFMEDPLAN6)).replace(PERCENT,PERCENTSIGN) : (String)options.get(ABFMEDPLAN6)); 
        }else{
            outMap.put(FINALMEDPLN1,String.isNotBlank((String)options.get(NQABFMEDPLAN1)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN1)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN1))? ((String)options.get(NQABFMEDPLAN1)).substringAfter('-') : (String)options.get(NQABFMEDPLAN1))); 
            outMap.put(FINALMEDPLN2,String.isNotBlank((String)options.get(NQABFMEDPLAN2)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN2)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN2))? ((String)options.get(NQABFMEDPLAN2)).substringAfter('-') : (String)options.get(NQABFMEDPLAN2))); 
            outMap.put(FINALMEDPLN3,String.isNotBlank((String)options.get(NQABFMEDPLAN3)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN3)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN3))? ((String)options.get(NQABFMEDPLAN3)).substringAfter('-') : (String)options.get(NQABFMEDPLAN3))); 
            outMap.put(FINALMEDPLN4,String.isNotBlank((String)options.get(NQABFMEDPLAN4)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN4)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN4))? ((String)options.get(NQABFMEDPLAN4)).substringAfter('-') : (String)options.get(NQABFMEDPLAN4)));
            outMap.put(FINALMEDPLN5,String.isNotBlank((String)options.get(NQABFMEDPLAN5)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN5)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN5))? ((String)options.get(NQABFMEDPLAN5)).substringAfter('-') : (String)options.get(NQABFMEDPLAN5)));
            outMap.put(FINALMEDPLN6,String.isNotBlank((String)options.get(NQABFMEDPLAN6)) && !(PRINT.equalsIgnoreCase(taskType)) ? ((String)options.get(NQABFMEDPLAN6)).substringAfter('-').replace(PERCENT,PERCENTSIGN) : ( String.isNotBlank((String)options.get(NQABFMEDPLAN6))? ((String)options.get(NQABFMEDPLAN6)).substringAfter('-') : (String)options.get(NQABFMEDPLAN6)));
        } 
        return true; 

    }
  
}