@isTest
public class SGA_AP_GenericUtilsVlocityTest {

    private static testMethod void testValidCARatingArea1or9() {
        Map<String,object> inputMap = new Map<String,object>();
        Map<String,object> outMap = new Map<String,object>();
        Map<String, Object> optns = new Map<string,Object>();
                
        optns.put('ZipCode', '95223');
        optns.put('CountyName', 'ALPINE');
        new SGA_AP_GenericUtilsVlocity().invokeMethod('validCARatingArea1or9',inputMap,outMap,optns);
        system.assertEquals(outMap.get('ValidCARatingArea1or9'), true);        
    }
    
    private static testMethod void testInValidCARatingArea1or9() {
        Map<String,object> inputMap = new Map<String,object>();
        Map<String,object> outMap = new Map<String,object>();
        Map<String, Object> optns = new Map<string,Object>();
                
        optns.put('ZipCode', '12345');
        optns.put('CountyName', 'Dummy');
        new SGA_AP_GenericUtilsVlocity().invokeMethod('validCARatingArea1or9',inputMap,outMap,optns);
        system.assertEquals(outMap.get('ValidCARatingArea1or9'), false);        
    }

}