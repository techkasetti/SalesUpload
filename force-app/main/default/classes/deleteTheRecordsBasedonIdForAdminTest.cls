@isTest
public class deleteTheRecordsBasedonIdForAdminTest {
    
    static testMethod void test1(){
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');
        string batchId = value.Id;
        String userEmail = UserInfo.getUserEmail();
        
        Test.startTest();        
        deleteTheRecordsBasedonIdForAdmin obj = new deleteTheRecordsBasedonIdForAdmin(batchId,userEmail);
        List<Sales_Transaction_Stage__c> salesTransStage = new  List<Sales_Transaction_Stage__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }
    
    static testMethod void test2(){
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = '8 - Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');
        string batchId = value.Id;
        String userEmail = UserInfo.getUserEmail();
        
        Test.startTest();        
        deleteTheRecordsBasedonIdForAdmin obj = new deleteTheRecordsBasedonIdForAdmin(batchId,userEmail);
        List<Sales_Transaction_Stage__c> salesTransStage = new  List<Sales_Transaction_Stage__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }
}