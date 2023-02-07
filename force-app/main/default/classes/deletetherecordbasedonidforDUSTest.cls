@isTest
public class deletetherecordbasedonidforDUSTest {
    
     static testMethod void test1(){
        
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');
        
        string batchId =value.Id;
        String userEmail = UserInfo.getUserEmail();
        
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
        
         salesSuccessData objj = new salesSuccessData(value.Id,userEmail);
        Test.setMock(HttpCalloutMock.class, new SalesSuccesDataHttpWebService()); 
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getCSVFile(value.id);
      
        /////////////////////////////////////////////

        
        Test.startTest();        
        deletetherecordbasedonidforDUS obj = new deletetherecordbasedonidforDUS(batchId);
        List<Data_Upload_Sales__c> salesTransStage = new  List<Data_Upload_Sales__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }

    static testMethod void test2(){
        
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');
        
        string batchId =value.Id;
        String userEmail = UserInfo.getUserEmail();
        
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
        
         salesSuccessData objj = new salesSuccessData(value.Id,userEmail);
        Test.setMock(HttpCalloutMock.class, new SalesSuccesDataHttpWebService()); 
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getCSVFile(value.id);
      
        /////////////////////////////////////////////

        
        Test.startTest();        
        deletetherecordbasedonidforDUS obj = new deletetherecordbasedonidforDUS(batchId);
        List<Data_Upload_Sales__c> salesTransStage = new  List<Data_Upload_Sales__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }
        static testMethod void test3(){
         string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');
        
        string batchId =value.Id;
        String userEmail = UserInfo.getUserEmail();
        
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
        
         salesSuccessData objj = new salesSuccessData(value.Id,userEmail);
        Test.setMock(HttpCalloutMock.class, new MockGenerator()); 
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getCSVFile(value.id);
      
        /////////////////////////////////////////////

        
        Test.startTest();        
        deletetherecordbasedonidforDUS obj = new deletetherecordbasedonidforDUS(batchId);
        List<Data_Upload_Sales__c> salesTransStage = new  List<Data_Upload_Sales__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }
        
}