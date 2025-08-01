/************************************************************************
Class Name   : SGA_AP114_FetchABFEnrollProducts_Test
Date Created : 16-Oct-2018
Created By   : IDC Offshore
Description  : This is a test class for SGA_AP114_FetchABFEnrollProducts_Test
**************************************************************************/
@isTest(SeeAllData=false)
private class SGA_AP114_FetchABFEnrollProducts_Test {
    private static final string CLASSNAME='SGA_AP114_FetchABFEnrollProducts_Test';
    private static final string FETCHABFMEDPROD = 'fetchABFMedProds';
    private static final string GROUPSPECIFICATION='GroupSpecification';
    private static final string SG_GROUPVALUE='SMALLGROUP';
    private static final string LG_GROUPVALUE='LARGEGROUP';
    /************************************************************************************
Method Name : createtestProduct
Parameters  : None
Return type : Lis<Product2>
Description : This is the testmethod for creating test Products
*************************************************************************************/
    private static List<Product2> createtestProduct(){
        User testUser = Util02_TestData.createUser();
        product2 pd = new product2();
        list<product2> lstpd = new list<product2>();
        System.runAs(testUser){
            string dt = '2019-12-31';
            pd.name = 'TestProd';
            pd.ProductCode= 'SR07';
            pd.vlocity_ins__Type__c = 'Medical';
            pd.vlocity_ins__EndDate__c = date.valueof(dt);
            pd.ABF__C=true;
            pd.vlocity_ins__MarketSegment__c = 'Small Group';
            pd.Service_Area__c='ABFCOS001';
            product2 pd1 = new product2();
            pd1.name = 'TestProd1';
            pd1.ProductCode= 'SR08';
            pd1.vlocity_ins__Type__c = 'Medical';
            pd1.vlocity_ins__EndDate__c = date.valueof(dt);
            pd1.ABF__C=true;
            pd1.vlocity_ins__MarketSegment__c = 'Large Group;Small Group';
            pd1.Service_Area__c='ABFCOS001';
            lstpd.add(pd);
            lstpd.add(pd1);
            insert lstpd;           
        }
        return lstpd; 
    }    
    
