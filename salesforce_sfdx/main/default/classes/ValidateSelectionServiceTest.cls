@isTest(seeAllData = false)
public class ValidateSelectionServiceTest{
    public testmethod static void ValidateSelectionServiceTestMethod(){     
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> DentalinputMap = new Map<String,Object>();
        Map<String,Object> VisioninputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        Map<String,Object> SelectMedicalinputMap = new Map<String,Object>();
        Map<String,Object> SelectedMedicalinputMap = new Map<String,Object>();
        Map<String,Object> SelectDentalinputMap = new Map<String,Object>();
        Map<String,Object> SelectVisioninputMap = new Map<String,Object>();
        Map<String,Object> ZipCodeinputMap = new Map<String,Object>();
        Map<String,Object> DuplicateAccountinputMap = new Map<String,Object>();
        Map<String,Object> MedicalEmptyinputMap = new Map<String,Object>();
        Map<String,Object> DentalEmptyinputMap = new Map<String,Object>();
        Map<String,Object> VisionEmptyinputMap = new Map<String,Object>();
        Map<String,Object> SelectMedicalEmptyinputMap = new Map<String,Object>();
        Map<String,Object> SelectDentalEmptyinputMap = new Map<String,Object>();
        Map<String,Object> SelectVisionEmptyinputMap = new Map<String,Object>();
        
        Map<String,Object> landDInputMap = new Map<String,Object>();
        Map<String,Object> SelectedLAndDCoverage = new Map<String,Object>();
        Map<String,Object> LandDWithQuote = new Map<String,Object>();
        Map<String,Object> LifeBlk = new Map<String,Object>();
        Map<String,Object> DisabilityBlk = new Map<String,Object>();
        Map<String,Object> LDLifeDisabilityWaitingPeriodBlock = new Map<String,Object>();
        
        
        LifeBlk.put('LDBasicLife', true);
        DisabilityBlk.put('DisabilityShortTerm',true);
        LandDWithQuote.put('LifeBlk', LifeBlk);
        LandDWithQuote.put('DisabilityBlk', DisabilityBlk);
        LDLifeDisabilityWaitingPeriodBlock.put('LDLifeDisabilityClassNumber', '1');
        LDLifeDisabilityWaitingPeriodBlock.put('LDCoverageDescription', 'DisabilityPrdVoluntaryLong');
        SelectedLAndDCoverage.put('LandDWithQuote', LandDWithQuote);
        
        
        SelectedLAndDCoverage.put('LDLifeDisabilityWaitingPeriodBlock', LDLifeDisabilityWaitingPeriodBlock);
        
        landDInputMap.put('SelectedLAndDCoverage', SelectedLAndDCoverage);
        landDInputMap.put('WithQuote', true);
        
        Product2 prod = new Product2(Name = 'Test Product');
        List<Product2> MedicalAccounts =  new List<Product2>();
        List<Product2> DentalAccounts =  new List<Product2>();
        List<Product2> VisionAccounts =  new List<Product2>();
        
        List<Product2> EmptyAccounts =  null;
        Boolean Rider29Prod = true;
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> DentalCoverage = new Map<String,Object>();
        Map<String,Object> VisionCoverage = new Map<String,Object>();
        Map<String,Object> SelectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> SelectedMedicalCoverage = new Map<String,Object>();
        Map<String,Object> SelectDentalCoverage = new Map<String,Object>();
        Map<String,Object> SelectVisionCoverage = new Map<String,Object>();
        Map<String,Object> MedicalEmptyCoverage = new Map<String,Object>();
        Map<String,Object> DentalEmptyCoverage = new Map<String,Object>();
        Map<String,Object> VisionEmptyCoverage = new Map<String,Object>();
        Map<String,Object> SelectMedicalEmptyCoverage = new Map<String,Object>();
        Map<String,Object> SelectDentalEmptyCoverage = new Map<String,Object>();
        Map<String,Object> SelectVisionEmptyCoverage = new Map<String,Object>();
        
        MedicalAccounts.add(prod);
        MedicalAccounts.add(prod);
        MedicalAccounts.add(prod);
        MedicalAccounts.add(prod);
        MedicalCoverage.put('MedicalAccounts', MedicalAccounts);
        MedicalinputMap.put('MedicalCoverage', MedicalCoverage);
        SelectMedicalCoverage.put('output2', MedicalAccounts);
        SelectedMedicalCoverage.put('isConflictRider29Plans', Rider29Prod);
        SelectedMedicalinputMap.put('SelectMedicalCoverage', SelectedMedicalCoverage);
        SelectMedicalinputMap.put('SelectMedicalCoverage', SelectMedicalCoverage);
        MedicalEmptyCoverage.put('MedicalAccounts', EmptyAccounts);
        MedicalEmptyinputMap.put('MedicalCoverage', MedicalEmptyCoverage);
        SelectMedicalEmptyCoverage.put('output2', EmptyAccounts);
        SelectMedicalEmptyinputMap.put('SelectMedicalCoverage', SelectMedicalEmptyCoverage);
        
        DentalAccounts.add(prod);
        DentalAccounts.add(prod);
        DentalAccounts.add(prod);
        DentalCoverage.put('DentalAccounts', DentalAccounts);
        DentalinputMap.put('DentalCoverage', DentalCoverage);
        SelectDentalCoverage.put('output3', DentalAccounts);
        SelectDentalinputMap.put('SelectDentalPlans', SelectDentalCoverage);
        DentalEmptyCoverage.put('DentalAccounts', EmptyAccounts);
        DentalEmptyinputMap.put('DentalCoverage', DentalEmptyCoverage);
        SelectDentalEmptyCoverage.put('output3', EmptyAccounts);
        SelectDentalEmptyinputMap.put('SelectDentalPlans', SelectDentalEmptyCoverage);
        
        VisionAccounts.add(prod);
        VisionAccounts.add(prod);
        VisionCoverage.put('VisionAccounts', VisionAccounts);
        VisioninputMap.put('VisionCoverage', VisionCoverage);
        SelectVisionCoverage.put('output4', VisionAccounts);
        SelectVisioninputMap.put('SelectVisionPlans', SelectVisionCoverage);
        VisionEmptyCoverage.put('VisionAccounts', EmptyAccounts);
        VisionEmptyinputMap.put('VisionCoverage', VisionEmptyCoverage);
        SelectVisionEmptyCoverage.put('output4', EmptyAccounts);
        SelectVisionEmptyinputMap.put('SelectVisionPlans', SelectVisionEmptyCoverage);
        
        Map<String,Object> Step = new Map<String,Object>();
        Integer CheckZipCode = 2;
        Step.put('CheckZipCode', CheckZipCode);
        ZipCodeinputMap.put('Step', Step);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        Boolean validateLandD = vss.invokeMethod('validateCoverageDesc', landDInputMap, outMap, options);
        System.assertEquals(validateLandD, true);
        
        Map<String,Object> validateProductselectedNVMap = new Map<String,Object>();
        String SelectMedAccount1 = '[{"Name":"Test Blue","network__c":"Blue Open Access POS","ProductCode": "3004","Id":"'+prod.Id+'"}]';
        List<object> MedicalAccountsList = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount1)); 
        validateProductselectedNVMap.put('qState','NV');
        validateProductselectedNVMap.put('MedicalCoverage', new Map<String,Object>{'MedicalAccounts'=>MedicalAccountsList});

        Boolean validateProductselectedNV = vss.invokeMethod('validateProductselectedNV', validateProductselectedNVMap, outMap, options);
        Map<String,Object> validateMedicalInputMap = new Map<String,Object>();
        validateMedicalInputMap.put('MedicalCoverageNQ',new Map<String,Object>{'MedicalAccounts'=>MedicalAccountsList});
        Boolean validateMedical1 = vss.invokeMethod('validateMedical', validateMedicalInputMap, outMap, options);
        System.assertEquals(validateMedical1, true);   
        
        Boolean validateMedical = vss.invokeMethod('validateMedical', MedicalinputMap, outMap, options);
        System.assertEquals(validateMedical, true);
        Map<String,Object> validateSelectedMedical1Map = new Map<String,Object>();
        validateSelectedMedical1Map.put('MedicalCoverageNQ',new Map<String,Object>{'MedicalAccounts'=>MedicalAccountsList,'isConflictRider29Plans'=>true});
        Boolean validateSelectedMedical1 = vss.invokeMethod('validateSelectedMedical', validateSelectedMedical1Map, outMap, options);
        System.assertEquals(validateSelectedMedical1, true);
        
        Boolean validateSelectedMedical = vss.invokeMethod('validateSelectedMedical', MedicalinputMap, outMap, options);
        System.assertEquals(validateSelectedMedical, true);
        
        Boolean validateSelectedMedicalRider = vss.invokeMethod('validateSelectedMedical', SelectedMedicalinputMap, outMap, options);
        System.assertEquals(validateSelectedMedicalRider, true);
        
        Boolean validateDental = vss.invokeMethod('validateDental', DentalinputMap, outMap, options);
        System.assertEquals(validateDental, true);
        
        Boolean validateVision = vss.invokeMethod('validateVision', VisioninputMap, outMap, options);
        System.assertEquals(validateVision, true);
        
        Boolean validateQuoteMedical = vss.invokeMethod('validateQuoteMedical', SelectMedicalinputMap, outMap, options);
        System.assertEquals(validateQuoteMedical, true);
        
        Boolean validateQuoteDental = vss.invokeMethod('validateQuoteDental', SelectDentalinputMap, outMap, options);
        System.assertEquals(validateQuoteDental, true);
        
        Boolean validateQuoteVision = vss.invokeMethod('validateQuoteVision', SelectVisioninputMap, outMap, options);
        System.assertEquals(validateQuoteVision, true);
        
        Boolean validateZipCode = vss.invokeMethod('validateZipCode', ZipCodeinputMap, outMap, options);
        System.assertEquals(validateZipCode, true);
        
        Boolean validateMedicalEmpty = vss.invokeMethod('validateMedical', MedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateMedicalEmpty, true);
        
        Boolean validateDentalEmpty = vss.invokeMethod('validateDental', DentalEmptyinputMap, outMap, options);
        System.assertEquals(validateDentalEmpty, true);
        
        Boolean validateVisionEmpty = vss.invokeMethod('validateVision', VisionEmptyinputMap, outMap, options);
        System.assertEquals(validateVisionEmpty, true);
        
        Boolean validateQuoteMedicalEmpty = vss.invokeMethod('validateQuoteMedical', SelectMedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteMedicalEmpty, true);
        
        Boolean validateQuoteDentalEmpty = vss.invokeMethod('validateQuoteDental', SelectDentalEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteDentalEmpty, true);
        
        Boolean validateQuoteVisionEmpty = vss.invokeMethod('validateQuoteVision', SelectVisionEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteVisionEmpty, true);
        
        Boolean validateQuoteMedicalEmptyCACO = vss.invokeMethod('validateDuplicateMedicalCACO', SelectMedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteMedicalEmptyCACO, true);
        
        Boolean validateQuoteDentalEmptyCACO = vss.invokeMethod('validateDuplicateDentalCACO', SelectDentalEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteDentalEmptyCACO, true);
        
        Boolean validateQuoteVisionEmptyCACO = vss.invokeMethod('validateDuplicateVisionCACO', SelectVisionEmptyinputMap, outMap, options);
        System.assertEquals(validateQuoteVisionEmptyCACO, true);
        
        Boolean validateDuplicateMedicalVAGAMO = vss.invokeMethod('validateDuplicateMedicalVAGAMO', SelectMedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateDuplicateMedicalVAGAMO, true);
        
        Boolean validateDuplicateMedicalOHKYIN = vss.invokeMethod('validateDuplicateMedicalOHKYIN', SelectMedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateDuplicateMedicalOHKYIN, true);
        
        Boolean validateDuplicateMedicalOHKYIN2 = vss.invokeMethod('validateDuplicateMedicalOHKYIN2', SelectMedicalEmptyinputMap, outMap, options);
        System.assertEquals(validateDuplicateMedicalOHKYIN2, true);
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : duplicateAccountTest
* Description : This is the test method to test the duplicate account creation using omniscript
* ***************************************************************************************************/       
    public testmethod static void duplicateAccountTest(){
        User u = Util02_TestData.createUser();
        system.runAs(u){
            List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
            insert cs001List; 
            List<CS002_RTypeAssignOnLeadConvert__c> cs002List = Util02_TestData.createCS002Data();
            insert cs002List;
            Id grpRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business Account').getRecordTypeId();
            Account a = new Account(Name='Test Account Name');
            a.RecordTypeId = grpRecordTypeId; 
            insert a;
            
            Contact c = new Contact(LastName = 'Contact Last Name', AccountId = a.id);
            insert c;
            
            User user = new User();
            user.ProfileID = [Select Id From Profile Where Name='Anthem SG Broker'].id;
            user.EmailEncodingKey = 'ISO-8859-1';
            user.LanguageLocaleKey = 'en_US';
            user.TimeZoneSidKey = 'America/New_York';
            user.LocaleSidKey = 'en_US';
            user.FirstName = 'first';
            user.LastName = 'last';
            user.Username = 'test@testssss.com'+DateTime.now().millisecond();   
            user.CommunityNickname = 'testUser123';
            user.Alias = 't1';
            user.Email = 'no@email.com';
            user.IsActive = true;
            user.ContactId = c.Id;
            
            insert user;
            
            Account acc = Util02_TestData.createGroupAccount();
            Insert acc;
            AccountTeamMember actTeam = new AccountTeamMember(AccountId=acc.Id,TeamMemberRole = 'Broker',UserId=user.Id);
            Insert actTeam;
            Map<String,Object> outMap = new Map<String,Object>();
            Map<String,Object> options = new Map<String,Object>();
            Map<String,Object> ZipCodeinputMap = new Map<String,Object>();
            Map<String,Object> TypeAheadBrokerBlock = new Map<String,Object>();
            Map<String,Object> Step = new Map<String,Object>();
            TypeAheadBrokerBlock.put('BrokerId', user.ContactId);
            Step.put('TypeAheadBroker-Block', TypeAheadBrokerBlock);
            Step.put('TaxID', '345234123');
            Integer CheckZipCode = 1;
            Step.put('CheckZipCode', CheckZipCode);
            ZipCodeinputMap.put('Step', Step);
            
            test.startTest();
            ValidateSelectionService vss = new ValidateSelectionService();
            Boolean validateZipCode = vss.invokeMethod('validateZipCode', ZipCodeinputMap, outMap, options);
            System.assertEquals(validateZipCode, true);
            test.stopTest();
        }
        
    }
    /****************************************************************************************************
* Method Name : medicalDentalVisionCACOTest
* Description : This is the test method for validating the medical,dental and vision products for 
*               CA and CO locations
* ***************************************************************************************************/
    public testmethod static void medicalDentalVisionCACOTest(){
        
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> DentalinputMap = new Map<String,Object>();
        Map<String,Object> VisioninputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Product',network__c='Select HMO',ProductCode='3004',vlocity_ins__Type__c='Medical');
        Product2 prod1 = new Product2(Name = 'Test Product',network__c='California Care HMO',ProductCode='3005',vlocity_ins__Type__c='Medical');
        Product2 prod2 = new Product2(Name = 'Test Product',network__c='Select PPO',ProductCode='3006',vlocity_ins__Type__c='Medical');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> DentalCoverage = new Map<String,Object>();
        Map<String,Object> selectDentalCoverage = new Map<String,Object>();
        Map<String,Object> VisionCoverage = new Map<String,Object>();
        Map<String,Object> selectVisionCoverage = new Map<String,Object>();
        
        MedicalinputMap.put('qState','CA');
        DentalinputMap.put('qState','CA');  
        VisioninputMap.put('qState','CA');
        MedicalCoverage.put('MedicalPlansCount',2);
        DentalCoverage.put('DentalPlansCount',2);
        VisionCoverage.put('VisionPlansCount',2);
        MedicalCoverage.put('SelectedNetworks','Select PPO');
        
        String innerSelectMed = '[{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeMedical": "3005","SelectProductCodeLookupMedical": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "InputContractCodeMedical": "3006","SelectProductCodeLookupMedical": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(innerSelectMed));
        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        String innerSelectDen = '[{"InputContractCodeDental": "3004","SelectProductCodeLookupDental": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeDental": "3005","SelectProductCodeLookupDental": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "InputContractCodeDental": "3006","SelectProductCodeLookupDental": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        
        List<object> denData = (List<Object>)(JSON.deserializeUntyped(innerSelectDen));
        selectDentalCoverage.put('InnerSelectDental',dendata);
        DentalCoverage.put('SelectDental',selectDentalCoverage);
        DentalinputMap.put('DentalCoverageNQ', DentalCoverage);
        
        String innerSelectVis = '[{"InputContractCodeVision": "3004","SelectProductCodeLookupVision": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeVision": "3005","SelectProductCodeLookupVision": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "InputContractCodeVision": "3006","SelectProductCodeLookupVision": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> visData = (List<Object>)(JSON.deserializeUntyped(innerSelectVis));
        selectVisionCoverage.put('InnerSelectVision',visData);
        VisionCoverage.put('SelectVision',selectVisionCoverage);
        VisioninputMap.put('VisionCoverageNQ', VisionCoverage);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateQuoteMedicalEmptyCACO = vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        
        String innerSelectMed1 = '[{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeMedical": "3006","SelectProductCodeLookupMedical": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> data1 = (List<Object>)(JSON.deserializeUntyped(innerSelectMed1));
        selectMedicalCoverage.put('InnerSelectMedical',data1);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        
        MedicalCoverage.put('SelectedNetworks','Select HMO');
        MedicalCoverage.put('CAContributionPlan','3004');
        Map<String,Object> selectMedicalBlock = new Map<String,Object>();
        String contriPlan = '{"MedicalContributionForEachMonth" : "Percentage of plan option"}';
        object contriData = (Object)(JSON.deserializeUntyped(contriPlan));
        
        MedicalCoverage.put('CAMedicalBlock',contriData);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        vss.invokeMethod('validateDuplicateDentalCACO', DentalinputMap, outMap, options);
        
        String innerSelectDen1 = '[{"InputContractCodeDental": "3004","SelectProductCodeLookupDental": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeDental": "3004","SelectProductCodeLookupDental": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeDental": "3006","SelectProductCodeLookupDental": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        
        List<object> denData1 = (List<Object>)(JSON.deserializeUntyped(innerSelectDen1));
        
        selectDentalCoverage.put('InnerSelectDental',denData1);
        DentalCoverage.put('SelectDental',selectDentalCoverage);
        DentalinputMap.put('DentalCoverageNQ', DentalCoverage); 
        vss.invokeMethod('validateDuplicateDentalCACO', DentalinputMap, outMap, options);
        vss.invokeMethod('validateDuplicateVisionCACO', VisioninputMap, outMap, options);
        
        String innerSelectVis1 = '[{"InputContractCodeVision": "3004","SelectProductCodeLookupVision": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeVision": "3004","SelectProductCodeLookupVision": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeVision": "3006","SelectProductCodeLookupVision": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> visData1 = (List<Object>)(JSON.deserializeUntyped(innerSelectVis1));
        selectVisionCoverage.put('InnerSelectVision',visData1);
        VisionCoverage.put('SelectVision',selectVisionCoverage);
        VisioninputMap.put('VisionCoverageNQ', VisionCoverage);
        vss.invokeMethod('validateDuplicateVisionCACO', VisioninputMap, outMap, options);
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : medicalDentalVisionCACOTest1
* Description : This is the test method for validating the medical,dental and vision products for 
*               CA and CO locations
* ***************************************************************************************************/
    public testmethod static void medicalDentalVisionCACOTest1(){
        
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> DentalinputMap = new Map<String,Object>();
        Map<String,Object> VisioninputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Product',network__c='Select HMO',ProductCode='3004',vlocity_ins__Type__c='Medical');
        
        prodList.add(prod);
        insert prodList;
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> DentalCoverage = new Map<String,Object>();
        Map<String,Object> selectDentalCoverage = new Map<String,Object>();
        Map<String,Object> VisionCoverage = new Map<String,Object>();
        Map<String,Object> selectVisionCoverage = new Map<String,Object>();
        
        MedicalinputMap.put('qState','CA');
        DentalinputMap.put('qState','CA');  
        VisioninputMap.put('qState','CA');    
        MedicalCoverage.put('MedicalPlansCount',1);
        DentalCoverage.put('DentalPlansCount',1);
        VisionCoverage.put('VisionPlansCount',1);
        MedicalCoverage.put('SelectedNetworks','Select PPO');
        
        String innerSelectMed = '{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"}';
        object data = (Object)(JSON.deserializeUntyped(innerSelectMed));
        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        String innerSelectDen = '{"InputContractCodeDental": "3004","SelectProductCodeLookupDental": "'+'3004-'+prod.Id+'-'+prod.Name+'"}';
        
        object denData = (Object)(JSON.deserializeUntyped(innerSelectDen));
        selectDentalCoverage.put('InnerSelectDental',denData);
        DentalCoverage.put('SelectDental',selectDentalCoverage);
        DentalinputMap.put('DentalCoverageNQ', DentalCoverage);
        
        String innerSelectVis = '{"InputContractCodeVision": "3004","SelectProductCodeLookupVision": "'+'3004-'+prod.Id+'-'+prod.Name+'"}';
        
        object visData = (Object)(JSON.deserializeUntyped(innerSelectVis));
        selectVisionCoverage.put('InnerSelectVision',visData);
        VisionCoverage.put('SelectVision',selectVisionCoverage);
        VisioninputMap.put('VisionCoverageNQ', VisionCoverage);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateQuoteMedicalEmptyCACO = vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        System.assertEquals(validateQuoteMedicalEmptyCACO, true);
        vss.invokeMethod('validateDuplicateDentalCACO', DentalinputMap, outMap, options);
        DentalinputMap.put('qState','CO'); 
        vss.invokeMethod('validateDuplicateDentalCACO', DentalinputMap, outMap, options);
        vss.invokeMethod('validateDuplicateVisionCACO', VisioninputMap, outMap, options);
        MedicalCoverage.put('SelectedNetworks','Select HMO');
        MedicalCoverage.put('CAContributionPlan','3004');
        Map<String,Object> selectMedicalBlock = new Map<String,Object>();
        String contriPlan = '{"MedicalContributionForEachMonth" : "Percentage of plan option"}';
        object contriData = (Object)(JSON.deserializeUntyped(contriPlan));
        
        MedicalCoverage.put('CAMedicalBlock',contriData);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        Boolean validateQuoteMedicalEmptyCACO1 = vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : medicalDentalVisionCACOTest2
* Description : This is the test method for validating the medical,dental and vision products for 
*               CA and CO locations
* ***************************************************************************************************/
    public testmethod static void medicalDentalVisionCACOTest2(){
        
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> DentalinputMap = new Map<String,Object>();
        Map<String,Object> VisioninputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Product',network__c='Select HMO',ProductCode='3004',vlocity_ins__Type__c='Medical');
        
        prodList.add(prod);
        insert prodList;
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> DentalCoverage = new Map<String,Object>();
        Map<String,Object> selectDentalCoverage = new Map<String,Object>();
        Map<String,Object> VisionCoverage = new Map<String,Object>();
        Map<String,Object> selectVisionCoverage = new Map<String,Object>();
        
        MedicalinputMap.put('qState','CA');
        MedicalCoverage.put('MedicalPlansCount',0);
        DentalCoverage.put('DentalPlansCount',0);
        VisionCoverage.put('VisionPlansCount',0);
        MedicalCoverage.put('SelectedNetworks','Select PPO');
        
        String innerSelectMed = '{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod.Id+'-'+prod.Name+'"}';
        object data = (Object)(JSON.deserializeUntyped(innerSelectMed));
        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateQuoteMedicalEmptyCACO = vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        System.assertEquals(validateQuoteMedicalEmptyCACO, true);
        
        MedicalCoverage.put('SelectedNetworks','Select HMO');
        MedicalCoverage.put('CAContributionPlan','3004');
        Map<String,Object> selectMedicalBlock = new Map<String,Object>();
        String contriPlan = '{"MedicalContributionForEachMonth" : "Percentage of plan option"}';
        object contriData = (Object)(JSON.deserializeUntyped(contriPlan));
        
        MedicalCoverage.put('CAMedicalBlock',contriData);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        Boolean validateQuoteMedicalEmptyCACO1 = vss.invokeMethod('validateDuplicateMedicalCACO', MedicalinputMap, outMap, options);
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : calCOBRACACOTest
* Description : This is the test method for validating the calcobra details in the omniscript
* ***************************************************************************************************/
    public testmethod static void calCOBRACACOTest(){
        Map<String,Object> calCobraInputMap = new Map<String,Object>();
        Map<String,Object> calCOBRAStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        Map<String,Object> calCobraInputMap1 = new Map<String,Object>();
        Map<String,Object> calCOBRAStep1 = new Map<String,Object>();
        
        String memberDetails = '[{"LastName": "11","FirstName":"11","M.I.": null,"SocialSecurityNum": 111111111,"EventType": "COBRA","TerminationDate":"2018-03-06","DescribeQualifyingEvent": "111111","Employee/DependentQuestionnaire": "Yes","Employeevalidate": "Yes","DisablingCondition": "11111"},{ "LastName": "11","FirstName": "11","M.I.": null,"SocialSecurityNum": 111111111,"EventType": "COBRA","TerminationDate": "2018-03-05","DescribeQualifyingEvent": "111","Employee/DependentQuestionnaire": "Yes","Employeevalidate": "Yes","DisablingCondition": ""}]';
        List<object> memData = (List<Object>)(JSON.deserializeUntyped(memberDetails));
        
        
        calCOBRAStep.put('CalCOBRAMemCount',2);
        calCOBRAStep.put('CalCOBRACOBRAMemberDetails',memData);
        calCobraInputMap.put('CalCOBRACOBRAQuestionnaire',calCOBRAStep);
        
        String memberDetails1 = '{"LastName": "11","FirstName":"11","M.I.": null,"SocialSecurityNum": 111111111,"EventType": "COBRA","TerminationDate":"2018-03-06","DescribeQualifyingEvent": "111111","Employee/DependentQuestionnaire": "Yes","Employeevalidate": "Yes","DisablingCondition": ""}';
        Map<String,Object> memData1 = (Map<String,Object>)(JSON.deserializeUntyped(memberDetails1));
        calCOBRAStep1.put('CalCOBRAMemCount',1);
        calCOBRAStep1.put('CalCOBRACOBRAMemberDetails',memData1);
        calCobraInputMap1.put('CalCOBRACOBRAQuestionnaire',calCOBRAStep1);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        Boolean validateQuoteMedicalEmptyCACO = vss.invokeMethod('validateDisablingCondition', calCobraInputMap, outMap, options);
        System.assertEquals(validateQuoteMedicalEmptyCACO, true);
        
        Boolean validateQuoteMedicalEmptyCACO1 = vss.invokeMethod('validateDisablingCondition', calCobraInputMap1, outMap, options);
        System.assertEquals(validateQuoteMedicalEmptyCACO1, true);
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validateCoverageDescwithoutNone1Test
* Description : This is the test method for L&DCoverageDesc with out selecting None L&D products with
*               one coverage description block
* ***************************************************************************************************/
    public testmethod static void validateCoverageDescwithoutNone1Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> LandDWithOutQuote = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        LandDWithOutQuote.put('LDPrdNone',false);
        LandDWithOutQuote.put('LDPrdBasicLife',false);
        LandDWithOutQuote.put('LDPrdBasicDependent',true);
        LandDWithOutQuote.put('LDPrdOptionalLife',false);
        LandDWithOutQuote.put('LDPrdOptionalDependent',false);
        LandDWithOutQuote.put('DisabilityPrdNone',false);
        LandDWithOutQuote.put('DisabilityPrdShort',false);
        LandDWithOutQuote.put('DisabilityPrdLong',false);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryShort',false);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryLong',false);
        landdStep.put('LandDWithOutQuote',LandDWithOutQuote);
        landdStep.put('LDWaiveBlockCount',1);
        String waiveBlock = '{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null}';
        Map<String,object> waiveBlockData = (Map<String,Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        landdInputMap.put('WithQuote',false);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validateCoverageDescwithoutNone2Test
* Description : This is the test method for L&DCoverageDesc with out selecting None L&D products with
*               two coverage description block
* ***************************************************************************************************/
    public testmethod static void validateCoverageDescwithoutNone2Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> LandDWithOutQuote = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        LandDWithOutQuote.put('LDPrdNone',false);
        LandDWithOutQuote.put('LDPrdBasicLife',true);
        LandDWithOutQuote.put('LDPrdBasicDependent',true);
        LandDWithOutQuote.put('LDPrdOptionalLife',true);
        LandDWithOutQuote.put('LDPrdOptionalDependent',true);
        LandDWithOutQuote.put('DisabilityPrdNone',false);
        LandDWithOutQuote.put('DisabilityPrdShort',true);
        LandDWithOutQuote.put('DisabilityPrdLong',true);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryShort',true);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryLong',true);
        LandDWithOutQuote.put('LDWaiveBlockCount',2);
        landdStep.put('LandDWithOutQuote',LandDWithOutQuote);
        String waiveBlock = '[{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null},{"LDLifeDisabilityClassNumber": "2", "LDCoverageDescription": "DisabilityPrdLong","LDEligibilityDescription":"Firstofthemonthfollowingdateofhire","LDEligibilityDescription-Other": null}]';
        List<object> waiveBlockData = (List<Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        landdInputMap.put('WithQuote',false);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validateCoverageDescwithNone1Test
* Description : This is the test method for L&DCoverageDesc with selecting None L&D products with
*               1 coverage description block
* ***************************************************************************************************/
    public testmethod static void validateCoverageDescwithNone1Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        landdStep.put('LDPrdNone',true);
        landdStep.put('LDPrdBasicLife',false);
        landdStep.put('LDPrdBasicDependent',false);
        landdStep.put('LDPrdOptionalLife',false);
        landdStep.put('LDPrdOptionalDependent',false);
        landdStep.put('DisabilityPrdNone',true);
        landdStep.put('DisabilityPrdShort',false);
        landdStep.put('DisabilityPrdLong',false);
        landdStep.put('DisabilityPrdVoluntaryShort',false);
        landdStep.put('DisabilityPrdVoluntaryLong',false);
        landdStep.put('LDWaiveBlockCount',1);
        String waiveBlock = '{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null}';
        Map<String,object> waiveBlockData = (Map<String,Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validateCoverageDescwithNone2Test
* Description : This is the test method for L&DCoverageDesc with selecting None L&D products with
*               2 coverage description block
* ***************************************************************************************************/
    public testmethod static void validateCoverageDescwithNone2Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        landdStep.put('LDPrdNone',true);
        landdStep.put('LDPrdBasicLife',false);
        landdStep.put('LDPrdBasicDependent',false);
        landdStep.put('LDPrdOptionalLife',false);
        landdStep.put('LDPrdOptionalDependent',false);
        landdStep.put('DisabilityPrdNone',true);
        landdStep.put('DisabilityPrdShort',false);
        landdStep.put('DisabilityPrdLong',false);
        landdStep.put('DisabilityPrdVoluntaryShort',false);
        landdStep.put('DisabilityPrdVoluntaryLong',false);
        landdStep.put('LDWaiveBlockCount',2);
        String waiveBlock = '[{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null},{"LDLifeDisabilityClassNumber": "2", "LDCoverageDescription": "DisabilityPrdLong","LDEligibilityDescription":"Firstofthemonthfollowingdateofhire","LDEligibilityDescription-Other": null}]';
        List<object> waiveBlockData = (List<Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validateCoverageDescwithoutNone3Test
* Description : This is the test method for L&DCoverageDesc with out selecting None L&D products with
*               2 coverage description block
* ***************************************************************************************************/
    public testmethod static void validateCoverageDescwithoutNone3Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        landdStep.put('LDPrdNone',false);
        landdStep.put('LDPrdBasicLife',true);
        landdStep.put('LDPrdBasicDependent',true);
        landdStep.put('LDPrdOptionalLife',true);
        landdStep.put('LDPrdOptionalDependent',true);
        landdStep.put('DisabilityPrdNone',false);
        landdStep.put('DisabilityPrdShort',true);
        landdStep.put('DisabilityPrdLong',true);
        landdStep.put('DisabilityPrdVoluntaryShort',true);
        landdStep.put('DisabilityPrdVoluntaryLong',true);
        landdStep.put('LDWaiveBlockCount',2);
        String waiveBlock = '[{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null},{"LDLifeDisabilityClassNumber": "2", "LDCoverageDescription": "DisabilityPrdLong","LDEligibilityDescription":"Firstofthemonthfollowingdateofhire","LDEligibilityDescription-Other": null}]';
        List<object> waiveBlockData = (List<Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : validatePaymentInfoTest
* Description : This is the test method for testing payment info
* ***************************************************************************************************/
    public testmethod static void validatePaymentInfoTest(){
        Map<String,Object> paymentInputMap = new Map<String,Object>();
        Map<String,Object> paymentStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        paymentStep.put('PaymentInformation','Yes');
        paymentInputMap.put('Payment',paymentStep);
        // @SMGR-31517 - List<Application_Document_Config__c> testConfigList = Util02_TestData.createDocumentConfigList();
        //Business Custom Setting insertion
        List<CS001_RecordTypeBusinessTrack__c> cs001List = Util02_TestData.createCS001Data();
        //Account record creation
        Account testAccount = Util02_TestData.createGroupAccount();
        Test.startTest();
        Database.insert(cs001List);
        // @SMGR-31517 - Database.insert(testConfigList);
        Database.insert(testAccount);
        vlocity_ins__Party__c partyObj = Util02_TestData.createPartyforAccount(testAccount.Id);
        Database.insert(partyObj);
        vlocity_ins__Application__c applicationObj = Util02_TestData.createApplicationRec(testAccount.Id, partyObj.Id);
        applicationObj.vlocity_ins__Type__c = System.Label.SG42_PaperApplication;
        applicationObj.Payment_Status__c = 'FAILURE';
        Database.insert(applicationObj);
        paymentInputMap.put('applicationId',applicationObj.Id);
        
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validatePaymentCACO = vss.invokeMethod('validatePaymentInfoCACO', paymentInputMap, outMap, options);
        System.assertEquals(validatePaymentCACO, true);
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : DuplicateMedicalVAGAMOTest
* Description : This is the test method for validating the duplicate medical products for 
*               VA, GA and MO locations
* ***************************************************************************************************/
    public testmethod static void DuplicateMedicalVAGAMOTest(){
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalinputMapGA = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway Enhanced',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='BlueChoice HMO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod3 = new Product2(Name = 'Test VA',network__c='KeyCare',ProductCode='3007',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='VA');
        Product2 prod4 = new Product2(Name = 'Test MO',network__c='Blue Access',ProductCode='3008',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='MO');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        prodList.add(prod3);
        prodList.add(prod4);
        insert prodList;
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> MedicalCoverageGA = new Map<String,Object>();
        Map<String,Object> MedicalCoverageGA1 = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverageGA = new Map<String,Object>();
        
        MedicalinputMap.put('qState','VA');
        MedicalCoverage.put('MedicalPlansCount',2);
        
        MedicalinputMapGA.put('qState','GA');
        MedicalCoverageGA1.put('BlueMedicalPlansCount',2);
        MedicalCoverageGA1.put('PathwayMedicalPlansCount',2);
        MedicalCoverageGA1.put('HMOMedicalPlansCount',2);
        
        String innerSelectMed = '[{"InputContractCodeMedical": "3008","SelectProductCodeLookupMedical": "'+'3008-'+prod4.Id+'-'+prod4.Name+'"},'+
            '{ "InputContractCodeMedical": "3008","SelectProductCodeLookupMedical": "'+'3008-'+prod4.Id+'-'+prod4.Name+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(innerSelectMed));
        
        String innerSelectMedBlue = '[{"BlueContractCodeInput": "3004","BlueSelectProductCodeLookupMed": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "BlueContractCodeInput": "3004","BlueSelectProductCodeLookupMed": "'+'3004-'+prod.Id+'-'+prod.Name+'"}]';
        List<object> dataBlue = (List<Object>)(JSON.deserializeUntyped(innerSelectMedBlue));
        String innerSelectMedPathway = '[{"PathwayContractCodeInput": "3005","PathwaySelectProductCodeLookupMed": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "PathwayContractCodeInput": "3005","PathwaySelectProductCodeLookupMed": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"}]';
        List<object> dataPathway = (List<Object>)(JSON.deserializeUntyped(innerSelectMedPathway));
        String innerSelectMedHMO = '[{"HMOContractCodeInput": "3006","HMOSelectProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"},'+
            '{ "HMOContractCodeInput": "3006","HMOSelectProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> dataHMO = (List<Object>)(JSON.deserializeUntyped(innerSelectMedHMO));
        
        selectMedicalCoverage.put('InnerSelectMedicalVAMO',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        selectMedicalCoverageGA.put('POSBlueBlock',dataBlue);
        selectMedicalCoverageGA.put('POSPathwayBlock',dataPathway);
        selectMedicalCoverageGA.put('HMOBlueBlock',dataHMO);
        MedicalCoverageGA.put('InnerSelectMedicalGA',selectMedicalCoverageGA);
        MedicalCoverageGA1.put('SelectMedical',MedicalCoverageGA);
        MedicalCoverageGA1.put('GAMedicalContibutionType','PoP');
        MedicalCoverageGA1.put('GAContributionPlan','test');
        MedicalinputMapGA.put('MedicalCoverageNQ', MedicalCoverageGA1);
        
        test.startTest();
        
        ValidateSelectionService vss = new ValidateSelectionService();
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateDuplicateMedicalMO = vss.invokeMethod('validateDuplicateMedicalVAGAMO', MedicalinputMap, outMap, options);
        
        Boolean validateDuplicateMedicalGA = vss1.invokeMethod('validateDuplicateMedicalVAGAMO', MedicalinputMapGA, outMap, options);
        
        test.stopTest();
        
    }
    
/****************************************************************************************************
* Method Name : DuplicateMedicalVAGAMOTest2
* Description : This is the test method for validating for VA when only an EPO Plan is selected
* ***************************************************************************************************/
    public testmethod static void DuplicateMedicalVAGAMOTest2(){
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalinputMapGA = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        
        MedicalinputMap.put('qState','VA');
        
        String innerSelectMed = '{"SelectProductCodeIdMedical":"YEAR-3H9A-01t0Z000008VO6F-Anthem Bronze OAEPO 7000/40%/7500","SelectProductCodeLookupMedical":"3H9A-01t0Z000008VO6FQAW-Anthem Bronze OAEPO 7000/40%/7500","MedicalContractCode":"3H9A","MedicalProductId":"01t0Z000008VO6FQAW","MedicalProductName":"Anthem Bronze OAEPO 7000/40%/7500","ProductSubType":"EPO","SelectedMedicalPlan":"3H9A-Anthem Bronze OAEPO 7000/40%/7500","Network":"KeyCare"}';
        Object data = (Object)(JSON.deserializeUntyped(innerSelectMed));
        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        test.startTest();
        
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateDuplicateMedicalVA = vss.invokeMethod('validateDuplicateMedicalVAGAMO', MedicalinputMap, outMap, options);
        
        test.stopTest();
    }
    
/****************************************************************************************************
* Method Name : DuplicateMedicalVAGAMOTest3
* Description : This is the test method for validating for VA when an non EPO Plan is selected with an EPO Plan
* ***************************************************************************************************/
    public testmethod static void DuplicateMedicalVAGAMOTest3(){
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalinputMapGA = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        
        MedicalinputMap.put('qState','VA');
        
        String innerSelectMed = '[{"SelectProductCodeIdMedical":"YEAR-3H9A-01t0Z000008VO6F-Anthem Bronze OAEPO 7000/40%/7500","SelectProductCodeLookupMedical":"3H9A-01t0Z000008VO6FQAW-Anthem Bronze OAEPO 7000/40%/7500","MedicalContractCode":"3H9A","MedicalProductId":"01t0Z000008VO6FQAW","MedicalProductName":"Anthem Bronze OAEPO 7000/40%/7500","ProductSubType":"EPO","SelectedMedicalPlan":"3H9A-Anthem Bronze OAEPO 7000/40%/7500","Network":"KeyCare"},{"SelectProductCodeIdMedical":"YEAR-3H96-01t0Z000008VO5W-Anthem Platinum PPO 250/10%/3100","SelectProductCodeLookupMedical":"3H96-01t0Z000008VO5WQAW-Anthem Platinum PPO 250/10%/3100","MedicalContractCode":"3H96","MedicalProductId":"01t0Z000008VO5WQAW","MedicalProductName":"Anthem Platinum PPO 250/10%/3100","ProductSubType":"PPO","SelectedMedicalPlan":"3H96-Anthem Platinum PPO 250/10%/3100","Network":"KeyCare"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(innerSelectMed));
        
        selectMedicalCoverage.put('InnerSelectMedical',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        test.startTest();
        
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateDuplicateMedicalVA = vss.invokeMethod('validateDuplicateMedicalVAGAMO', MedicalinputMap, outMap, options);
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : validateDuplicateDentalOHKYINVAGAMOTest
* Description : This is the test method for validating the medical,dental and vision products for 
*               OH/KY/IN/VA/GA/MO locations
* ***************************************************************************************************/
    public testmethod static void validateDuplicateDentalOHKYINVAGAMOTest(){
        
        
        Map<String,Object> DentalinputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Prime',network__c='Dental Prime',ProductCode='1R56',vlocity_ins__Type__c='Dental',vlocity_ins__Availability__c='OH');
        Product2 prod1 = new Product2(Name = 'Test Complete',network__c='Dental Complete',ProductCode='1R4W',vlocity_ins__Type__c='Dental',vlocity_ins__Availability__c='OH');
        
        prodList.add(prod);
        prodList.add(prod1);
        
        insert prodList;
        Map<String,Object> DentalCoverage = new Map<String,Object>();
        Map<String,Object> selectDentalCoverage = new Map<String,Object>();
        DentalinputMap.put('qState','OH');
        DentalCoverage.put('DentalPlansCount',2);
        String innerSelectDen = '[{"InputContractCodeDental": "1R56","SelectProductCodeLookupDental": "'+'1R56-'+prod.Id+'-'+prod.Name+'","DentalProductId" : "'+prod.Id+'","DentalContractCode" : "1R56"},'+
            '{ "InputContractCodeDental": "1R56","SelectProductCodeLookupDental": "'+'1R56-'+prod.Id+'-'+prod.Name+'","DentalProductId" : "'+prod.Id+'","DentalContractCode" : "1R56"}]';
        List<object> denData = (List<Object>)(JSON.deserializeUntyped(innerSelectDen));
        selectDentalCoverage.put('InnerSelectDental',denData);
        DentalCoverage.put('SelectDental',selectDentalCoverage);
        DentalinputMap.put('DentalCoverageNQ', DentalCoverage);
        ValidateSelectionService vss = new ValidateSelectionService();
        vss.invokeMethod('validateDuplicateDentalOHKYINVAGAMO', DentalinputMap, outMap, options);
        
        String innerSelectDen1 = '[{"InputContractCodeDental": "1R4W","SelectProductCodeLookupDental": "'+'1R4W-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "InputContractCodeDental": "1R4W","SelectProductCodeLookupDental": "'+'1R4W-'+prod1.Id+'-'+prod1.Name+'"}]';
        List<object> denData1 = (List<Object>)(JSON.deserializeUntyped(innerSelectDen1));
        selectDentalCoverage.put('InnerSelectDental',denData1);
        DentalCoverage.put('SelectDental',selectDentalCoverage);
        DentalinputMap.put('DentalCoverageNQ', DentalCoverage);
        
        test.startTest();
        
        vss.invokeMethod('validateDuplicateDentalOHKYINVAGAMO', DentalinputMap, outMap, options);
        
        
        test.stopTest();
    }
    
    /****************************************************************************************************
* Method Name : validateDuplicateMedicalOHKYINTest
* Description : This is the test method for validating the duplicate medical products for 
*               OH, KY and IN locations
* ***************************************************************************************************/
    public testmethod static void validateDuplicateMedicalOHKYINTest(){
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalinputMapKY = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Access',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod2 = new Product2(Name = 'Test Pathway HMO',network__c='Pathway Enhanced',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod3 = new Product2(Name = 'Pathway HMO',network__c='BlueChoice HMO',ProductCode='3007',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod4 = new Product2(Name = 'Test IN',network__c='Blue Access',ProductCode='3008',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod5 = new Product2(Name = 'Test OH',network__c='Blue Access',ProductCode='3009',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='OH');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        prodList.add(prod3);
        prodList.add(prod4);
        prodList.add(prod5);
        insert prodList;
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> MedicalCoverage1 = new Map<String,Object>();
        Map<String,Object> MedicalCoverageKY = new Map<String,Object>();
        Map<String,Object> MedicalCoveragekY1 = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverageKY = new Map<String,Object>();
        
        MedicalinputMap.put('qState','OH');
        MedicalCoverage.put('MedicalPlansCount',2);
        
        MedicalinputMapKY.put('qState','KY');
        MedicalCoverageKY1.put('POSBlueBlockCount',2);
        MedicalCoverageKY1.put('POSPathwayBlockCount',2);
        MedicalCoverageKY1.put('HMOPathwayCount',2);
        MedicalCoverageKY1.put('PathwayTransitionCount',2);
        
        
        String innerSelectMed = '[{"InputContractCodeMedical": "3008","SelectProductCodeLookupMedical": "'+'3008-'+prod4.Id+'-'+prod4.Name+'"},'+
            '{ "InputContractCodeMedical": "3008","SelectProductCodeLookupMedical": "'+'3008-'+prod4.Id+'-'+prod4.Name+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(innerSelectMed));
        
        String innerSelectMedBlue = '[{"BlueContractCodeInput": "3004","BlueSelectProductCodeLookupMed": "'+'3004-'+prod.Id+'-'+prod.Name+'"},'+
            '{ "BlueContractCodeInput": "3004","BlueSelectProductCodeLookupMed": "'+'3004-'+prod.Id+'-'+prod.Name+'"}]';
        List<object> dataBlue = (List<Object>)(JSON.deserializeUntyped(innerSelectMedBlue));
        
        String innerSelectMedPathway = '[{"PathwayContractCodeInput": "3005","PathwaySelectProductCodeLookupMed": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"},'+
            '{ "PathwayContractCodeInput": "3005","PathwaySelectProductCodeLookupMed": "'+'3005-'+prod1.Id+'-'+prod1.Name+'"}]';
        List<object> dataPathway = (List<Object>)(JSON.deserializeUntyped(innerSelectMedPathway));
        
        String innerSelectMedHMO = '[{"PathwayHMOContractCodeInput": "3006","PathwayHMOProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"},'+
            '{ "PathwayHMOContractCodeInput": "3006","PathwayHMOProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> dataHMO = (List<Object>)(JSON.deserializeUntyped(innerSelectMedHMO));
        
        String innerSelectPathway = '[{"PathwayHMOTransContractCodeInput": "3007","PathwayHMOTransProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"},'+
            '{ "PathwayHMOTransContractCodeInput": "3006","PathwayHMOTransProductCodeLookupMed": "'+'3006-'+prod2.Id+'-'+prod2.Name+'"}]';
        List<object> dataPathwaytran = (List<Object>)(JSON.deserializeUntyped(innerSelectPathway));
        
        selectMedicalCoverage.put('InnerSelectMedicalOHIN',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        selectMedicalCoverageKY.put('POSBlueBlock',dataBlue);
        selectMedicalCoverageKY.put('POSPathwayBlock',dataPathway);
        selectMedicalCoverageKY.put('HMOPathwayBlock',dataHMO);
        selectMedicalCoverageKY.put('HMOPathwayTransBlock',dataPathwaytran);
        MedicalCoverageKY.put('InnerSelectMedicalKY',selectMedicalCoverageKY);
        MedicalCoverageKY1.put('SelectMedical',MedicalCoverageKY);
        MedicalinputMapKY.put('MedicalCoverageNQ', MedicalCoverageKY1);
        
        test.startTest();
        
        ValidateSelectionService vss = new ValidateSelectionService();
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateDuplicateMedicalMO = vss.invokeMethod('validateDuplicateMedicalOHKYIN', MedicalinputMap, outMap, options);
        
        Boolean validateDuplicateMedicalGA = vss1.invokeMethod('validateDuplicateMedicalOHKYIN', MedicalinputMapKY, outMap, options);
        
        test.stopTest();
        
    }
    /****************************************************************************************************
* Method Name : validateDuplicateMedicalOHKYIN2Test
* Description : This is the test method for validating the duplicate medical products for 
*               OH, KY and IN locations
* ***************************************************************************************************/
    public testmethod static void validateDuplicateMedicalOHKYIN2Test(){
        Map<String,Object> MedicalinputMap = new Map<String,Object>();
        Map<String,Object> MedicalinputMapKY1= new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Access',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod2 = new Product2(Name = 'Test Pathway HMO',network__c='Pathway Enhanced',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod3 = new Product2(Name = 'Pathway HMO',network__c='BlueChoice HMO',ProductCode='3007',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='KY');
        Product2 prod4 = new Product2(Name = 'Test IN',network__c='Blue Access',ProductCode='3008',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod5 = new Product2(Name = 'Test OH',network__c='Blue Access',ProductCode='3009',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='OH');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        prodList.add(prod3);
        prodList.add(prod4);
        prodList.add(prod5);
        insert prodList;
        
        Map<String,Object> MedicalCoverage = new Map<String,Object>();
        Map<String,Object> MedicalCoverage1 = new Map<String,Object>();
        Map<String,Object> MedicalCoverageKY = new Map<String,Object>();
        Map<String,Object> MedicalCoveragekY1 = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverage = new Map<String,Object>();
        Map<String,Object> selectMedicalCoverageKY = new Map<String,Object>();
        
        MedicalinputMap.put('qState','OH');
        MedicalCoverage.put('MedicalPlansCount',1);
        
        MedicalinputMapKY1.put('qState','KY');
        MedicalCoverageKY1.put('POSBlueBlockCount',1);
        MedicalCoverageKY1.put('POSPathwayBlockCount',1);
        MedicalCoverageKY1.put('HMOPathwayCount',1);
        MedicalCoverageKY1.put('PathwayTransitionCount',1);
        
        String innerSelectMed = '{"InputContractCodeMedical": "3004","SelectProductCodeLookupMedical": "'+'3004-'+prod4.Id+'-'+prod4.Name+'"}';
        Map<String,object> data = (Map<String,object>)(JSON.deserializeUntyped(innerSelectMed));
        
        String innerSelectMedBlue = '{"BlueContractCodeInput": "3005","BlueSelectProductCodeLookupMed": "'+'3005-'+prod.Id+'-'+prod.Name+'"}';
        Map<String,object> dataBlue = (Map<String,object>)(JSON.deserializeUntyped(innerSelectMedBlue));
        
        String innerSelectMedPathway = '{"PathwayContractCodeInput": "3006","PathwaySelectProductCodeLookupMed": "'+'3006-'+prod1.Id+'-'+prod1.Name+'"}';
        Map<String,object> dataPathway = (Map<String,object>)(JSON.deserializeUntyped(innerSelectMedPathway));
        
        String innerSelectMedHMO = '{"PathwayHMOContractCodeInput": "3007","PathwayHMOProductCodeLookupMed": "'+'3007-'+prod2.Id+'-'+prod2.Name+'"}';
        Map<String,object> dataHMO = (Map<String,object>)(JSON.deserializeUntyped(innerSelectMedHMO));
        
        String innerSelectPathway = '{"PathwayHMOTransContractCodeInput": "3009","PathwayHMOTransProductCodeLookupMed": "'+'3009-'+prod2.Id+'-'+prod2.Name+'"}';
        Map<String,object> dataPathwaytran = (Map<String,object>)(JSON.deserializeUntyped(innerSelectPathway));
        
        
        selectMedicalCoverage.put('InnerSelectMedicalOHIN',data);
        MedicalCoverage.put('SelectMedical',selectMedicalCoverage);
        MedicalinputMap.put('MedicalCoverageNQ', MedicalCoverage);
        
        selectMedicalCoverageKY.put('POSBlueBlock',dataBlue);
        selectMedicalCoverageKY.put('POSPathwayBlock',dataPathway);
        selectMedicalCoverageKY.put('HMOPathwayBlock',dataHMO);
        selectMedicalCoverageKY.put('HMOPathwayTransBlock',dataPathwaytran);
        MedicalCoverageKY.put('InnerSelectMedicalKY',selectMedicalCoverageKY);
        MedicalCoverageKY1.put('SelectMedical',MedicalCoverageKY);
        MedicalinputMapKY1.put('MedicalCoverageNQ', MedicalCoverageKY1);
        
        test.startTest();
        
        ValidateSelectionService vss = new ValidateSelectionService();
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateDuplicateMedicalMO = vss.invokeMethod('validateDuplicateMedicalOHKYIN', MedicalinputMap, outMap, options);
        
        Boolean validateDuplicateMedicalGA = vss1.invokeMethod('validateDuplicateMedicalOHKYIN', MedicalinputMapKY1, outMap, options);
        
        test.stopTest();
        
    }
    /****************************************************************************************************
* Method Name : validatProductSelectedGATest
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box IN GA Erollment Omniscript With Quote
*               Positive Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedGATest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway Enhanced',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='BlueChoice HMO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageGA1 = new Map<String,Object>();              
        inputMap.put('qState','GA');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Open Access POS","ProductCode": "3004","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageGA1.put('MedicalAccounts',data);
        MedicalCoverageGA1.put('MedicalContributionChoiceGA','PoP');
        MedicalCoverageGA1.put('GAPercentPlan','test');         
        inputMap.put('MedicalCoverage',MedicalCoverageGA1);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedGA = vss1.invokeMethod('validateProductselectedGA',inputMap, outMap, options);
        
        test.stopTest();
        
    }
    /****************************************************************************************************
* Method Name : validatProductSelectedGATest2
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box IN GA Erollment Omniscript With Quote  
*               Negative Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedGATest2(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway Enhanced',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='BlueChoice HMO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='GA');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageGA = new Map<String,Object>();
        Map<String,Object> MedicalCoverageGA1 = new Map<String,Object>();
        
        inputMap.put('qState','GA');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Open Access POS","ProductCode": "3004","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));    
        MedicalCoverageGA1.put('MedicalAccounts',data);
        MedicalCoverageGA1.put('MedicalContributionChoiceGA','PoP');
        MedicalCoverageGA1.put('GAPercentPlan','3004');         
        inputMap.put('MedicalCoverage',MedicalCoverageGA1);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedGA = vss1.invokeMethod('validateProductselectedGA',inputMap, outMap, options);
        
        test.stopTest();
        
    }
    
/****************************************************************************************************
* Method Name : validatProductSelectedGATest3
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box for VA Erollment Omniscript With Quote  
*               Positive Test Scenario When both EPO and non EPO Plan is selected
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedGATest3() {
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        
        Map<String,Object> MedicalCoverageVA = new Map<String,Object>();
        
        inputMap.put('qState','VA');
        
        String SelectMedAccount = '[{"Name":"Anthem Gold OAEPO 1500/20/5500","ProductCode":"3H99","vlocity_ins__SubType__c":"EPO","vlcSelected":false},{"Name":"Anthem Bronze OAEPO 7000/40%/7500","ProductCode":"3H9B","vlcSelected":true},{"Name":"Anthem Bronze PPO 6550/0/6550 w/HSA","ProductCode":"3HAP","vlcSelected":true}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));    
        MedicalCoverageVA.put('MedicalAccounts',data);       
        inputMap.put('MedicalCoverage',MedicalCoverageVA);
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedGA = vss1.invokeMethod('validateProductselectedGA',inputMap, outMap, options);
        
        test.stopTest();
    }
    
/****************************************************************************************************
* Method Name : validatProductSelectedGATest4
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box for VA Erollment Omniscript With Quote  
*               Negative Test Scenario When only EPO is selected
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedGATest4(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        
        Map<String,Object> MedicalCoverageVA = new Map<String,Object>();
        
        inputMap.put('qState','VA');
        
        String SelectMedAccount = '[{"Name":"Anthem Gold OAEPO 1500/20/5500","ProductCode":"3H99","vlcSelected":false},{"Name":"Anthem Bronze OAEPO 7000/40%/7500","ProductCode":"3H9B","vlcSelected":true},{"Name":"Anthem Bronze PPO 6550/0/6550 w/HSA","ProductCode":"3HAP","vlcSelected":false}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));    
        MedicalCoverageVA.put('MedicalAccounts',data);       
        inputMap.put('MedicalCoverage',MedicalCoverageVA);
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedGA = vss1.invokeMethod('validateProductselectedGA',inputMap, outMap, options);
        
        test.stopTest();
    }
    
        public testmethod static void validateCoverageDescwithoutNone21Test(){
        Map<String,Object> landdInputMap = new Map<String,Object>();
        Map<String,Object> LandDWithOutQuote = new Map<String,Object>();
        Map<String,Object> landdStep = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        LandDWithOutQuote.put('LDPrdNone',false);
        LandDWithOutQuote.put('LDPrdBasicLife',true);
        LandDWithOutQuote.put('LDPrdBasicDependent',false);
        LandDWithOutQuote.put('LDPrdOptionalLife',false);
        LandDWithOutQuote.put('LDPrdOptionalDependent',false);
        LandDWithOutQuote.put('DisabilityPrdNone',false);
        LandDWithOutQuote.put('DisabilityPrdShort',false);
        LandDWithOutQuote.put('DisabilityPrdLong',false);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryShort',false);
        LandDWithOutQuote.put('DisabilityPrdVoluntaryLong',false);
        LandDWithOutQuote.put('LDWaiveBlockCount',2);
        landdStep.put('LandDWithoutQuote',LandDWithoutQuote);
        String waiveBlock = '[{"LDLifeDisabilityClassNumber": "4","LDCoverageDescription": "LDPrdBasicLife","LDEligibilityDescription": "Firstofthemonthfollowing60days","LDEligibilityDescription-Other": null},{"LDLifeDisabilityClassNumber": "2", "LDCoverageDescription": "DisabilityPrdLong","LDEligibilityDescription":"Firstofthemonthfollowingdateofhire","LDEligibilityDescription-Other": null}]';
        List<object> waiveBlockData = (List<Object>)(JSON.deserializeUntyped(waiveBlock));
        Map<String,Object> landdWaiveBlockMap = new Map<String,Object>();
        landdWaiveBlockMap.put('LDLifeDisabilityWaiveBlock',waiveBlockData);
        
        landdStep.put('LDLifeDisabilityWaitingPeriodBlock',landdWaiveBlockMap);
        landdInputMap.put('SelectedLAndDCoverage',landdStep);
        landdInputMap.put('WithQuote',false);
        
        test.startTest();
        ValidateSelectionService vss = new ValidateSelectionService();
        
        Boolean validateLandDCACO = vss.invokeMethod('validateCoverageDesc', landdInputMap, outMap, options);
        System.assertEquals(validateLandDCACO, true);
        
        test.stopTest();
    }
    /****************************************************************************************************
* Method Name : validatProductSelectedOHINTest
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box IN OHIN Erollment Omniscript With Quote
*               Positive Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedOHTest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='4001',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Anthem HealthSync',ProductCode='4002',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Blue Access',ProductCode='4003',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageIN1 = new Map<String,Object>();              
        inputMap.put('qState','IN');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Access","ProductCode": "4003","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageIN1.put('MedicalAccounts',data);
        MedicalCoverageIN1.put('OHINMedContriForEachMonth1','PoP');
        MedicalCoverageIN1.put('OHINMedicalPlan1','test');         
        inputMap.put('MedicalCoverage',MedicalCoverageIN1);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedOH = vss1.invokeMethod('validateProductselectedOH',inputMap, outMap, options);
        
        test.stopTest();
        
    }
    /****************************************************************************************************
* Method Name : validatProductSelectedOHINTest1
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box IN OHIN Erollment Omniscript With Quote
*               Positive Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedOHTest1(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='4001',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Anthem HealthSync',ProductCode='4002',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Blue Access',ProductCode='4003',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='IN');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageIN1 = new Map<String,Object>();              
        inputMap.put('qState','IN');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Access","ProductCode": "4000","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageIN1.put('MedicalAccounts',data);
        MedicalCoverageIN1.put('OHINMedContriForEachMonth1','PoP');
        MedicalCoverageIN1.put('OHINMedicalPlan1','4000');         
        inputMap.put('MedicalCoverage',MedicalCoverageIN1);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedOH = vss1.invokeMethod('validateProductselectedOH',inputMap, outMap, options);
        
        test.stopTest();
        
    }
 /****************************************************************************************************
* Method Name : validatProductSelectedCATest
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box IN GA Erollment Omniscript With Quote
*               Positive Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedCATest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway Enhanced',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='BlueChoice HMO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageCA = new Map<String,Object>(); 
        Map<String,Object> MedicalCoverageMedBlock = new Map<String,Object>();    
        inputMap.put('qState','CA');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Open Access POS","ProductCode": "3004","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageCA.put('MedicalAccounts',data);
        MedicalCoverageCA.put('CAMedicalBlock1',MedicalCoverageMedBlock);
        MedicalCoverageMedBlock.put('MedicalContributionForEachMonth1','Percentage of plan option');
        MedicalCoverageMedBlock.put('CAPercentPlan','test');         
        inputMap.put('MedicalCoverage',MedicalCoverageCA);
    
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedCA = vss1.invokeMethod('validateProductselectedCA',inputMap, outMap, options);
        
        test.stopTest();
         System.assertEquals(true, validateProductselectedCA);
        
    }
     /****************************************************************************************************
* Method Name : validatProductSelectedCATest
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box CA Erollment Omniscript With Quote
*               Negative Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedCATest2(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='3004',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Pathway Enhanced',ProductCode='3005',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='BlueChoice HMO',ProductCode='3006',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='CA');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageCA = new Map<String,Object>(); 
        Map<String,Object> MedicalCoverageMedBlock = new Map<String,Object>();    
        inputMap.put('qState','CA');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Open Access POS","ProductCode": "3004","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageCA.put('MedicalAccounts',data);
        MedicalCoverageCA.put('CAMedicalBlock1',MedicalCoverageMedBlock);
        MedicalCoverageMedBlock.put('MedicalContributionForEachMonth1','Percentage of plan option');
        MedicalCoverageMedBlock.put('CAPercentPlan','3004');         
        inputMap.put('MedicalCoverage',MedicalCoverageCA);
    
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedCA = vss1.invokeMethod('validateProductselectedCA',inputMap, outMap, options);
        
        test.stopTest();
        System.assertEquals(true, validateProductselectedCA);
        
    }
   /****************************************************************************************************
* Method Name : validatProductSelectedNVTest
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box NV Erollment Omniscript With Quote
*               Positive Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedNVTest(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='4001',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Anthem HealthSync',ProductCode='4002',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Blue Access',ProductCode='4003',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageNV = new Map<String,Object>();              
        inputMap.put('qState','NV');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Access","ProductCode": "4003","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageNV.put('MedicalAccounts',data);
        MedicalCoverageNV.put('MedicalContributionForEachMonthNVQ','Percentage of plan option');
        MedicalCoverageNV.put('NVPercentPlan','test');         
        inputMap.put('MedicalCoverage',MedicalCoverageNV);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedNV = vss1.invokeMethod('validateProductselectedNV',inputMap, outMap, options);
        
        test.stopTest();
        System.assertEquals(true, validateProductselectedNV);
    }
     /****************************************************************************************************
* Method Name : validatProductSelectedNVTest2
* Description : This is the test method for validating the medical products selected and product code 
*               entered in Plan text box NV Erollment Omniscript With Quote
*               Negative Test Scenario
* ***************************************************************************************************/
    public testmethod static void validatProductSelectedNVTest2(){
        Map<String,Object> inputMap = new Map<String,Object>();
        Map<String,Object> outMap = new Map<String,Object>();
        Map<String,Object> options = new Map<String,Object>();
        List<product2> prodList = new List<Product2>();
        Product2 prod = new Product2(Name = 'Test Blue',network__c='Blue Open Access POS',ProductCode='4001',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        Product2 prod1 = new Product2(Name = 'Test Pathway',network__c='Anthem HealthSync',ProductCode='4002',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        Product2 prod2 = new Product2(Name = 'Test HMO',network__c='Blue Access',ProductCode='4003',vlocity_ins__Type__c='Medical',vlocity_ins__Status__c='Active',vlocity_ins__Availability__c='NV');
        
        prodList.add(prod);
        prodList.add(prod1);
        prodList.add(prod2);
        insert prodList;
        
        Map<String,Object> MedicalCoverageNV = new Map<String,Object>();              
        inputMap.put('qState','NV');
        
        String SelectMedAccount = '[{"Name":"Test Blue","network__c":"Blue Access","ProductCode": "4003","Id":"'+prod.Id+'"}]';
        List<object> data = (List<Object>)(JSON.deserializeUntyped(SelectMedAccount));                
        MedicalCoverageNV.put('MedicalAccounts',data);
        MedicalCoverageNV.put('MedicalContributionForEachMonthNVQ','Percentage of plan option');
        MedicalCoverageNV.put('NVPercentPlan','4003');         
        inputMap.put('MedicalCoverage',MedicalCoverageNV);
        
        
        test.startTest();
        
        ValidateSelectionService vss1 = new ValidateSelectionService();
        
        Boolean validateProductselectedNV = vss1.invokeMethod('validateProductselectedNV',inputMap, outMap, options);
        
        test.stopTest();
        System.assertEquals(true, validateProductselectedNV);
    }
}