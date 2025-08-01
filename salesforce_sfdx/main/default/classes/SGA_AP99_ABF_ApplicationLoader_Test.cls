/****************************************************************************************************
* Class Name  : SGA_AP99_ABF_ApplicationLoader_Test
* Description : This is the test class for SGA_AP99_ABF_ApplicationLoader class
* Developed By: Vikings Team
* ***************************************************************************************************/   

@isTest(SeeAllData=false)
private class SGA_AP99_ABF_ApplicationLoader_Test{

    private static final string DATAJSN = '{"Application Id":"a208D0000009ut1QAA","EmployerInformation":"EmployerInformation","CoverageBenefitDesign":"CoverageBenefitDesign","DentalCoverage":"DentalCoverage","DentalCoverageNQ":"DentalCoverageNQ","VisionCoverage":"VisionCoverage","VisionCoverageNQ":"VisionCoverageNQ","SelectedLAndDCoverage":"SelectedLAndDCoverage","Eligibility":"Eligibility","ApplicationInfo":"ApplicationInfo","BrokerSalesInformation":"BrokerSalesInformation","GeneralAgreementVA_AnthemClient":"GeneralAgreementVA_AnthemClient","Ownership1":"Ownership1","EmployeeSponsoredCheck":"EmployeeSponsoredCheck","NoDentalCoverage1":"NoDentalCoverage1","NoLife":"NoLife","NoVisionCoverage1":"NoVisionCoverage1","VisionEmployeecheck":"VisionEmployeecheck","VisionEmployerSponsership":"VisionEmployerSponsership","VisionVoluntaryCheck":"VisionVoluntaryCheck","VisionVoluntaryProduct":"VisionVoluntaryProduct","VoluntaryCheck":"VoluntaryCheck","WithQuote":"WithQuote","ABFState":"ABFState","MedicalPlan1":"MedicalPlan1","MedicalPlan2":"MedicalPlan2","MedicalPlan3":"MedicalPlan3","MedicalPlan4":"MedicalPlan4","MedicalPlan5":"MedicalPlan5","MedicalPlan6":"MedicalPlan6","MedicalPlanNQ1":"MedicalPlanNQ1","MedicalPlanNQ2":"MedicalPlanNQ2","MedicalPlanNQ3":"MedicalPlanNQ3","MedicalPlanNQ4":"MedicalPlanNQ4","MedicalPlanNQ5":"MedicalPlanNQ5","MedicalPlanNQ6":"MedicalPlanNQ6","CountyCode":"CountyCode","checkAnthemClientOrNot":"checkAnthemClientOrNot","QuoteId":"QuoteId","ContributionBlock1":"ContributionBlock1","ContributionBlock2":"ContributionBlock2","ContributionBlock3":"ContributionBlock3","ContributionBlock4":"ContributionBlock4","ContributionBlock5":"ContributionBlock5","ContributionBlock6":"ContributionBlock6"}';
    private static final string APP_NAME = 'Small Group Application for TEST DEC 4 Effective: Jan 1 2017';
    private static final string WRITING_BR_EMAIL = 'rmup@vlocity.com';
    private static final string CONTEXT_ID = 'ContextId';
    private static final string LOAD_DATA = 'loadData';
    
    /****************************************************************************************************
    * Method Name : applicationLoaderTestMethod
    * Description : This is the test method to test the resend docuSign functionality 
    * ***************************************************************************************************/   
     
    static testMethod void applicationLoaderTestMethod(){
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            SGA_AP99_ABF_ApplicationLoader app = new SGA_AP99_ABF_ApplicationLoader();
            vlocity_ins__Application__c appobj = new vlocity_ins__Application__c();
            appobj.Name = APP_NAME;
            appobj.Writing_Broker_Email_ID__c = WRITING_BR_EMAIL;
            appobj.vlocity_ins__JSONData__c = DATAJSN;
            insert appobj;
            
            Map<String,Object> inputMap = new Map<String, Object>{CONTEXT_ID => appobj.Id};
            Map<String,Object> outMap = new Map<String, Object>();
            Map<String,Object> options= new Map<String, Object>(); 
            Test.startTest();
            Boolean returnValue = app.invokeMethod(LOAD_DATA,inputMap, outMap, options);
            Test.stopTest();
        }
    }
}