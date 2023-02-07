@IsTest
public class SalesValidationFailSummaryControllerTest {
    
    static testMethod void initializeAccordianHeaderListTest(){
        
        Sales_Error_Code__c salesErrCodeObj = new Sales_Error_Code__c(); 
        salesErrCodeObj.Error_Message__c = 'Test message';
        salesErrCodeObj.Error_Description__c = 'Test description';
        salesErrCodeObj.Error_Type__c = 'Model';
         salesErrCodeObj.Record_Code_Type__c = 'Sales Upload';
         salesErrCodeObj.Active__c = true;
        insert salesErrCodeObj;
        
        Sales_Error_Code__c getSalesErrorCode  = [Select Name from Sales_Error_Code__c limit 1];
        
        Inventory_Transaction_Master__c invMasterObj = new Inventory_Transaction_Master__c();
        insert invMasterObj;
        
        Sales_Transaction_Stage__c salesStageObj = new Sales_Transaction_Stage__c();
        salesStageObj.Upload_Batch_No__c = invMasterObj.Id;
        salesStageObj.Error_Code__c = getSalesErrorCode.Name;
        insert salesStageObj;
        Sales_Transaction_Stage__c salesStageObj2 = new Sales_Transaction_Stage__c();
        salesStageObj2.Upload_Batch_No__c = invMasterObj.Id;
        salesStageObj2.Error_Code__c = getSalesErrorCode.Name;
        insert salesStageObj2;
        
        Test.startTest();
        SalesValidationFailSummaryController.initializeAccordianHeaderList(invMasterObj.Id);
        System.assertEquals('Sales Upload', salesErrCodeObj.Record_Code_Type__c,'initializeAccordianHeaderListTest');
        Test.stopTest();
    }

}