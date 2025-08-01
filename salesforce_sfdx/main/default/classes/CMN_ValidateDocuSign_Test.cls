@isTest
public class CMN_ValidateDocuSign_Test {
    
    static testMethod void validateDocusign(){        
        CMN_ValidateDocuSign valid= new CMN_ValidateDocuSign ();
        Map<String,Object> inputMap = new Map<String, Object>{'DocuSign Signature Action' => new List<Object>{new Map<String, Object>{'status' => 'Completed'}}};
            Map<String,Object> outMap = new Map<String, Object>();
        Map<String,Object> options= new Map<String, Object>(); 
        valid.invokeMethod('validateDocuSignPrint',inputMap, outMap, options);
        valid.invokeMethod('validateDocuSignPrintABFSpeciality',inputMap, outMap, options);
        valid.invokeMethod('validateDocuSignPrintABFCASpeciality',inputMap, outMap, options);
    }
    
    static testMethod void validateDocusignFalse(){
        CMN_ValidateDocuSign valid= new CMN_ValidateDocuSign ();
        Map<String,Object> inputMap = new Map<String, Object>{'DocuSign Signature Action' => new List<Object>{new Map<String, Object>{'status' => 'In Process'}}};
        Map<String,Object> outMap = new Map<String, Object>();
        Map<String,Object> options= new Map<String, Object>(); 
        valid.invokeMethod('validateDocuSignPrint',inputMap, outMap, options);
        valid.invokeMethod('validateDocuSignPrintABFSpeciality',inputMap, outMap, options);
        valid.invokeMethod('validateDocuSignPrintABFCASpeciality',inputMap, outMap, options);
    }
}