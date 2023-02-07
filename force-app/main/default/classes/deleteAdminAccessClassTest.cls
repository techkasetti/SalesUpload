@isTest
public class deleteAdminAccessClassTest {
    
    @isTest
    static void testGetRetailerData()
    {
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus.Batch_Status__c = 'Migration In Progress'; 
        updateBatchStatus.Record_Type__c  = 'sales';
        updateBatchStatus.Sales_Month__c = 'jan';
        updateBatchStatus.Sales_Year__c = '2019';
        insert updateBatchStatus;
        string returnBatchId = updateBatchStatus.Id;
        String batchId1 = updateBatchStatus.Id;
        
        Inventory_Transaction_Master__c invtrans = new Inventory_Transaction_Master__c();
        invtrans.Batch_Status__c = 'Migration In Progress';
        invtrans.Record_Type__c  = 'sales';
        invtrans.Sales_Month__c = 'jan';
        invtrans.Sales_Year__c = '2019';
        insert invtrans;
        
        List<Sales_Transaction_Stage__c> transferRecords1 = new List<Sales_Transaction_Stage__c>();
        Sales_Transaction_Stage__c stageValue = new Sales_Transaction_Stage__c();
        stageValue.Color__c = 'GRAY';
        stageValue.Record_Status__c = '2 - Data Validation Successful';
        stageValue.Upload_Batch_No__c = invtrans.id;
        stageValue.Company__c = 'Hong Kong Packaging';
        stageValue.Year__c = '2019';
        stageValue.Unit_Sold__c = '234';
        stageValue.Unit_Price_100_EUR__c = '24';
        stageValue.Unit_Price_100_USD__c = '25';
        stageValue.Sales_EUR__c = '10';
        stageValue.Sales_USD__c = '20';
        stageValue.Unit_Sold__c = '234';
        stageValue.ExRate_to_EUR__c = '234';
        stageValue.ExRate_to_USD__c = '234';
        stageValue.Local_Net_Unit_Pirce_100__c = '234';
        stageValue.Sales_Transaction_Currency__c = '234';
        stageValue.Gross_Sales_USD__c = '12.2';
        stageValue.Freight_Charge_USD__c = '2.2';
        stageValue.Month__c = 'jan';
        
        insert stageValue;
        
        List<Sales_Transaction_Stage__c> transferRecords= new List<Sales_Transaction_Stage__c>();
        transferRecords.add(stageValue);  
        
        
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = '2 - Data Validation In Progress';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        value.Success_Notification__c = true;
        value.Reprocessing__c = false;
        value.Sales_Month__c = 'jan';
        value.Sales_Year__c = '2019';
        insert value;
        
        Sales_Transaction_Stage__c salesTranscation = new Sales_Transaction_Stage__c();
        salesTranscation.Vendor__c= 'JC PENNEY';
        salesTranscation.Model__c = 'CS1Q';
        salesTranscation.Retailer_Check__c = true;
        salesTranscation.Model_Check__c = True;
        salesTranscation.Record_Status__c = '2 - Data Validation Successful';
        salesTranscation.Upload_Batch_No__c = value.Id;
        salesTranscation.Unit_Sold__c = '123';
        salesTranscation.Unit_Price_100_EUR__c = '12';
        salesTranscation.Unit_Price_100_USD__c = '675';
        salesTranscation.Sales_EUR__c = '11';
        salesTranscation.Sales_USD__c = '121';
        salesTranscation.ExRate_to_EUR__c ='321';
        salesTranscation.ExRate_to_USD__c = '521';
        salesTranscation.Local_Net_Unit_Pirce_100__c = '989';
        salesTranscation.Sales_Transaction_Currency__c = '525';
        salesTranscation.Gross_Sales_USD__c = '125';
        salesTranscation.Freight_Charge_USD__c = '323';
        salesTranscation.Month__c = 'jan';
        salesTranscation.Year__c = '2019';
        insert salesTranscation;
        
        Sales_Transaction_Stage__c salesTranscation00 = new Sales_Transaction_Stage__c();
        salesTranscation00.Vendor__c= 'JC PENNEY';
        salesTranscation00.Model__c = 'CS1Q';
        salesTranscation00.Retailer_Check__c = true;
        salesTranscation00.Model_Check__c = True;
        salesTranscation00.UnitSoldCombinationNotFound__c = true;
        salesTranscation00.Record_Status__c = '2 - Data Validation Successful';
        salesTranscation00.Upload_Batch_No__c = value.Id;
        salesTranscation00.Unit_Sold__c = '0';
        salesTranscation00.Unit_Price_100_EUR__c = '12';
        salesTranscation00.Unit_Price_100_USD__c = '675';
        salesTranscation00.Sales_EUR__c = '0';
        salesTranscation00.Sales_USD__c = '0';
        salesTranscation00.ExRate_to_EUR__c ='321';
        salesTranscation00.ExRate_to_USD__c = '521';
        salesTranscation00.Local_Net_Unit_Pirce_100__c = '989';
        salesTranscation00.Sales_Transaction_Currency__c = '0';
        salesTranscation00.Gross_Sales_USD__c = '125';
        salesTranscation00.Freight_Charge_USD__c = '323';
        salesTranscation00.Month__c = 'jan';
        salesTranscation00.Year__c = '2019';
        insert salesTranscation00;
        
        Sales_Transaction_Stage__c salesTranscationBlank= new Sales_Transaction_Stage__c();
        salesTranscationBlank.Vendor__c= 'JC PENNEY';
        salesTranscationBlank.Model__c = 'CS1Q';
        salesTranscationBlank.Retailer_Check__c = true;
        salesTranscationBlank.Model_Check__c = True;
        salesTranscationBlank.UnitSoldCombination__c = true;
        salesTranscationBlank.Record_Status__c = '2 - Data Validation Successful';
        salesTranscationBlank.Upload_Batch_No__c = value.Id;
        salesTranscationBlank.Unit_Sold__c = '0';
        salesTranscationBlank.Unit_Price_100_EUR__c = '12';
        salesTranscationBlank.Unit_Price_100_USD__c = '675';
        salesTranscationBlank.Sales_EUR__c = '';
        salesTranscationBlank.Sales_USD__c = '';
        salesTranscationBlank.ExRate_to_EUR__c ='321';
        salesTranscationBlank.ExRate_to_USD__c = '521';
        salesTranscationBlank.Local_Net_Unit_Pirce_100__c = '989';
        salesTranscationBlank.Sales_Transaction_Currency__c = '';
        salesTranscationBlank.Gross_Sales_USD__c = '125';
        salesTranscationBlank.Freight_Charge_USD__c = '323';
        salesTranscationBlank.Month__c = 'jan';
        salesTranscationBlank.Year__c = '2019';
        insert salesTranscationBlank;
        
        Sales_Transaction_Stage__c salesTranscationWarning= new Sales_Transaction_Stage__c();
        salesTranscationWarning.Vendor__c= 'JC PENNEY';
        salesTranscationWarning.Model__c = 'CS1Q';
        salesTranscationWarning.Retailer_Check__c = true;
        salesTranscationWarning.Model_Check__c = True;
        salesTranscationWarning.unit_sold_warning__c = true;
        salesTranscationWarning.Record_Status__c = '2 - Data Validation Successful';
        salesTranscationWarning.Upload_Batch_No__c = value.Id;
        salesTranscationWarning.Unit_Sold__c = '0';
        salesTranscationWarning.Unit_Price_100_EUR__c = '12';
        salesTranscationWarning.Unit_Price_100_USD__c = '675';
        salesTranscationWarning.Sales_EUR__c = '123';
        salesTranscationWarning.Sales_USD__c = '123';
        salesTranscationWarning.ExRate_to_EUR__c ='321';
        salesTranscationWarning.ExRate_to_USD__c = '521';
        salesTranscationWarning.Local_Net_Unit_Pirce_100__c = '989';
        salesTranscationWarning.Sales_Transaction_Currency__c = '123';
        salesTranscationWarning.Gross_Sales_USD__c = '125';
        salesTranscationWarning.Freight_Charge_USD__c = '323';
        salesTranscationWarning.Month__c = 'jan';
        salesTranscationWarning.Year__c = '2019';
        insert salesTranscationWarning;
        
        ContentVersion invenotryFile = new ContentVersion();
        invenotryFile.ContentLocation = 'S';
        invenotryFile.VersionData = Blob.valueOf(csv);
        invenotryFile.Title = 'Inventory Data File Uplaod';
        invenotryFile.PathOnClient = fileName; 
        insert invenotryFile;   
        
        ContentVersion inventoryVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :invenotryFile.Id];            
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=inventoryVerContent.ContentDocumentId;            
        insert contentlink;       
        
        Cogs_Sales_Upload__c customdataInv = new Cogs_Sales_Upload__c();
        customdataInv.storageKey__c ='h+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        customdataInv.storageName__c = 'mcogs01';
        customdataInv.containerName__c = 'mcogs01files/SalesForce/SalesUpload';
        insert customdataInv;
        
        

       // Inventory_Transaction_Master__c inventoryTransMast = new Inventory_Transaction_Master__c();
        deleteAdminAccessClass.getDeleteData(value.Id);
        deleteAdminAccessClass.deleteRecordForInventory(value.Id);
        string userEmail = UserInfo.getUserEmail();
        string batchId = salesTranscation.Id;
        
        deleteTheRecordsBasedonIdForAdmin obj = new deleteTheRecordsBasedonIdForAdmin(value.Id,userEmail);
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getCSVFile(value.id);
        System.assertEquals('Sales', value.Record_Type__c,'testGetRetailerData');
       
    }

}