    /************************************************************************************
Method Name : createtestAttriAssign
Parameters  : None
Return type : List<vlocity_ins__AttributeAssignment__c>
Description : This is the testmethod for creating test AttributeAssignmentt
*************************************************************************************/
    private static List<vlocity_ins__AttributeAssignment__c> createtestAttriAssign(){
        User testUser = Util02_TestData.createUser();
        list<vlocity_ins__AttributeAssignment__c> listva = new list<vlocity_ins__AttributeAssignment__c>();
        System.runAs(testUser){
            List<Product2> pd= createtestProduct();
            vlocity_ins__AttributeAssignment__c va = new vlocity_ins__AttributeAssignment__c();
            va.name = 'test attribute';             
            va.vlocity_ins__ObjectId__c = pd[0].id;
            vlocity_ins__AttributeAssignment__c va1 = new vlocity_ins__AttributeAssignment__c();
            va1.name = 'test attribute';
            va1.vlocity_ins__ObjectId__c = pd[0].id;    
            listva.add(va);
            listva.add(va1);
            insert listva;
        }
        return listva;
    }
    /************************************************************************************
Method Name : testFetchProducts
Parameters  : None
Return type : void
Description : This is the testmethod for getting small group ABF Products
*************************************************************************************/
    private static testMethod void testFetchProducts() {
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            list<vlocity_ins__AttributeAssignment__c> listva =createtestAttriAssign();            
            string optionjson = '{"productSearchCriteria":  "vlocity_ins__Type__c = \'' +'Medical'+ '\'"}';
            Geographical_Info__c geo = new Geographical_Info__c(State__c='CO' ,Name = 'EBCBS' ,Zip_Code__c = '81630' , County__c='MEREDA',County_Code__c='08077', RatingArea__c =3,Service_Area__c='ABFCOS001,ABFCOS002');
            database.insert(geo);
            Map<String,Object> inputMap = new  Map<String,Object> ();
            Map<String,Object> outMap = new  Map<String,Object> ();
            Map<String,Object> options = new  Map<String,Object> ();
            //**********************Added by Karan*********
            Map<String,Object> obj1 = new  Map<String,Object> ();
            obj1.put('AppEffectiveDateFormula', '03/01/2020');
            inputMap.put('EmployerInformation', obj1);
            //****************************************
            options = (Map<String, Object>) JSON.deserializeUntyped(optionjson);
            options.put(GROUPSPECIFICATION,SG_GROUPVALUE);
            options.put('zipcode','81630');
            options.put('countycode','08077');
            options.put('Service_Area__c','ABFCOS001,ABFCOS002');
            options.put('PlanName','Test');      
            options.put('ContractCode','S07R');      
            Test.startTest();
            SGA_AP114_FetchABFEnrollProducts ag = new SGA_AP114_FetchABFEnrollProducts ();       
            ag.invokeMethod(FETCHABFMEDPROD,inputMap,outMap,options);
            Test.stopTest();
        }
    }
    /************************************************************************************
Method Name : testGetProductsLG
Parameters  : None
Return type : void
Description : This is the testmethod for getting ABF Large group Products
*************************************************************************************/
    private static testMethod void testGetProductsLG() {
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            list<vlocity_ins__AttributeAssignment__c> listva =createtestAttriAssign();            
            string optionjson = '{"productSearchCriteria":  "vlocity_ins__Type__c = \'' +'Medical'+ '\'"}';
            Geographical_Info__c geo = new Geographical_Info__c(State__c='CO' ,Name = 'EBCBS' ,Zip_Code__c = '81630' , County__c='MEREDA',County_Code__c='08077', RatingArea__c =3,Service_Area__c='ABFCOS001,ABFCOS002');
            database.insert(geo);
            Map<String,Object> inputMap = new  Map<String,Object> ();
            Map<String,Object> outMap = new  Map<String,Object> ();
            Map<String,Object> options = new  Map<String,Object> ();       
            options = (Map<String, Object>) JSON.deserializeUntyped(optionjson);
            options.put(GROUPSPECIFICATION,LG_GROUPVALUE);
            options.put('zipcode','81630');
            options.put('countycode','08077');
            options.put('Service_Area__c','ABFCOS001,ABFCOS002');
            options.put('PlanName','Test');      
            options.put('ContractCode','S07R');      
            Test.startTest();
            SGA_AP114_FetchABFEnrollProducts ag = new SGA_AP114_FetchABFEnrollProducts ();       
            ag.invokeMethod(FETCHABFMEDPROD,inputMap,outMap,options);
            Test.stopTest();
        }
    }
    /************************************************************************************
Method Name : testEmptyProducts
Parameters  : None
Return type : void
Description : This is the testmethod when products are empty
*************************************************************************************/
    private static testMethod void testEmptyProducts(){    
        User testUser = Util02_TestData.createUser();
        System.runAs(testUser){
            Map<String,Object> inputMapel2 = new  Map<String,Object> ();
            Map<String,Object> outMapel2 = new  Map<String,Object> ();
            Map<String,Object> optionsel2 = new  Map<String,Object> ();
            Test.startTest();
            SGA_AP114_FetchABFEnrollProducts ag2 = new SGA_AP114_FetchABFEnrollProducts ();               
            system.assertEquals(true, ag2.invokeMethod('FETCHABFMEDPROD',inputMapel2,outMapel2,optionsel2));
            Test.stopTest();
        }
    }
/************************************************************************************
Method Name : testWrapperProducts
Parameters  : None
Return type : void
Description : This is the testmethod to cover the Wrapper class
*************************************************************************************/
    private static testMethod void testWrapperProducts() {
        List<Product2> pd= createtestProduct();
        SGA_AP114_FetchABFEnrollProducts.abfMedProdWrapper wrapper = new SGA_AP114_FetchABFEnrollProducts.abfMedProdWrapper(
            pd[0].Id,
            pd[0].ProductCode+'-'+pd[0].Name,
            pd[0].ProductCode,
            pd[0].Tech_Rider_Options__c);
    } 
}