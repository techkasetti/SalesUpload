@isTest
public class deleteTheRecordsBasedonIdTest {
    
    static testMethod void testMethod1() 
    {
        
        /*  List<Sales_Transaction_Stage__c> records = new List<Sales_Transaction_Stage__c>();
for(Integer i=0 ;i <200;i++)
{*/
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
     
        
        Sales_Transaction_Stage__c records = new Sales_Transaction_Stage__c();
        records.Color__c ='BLACK';
        records.Upload_Batch_No__c = value.id;
        insert records;	
        System.assertEquals('BLACK', records.Color__c,'putFileRequestTest');
        // }
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus =[Select Id, Mainetti_Company__c, Record_Type__c from Inventory_Transaction_Master__c where Id=:value.id];
        
        
        
        
        Test.startTest();        
        deleteTheRecordsBasedonId obj = new deleteTheRecordsBasedonId(updateBatchStatus.Id);
        List<Sales_Transaction_Stage__c> salesTransStage = new  List<Sales_Transaction_Stage__c>();
        Database.BatchableContext bc1;
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
        
    }
    
   
    }