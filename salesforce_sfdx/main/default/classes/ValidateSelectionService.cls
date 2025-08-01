/****************************************************************************************************
* Class Name  : ValidateSelectionService
* Description : This is the class used for omniscript validations
* ***************************************************************************************************/     
global without sharing class ValidateSelectionService implements vlocity_ins.VlocityOpenInterface
{
    public static final string ERROR = 'error';
    public static final string WITH_QUOTE = 'WithQuote';
    public static final string MEDICAL_COVERAGE = 'MedicalCoverageNQ';
    public static final string MEDICAL_COVERAGE_WQ = 'MedicalCoverage';
    public static final string CA_MED_BLOCK_WQ = 'CAMedicalBlock1';
    public static final string CA_MED_CONTRI_WQ = 'MedicalContributionForEachMonth1';
    private static final string CAPERCENTPLAN = 'CAPercentPlan';
    public static final string SELECT_MEDICAL = 'SelectMedical';
    public static final string INNER_MEDICAL ='InnerMedical';
    public static final string CONTRACT_CODE ='MedicalContractCode';
    public static final string MED_PLAN_COUNT = 'MedicalPlansCount';
    public static final string MED_INNER_BLOCK = 'InnerSelectMedical';
    public static final string SELECTED_MEDICAL_PLAN = 'SelectedMedicalPlan';
    public static final string EPO_ONLY_SELECTED = 'An EPO plan has been selected without also selecting a non EPO plan. Please include a non EPO plan in order to continue.';
    public static final string NAME = 'Name';
    public static final string VLC_SELECTED = 'vlcSelected';
    public static final string CC_MEDICAL = 'InputContractCodeMedical';
    public static final string PROD_CODE_MED = 'SelectProductCodeLookupMedical';
    public static final string DUPLICATE_PLANS = 'Please do not select duplicate plans';
    public static final string BLANK = '';
    public static final string UNDERSCORE = '_';
    public static final string ONE_NETWORK = 'Only products from any one network can be selected for PPO plans';
    public static final string VAL_PRD_SELRCTE_OH='validateProductselectedOH'; 
    public static final string DENTAL_COVERAGE = 'DentalCoverageNQ';
    public static final string SELECT_DENTAL = 'SelectDental';
    public static final string DEN_PLAN_COUNT = 'DentalPlansCount';
    public static final string DEN_INNER_BLOCK = 'InnerSelectDental';
    public static final string CC_DENTAL = 'InputContractCodeDental';
    public static final string PROD_CODE_DEN = 'SelectProductCodeLookupDental';
    public static final string DEN_PRD_ID = 'DentalProductId';
    public static final string ENROLL_DENT_EMP = 'EnrollingDentalEmp';
    public static final string EFFECTIVE_YEAR = 'EffectiveDateYear';
    public static final string DEN_CON_CODE = 'DentalContractCode';
    public static final string ORTHOERROR_MSG_10 = 'Ortho Dental plans are not available when number of enrollees is less than 10';
    public static final string ORTHOERROR_MSG_5 = 'Ortho Dental plans are not available when number of enrollees is less than 5';
    public static final string VISION_COVERAGE = 'VisionCoverageNQ';
    public static final string SELECT_VISION = 'SelectVision';
    public static final string VIS_PLAN_COUNT = 'VisionPlansCount';
    public static final string VIS_INNER_BLOCK = 'InnerSelectVision';
    public static final string CC_VISION = 'InputContractCodeVision';
    public static final string PROD_CODE_VIS = 'SelectProductCodeLookupVision';
    public static final string SELECT_ALL_PRD = 'SelectAllProducts';
    
    public static final string STATE_VAL = 'qState';
    public static final string CA_STATE = 'CA';
    
    public static final string VAL_MEDICAL = 'validateMedical';
    public static final string VAL_SEL_MEDICAL = 'validateSelectedMedical';
    public static final string VAL_DENTAL = 'validateDental';
    public static final string VAL_VISION = 'validateVision';
    public static final string VAL_QUOTE_MEDICAL = 'validateQuoteMedical';
    public static final string VAL_QUOTE_DENTAL = 'validateQuoteDental';
    public static final string VAL_QUOTE_VISION = 'validateQuoteVision';
    public static final string VAL_ZIPCODE = 'validateZipCode';
    public static final string VAL_COVERAGE_DESC = 'validateCoverageDesc';
    public static final string VAL_DIS_CONDITION = 'validateDisablingCondition';
    public static final string VAL_DUP_MEDICAL_CACO = 'validateDuplicateMedicalCACO';
    public static final string VAL_DUP_DENTAL_CACO = 'validateDuplicateDentalCACO';
    public static final string VAL_DUP_VISION_CACO = 'validateDuplicateVisionCACO';
    public static final string VAL_PRD_SELRCTE_NV='validateProductselectedNV'; 
    public static final string VAL_PRD_SELRCTE_CA='validateProductselectedCA'; 
    public static final string CAL_COBRA_QUESTIONNARIE = 'CalCOBRACOBRAQuestionnaire';
    public static final string CAL_COBRA_MEMCOUNT = 'CalCOBRAMemCount';
    public static final string CAL_COBRA_MEMDETAILS = 'CalCOBRACOBRAMemberDetails';
    public static final string EMPLOYEE_VALIDATE = 'Employeevalidate';
    public static final string DISABLING_CONDITION = 'DisablingCondition';
    public static final string YES_CONSTANT = 'Yes';
    public static final string ERROR_MSG = 'Please fix all the fields with errors';
    public static final string SEL_LAND_COVERAGE = 'SelectedLAndDCoverage';
    public static final string LD_PRD_NONE = 'LDPrdNone';
    public static final string DIS_PRD_NONE = 'DisabilityPrdNone';
    public static final string LD_PRD_BASIC_LIFE = 'LDPrdBasicLife';
    public static final string LD_PRD_BASIC_DEP = 'LDPrdBasicDependent';
    public static final string LD_WITH_QUOTE = 'LandDWithQuote';
    public static final string LD_LIFE_BLOCK = 'LifeBlk';
    public static final string DIS_DISABILITY_BLOCK = 'DisabilityBlk';
    public static final string LD_DEPENDENT_BLOCK = 'LifeDependentBlk';
    public static final string LD_WITHOUT_QUOTE = 'LandDWithoutQuote';
    public static final string LD_PRD_BASIC_LIFE_Q = 'LDBasicLife';
    public static final string LD_PRD_BASIC_DEP_Q = 'LDPrdDependent';
    public static final string DIS_PRD_SHORT_Q = 'DisabilityShortTerm';
    
    public static final string LD_PRD_OPT_LIFE = 'LDPrdOptionalLife';
    public static final string LD_PRD_OPT_DEPENDENT = 'LDPrdOptionalDependent';
    public static final string DIS_PRD_SHORT = 'DisabilityPrdShort';
    public static final string DIS_PRD_LONG = 'DisabilityPrdLong';
    public static final string DIS_PRD_VOL_SHORT = 'DisabilityPrdVoluntaryShort';
    public static final string DIS_PRD_VOL_LONG = 'DisabilityPrdVoluntaryLong';
    public static final string LD_DIS_WAITING_PERIOD_BLK = 'LDLifeDisabilityWaitingPeriodBlock';
    public static final string MO_LIFE_WAITING_PERIOD_BLK = 'MOLDLifeWaitingPeriodBlock';
    public static final string MO_DISABILITY_WAITING_PERIOD_BLK = 'MOLDDisabilityWaitingPeriodBlock';
    public static final string LD_WAIVE_BLK_COUNT = 'LDWaiveBlockCount';
    public static final string MO_LIFE_WAIVE_BLK_COUNT = 'MOLifeWaiveBlockCount';
    public static final string MO_DISABILITY_WAIVE_BLK_COUNT = 'MODisabilityWaiveBlockCount';
    public static final string LD_DIS_WAIVE_BLK = 'LDLifeDisabilityWaiveBlock';
    public static final string MO_LIFE_WAIVE_BLK = 'MOLDLifeWaiveBlock1';
    public static final string MO_DISABILITY_WAIVE_BLK = 'MOLDDisabilityWaiveBlock1';
    public static final string LD_COV_DESC = 'LDCoverageDescription';
    public static final string MO_LIFE_COV_DESC = 'MOLDLifeCoverageDescription1';
    public static final string MO_DIS_COV_DESC = 'MOLDDisabilityCoverageDescription1';
    public static final string ERROR_MSG1 = 'Please select the Coverage Description from the selected Life & Disability products';
    public static final string ERROR_MSG_LIFEPLANS = 'Please select 1 L&D plan to continue';
    public static final string MEDICAL_ACCOUNTS = 'MedicalAccounts';
    public static final string MEDICAL_ACCOUNTS1 = 'MedicalAccounts1';
    public static final string MEDICAL_THREE_MSG = 'You may not enroll in more than three Medical plans';
    public static final string MEDICAL_NO_PLANS = 'You must enroll in at least one Medical plan';
    public static final string RIDER_29PLANS = 'isConflictRider29Plans';
    public static final string RIDER29_ERROR_MSG2 = 'During enrollment you must only pick plans with or without age 29, not both.';
    public static final string DENTAL_ACCOUNTS = 'DentalAccounts';
    public static final string DENTAL_TWO_MSG = 'You may not enroll in more than two Dental plans';
    public static final string DENTAL_NO_PLANS = 'You must enroll in at least one Dental plan';
    
    public static final string VISION_ACCOUNTS = 'VisionAccounts';
    public static final string VISION_PLAN_MSG = 'You may not enroll in more than one Vision plan';
    public static final string VISION_NO_PLANS = 'You must enroll in at least one Vision plan';
    public static final string SEL_MEDICAL_COVERAGE = 'SelectMedicalCoverage';
    public static final string OUTPUT2 = 'output2';
    public static final string QUOTE_ENROLL_MEDICAL_MULTI_PLANS = 'You may not quote more than ten Medical plans';
    public static final string SEL_DENTAL_PLANS = 'SelectDentalPlans';
    public static final string OUTPUT3 = 'output3';
    public static final string QUOTE_ENROLL_DENTAL_MULTI_PLANS = 'You may not quote more than ten Dental plans';
    public static final string SEL_VISION_PLANS = 'SelectVisionPlans';
    public static final string OUTPUT4 = 'output4';
    public static final string QUOTE_ENROLL_VISION_MULTI_PLANS = 'You may not quote more than ten Vision plans';
    
    public static final string VALIDATE_PAYMENT_MTHD = 'validatePaymentInfoCACO';
    public static final string PAYMENT = 'Payment';
    public static final string PAYMENT_INFO = 'PaymentInformation';
    public static final string APP_ID = 'applicationId';
    public static final string SUCCESS = 'SUCCESS';
    public static final string YES = 'Yes';
    
    public static final string STEP = 'Step';
    public static final string ZIPCODE_ERROR_MSG = 'zipCodeErrorMsg';
    public static final string CHECK_ZIPCODE = 'CheckZipCode';
    private static final string HYPHEN = '-';
    private static final string SPACE = ' ';
    private static final string SELECTED_NETWORKS = 'SelectedNetworks';
    private static final string CONTRI_PLAN = 'CAContributionPlan';
    private static final string CA_MED_BLOCK = 'CAMedicalBlock';
    private static final string MED_CONTRI_MONTH = 'MedicalContributionForEachMonth';
    private static final string PERCENT_PLAN = 'Percentage of plan option';
    private static final string PERCENT_PLAN1 = 'Percentage of Plan option';
    private static final string DENTAL_TYPE = 'DentalPlanType';
    private static final string VISION_TYPE = 'VisionPlanType';
    private static final string VOLUNTRY = 'Voluntary';
    private static final string EMP_SPONSORED = 'EmployerSponsored';
    private static final string NOVALUE = 'N';
    private static final string YESVALUE = 'Y';
    
    private static final string VALIDATEDUPLICATEMEDVAGAMO= 'validateDuplicateMedicalVAGAMO';
    private static final string BLUEMEDPLANCOUNT = 'BlueMedicalPlansCount';
    private static final string PATHWAYMEDPLANCOUNT = 'PathwayMedicalPlansCount';
    private static final string HMOMEDPLANCOUNT = 'HMOMedicalPlansCount';
    private static final string VA_STATE = 'VA';
    private static final string GA_STATE = 'GA';
    private static final string MO_STATE = 'MO';
    private static final string INNERSELECTMEDVAMO = 'InnerSelectMedicalVAMO';
    private static final string INNERSELECTMEDGA = 'InnerSelectMedicalGA';
    private static final string POSBLUEBLK = 'POSBlueBlock';
    private static final string BLUESELPRODLOOKUPMED = 'BlueSelectProductCodeLookupMed';
    private static final string POSPATHWAYBLK = 'POSPathwayBlock';
    private static final string PATHWAYSELPRDLOOKUPMED = 'PathwaySelectProductCodeLookupMed';
    private static final string HMOBLUEBLK = 'HMOBlueBlock';
    private static final string HMOSELPRDLOOKUPMED = 'HMOSelectProductCodeLookupMed';
    private static final string VALIDATEDUPLICATEDENOHINKYVAGAMO= 'validateDuplicateDentalOHKYINVAGAMO';
    private static final string GACONTRIBUTIONPLAN= 'GAContributionPlan';
    private static final string GAMEDCONTRITYPE= 'GAMedicalContibutionType';
    private static final string POP= 'PoP';
    private static final string COMMA = ',';
    private static final string DENTAL_PLAN_TYPES = 'SelectedDentalPlanTypes';
    private static final string GAMEDCONTRITYPE_WQ= 'MedicalContributionChoiceGA';
    private static final string GACONTRIBUTIONPLAN_WQ= 'GAPercentPlan';
    
    private static final string VALIDATEDUPLICATEMEDOHKYIN= 'validateDuplicateMedicalOHKYIN';
    private static final string VALIDATEPRODUCTSELCETEDGA= 'validateProductselectedGA';
    private static final string POSBLUEMEDPLANCOUNT = 'POSBlueBlockCount';
    private static final string POSPATHWAYMEDPLANCOUNT = 'POSPathwayBlockCount';
    private static final string HMOPATHWAYCOUNT = 'HMOPathwayCount';
    private static final string HMOPATHWAYTRANSITION ='PathwayTransitionCount';
    private static final string OH_STATE = 'OH';
    private static final string KY_STATE = 'KY';
    private static final string IN_STATE = 'IN';
    private static final string INNERSELECTMEDOHIN = 'InnerSelectMedicalOHIN';
    private static final string INNERSELECTMEDKY = 'InnerSelectMedicalKY';
    private static final string POSBLUEBLKKY = 'POSBlueBlock';
    private static final string BLUESELPRODLOOKUPMEDKY = 'BlueSelectProductCodeLookupMed';
    private static final string POSPATHWAYBLKKY = 'POSPathwayBlock';
    private static final string PATHWAYSELPRDLOOKUPMEDKY = 'PathwaySelectProductCodeLookupMed';
    private static final string HMOBLUEBLKKY = 'HMOPathwayBlock';
    private static final string HMOSELPRDLOOKUPMEDKY = 'PathwayHMOProductCodeLookupMed';
    private static final string PATHWAYTRANSITIONBLKKY = 'HMOPathwayTransBlock';
    private static final string PATHWAYTRANSITIONLOOKUPMEDKY= 'PathwayHMOTransProductCodeLookupMed';
    private static final string VALIDATEPRODUCTSELECTEDNVE ='validateProductselectedNVE';
    private static final string NVSTATE= 'NV';
    private static final string PRODUCTCODES= 'ProductCode';
    private static final string IDVAR = 'Id';
    private static final string NVPERCENTPLAN = 'NVPercentPlan';
    private static final string NVPERCENTPLANE = 'NVPercentPlanE';
    private static final string OHINMEDCONTRITYPE_WQ= 'OHINMedContriForEachMonth1';
    private static final string OHINCONTRIBUTIONPLAN_WQ= 'OHINMedicalPlan1';
    
    private static final string NVMEDCONTREACHMONTHQ = 'MedicalContributionForEachMonthNVQ';
private static final string NVMEDCONTREACHMONTHQE = 'MedicalContributionForEachMonthNV';      
  private static final string DHMONTWRK = 'DHMONtwrk';
  private static final string NODHMO = 'NoDHMO';
  private static final string DENTALNETHMO = 'Dental Net HMO';
  private static final string ACADENTAL = 'ACA Dental';
  private static final string DENTALNET = 'Dental Net';
  private static final string PNC = 'PNC';
    
    /****************************************************************************************************
* Method Name : invokeMethod
* Params      : String methodName,Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This is the interface method to invoke the method based on the provided remote method
* ***************************************************************************************************/        
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        try{
            if (VAL_MEDICAL.equalsIgnoreCase(methodName))
            {
                return validateMedical(inputMap,outMap,options);
            }
            else if (VAL_SEL_MEDICAL.equalsIgnoreCase(methodName))
            {
                return validateSelectedMedical(inputMap,outMap,options);
            }
            else if (VAL_DENTAL.equalsIgnoreCase(methodName))
            {
                return validateDental(inputMap,outMap,options);
            }
            else if (VAL_VISION.equalsIgnoreCase(methodName))
            {
                return validateVision(inputMap,outMap,options);
            }
            else if (VAL_QUOTE_MEDICAL.equalsIgnoreCase(methodName))
            {
                return validateQuoteMedical(inputMap,outMap,options);
            }
            else if (VAL_QUOTE_DENTAL.equalsIgnoreCase(methodName))
            {
                return validateQuoteDental(inputMap,outMap,options);
            }
            else if (VAL_QUOTE_VISION.equalsIgnoreCase(methodName))
            {
                return validateQuoteVision(inputMap,outMap,options);
            }
            
            else if (VAL_ZIPCODE.equalsIgnoreCase(methodName))
            {
                return validateZipCode(inputMap,outMap,options);
            }
            else if (VAL_COVERAGE_DESC.equalsIgnoreCase(methodName))
            {
                return validateCoverageDesc(inputMap,outMap,options);
            }
            else if (VAL_DIS_CONDITION.equalsIgnoreCase(methodName))
            {
                return validateDisablingCondition(inputMap,outMap,options);
            }
            else if (VAL_DUP_MEDICAL_CACO.equalsIgnoreCase(methodName))
            {
                return validateDuplicateMedicalCACO(inputMap,outMap,options);
            }
            else if (VAL_DUP_DENTAL_CACO.equalsIgnoreCase(methodName))
            {
                return validateDuplicateDentalCACO(inputMap,outMap,options);
            }
            else if (VAL_DUP_VISION_CACO.equalsIgnoreCase(methodName))
            {
                return validateDuplicateVisionCACO(inputMap,outMap,options);
            }
            else if (VALIDATE_PAYMENT_MTHD.equalsIgnoreCase(methodName))
            {
                return validatePaymentInfoCACO(inputMap,outMap,options);
            }
            else if (VALIDATEDUPLICATEMEDVAGAMO.equalsIgnoreCase(methodName))
            {
                return validateDuplicateMedicalVAGAMO(inputMap,outMap,options);
            }
            else if (VALIDATEDUPLICATEDENOHINKYVAGAMO.equalsIgnoreCase(methodName))
            {
                return validateDuplicateDentalOHKYINVAGAMO(inputMap,outMap,options);
            }
            else if (VALIDATEDUPLICATEMEDOHKYIN.equalsIgnoreCase(methodName))
            {
                return validateDuplicateMedicalOHKYIN(inputMap,outMap,options);
            }
            else if (VALIDATEPRODUCTSELCETEDGA.equalsIgnoreCase(methodName))  
            {
                return validateProductselectedGA(inputMap,outMap,options);
            }else if (VAL_PRD_SELRCTE_OH.equalsIgnoreCase(methodName))  
            {
               
                return validateProductselectedOH(inputMap,outMap,options);
            }
            
            else if (VAL_PRD_SELRCTE_NV.equalsIgnoreCase(methodName))  
            {
               
                return validateProductselectedNV(inputMap,outMap,options);
            }
            else if (VAL_PRD_SELRCTE_CA.equalsIgnoreCase(methodName))  
            {
               
                return validateProductselectedCA(inputMap,outMap,options);
            }
           
            
   }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.INVOKEMETHOD, SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    /**********************************************************************************************
* Method Name : validateDisablingCondition
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from CALCOBRA step.
*********************************************************************************************/
    private Boolean validateDisablingCondition(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> calCOBRAStep = (Map<String,Object>) inputMap.get(CAL_COBRA_QUESTIONNARIE);
        Integer calCobCount = Integer.valueOf(calCOBRAStep.get(CAL_COBRA_MEMCOUNT));
        if(calCobCount == 1){
            Map<String,Object> cobraBlockMap = (Map<String,Object>)calCOBRAStep.get(CAL_COBRA_MEMDETAILS);
            String employeeVal = (String)cobraBlockMap.get(EMPLOYEE_VALIDATE);
            String disablingCondition = (String)cobraBlockMap.get(DISABLING_CONDITION);
            if(YES_CONSTANT.equalsIgnoreCase(employeeVal) && String.isBlank(disablingCondition)){
                outMap.put(ERROR,ERROR_MSG);
            }
        }else if(calCobCount > 1){
            List<Object> cobraBlockList = (List<Object>)calCOBRAStep.get(CAL_COBRA_MEMDETAILS);
            for(Object obj : cobraBlockList){
                Map<String,Object> cobraBlockMap = (Map<String,Object>) obj;
                String employeeVal = (String)cobraBlockMap.get(EMPLOYEE_VALIDATE);
                String disablingCondition = (String)cobraBlockMap.get(DISABLING_CONDITION);
                if(YES_CONSTANT.equalsIgnoreCase(employeeVal) && String.isBlank(disablingCondition)){
                    outMap.put(ERROR,ERROR_MSG);
                    Break;
                }
            }
        }
        return true;
        
    }
    /**********************************************************************************************
* Method Name : validateCoverageDesc
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from CALCOBRA step.
*********************************************************************************************/
    private Boolean validateCoverageDesc(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean LDPrdBasicLife = false;
        Boolean LDPrdBasicDependent = false;
        Boolean DisabilityPrdShort = false;
        Boolean LDPrdOptionalLife = false;
        Boolean LDPrdOptionalDependent = false;
        Boolean DisabilityPrdLong = false;
        Boolean DisabilityPrdVoluntaryShort = false;
        Boolean DisabilityPrdVoluntaryLong = false;
        Boolean lifeNone = false;
        Boolean disNone = false;
        
        Map<String,Object> coverageStep = (Map<String,Object>) inputMap.get(SEL_LAND_COVERAGE);
        Boolean withQuote = (BOOLEAN)inputMap.get(WITH_QUOTE);
        String stateValue = (String)inputMap.get(STATE_VAL);
            
        if(withQuote){
            Map<String,Object> LandDWithQuoteMap = (Map<String,Object>)coverageStep.get(LD_WITH_QUOTE);
            system.debug('LandDWithQuoteMap'+LandDWithQuoteMap);

            if(LandDWithQuoteMap != null){
                
                
                Map<String,Object> LifeBlkMap = (Map<String,Object>)LandDWithQuoteMap.get(LD_LIFE_BLOCK);
                Map<String,Object> DisabilityBlkMap = (Map<String,Object>)LandDWithQuoteMap.get(DIS_DISABILITY_BLOCK);
                Integer totallandDAccounts = Integer.valueOf(LandDWithQuoteMap.get('LandDAccountsCount'));
                system.debug('totallandDAccounts'+totallandDAccounts);
                Integer dependentCount = Integer.valueOf(LandDWithQuoteMap.get('LAndDDCount'));
                system.debug('dependentCount'+dependentCount);
                Integer disabilityCount = Integer.valueOf(LandDWithQuoteMap.get('STDCount'));
                system.debug('disabilityCount'+disabilityCount);
                Integer lifeCount = Integer.valueOf(LandDWithQuoteMap.get('LAndDCount'));
                Integer sumLifeDepPlan = Integer.valueOf(LandDWithQuoteMap.get('SumLifeplanandDepPlan'));
                LDPrdBasicLife = (Boolean)LandDWithQuoteMap.get('LifeExists');
                LDPrdBasicDependent = (Boolean)LandDWithQuoteMap.get('DependentExists');
                DisabilityPrdShort = (Boolean)LandDWithQuoteMap.get('ShortTermDisabilityExists');

                system.debug('lifeCount'+lifeCount);    
                if(totallandDAccounts>1) {
                    
                     If(disabilityCount>1||lifeCount>1||dependentCount>1||sumLifeDepPlan>1){
                        outMap.put(ERROR,ERROR_MSG_LIFEPLANS);
                    }
                        
                    
                }
            }
            
        }else {
            Map<String,Object> LandDWithOutQuoteMap = (Map<String,Object>)coverageStep.get(LD_WITHOUT_QUOTE);
            if(LandDWithOutQuoteMap != null){
                LDPrdBasicLife = (Boolean)LandDWithOutQuoteMap.get(LD_PRD_BASIC_LIFE);
                LDPrdBasicDependent = (Boolean)LandDWithOutQuoteMap.get(LD_PRD_BASIC_DEP);
                DisabilityPrdShort = (Boolean)LandDWithOutQuoteMap.get(DIS_PRD_SHORT);
                LDPrdOptionalLife = (Boolean)LandDWithOutQuoteMap.get(LD_PRD_OPT_LIFE);
                LDPrdOptionalDependent = (Boolean)LandDWithOutQuoteMap.get(LD_PRD_OPT_DEPENDENT);
                DisabilityPrdLong = (Boolean)LandDWithOutQuoteMap.get(DIS_PRD_LONG);
                DisabilityPrdVoluntaryShort = (Boolean)LandDWithOutQuoteMap.get(DIS_PRD_VOL_SHORT);
                DisabilityPrdVoluntaryLong = (Boolean)LandDWithOutQuoteMap.get(DIS_PRD_VOL_LONG);
                lifeNone = (Boolean)LandDWithOutQuoteMap.get(LD_PRD_NONE);
                disNone = (Boolean)LandDWithOutQuoteMap.get(DIS_PRD_NONE);
            }
        }
        Set<String> landdproducts = new Set<String>();
        if(!lifeNone || !disNone){
            
            if(LDPrdBasicLife){
                landdproducts.add(LD_PRD_BASIC_LIFE);
            }
            if(LDPrdBasicDependent){
                landdproducts.add(LD_PRD_BASIC_DEP);
            }
            if(LDPrdOptionalLife){
                landdproducts.add(LD_PRD_OPT_LIFE);
            }
            if(LDPrdOptionalDependent){
                landdproducts.add(LD_PRD_OPT_DEPENDENT);
            }
            if(DisabilityPrdShort){
                landdproducts.add(DIS_PRD_SHORT);
            }
            if(DisabilityPrdLong){
                landdproducts.add(DIS_PRD_LONG);
            }
            if(DisabilityPrdVoluntaryShort){
                landdproducts.add(DIS_PRD_VOL_SHORT);
            }
            if(DisabilityPrdVoluntaryLong){
                landdproducts.add(DIS_PRD_VOL_LONG);
            }
            if(!landdproducts.isEmpty()){
                String validationError = BLANK;
                if (stateValue == MO_STATE) {
                system.debug('----1---');
                    validationError = validateLAndDCoverageDesc(coverageStep, landdproducts, MO_LIFE_WAITING_PERIOD_BLK, MO_LIFE_WAIVE_BLK_COUNT, MO_LIFE_WAIVE_BLK, MO_LIFE_COV_DESC, false);
                    if(String.isBlank(validationError)) {
                       system.debug('----2---');
                        validationError = validateLAndDCoverageDesc(coverageStep, landdproducts, MO_DISABILITY_WAITING_PERIOD_BLK, MO_DISABILITY_WAIVE_BLK_COUNT, MO_DISABILITY_WAIVE_BLK, MO_DIS_COV_DESC, false);
                    }
                } else {
                    validationError = validateLAndDCoverageDesc(coverageStep, landdproducts, LD_DIS_WAITING_PERIOD_BLK, LD_WAIVE_BLK_COUNT, LD_DIS_WAIVE_BLK, LD_COV_DESC, false);
                }
                
                if (String.isNotBlank(validationError)) {
                    system.debug('----no erro---');
                    outMap.put(ERROR,ERROR_MSG1);
                }
            }
         } else if(lifeNone && disNone){
            
            String noLAndDValidationError = BLANK;
            if (stateValue == MO_STATE) {
                noLAndDValidationError = validateLAndDCoverageDesc(coverageStep, landdproducts, MO_LIFE_WAITING_PERIOD_BLK, MO_LIFE_WAIVE_BLK_COUNT, MO_LIFE_WAIVE_BLK, MO_LIFE_COV_DESC, true);
                if(String.isBlank(noLAndDValidationError)) {
                    noLAndDValidationError = validateLAndDCoverageDesc(coverageStep, landdproducts, MO_DISABILITY_WAITING_PERIOD_BLK, MO_DISABILITY_WAIVE_BLK_COUNT, MO_DISABILITY_WAIVE_BLK, MO_DIS_COV_DESC, true);
                }
            } else {
                noLAndDValidationError = validateLAndDCoverageDesc(coverageStep, landdproducts, LD_DIS_WAITING_PERIOD_BLK, LD_WAIVE_BLK_COUNT, LD_DIS_WAIVE_BLK, LD_COV_DESC, true);
            }
            
            if (String.isNotBlank(noLAndDValidationError)) {
                outMap.put(ERROR,ERROR_MSG1);
            }
        }
        return true;
    }
    
    /****************************************************************************************************
* Method Name : validateLAndDCoverageDesc
* Params      : Map<String,Object> coverageStep, Set<String> landdproducts, String waitingPeriodBlockName, String waiveCount, String waiveBlockName, String LDCoverageDesc, Boolean noLAndDSelected
* Return type : String
* Description : This method is used to validate the LAndD Coverage Discription selected in the Waived block with the actual products selected
* ***************************************************************************************************/
    
    private String validateLAndDCoverageDesc(Map<String,Object> coverageStep, Set<String> landdproducts, String waitingPeriodBlockName, String waiveCount, String waiveBlockName, String LDCoverageDesc, Boolean noLAndDSelected){
        Map<String,Object> landdblock = (Map<String,Object>)coverageStep.get(waitingPeriodBlockName);
        Integer landdwaiveCount = Integer.valueOf(coverageStep.get(waiveCount));
        system.debug('----7---'+landdwaiveCount);
        if(landdwaiveCount == 1){
            Map<String,Object> disableBlockMap = (Map<String,Object>)landdblock.get(waiveBlockName);
            String coverageDesc = (String)disableBlockMap.get(LDCoverageDesc);
                system.debug('----5---'+coverageDesc);
            if(noLAndDSelected){
                if(String.isNotBlank(coverageDesc)){
                 system.debug('----3---'+landdwaiveCount);
                    return ERROR_MSG1;
                }
            } else {
                if(!landdproducts.contains(coverageDesc)){
                 system.debug('----4---'+landdproducts);
                 system.debug('----4---'+coverageDesc);
                    return ERROR_MSG1;
                }
            }
        } else if(landdwaiveCount > 1) {
            List<Object> disabilityBlock = (List<Object>)landdblock.get(waiveBlockName);
            for(Object obj : disabilityBlock){
                Map<String,Object> coverageBlock = (Map<String,Object>) obj;
                String coverageDesc = (String)coverageBlock.get(LDCoverageDesc);
                system.debug('----6---'+coverageDesc);
                system.debug('----6---'+noLAndDSelected);
                system.debug('----6---'+landdproducts);
                if(noLAndDSelected){
                    if(String.isNotBlank(coverageDesc)){
                        return ERROR_MSG1;
                    }
                } else {
                    if(!landdproducts.isEmpty() && !landdproducts.contains(coverageDesc)){
                        return ERROR_MSG1;
                    }
                }
            }
        }
        system.debug('----7---'+landdproducts);
        return BLANK;
    }
    
    /****************************************************************************************************
* Method Name : validateMedical
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the medical plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateMedical(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>3)
                
            {
                outMap.put(ERROR,MEDICAL_THREE_MSG);
            }
            else if (selectCoverageOutputList == null)
            {
                outMap.put(ERROR,MEDICAL_NO_PLANS);
            }
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEDENTAL,SG01_Constants.SPACE, Logginglevel.ERROR);}
        
        return true;
    }
    
    /****************************************************************************************************
* Method Name : validateSelectedMedical
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the medical plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateSelectedMedical(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);

        Boolean isConflictRider29Plans = (Boolean) selectCoverageMap.get(RIDER_29PLANS);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if(isConflictRider29Plans){
                outMap.put(ERROR,RIDER29_ERROR_MSG2);
            }
            else if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>3)
            {
                outMap.put(ERROR,MEDICAL_THREE_MSG);
            }
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEDENTAL,SG01_Constants.SPACE, Logginglevel.ERROR);}
        
        return true;
    }
    /****************************************************************************************************
* Method Name : validateDental
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the dental plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateDental(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(DENTAL_COVERAGE);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(DENTAL_ACCOUNTS);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>2)
            {
                outMap.put(ERROR,DENTAL_TWO_MSG);
            }
            else if (selectCoverageOutputList == null)
            { 
                outMap.put(ERROR,DENTAL_NO_PLANS);
            }
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEDENTAL,SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    /****************************************************************************************************
* Method Name : validateVision
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the vision plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateVision(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(VISION_COVERAGE);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(VISION_ACCOUNTS);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()!=1)
                
            {
                outMap.put(ERROR,VISION_PLAN_MSG);
            }
            else if (selectCoverageOutputList == null)
            {
                outMap.put(ERROR,VISION_NO_PLANS);
            }
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEVISION,SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    
    /****************************************************************************************************
* Method Name : validateQuoteMedical
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the Quote Medical plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateQuoteMedical(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(SEL_MEDICAL_COVERAGE);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(OUTPUT2);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>10)
                
            {
                outMap.put(ERROR,QUOTE_ENROLL_MEDICAL_MULTI_PLANS);
            }
            else if (selectCoverageOutputList == null)
            {
                outMap.put(ERROR,MEDICAL_NO_PLANS);
            }
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEDENTAL,SG01_Constants.SPACE, Logginglevel.ERROR);}
        return true;
    }
    /****************************************************************************************************
* Method Name : validateQuoteDental
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the Quote Dental plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateQuoteDental(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(SEL_DENTAL_PLANS);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(OUTPUT3);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>10)
                
            {
                outMap.put(ERROR,QUOTE_ENROLL_DENTAL_MULTI_PLANS);
            }
            /*else if (selectCoverageOutputList == null)
{
outMap.put(ERROR,DENTAL_NO_PLANS);
}*/
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEDENTAL,SG01_Constants.SPACE, Logginglevel.ERROR);}
        
        return true;
    }
    /****************************************************************************************************
* Method Name : validateQuoteVision
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the Quote Vision plans in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateQuoteVision(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options)
    {
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(SEL_VISION_PLANS);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(OUTPUT4);
        Map<String, Object> validationErrJSON = new Map<String, Object>();
        Try{
            if (selectCoverageOutputList!=null && selectCoverageOutputList.size()>10)
                
            {
                outMap.put(ERROR,QUOTE_ENROLL_VISION_MULTI_PLANS);
            }
            /*else if (selectCoverageOutputList == null)
{
outMap.put(ERROR,VISION_NO_PLANS);
}*/
            
            if (validationErrJSON.keySet().size() > 0)
                outMap.put(ERROR, validationErrJSON);
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEVISION,SG01_Constants.SPACE, Logginglevel.ERROR);}
        
        return true;
    }
    
    /****************************************************************************************************
* Method Name : validateZipCode
* Params      : Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options
* Return type : Boolean
* Description : This method is used to validate the Zip Code in newyork omniscript
* ***************************************************************************************************/
    private Boolean validateZipCode(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> zipCodeMap = (Map<String,Object>)inputMap.get(STEP);
        Try
        {
            //Commenting for Broker Search enhancements and adding new screen for license
            /* if(zipCodeMap.get(CHECK_ZIPCODE) != 1){
outMap.put(ERROR,ZIPCODE_ERROR_MSG);
}else{*/
            //calling validateDuplicateAccount method as validateZipCode method is directly calling 
            //from GroupProfileStep to validate the account is dupliate or not
            validateDuplicateAccount(inputMap,outMap,options);
            // }
            
            
        }Catch(Exception ex){UTIL_LoggingService.logHandledException(ex, SG01_Constants.ORGID, SG01_Constants.APPLICATIONNAME,SG01_Constants.CLS_VALIDATESELECTIONSERVICE, SG01_Constants.VALIDATEQUOTEDENTAL, SG01_Constants.BLANK, Logginglevel.ERROR);}
        
        return true;
    }
    /**********************************************************************************************
* Method Name : validateDuplicateAccount
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from validateZipCode method, is used to validate the account is duplicate or not.
*********************************************************************************************/
    private Boolean validateDuplicateAccount(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        /***********************IDC Offshore Code Starts *********************************/
        Map<String,Object> stepMap = (Map<String,Object>)inputMap.get(STEP);
        if(stepMap != NULL && !stepMap.isEmpty()){
            //this block of code is used to check and restrict duplicate account creation.
            Map<String,Object> typeAheadBrokerMap = (Map<String,Object>)stepMap.get(System.Label.SG40_TypeAheadBrokerBlock);
            String brokerId = (String)typeAheadBrokerMap.get(System.Label.SG37_BrokerId);
            String taxId = (String)stepMap.get(System.Label.SG38_TaxId);
            Map<String, Object> validationErrJSON = new Map<String, Object>();
            String duplicateAccountError = System.Label.SG36_DuplicateErrMessage;
            Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get(System.Label.SG_GroupRecordTypeName).getRecordTypeId();
            //retriving the user ids where the user entered broker id matches
            List<User> userList = [select id from User where contactid =:brokerId LIMIT 1];
            //checking the user is present in the user list and the same is exist in any of the account teams
            if(userList != NULL && !userList.isEmpty() && String.isNotBlank(taxId)){
                
                List<AccountTeamMember> accTeamMemList = [SELECT Id FROM AccountTeamMember 
                                                          where Account.Employer_EIN__c =:taxId AND Account.RecordTypeId =:grpRecordTypeId 
                                                          AND TeamMemberRole =:System.Label.SG72_AccountTeamRole and UserId =:userList[0].Id LIMIT 1];
                if(accTeamMemList != NULL && !accTeamMemList.isEmpty()){
                    //outMap.put(System.Label.SG41_Error,duplicateAccountError);
                }
            }
        }
        /***********************IDC Offshore Code Ends *********************************/
        return true;
    }
    
    
     /**********************************************************************************************
* Method Name : validateDuplicateMedicalCACO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in CA/CO enrollment omniscript.
*********************************************************************************************/
    private Boolean validateDuplicateMedicalCACO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        Map<String,Object> selectMedicalBlock = CA_STATE.equalsIgnoreCase(stateValue) ? (Map<String,Object>)selectCoverageMap.get(CA_MED_BLOCK) : NULL;
        String contriOption = selectMedicalBlock != NULL && !selectMedicalBlock.isEmpty() ? (String)selectMedicalBlock.get(MED_CONTRI_MONTH) : BLANK;
        String selectedNetworksinOS = CA_STATE.equalsIgnoreCase(stateValue) ? (String)selectCoverageMap.get(SELECTED_NETWORKS) : (String)BLANK;
        Map<String,Object> selectMedicalMap = (Map<String,Object>)selectCoverageMap.get(SELECT_MEDICAL);
        Integer medicalPlanCount = Integer.valueOf(selectCoverageMap.get(MED_PLAN_COUNT));
        Boolean selectAllCheck = (Boolean)selectCoverageMap.get(SELECT_ALL_PRD);
        Map<String,String> prodIdProdNameMap = new Map<String,String>();
        if(medicalPlanCount > 1){
            List<Object> innerSelectMedicalList = (List<Object>) selectMedicalMap.get(MED_INNER_BLOCK);
            for(Object obj : innerSelectMedicalList){
                
                Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                String contractORProduct = (String)innerSelectMedicalMap.get(CC_MEDICAL);
                String productID = (String)innerSelectMedicalMap.get(PROD_CODE_MED);
                
                if(!prodIdProdNameMap.isEmpty() && prodIdProdNameMap.containsKey(productID) && String.isNotBlank(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    break;
                }else if(String.isNotBlank(productID)){
                    prodIdProdNameMap.put(productID,contractORProduct);
                }
            }
            
            if(stateValue.equalsIgnoreCase(CA_STATE)){
                String selectedContractCode = (String)selectCoverageMap.get(CONTRI_PLAN);
                List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Tech_Prod_Code_Name__c IN:prodIdProdNameMap.keySet() AND Network__c != :BLANK];
                Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(PERCENT_PLAN) ? TRUE : FALSE;
                Boolean isContributionPlanExists = false;
                for(Product2 prodObj : productList){
                    if(selectedNetworksinOS != NULL && !selectedNetworksinOS.contains(prodObj.Network__c)){
                        outMap.put(ERROR,prodObj.ProductCode+SPACE+System.Label.SG143_PlanNotinSelectedNetwork);
                        isContributionPlanExists = true;
                        break;
                    }
                    
                    if(isContributionOption3 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                        isContributionPlanExists = true;
                    }
                }
                
                if(isContributionOption3 && !isContributionPlanExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
                
            }
            
        }else if(medicalPlanCount == 1 && CA_STATE.equalsIgnoreCase(stateValue)){
            String selectedContractCode = (String)selectCoverageMap.get(CONTRI_PLAN);
            Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) selectMedicalMap.get(MED_INNER_BLOCK);
            String contractORProduct = (String)innerSelectMedicalMap.get(CC_MEDICAL);
            String productID = (String)innerSelectMedicalMap.get(PROD_CODE_MED);
            prodIdProdNameMap.put(productID,contractORProduct);
            Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(PERCENT_PLAN) ? TRUE : FALSE;
            Boolean isContributionPlanExists = false;
            List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Tech_Prod_Code_Name__c IN:prodIdProdNameMap.keySet() AND Network__c != :BLANK];
            for(Product2 prodObj : productList){
                
                if(selectedNetworksinOS != NULL && !selectedNetworksinOS.contains(prodObj.Network__c)){
                    outMap.put(ERROR,prodObj.ProductCode+SPACE+System.Label.SG143_PlanNotinSelectedNetwork);
                    isContributionPlanExists = true;
                    break;
                }
                
                if(isContributionOption3 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                    isContributionPlanExists = true;
                }
            }
            if(isContributionOption3 && !isContributionPlanExists){
                outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
            }
        }/*else if(CA_STATE.equalsIgnoreCase(stateValue)){
            Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(PERCENT_PLAN) ? TRUE : FALSE;
            String selectedContractCode = (String)selectCoverageMap.get(CONTRI_PLAN);
            if(String.isNotBlank(selectedContractCode)){
                Boolean isContriExists = new SGA_AP77_CreateAppProducts().createApplicationProducts(inputMap,outMap,options,selectedContractCode);
                if(!isContriExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
            }  
        }*/
        return true;
    }
    
    
    
    /**********************************************************************************************
* Method Name : validateDuplicateDentalCACO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from dental coverage step in CA/CO enrollment omniscript.
*********************************************************************************************/
    private Boolean validateDuplicateDentalCACO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(DENTAL_COVERAGE);
        Map<String,Object> selectDentalMap = (Map<String,Object>)selectCoverageMap.get(SELECT_DENTAL);
        Integer dentalPlanCount = Integer.valueOf(selectCoverageMap.get(DEN_PLAN_COUNT));
        Boolean duplicatePlansSelected = false;
        Boolean isDHMONtwrk = false;
        Boolean notDHMONtwrk = false;
        Map<String,String> prodIdProdNameMap = new Map<String,String>();
        Set<String> productCodes = new Set<String>(); 
        String stateValue = (String)inputMap.get(STATE_VAL);
        String selectedPlanType = CA_STATE.equalsIgnoreCase(stateValue) ? (String)selectCoverageMap.get(DENTAL_TYPE) : BLANK;
        Integer effDate = Integer.valueOf(inputMap.get(EFFECTIVE_YEAR));
        Integer dentalEmpEnrlCount = Integer.valueOf(selectCoverageMap.get(ENROLL_DENT_EMP));
        
        if(dentalPlanCount == 1){
            Map<String,Object> innerDentalMap = (Map<String,Object>)selectDentalMap.get(DEN_INNER_BLOCK);
            String productID = (String)innerDentalMap.get(PROD_CODE_DEN);
            productCodes.add(productID.substringBefore(HYPHEN));
        }
        else if(dentalPlanCount > 1){
            List<Object> innerSelectDentalList = (List<Object>) selectDentalMap.get(DEN_INNER_BLOCK);
            for(Object obj : innerSelectDentalList){
                Map<String,Object> innerSelectDentalMap = (Map<String,Object>) obj;
                String contractORProduct = (String)innerSelectDentalMap.get(CC_DENTAL);
                String productID = (String)innerSelectDentalMap.get(PROD_CODE_DEN);
                if(!prodIdProdNameMap.isEmpty() && prodIdProdNameMap.containsKey(productID) && String.isNotBlank(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    duplicatePlansSelected = true;
                    break;
                }else if(String.isNotBlank(productID)){
                    prodIdProdNameMap.put(productID,contractORProduct);
                    productCodes.add(productID.substringBefore(HYPHEN));
                }
            }
        }
        
        //handiling the code if the user selects different coverage types
        SgPortfolioTypes__c CustomSettingPortfolioTypes = SgPortfolioTypes__c.getValues('DentalVisionSgPortfolioTypes');
        List<String> PortfolioTypes = CustomSettingPortfolioTypes.PortfolioTypeValues__c.split(';');
        if(!productCodes.isEmpty() && !duplicatePlansSelected){
            List<Product2> dentalProdList = [SELECT ID,VoluntaryProduct__c,Tech_Plan_Type__c,Network__c, HIOS_ID__c FROM Product2 WHERE PRODUCTCODE IN:productCodes AND Portfolio_Type__c IN:PortfolioTypes];
            if(CA_STATE.equalsIgnoreCase(stateValue)){
                if((dentalProdList.size() > 1 && selectedPlanType == VOLUNTRY && (dentalProdList[0].VoluntaryProduct__c == NOVALUE || dentalProdList[1].VoluntaryProduct__c == NOVALUE)) 
                   || (dentalProdList.size() == 1 && selectedPlanType == VOLUNTRY && dentalProdList[0].VoluntaryProduct__c == NOVALUE) || 
                   (dentalProdList.size() > 1 && selectedPlanType == EMP_SPONSORED && (dentalProdList[0].VoluntaryProduct__c == YESVALUE || dentalProdList[1].VoluntaryProduct__c == YESVALUE)) 
                   || (dentalProdList.size() == 1 && selectedPlanType == EMP_SPONSORED && dentalProdList[0].VoluntaryProduct__c == YESVALUE)){
                       outMap.put(ERROR,System.Label.SG147_SelectNetworkPlan);
                         
                   }
            }else{
                if(dentalProdList.size() > 1 && dentalProdList[0].VoluntaryProduct__c != dentalProdList[1].VoluntaryProduct__c){
                    outMap.put(ERROR,System.Label.SG140_SelectOneCoverageType);
                }
            }
            //Handling ortho dental errors for ortho products
            for(Product2 dentProd: dentalProdList){
                if(dentProd.HIOS_ID__c == YESVALUE && effDate == 2018 && dentalEmpEnrlCount < 10){
                    outMap.put(ERROR, ORTHOERROR_MSG_10);
                }
                else if(dentProd.HIOS_ID__c == YESVALUE && effDate == 2019 && dentalEmpEnrlCount < 5){
                    outMap.put(ERROR, ORTHOERROR_MSG_5);
                }
                
                if(CA_STATE.equalsIgnoreCase(stateValue) && effDate == 2019 && dentProd.Network__c != null){          
                    if(dentProd.Network__c == DENTALNETHMO){
            isDHMONtwrk = true;
            outMap.put(DHMONTWRK, isDHMONtwrk);
          }
          else{                        
            notDHMONtwrk = true;
            outMap.put(NODHMO, notDHMONtwrk);
          }
        }
                else if(effDate == 2018){                    
                    if(dentProd.Tech_Plan_Type__c == ACADENTAL || dentProd.Tech_Plan_Type__c == DENTALNET ){                        
                        isDHMONtwrk = true;
            outMap.put(DHMONTWRK, isDHMONtwrk);
                    }
                    else if(dentProd.Tech_Plan_Type__c == PNC){                        
                        notDHMONtwrk = true;
            outMap.put(NODHMO, notDHMONtwrk);
                    }
                }
            }
            String dentalPlanTypes = dentalProdList != NULL && dentalProdList.size() > 1 ? dentalProdList[0].Tech_Plan_Type__c +COMMA+dentalProdList[1].Tech_Plan_Type__c : (dentalProdList != NULL && dentalProdList.size() == 1 ? dentalProdList[0].Tech_Plan_Type__c : BLANK);
                outMap.put(DENTAL_PLAN_TYPES,dentalPlanTypes);
        }
        return true;
    }
    /*********************************************************************************************
* Method Name : validateDuplicateVisionCACO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from vision coverage step in CA/CO enrollment omniscript.
*********************************************************************************************/
    private Boolean validateDuplicateVisionCACO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(VISION_COVERAGE);
        Map<String,Object> selectVisionMap = (Map<String,Object>)selectCoverageMap.get(SELECT_VISION);
        Integer visionPlanCount = Integer.valueOf(selectCoverageMap.get(VIS_PLAN_COUNT));
        Map<String,String> prodIdProdNameMap = new Map<String,String>();
        Boolean duplicatePlansSelected = false;
        Set<String> productCodes = new Set<String>(); 
        String selectedPlanType = (String)selectCoverageMap.get(VISION_TYPE);
        
        
        if(visionPlanCount == 1){
            Map<String,Object> innerVisionMap = (Map<String,Object>)selectVisionMap.get(VIS_INNER_BLOCK);
            String productID = (String)innerVisionMap.get(PROD_CODE_VIS);
            productCodes.add(productID.substringBefore(HYPHEN));
        }
        
        if(visionPlanCount > 1){
            List<Object> innerSelectVisionList = (List<Object>) selectVisionMap.get(VIS_INNER_BLOCK);
            for(Object obj : innerSelectVisionList){
                Map<String,Object> innerSelectVisionMap = (Map<String,Object>) obj;
                String contractORProduct = (String)innerSelectVisionMap.get(CC_VISION);
                String productID = (String)innerSelectVisionMap.get(PROD_CODE_VIS);
                if(!prodIdProdNameMap.isEmpty() && prodIdProdNameMap.containsKey(productID) && String.isNotBlank(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    duplicatePlansSelected = true;
                    break;
                }else if(String.isNotBlank(productID)){
                    prodIdProdNameMap.put(productID,contractORProduct);
                    productCodes.add(productID.substringBefore(HYPHEN));
                }
            }
        }
        
        //handiling the code if the user selects different coverage types
        SgPortfolioTypes__c CustomSettingPortfolioTypes = SgPortfolioTypes__c.getValues('DentalVisionSgPortfolioTypes');
        List<String> PortfolioTypes = CustomSettingPortfolioTypes.PortfolioTypeValues__c.split(';');
        if(!productCodes.isEmpty() && !duplicatePlansSelected){
            List<Product2> visionProdList = [SELECT ID,VoluntaryProduct__c FROM Product2 WHERE PRODUCTCODE IN:productCodes AND Portfolio_Type__c IN:PortfolioTypes];
            if((visionProdList.size() > 1 && selectedPlanType == VOLUNTRY && (visionProdList[0].VoluntaryProduct__c == NOVALUE || visionProdList[1].VoluntaryProduct__c == NOVALUE)) 
               || (visionProdList.size() == 1 && selectedPlanType == VOLUNTRY && visionProdList[0].VoluntaryProduct__c == NOVALUE) || 
               (visionProdList.size() > 1 && selectedPlanType == EMP_SPONSORED && (visionProdList[0].VoluntaryProduct__c == YESVALUE || visionProdList[1].VoluntaryProduct__c == YESVALUE)) 
               || (visionProdList.size() == 1 && selectedPlanType == EMP_SPONSORED && visionProdList[0].VoluntaryProduct__c == YESVALUE)){
                   outMap.put(ERROR,System.Label.SG147_SelectNetworkPlan);
                   
               }
            
        }
        return true;
    }
    
    /*********************************************************************************************
* Method Name : validatePaymentInfoCACO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from payment info step to validate the payment info.
*********************************************************************************************/
    private Boolean validatePaymentInfoCACO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Map<String,Object> paymentInfoStep = (Map<String,Object>)inputMap.get(PAYMENT);
        String paymentSelected = (String)paymentInfoStep.get(PAYMENT_INFO);
        
        if(YES.equalsIgnoreCase(paymentSelected)){
            String appId = (String)inputMap.get(APP_ID);
            if(String.isNotBlank(appId)){
                vlocity_ins__Application__c appObj = [select Id, Payment_Status__c from vlocity_ins__Application__c where Id=:appId limit 1];
                if(!SUCCESS.equalsIgnoreCase(appObj.Payment_Status__c)){
                    outMap.put(ERROR,System.Label.SGA132_PaymentInfoError);
                }
            }
        }
        
        return true;
    }
    
    /**********************************************************************************************
* Method Name : validateDuplicateMedicalVAGAMO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in CA/CO enrollment omniscript.
*********************************************************************************************/
    private Boolean validateDuplicateMedicalVAGAMO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        Map<String,Object> selectMedicalMap = (Map<String,Object>)selectCoverageMap.get(SELECT_MEDICAL);
        Integer medicalPlanCount = Integer.valueOf(selectCoverageMap.get(MED_PLAN_COUNT));
        Integer BlueMedicalPlansCount = Integer.valueOf(selectCoverageMap.get(BLUEMEDPLANCOUNT));
        Integer PathwayMedicalPlansCount = Integer.valueOf(selectCoverageMap.get(PATHWAYMEDPLANCOUNT));
        Integer HMOMedicalPlansCount = Integer.valueOf(selectCoverageMap.get(HMOMEDPLANCOUNT));
        Map<String,String> prodIdProdNameMap = new Map<String,String>();
        Set<String> productSet = new Set<String>();

        /* SMGR-25637 VA -Require Non EPO Plan Selection When an EPO Plan is Selected */
        if (VA_STATE.equalsIgnoreCase(stateValue)) {
            Boolean isEPOSelected = false;
            Boolean isNonEPOSelected = false;
            
            List<Object> innerSelectMedicalList = new List<Object>();
            
            if (selectMedicalMap.get(MED_INNER_BLOCK) instanceof List<Object>) {
                innerSelectMedicalList = (List<Object>) selectMedicalMap.get(MED_INNER_BLOCK);
            } else {
                Object obj = selectMedicalMap.get(MED_INNER_BLOCK);
                innerSelectMedicalList.add(obj);
            }
            
            for(Object obj : innerSelectMedicalList){
                Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                String productName = (String)innerSelectMedicalMap.get(SELECTED_MEDICAL_PLAN);
                
                 if (String.isNotBlank(productName)){
                    if(productName.contains('EPO')) { 
                        isEPOSelected = true;
                    }
                    if (productName.contains('PPO') || productName.contains('POS') || productName.contains('HMO')) {
                        isNonEPOSelected = true; 
                    }  
                }       
            }
            
            if (isEPOSelected && !isNonEPOSelected) {  
                 outMap.put(ERROR,EPO_ONLY_SELECTED);
            }
        }
        
        if(medicalPlanCount > 1 && (VA_STATE.equalsIgnoreCase(stateValue) || MO_STATE.equalsIgnoreCase(stateValue)))
        {
            List<Object> innerSelectMedicalList = (List<Object>) selectMedicalMap.get(INNERSELECTMEDVAMO);
            for(Object obj : innerSelectMedicalList){
                Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                String contractORProduct = (String)innerSelectMedicalMap.get(CC_MEDICAL);
                String productID = (String)innerSelectMedicalMap.get(PROD_CODE_MED);
                if(String.isNotBlank(productID) && productSet.contains(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    break;
                }else{
                    productSet.add(productID);
                }
            }
        }else if(GA_STATE.equalsIgnoreCase(stateValue) && (BlueMedicalPlansCount >= 1 || PathwayMedicalPlansCount >= 1 || HMOMedicalPlansCount >= 1)){
            Map<String,Object> innerMedicalMap = (Map<String,Object>)selectMedicalMap.get(INNERSELECTMEDGA);
            if(BlueMedicalPlansCount > 1){
                List<Object> blueMedicalList = (List<Object>)innerMedicalMap.get(POSBLUEBLK);
                for(Object obj : blueMedicalList){
                    Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                    String productID1 = (String)innerSelectMedicalMap.get(BLUESELPRODLOOKUPMED);
                    if(String.isNotBlank(productID1) && productSet.contains(productID1)){
                        outMap.put(ERROR,DUPLICATE_PLANS);
                        break;
                    }else{
                        productSet.add(productID1);
                    }
                }
            }else if(BlueMedicalPlansCount == 1){
                string productId1 = checkPlanSelectedGA(innerMedicalMap, BLUESELPRODLOOKUPMED, POSBLUEBLK);
                productSet.add(productID1);
            }
            if(PathwayMedicalPlansCount > 1){
                List<Object> pathWayMedicalList = (List<Object>)innerMedicalMap.get(POSPATHWAYBLK);
                for(Object obj : pathWayMedicalList){
                    Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                    String productID1 = (String)innerSelectMedicalMap.get(PATHWAYSELPRDLOOKUPMED);
                    if(String.isNotBlank(productID1) && productSet.contains(productID1)){
                        outMap.put(ERROR,DUPLICATE_PLANS);
                        break;
                    }else{
                        productSet.add(productID1);
                    }
                }
            }else if(PathwayMedicalPlansCount == 1){
                string productId1 = checkPlanSelectedGA(innerMedicalMap, PATHWAYSELPRDLOOKUPMED, POSPATHWAYBLK);
                productSet.add(productID1);
            }
            if(HMOMedicalPlansCount > 1){
                List<Object> blueHMOMedicalList = (List<Object>)innerMedicalMap.get(HMOBLUEBLK);
                for(Object obj : blueHMOMedicalList){
                    Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                    String productID1 = (String)innerSelectMedicalMap.get(HMOSELPRDLOOKUPMED);
                    if(String.isNotBlank(productID1) && productSet.contains(productID1)){
                        outMap.put(ERROR,DUPLICATE_PLANS);
                        break;
                    }else{
                        productSet.add(productID1);
                    }
                }
            }else if(HMOMedicalPlansCount == 1){
                string productId1 = checkPlanSelectedGA(innerMedicalMap, HMOSELPRDLOOKUPMED, HMOBLUEBLK);
                productSet.add(productID1);
            }
        }
        if(!productSet.isEmpty()){
            String selectedContractCode = (String)selectCoverageMap.get(GACONTRIBUTIONPLAN);
            String contriOption = (String)selectCoverageMap.get(GAMEDCONTRITYPE);
            List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Tech_Prod_Code_Name__c IN:productSet ];
            Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(POP) ? TRUE : FALSE;
            Boolean isContributionPlanExists = false;
            for(Product2 prodObj : productList){
                   if(isContributionOption3 || selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                    isContributionPlanExists = true;
                }
            }
            if(isContributionOption3 && !isContributionPlanExists){
                outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
            }
        }
        return true;
    }
    /**********************************************************************************************
* Method Name : validateProductselectedGA
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in GAVAAMOenrollment omniscript.In GA Omniscript
                It Validates the product selected is same as that of product enterd in in Plan TextBox
*********************************************************************************************/
    private Boolean validateProductselectedGA(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE_WQ);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);
        Set<String> productSet = new Set<String>();
       
        if(selectCoverageOutputList.size() >= 1 && (GA_STATE.equalsIgnoreCase(stateValue)))
        {
            for(Object obj : selectCoverageOutputList){
                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;
                String contractORProduct = (String)selectCoverageOutputMap.get(PRODUCTCODES);
                String productID = (String)selectCoverageOutputMap.get(IDVAR);
                productSet.add(productID);
                   
             }      
            if(!productSet.isEmpty()){
                String selectedContractCode = (String)selectCoverageMap.get(GACONTRIBUTIONPLAN_WQ);
                String contriOption = (String)selectCoverageMap.get(GAMEDCONTRITYPE_WQ);
                List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Id IN:productSet];          
                Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(POP) ? TRUE : FALSE;
                Boolean isContributionPlanExists = false;
                for(Product2 prodObj : productList){
                    if(isContributionOption3 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                        isContributionPlanExists = true;
                    }
                }
                if(isContributionOption3 && !isContributionPlanExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
            }
        }
        
       /* SMGR-25637 VA -Require Non EPO Plan Selection When an EPO Plan is Selected */
       if (selectCoverageOutputList.size() >= 1 && (VA_STATE.equalsIgnoreCase(stateValue))) {
            Boolean isEPOSelected = false;
            Boolean isNonEPOSelected = false;
           
            for(Object obj : selectCoverageOutputList) {
                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;
                
                String productName = (String)selectCoverageOutputMap.get(NAME);
                Boolean isProductSelected = (Boolean)selectCoverageOutputMap.get(VLC_SELECTED);
                
                 if(String.isNotBlank(productName) && isProductSelected) {
                    if(productName.contains('EPO')) { 
                        isEPOSelected = true;
                    }
                    if(productName.contains('PPO') || productName.contains('POS') || productName.contains('HMO')) {
                        isNonEPOSelected = true;  
                    }
                }
            }
            
            if(isEPOSelected && !isNonEPOSelected) {
                 outMap.put(ERROR,EPO_ONLY_SELECTED);
            }
        }
        return true;
        
    }
    /**********************************************************************************************
* Method Name : validateDuplicateDentalOHKYINVAGAMO
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from dental coverage step in OH/IN/KY/VA/GA/MO/NV enrollment omniscript.
*********************************************************************************************/
    private Boolean validateDuplicateDentalOHKYINVAGAMO(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(DENTAL_COVERAGE);
        Map<String,Object> selectDentalMap = (Map<String,Object>)selectCoverageMap.get(SELECT_DENTAL);
        Integer dentalPlanCount = Integer.valueOf(selectCoverageMap.get(DEN_PLAN_COUNT));
        Integer dentalEmpEnrlCount = Integer.valueOf(selectCoverageMap.get(ENROLL_DENT_EMP));
        Integer effDate = Integer.valueOf(inputMap.get(EFFECTIVE_YEAR));
        Boolean duplicatePlansSelected = false;
        Set<String> productCodes = new Set<String>();
        SgPortfolioTypes__c CustomSettingPortfolioTypes = SgPortfolioTypes__c.getValues('DentalVisionSgPortfolioTypes');
        List<String> PortfolioTypes = CustomSettingPortfolioTypes.PortfolioTypeValues__c.split(';');
        
        if(dentalPlanCount > 1){
            List<Object> innerSelectDentalList = (List<Object>) selectDentalMap.get(DEN_INNER_BLOCK);
            Set<String> productIdSet = new Set<String>();
            for(Object obj : innerSelectDentalList){
                Map<String,Object> innerSelectDentalMap = (Map<String,Object>) obj;
                String productID = (String)innerSelectDentalMap.get(DEN_PRD_ID);
                String productCode = (String)innerSelectDentalMap.get(DEN_CON_CODE);
                if(String.isNotBlank(productID) && productIdSet.contains(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    duplicatePlansSelected = true;
                    break;
                }else if(String.isNotBlank(productID)){
                    productCodes.add(productCode);
                    productIdSet.add(productID);
                }
            }                                                
            if(!productCodes.isEmpty() && !duplicatePlansSelected){
                List<Product2> dentalProdList = [SELECT ID,VoluntaryProduct__c, HIOS_ID__c FROM Product2 WHERE PRODUCTCODE IN:productCodes AND Portfolio_Type__c IN:PortfolioTypes];
                if(dentalProdList != null && dentalProdList.size() > 1 && dentalProdList[0].VoluntaryProduct__c != dentalProdList[1].VoluntaryProduct__c){
                    outMap.put(ERROR,System.Label.SG140_SelectOneCoverageType);
                }
                for(Product2 dentProd: dentalProdList){
                    if(dentProd.HIOS_ID__c == YESVALUE && effDate == 2018 && dentalEmpEnrlCount < 10 && !NVSTATE.equalsIgnoreCase(stateValue)){
                        outMap.put(ERROR,ORTHOERROR_MSG_10);
                    }
                    else if(((effDate == 2019  && !NVSTATE.equalsIgnoreCase(stateValue)) || NVSTATE.equalsIgnoreCase(stateValue) ) && dentProd.HIOS_ID__c == YESVALUE && dentalEmpEnrlCount < 5){
                        outMap.put(ERROR,ORTHOERROR_MSG_5);
                    }
                }
            }
        }else if(dentalPlanCount == 1){
            object innerMapObj = (object)selectDentalMap.get(DEN_INNER_BLOCK);
            map<string,object> innerDentMap = (map<string,object>)innerMapObj;
            Set<String> productIdSet = new Set<String>();
            
            String productID = (String)innerDentMap.get(DEN_PRD_ID);
            String productCode = (String)innerDentMap.get(DEN_CON_CODE);
            if(String.isNotBlank(productID)){
                productCodes.add(productCode);
                productIdSet.add(productID);
            }
            if(!productCodes.isEmpty()){
                List<Product2> dentalProdList = [SELECT ID,VoluntaryProduct__c, HIOS_ID__c FROM Product2 WHERE PRODUCTCODE IN:productCodes AND Portfolio_Type__c IN:PortfolioTypes];
                if(dentalProdList != null && dentalProdList.size() > 1 && dentalProdList[0].VoluntaryProduct__c != dentalProdList[1].VoluntaryProduct__c){
                    outMap.put(ERROR,System.Label.SG140_SelectOneCoverageType);
                }
                for(Product2 dentProd: dentalProdList){
                    if(dentProd.HIOS_ID__c == YESVALUE && effDate == 2018 && dentalEmpEnrlCount < 10 && !NVSTATE.equalsIgnoreCase(stateValue)){
                        outMap.put(ERROR,ORTHOERROR_MSG_10);
                    }
                    else if(((effDate == 2019  && !NVSTATE.equalsIgnoreCase(stateValue)) || NVSTATE.equalsIgnoreCase(stateValue) ) && dentProd.HIOS_ID__c == YESVALUE && dentalEmpEnrlCount < 5){
                        outMap.put(ERROR, ORTHOERROR_MSG_5);
                    }
                }
            }  
        }
        return true;
    }
    
    /**********************************************************************************************
* Method Name : checkPlanSelectedGA
* Parameters  : Map<String,Object> innerMedicalMap,  string coverageBlk
* Return Type : String
* Description : This method is used to get the product code for GA products
*********************************************************************************************/
    private String checkPlanSelectedGA(Map<String,Object> innerMedicalMap, string coverageOptn, string coverageBlk){    
        Map<String,Object> selectedPrdMap = (Map<String,Object>)innerMedicalMap.get(coverageBlk);
        String productID1 = (String)selectedPrdMap.get(coverageOptn);
        return productID1;
    }
    
    /**********************************************************************************************
* Method Name : validateDuplicateMedicalOHKYIN
* Parameters  : Map<String,Object> innerMedicalMap,  string coverageBlk
* Return Type : String
* Description : This method is used to get the product code for KY products
*********************************************************************************************/
    private Boolean validateDuplicateMedicalOHKYIN(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
         
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE);
        Map<String,Object> selectMedicalMap = (Map<String,Object>)selectCoverageMap.get(SELECT_MEDICAL);
        Integer medicalPlanCount = Integer.valueOf(selectCoverageMap.get(MED_PLAN_COUNT));
        Integer POSBlueBlockCount = Integer.valueOf(selectCoverageMap.get(POSBLUEMEDPLANCOUNT));
        Integer POSPathwayBlockCount = Integer.valueOf(selectCoverageMap.get(POSPATHWAYMEDPLANCOUNT));
        Integer HMOPathwayCount = Integer.valueOf(selectCoverageMap.get(HMOPATHWAYCOUNT));
        Integer PathwayTransitionCount = Integer.valueOf(selectCoverageMap.get(HMOPATHWAYTRANSITION));
        Map<String,String> prodIdProdNameMap = new Map<String,String>();
        Map<String,Object> innerMedicalMap = new Map<String,Object>();
        Set<String> productSet = new Set<String>();
      
        if(medicalPlanCount > 1 && (OH_STATE.equalsIgnoreCase(stateValue) || IN_STATE.equalsIgnoreCase(stateValue)))
        {
            List<Object> innerSelectMedicalList = (List<Object>) selectMedicalMap.get(INNERSELECTMEDOHIN);
           
            for(Object obj : innerSelectMedicalList){
                Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                String contractORProduct = (String)innerSelectMedicalMap.get(CC_MEDICAL);
                String productID = (String)innerSelectMedicalMap.get(PROD_CODE_MED);
             
                if(String.isNotBlank(productID) && productSet.contains(productID)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    break;
                }else{
                    productSet.add(productID);
                }
            }
        }else if(KY_STATE.equalsIgnoreCase(stateValue)){
      innerMedicalMap = (Map<String,Object>)selectMedicalMap.get(INNERSELECTMEDKY);
      if(POSBlueBlockCount > 1){
        List<Object> blueMedicalList = (List<Object>)innerMedicalMap.get(POSBLUEBLKKY);
                for(Object obj : blueMedicalList){
                    Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                    String productID1 = (String)innerSelectMedicalMap.get(BLUESELPRODLOOKUPMEDKY);
                    if(String.isNotBlank(productID1) && productSet.contains(productID1)){
                        outMap.put(ERROR,DUPLICATE_PLANS);
                       
                        break;
                    }else{
                        productSet.add(productID1);
                    }
                }  
      }else if(POSBlueBlockCount == 1){
        string productId1 = checkPlanSelectedKY(innerMedicalMap, BLUESELPRODLOOKUPMEDKY, POSBLUEBLKKY);
        productSet.add(productID1);
      }
      
      if(POSPathwayBlockCount > 1){
        List<Object> pathWayMedicalList = (List<Object>)innerMedicalMap.get(POSPATHWAYBLKKY);
        for(Object obj : pathWayMedicalList){
          Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
          String productID1 = (String)innerSelectMedicalMap.get(PATHWAYSELPRDLOOKUPMEDKY);
          if(String.isNotBlank(productID1) && productSet.contains(productID1)){
            outMap.put(ERROR,DUPLICATE_PLANS);
            break;
          }else{
            productSet.add(productID1);
          }
        }
      }else if(POSPathwayBlockCount == 1){
        string productId1 = checkPlanSelectedKY(innerMedicalMap, PATHWAYSELPRDLOOKUPMEDKY, POSPATHWAYBLKKY);
        productSet.add(productID1);
      }
      
      if(HMOPathwayCount > 1){
            List<Object> blueHMOMedicalList = (List<Object>)innerMedicalMap.get(HMOBLUEBLKKY);
            for(Object obj : blueHMOMedicalList){
                Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
                String productID1 = (String)innerSelectMedicalMap.get(HMOSELPRDLOOKUPMEDKY);
              
                if(String.isNotBlank(productID1) && productSet.contains(productID1)){
                    outMap.put(ERROR,DUPLICATE_PLANS);
                    break;
                }else{
                    productSet.add(productID1);
                }
            }
      }else if(HMOPathwayCount == 1){
        string productId1 = checkPlanSelectedKY(innerMedicalMap, HMOSELPRDLOOKUPMEDKY, HMOBLUEBLKKY);
        productSet.add(productID1);
      }
      if(PathwayTransitionCount > 1){
        List<Object> blueHMOMedicalList = (List<Object>)innerMedicalMap.get(PATHWAYTRANSITIONBLKKY);
        for(Object obj : blueHMOMedicalList){
          Map<String,Object> innerSelectMedicalMap = (Map<String,Object>) obj;
          String productID1 = (String)innerSelectMedicalMap.get(PATHWAYTRANSITIONLOOKUPMEDKY);
          if(String.isNotBlank(productID1) && productSet.contains(productID1)){
            outMap.put(ERROR,DUPLICATE_PLANS);
            break;
          }else{
            productSet.add(productID1);
          }
        }
      }else if(PathwayTransitionCount == 1){
        string productId1 = checkPlanSelectedKY(innerMedicalMap, PATHWAYTRANSITIONLOOKUPMEDKY, PATHWAYTRANSITIONBLKKY);
        productSet.add(productID1);
      }
      
    }      
        return true;
    }
    
    
    /**********************************************************************************************
    * Method Name : checkPlanSelectedKY
    * Parameters  : Map<String,Object> innerMedicalMap,  string coverageBlk
    * Return Type : String
    * Description : This method is used to get the product code for KY products
    *********************************************************************************************/
    private String checkPlanSelectedKY(Map<String,Object> innerMedicalMap, string coverageOptn, string coverageBlk){    
        Map<String,Object> selectedPrdMap = (Map<String,Object>)innerMedicalMap.get(coverageBlk);
        String productID1 = (String)selectedPrdMap.get(coverageOptn);
        return productID1;
    }
   /**********************************************************************************************
* Method Name : validateProductselectedNV
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in WINVenrollment omniscript with Quote.In NV Omniscript
                It Validates the product selected is same as that of product enterd in in Plan TextBox
*********************************************************************************************/
    private Boolean validateProductselectedNV(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE_WQ);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);
        Set<String> productSet = new Set<String>();
       
        if(selectCoverageOutputList.size() >= 1 && (NVSTATE.equalsIgnoreCase(stateValue)))
        {
            for(Object obj : selectCoverageOutputList){
                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;
                String contractORProduct = (String)selectCoverageOutputMap.get(PRODUCTCODES);
                String productID = (String)selectCoverageOutputMap.get(IDVAR);
                productSet.add(productID);
                   
             }      
            if(!productSet.isEmpty()){
                String selectedContractCode = (String)selectCoverageMap.get(NVPERCENTPLAN);
                String contriOption = (String)selectCoverageMap.get(NVMEDCONTREACHMONTHQ);
                List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Id IN:productSet];          
                Boolean isContributionOption2 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(PERCENT_PLAN) ? TRUE : FALSE;
                Boolean isContributionPlanExists = false;
                for(Product2 prodObj : productList){
                    if(isContributionOption2 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                        isContributionPlanExists = true;
                    }
                }
                if(isContributionOption2 && !isContributionPlanExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
            }
        }
        return true;
        
    }
     /**********************************************************************************************
* Method Name : validateProductselectedOH
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in OHKYINenrollment omniscript.In OH Omniscript
                It Validates the product selected is same as that of product enterd in in Plan TextBox
*********************************************************************************************/
    private Boolean validateProductselectedOH(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE_WQ);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);
        Set<String> productSet = new Set<String>();
       
         if(selectCoverageOutputList.size() >= 1 && ((OH_STATE.equalsIgnoreCase(stateValue))||(IN_STATE.equalsIgnoreCase(stateValue))))
        {
            for(Object obj : selectCoverageOutputList){
                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;
                String contractORProduct = (String)selectCoverageOutputMap.get(PRODUCTCODES);
                String productID = (String)selectCoverageOutputMap.get(IDVAR);
                productSet.add(productID);
                   
             }      
            if(!productSet.isEmpty()){
                String selectedContractCode = (String)selectCoverageMap.get(OHINCONTRIBUTIONPLAN_WQ);
                String contriOption = (String)selectCoverageMap.get(OHINMEDCONTRITYPE_WQ);
                List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Id IN:productSet];          
                Boolean isContributionOption3 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(POP) ? TRUE : FALSE;
                Boolean isContributionPlanExists = false;
                for(Product2 prodObj : productList){
                    if(isContributionOption3 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                        isContributionPlanExists = true;
                    }
                }
                if(isContributionOption3 && !isContributionPlanExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
            }
        }
        return true;
        
    }
