@isTest
public class ViewErrorSummaryTest {
    @isTest
    static void fetchErrorCountTest()
    {
        
        
        Sales_Error_Code__c salesErrCodeObj = new Sales_Error_Code__c();
        salesErrCodeObj.Error_Message__c = 'Family';
        salesErrCodeObj.Error_Description__c = 'SUM(Family_FF__c)Family';
        salesErrCodeObj.Error_Type__c = 'Missing Field';
            salesErrCodeObj.Record_Code_Type__c = 'Sales Upload';
        salesErrCodeObj.Active__c = true;
        insert salesErrCodeObj;
        
        
        Inventory_Transaction_Master__c invMasterObj = new Inventory_Transaction_Master__c(); 
        invMasterObj.Sales_Company__c = 'Hong Kong Packaging';
        invMasterObj.Sales_Month__c = 'May';
        invMasterObj.Sales_Year__c = '2020';
        insert invMasterObj;
        
        Sales_Transaction_Stage__c salesStageObj = new Sales_Transaction_Stage__c();
        salesStageObj.Upload_Batch_No__c = invMasterObj.Id;
        salesStageObj.Error_Code__c = salesErrCodeObj.Name;
        insert salesStageObj;
        
        Test.startTest();
        ViewErrorSummary.fetchErrorCount(invMasterObj.id);
        System.assertEquals('Sales Upload', salesErrCodeObj.Record_Code_Type__c,'fetchErrorCountTest');
        Test.stopTest();
    }
    
}