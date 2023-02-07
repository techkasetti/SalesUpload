public with sharing class SalesValidationFailSummaryController {
    
    @AuraEnabled
    public static List<ValidationFailErrorCodeWrapperObject> initializeAccordianHeaderList(String batchNo){
        
        List<ValidationFailErrorCodeWrapperObject> errorCodeWrapHeaderList = new List<ValidationFailErrorCodeWrapperObject>();
        
        //Get picklist values to populate header 
        Schema.DescribeFieldResult fieldResult = Sales_Error_Code__c.Error_Type__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for(integer i=0; i<pList.Size(); i++){
            if(pList[i].getValue() <> 'Missing Field'){
                ValidationFailErrorCodeWrapperObject errorCodeHeader = new ValidationFailErrorCodeWrapperObject();
                errorCodeHeader.headerNo = 'No';
                errorCodeHeader.picklistValue = pList[i].getValue();
                errorCodeHeader.headerErrMessage = pList[i].getValue() + ' : Error Message';
                errorCodeHeader.headerErrRecords = 'Error Records';
                errorCodeHeader.headerErrDetailReport = 'Error Detail Report';
                errorCodeHeader.headerErrDescription = 'Error Description';
                
                List<ValidationFailErrorCodeWrapper> errorCodeWrapList = getValidationFailSummaryOnErrorType(batchNo, pList[i].getValue());
                
                errorCodeHeader.validationErrorCodeList = errorCodeWrapList;
                errorCodeWrapHeaderList.add(errorCodeHeader);
            }
        }
        return errorCodeWrapHeaderList;
    }
    
    @AuraEnabled
    public static List<ValidationFailErrorCodeWrapper> getValidationFailSummaryOnErrorType(String batchNo, String errorType){
        
        List<Sales_Error_Code__c> salesErrorCode ;
        if(
            Sales_Error_Code__c.SObjectType.getDescribe().isAccessible()
        ) {

        salesErrorCode  = [Select Name,Error_Records__c,Error_Description__c,Error_Detail_Report_Link__c,
                                                 Error_Message__c from Sales_Error_Code__c WHERE Record_Code_Type__c = 'Sales Upload' and Active__c = true and Error_Type__c = :errorType];
        }
        Set<String> errorCodes = new Set<String>();
        Map<String,Sales_Error_Code__c> errorCodeObjMap = new Map<String,Sales_Error_Code__c>();
        Map<String,Integer> errorCodeCountMap = new Map<String,Integer>();
        
        for(Sales_Error_Code__c errCode : salesErrorCode){
            String errrCode = '%' + errCode.Name + '%';
            errorCodes.add(errrCode);
            errorCodeObjMap.put(errCode.Name,errCode);
        }
        
        List<Sales_Transaction_Stage__c> salesTransStage;
        if(
            Sales_Transaction_Stage__c.SObjectType.getDescribe().isAccessible()
        ) {

        salesTransStage = [Select ERROR_CODE__c from Sales_Transaction_Stage__c where 
                                                      Upload_Batch_No__c=:batchNo and ERROR_CODE__c like :errorCodes];
        }
        for(Sales_Transaction_Stage__c salesStage : salesTransStage){
            String[] stageErorCodes= salesStage.ERROR_CODE__c .split(',');
            System.debug(stageErorCodes);
            for(String erCode : stageErorCodes){
                if(String.isNotBlank(erCode)){
                    if(errorCodeCountMap.containsKey(erCode)){
                        Integer errorCodeCount = errorCodeCountMap.get(erCode);
                        errorCodeCount = errorCodeCount + 1;
                        errorCodeCountMap.put(erCode,errorCodeCount);
                    } else {
                        Integer errorCodeCount = 1;
                        errorCodeCountMap.put(erCode,errorCodeCount);
                    }
                }
            }
        }
        
        List<ValidationFailErrorCodeWrapper> errorCodeWrapList = new List<ValidationFailErrorCodeWrapper>();
        for(String errorCodeKey : errorCodeCountMap.keySet()){
            Sales_Error_Code__c errCodeObject = new Sales_Error_Code__c();
            errCodeObject = errorCodeObjMap.get(errorCodeKey);
            if(errCodeObject <> null){
                ValidationFailErrorCodeWrapper errCodeWrap = new ValidationFailErrorCodeWrapper();
                errCodeWrap.errorCode = errorCodeKey;
                errCodeWrap.errorCount = errorCodeCountMap.get(errorCodeKey);                
                errCodeWrap.errorMessage = errCodeObject.Error_Message__c;
                errCodeWrap.errorDescription = errCodeObject.Error_Description__c;
                errCodeWrap.errorReportLink = errCodeObject.Error_Detail_Report_Link__c;                
                errorCodeWrapList.add(errCodeWrap);
            }
        }
        return errorCodeWrapList;
    }
    
    public class ValidationFailErrorCodeWrapper {
        @AuraEnabled public String errorCode {get;set;}
        @AuraEnabled public Integer errorCount {get;set;}
        @AuraEnabled public String errorMessage {get;set;}
        @AuraEnabled public String errorDescription {get;set;}
        @AuraEnabled public String errorReportLink {get;set;}
    }
    
    
    public class ValidationFailErrorCodeWrapperObject {        
        @AuraEnabled public String headerNo {get;set;}
        @AuraEnabled public String headerErrMessage {get;set;}
        @AuraEnabled public String headerErrRecords {get;set;}
        @AuraEnabled public String headerErrDetailReport {get;set;}
        @AuraEnabled public String headerErrDescription {get;set;}
        @AuraEnabled public String picklistValue {get;set;}
        @AuraEnabled public List<ValidationFailErrorCodeWrapper> validationErrorCodeList {get;set;}
    }

}