/**********************************************************************************************
* Method Name : validateProductselectedCA
* Parameters  : Map<String,Object>,Map<String,Object>,Map<String,Object>
* Return Type : Boolean
* Description : This method is calling from medical coverage step in CACOVenrollment omniscript with Quote.In CA Omniscript
                It Validates the product selected is same as that of product enterd in in Plan TextBox
*********************************************************************************************/
    private Boolean validateProductselectedCA(Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        String stateValue = (String)inputMap.get(STATE_VAL);
        Map<String,Object> selectCoverageMap = (Map<String,Object>)inputMap.get(MEDICAL_COVERAGE_WQ);
        List<Object> selectCoverageOutputList = (List<Object>) selectCoverageMap.get(MEDICAL_ACCOUNTS);
        Map<String,Object> selectCoverageMapCAMedBlock = (Map<String,Object>)selectCoverageMap.get(CA_MED_BLOCK_WQ);
        Set<String> productSet = new Set<String>();
       
        if(selectCoverageOutputList.size() >= 1 && (CA_STATE.equalsIgnoreCase(stateValue)))
        {
            for(Object obj : selectCoverageOutputList){
                Map<String,Object> selectCoverageOutputMap = (Map<String,Object>) obj;
                String contractORProduct = (String)selectCoverageOutputMap.get(PRODUCTCODES);
                String productID = (String)selectCoverageOutputMap.get(IDVAR);
                productSet.add(productID);
                   
             }      
            if(!productSet.isEmpty()){
                String selectedContractCode = (String)selectCoverageMapCAMedBlock.get(CAPERCENTPLAN);
                String contriOption = (String)selectCoverageMapCAMedBlock.get(CA_MED_CONTRI_WQ);
                List<Product2> productList = [select Id,Name,ProductCode,Network__c from Product2 Where Id IN:productSet];          
                Boolean isContributionOption2 = String.isNotBlank(contriOption) && contriOption.equalsIgnoreCase(PERCENT_PLAN) ? TRUE : FALSE;
                Boolean isContributionPlanExists = false;
                for(Product2 prodObj : productList){
                    if(isContributionOption2 && selectedContractCode.equalsIgnoreCase(prodObj.ProductCode)){
                        isContributionPlanExists = true;
                    }
                }
                if(isContributionOption2 && !isContributionPlanExists){
                    outMap.put(ERROR,System.Label.SG146_ContributionNotExists);
                }
            }
        }
        return true;
        
    }
   
   }