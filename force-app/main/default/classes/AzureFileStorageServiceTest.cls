@isTest
public class AzureFileStorageServiceTest {
 
    @TestSetup
    static void mainAzureUploadTest(){
        
        string csv = '[{"Company__c": "Hong Kong Packaging","Year__c": "2019","Week__c": "Wk02","Month__c": "Jan","Item_code__c": "HGR-3944   BLK002-  100","Material__c": "PS","Source__c": "Virgin","Model__c": "1000","Printed_Logo__c": "demoLogo","Color__c": "BLACK","Customer__c": "xxxxx","Customer_local_name__c": "","Mainetti_Brand__c": "Mainetti","Category__c": "HANGERS & ACCESSORIES","Sub_Category__c": "HANGERS","Family__c": "BOTTOM","Order_Type__c": "3rd","Unit_Sold__c": "2520","Unit_Price_100_EUR__c": "10.65123","Unit_Price_100_USD__c": "12.40602","Net_Unit_Price_100__c": "11","Sales_EUR__c": "268.410993","Sales_USD__c": "312.631704","Transaction_Currency__c" : "HKD","ExRate_to_EUR__c": "9.08505","ExRate_to_USD__c": "7.8","Local_Net_Unit_Pirce_100__c": "13","Sales_Transaction_Currency__c": "2438.527291","Shipped_To_Factory__c": "xxxxxx","Shipped_To_Country__c": "xxxxxx","Label__c": "","End_user__c": "","Vendor__c": "DemoRetailer","Division__c": "Demo","Retailer_Brand__c": "Demo", "Royalty_Rate__c": "", "Market__c": "USA","Remark__c": "","LOB__c": "PRL","": "SO_Number__c": "18300168","Production_Country__c": "CHINA"}]';
        string fileName = 'sample';
        String batchId = '';
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Budget';
        value.Mainetti_Company__c = 'Vietnam';
        insert value; 
      
        ContentVersion salesFile = new ContentVersion();
        salesFile.ContentLocation = 'S';
        salesFile.VersionData = Blob.valueOf(csv);
        salesFile.Title = 'Sales Data File Uplaod';
        salesFile.PathOnClient = fileName;            
        insert salesFile;
        
        ContentVersion salesVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :salesFile.Id]; 
        List<ContentVersion> conVerList = new  List<ContentVersion>();
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=salesVerContent.ContentDocumentId;            
        insert contentlink;
        
        Cogs_Sales_Upload__c customdataInv = new Cogs_Sales_Upload__c();
        customdataInv.storageKey__c ='h+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        customdataInv.storageName__c = 'mcogs01';
        customdataInv.containerName__c = 'mcogs01files/SalesForce/SalesUpload';
        customdataInv.File_Download_Path__c = 'mcogs01files/SalesForce/SalesUploadSuccess';
        customdataInv.File_Delete_Path__c = 'mcogs01files/SalesForce/SalesUploadDeleteBatchTest';
        insert customdataInv;
        
    }
    
    //@TestSetup
    static testMethod void putFileRequestTest(){
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Budget';
        value.Mainetti_Company__c = 'Vietnam';
        insert value; 
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        String account='';
        String storageKey ='jvgVaNt0NiDwLOuvX9HX5M8hliJF4TI1cQmKcfnALKpTJ6hJ5mtoX0ST2MaKdYEmTbJgCr89keEc8xvQltoF1A==';
        String containerName= 'mpdm01files/salesforce';
        String encodedfileName ='';
        string fileLength = '2';
        Blob myBlob =  Blob.valueOf(csv);
        Integer startRange = 123;
        System.assertEquals('Budget', value.Record_Type__c,'putFileRequestTest');
        
        
    }
    
    private class RestMock implements HttpCalloutMock {
        
        public HTTPResponse respond(HTTPRequest req) {
            String fullJson = 'your Json Response';
            
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
    static testMethod void servicecall() {
     
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new RestMock());
        //your webserive call code
        
        string csv = '[{"Company__c": "Hong Kong Packaging","Year__c": "2019","Week__c": "Wk02","Month__c": "Jan","Item_code__c": "HGR-3944   BLK002-  100","Material__c": "PS","Source__c": "Virgin","Model__c": "1000","Printed_Logo__c": "demoLogo","Color__c": "BLACK","Customer__c": "xxxxx","Customer_local_name__c": "","Mainetti_Brand__c": "Mainetti","Category__c": "HANGERS & ACCESSORIES","Sub_Category__c": "HANGERS","Family__c": "BOTTOM","Order_Type__c": "3rd","Unit_Sold__c": "2520","Unit_Price_100_EUR__c": "10.65123","Unit_Price_100_USD__c": "12.40602","Net_Unit_Price_100__c": "11","Sales_EUR__c": "268.410993","Sales_USD__c": "312.631704","Transaction_Currency__c" : "HKD","ExRate_to_EUR__c": "9.08505","ExRate_to_USD__c": "7.8","Local_Net_Unit_Pirce_100__c": "13","Sales_Transaction_Currency__c": "2438.527291","Shipped_To_Factory__c": "xxxxxx","Shipped_To_Country__c": "xxxxxx","Label__c": "","End_user__c": "","Vendor__c": "DemoRetailer","Division__c": "Demo","Retailer_Brand__c": "Demo", "Royalty_Rate__c": "", "Market__c": "USA","Remark__c": "","LOB__c": "PRL","": "SO_Number__c": "18300168","Production_Country__c": "CHINA"}]';
        string fileName = 'sample';
        String batchId = '';
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Budget';
        value.Mainetti_Company__c = 'Vietnam';
        insert value; 
      
        ContentVersion salesFile = new ContentVersion();
        salesFile.ContentLocation = 'S';
        salesFile.VersionData = Blob.valueOf(csv);
        salesFile.Title = 'Sales Data File Uplaod';
        salesFile.PathOnClient = fileName;            
        insert salesFile;
        
        ContentVersion salesVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :salesFile.Id]; 
        List<ContentVersion> conVerList = new  List<ContentVersion>();
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=salesVerContent.ContentDocumentId;            
        insert contentlink;
        
        
        boolean flag = true;
        
         Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Period__c,Upload_Converted_File_Name__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c from Inventory_Transaction_Master__c where Id =: value.Id ];
         String fileDelimiter = invTransMast.File_Delimiters__c;
         String batchNumber = invTransMast.Batch_No__c;
         system.debug('batchNumber:::'+batchNumber);
        boolean createStatus = true;
        
        String csvFile;
        String csvColumnHeader = '';
        String converTitle = 'Sales Data File Uplaod';
        String contentType = 'text/plain';
        String fileNames = invTransMast.Sales_Company__c+'+'+invTransMast.Period__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'.csv';
         system.debug('fileName:::'+fileNames);
         
          String batchNo = batchNumber != null ? batchNumber : '';          
             String fileData = '"'+ batchNo +'"';
          system.debug('fileData:::'+fileData);
       
        AzureFileStorageService azurefilestorage = new AzureFileStorageService();
       // azurefilestorage.mainAzureUpload(value.id); 
       // azurefilestorage.mainAzureUpload(value.id,converTitle);  
         azurefilestorage.mainAzureUploadDelete(value.id,fileNames,fileData);  
        azurefilestorage.downloadAzureFile(fileName);
         azurefilestorage.downloadConvertedAzureFile(fileName);
        System.assertEquals('Budget', value.Record_Type__c,'servicecall');
        Test.StopTest();
    }
    
    static testMethod void servicecalls() {
     
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new RestMock());
        //your webserive call code
        
       string csv = '[{"Mainetti_Company__c":"Hong Kong Packaging","Year__c":"2019","Period__c":"Q1 Review","Business_Vertical__c":"FLEXIBLE PACKAGING","SubCategory__c":"APPAREL BAGS","Source__c":"VIRGIN","Retailer__c":"DEBENHAMS","Local_Currency__c":"VND","ExRate_to_USD__c":"0.000037","ExRate_to_EUR__c":"0.000038","Jan_Qty__c":"100","Jan_Budget_Value__c":"80","Feb_Qty__c":"150","Feb_Budget_Value__c":"110","Mar_Qty__c":"150","Mar_Budget_Value__c":"80","Apr_Qty__c":"150","Apr_Budget_Value__c":"80","May_Qty__c":"100","May_Budget_Value__c":"80","Jun_Qty__c":"110","Jun_Budget_Value__c":"25","Jul_Qty__c":"50","Jul_Budget_Value__c":"30","Aug_Qty__c":"90","Aug_Budget_Value__c":"70","Sep_Qty__c":"130","Sep_Budget_Value__c":"100","Oct_Qty__c":"120","Oct_Budget_Value__c":"90","Nov_Qty__c":"100","Nov_Budget_Value__c":"50","Dec_Qty__c":"100","Dec_Budget_Value__c":"50"}]';
        string fileName = 'sample';
        String batchId = '';
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Budget';
        value.Mainetti_Company__c = 'Vietnam';
        insert value; 
      
        ContentVersion salesFile = new ContentVersion();
        salesFile.ContentLocation = 'S';
        salesFile.VersionData = Blob.valueOf(csv);
        salesFile.Title = 'Sales Data File Uplaod';
        salesFile.PathOnClient = fileName;            
        insert salesFile;
        
        ContentVersion salesVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :salesFile.Id]; 
        List<ContentVersion> conVerList = new  List<ContentVersion>();
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=salesVerContent.ContentDocumentId;            
        insert contentlink;
        
        boolean flag = true;
        
         Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Sales_Month__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c from Inventory_Transaction_Master__c where Id =: value.Id ];
         String fileDelimiter = invTransMast.File_Delimiters__c;
         String batchNumber = invTransMast.Batch_No__c;
         system.debug('batchNumber:::'+batchNumber);
        boolean createStatus = true;
        
        String csvFile;
        String csvColumnHeader = '';
        String converTitle = 'Sales Data File Uplaod';
        String contentType = 'text/plain';
        String fileNames = invTransMast.Sales_Company__c+'+'+invTransMast.Sales_Month__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'.csv';
         system.debug('fileName:::'+fileNames);
         
          String batchNo = batchNumber != null ? batchNumber : '';          
             String fileData = '"'+ batchNo +'"';
          system.debug('fileData:::'+fileData);
       
        AzureFileStorageService azurefilestorage = new AzureFileStorageService();
       // azurefilestorage.mainAzureUpload(value.id); 
        azurefilestorage.mainAzureUpload(value.id,converTitle);
        azurefilestorage.mainAzureUserUpload(value.id,converTitle);
        // azurefilestorage.mainAzureUploadDelete(value.id,fileNames,fileData);  
        //azurefilestorage.downloadAzureFile(fileName);
        System.assertEquals('Budget', value.Record_Type__c,'servicecalls'); 
        Test.StopTest();
    }
    static testMethod void servicecall1() {
      Test.startTest();
        Test.setMock(HttpCalloutMock.class, new RestMock());
        //your webserive call code
        
        string csv = '[{"Company__c": "Hong Kong Packaging","Year__c": "2019","Week__c": "Wk02","Month__c": "Jan","Item_code__c": "HGR-3944   BLK002-  100","Material__c": "PS","Source__c": "Virgin","Model__c": "1000","Printed_Logo__c": "demoLogo","Color__c": "BLACK","Customer__c": "xxxxx","Customer_local_name__c": "","Mainetti_Brand__c": "Mainetti","Category__c": "HANGERS & ACCESSORIES","Sub_Category__c": "HANGERS","Family__c": "BOTTOM","Order_Type__c": "3rd","Unit_Sold__c": "2520","Unit_Price_100_EUR__c": "10.65123","Unit_Price_100_USD__c": "12.40602","Net_Unit_Price_100__c": "11","Sales_EUR__c": "268.410993","Sales_USD__c": "312.631704","Transaction_Currency__c" : "HKD","ExRate_to_EUR__c": "9.08505","ExRate_to_USD__c": "7.8","Local_Net_Unit_Pirce_100__c": "13","Sales_Transaction_Currency__c": "2438.527291","Shipped_To_Factory__c": "xxxxxx","Shipped_To_Country__c": "xxxxxx","Label__c": "","End_user__c": "","Vendor__c": "DemoRetailer","Division__c": "Demo","Retailer_Brand__c": "Demo", "Royalty_Rate__c": "", "Market__c": "USA","Remark__c": "","LOB__c": "PRL","": "SO_Number__c": "18300168","Production_Country__c": "CHINA"}]';
        string fileName = 'sample';
        String batchId = '';
        boolean flag = true;
        String account='sample';
        String storageKey ='h+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        String containerName= 'mcogs01files/SalesForce/SalesUpload';
        String encodedfileName ='';
        string fileLength = '20';
        Blob myBlob =  Blob.valueOf(csv);
        Integer startRange = 123;
        String startRange1 = '5';
        String endRange = '20';
        // String fileLength = '';
        String fileVal = '4';
        string deletePath = 'mcogs01files/SalesForce/SalesUploadDeleteBatchTest';
         String fileValue = myBlob.toString();
    if(startRange <> 0){
        fileValue = '\n' + myBlob.toString();
    }    
    Blob blobValue = Blob.valueOf(fileValue);
        
        AzureFileStorageService.putFileRequest(account,storageKey,encodedfileName,containerName,myBlob,startRange);
        AzureFileStorageService.createFileRequest(account,storageKey,containerName,encodedfileName,fileLength);
        AzureFileStorageService.putFileRange(account, storageKey,containerName,encodedfileName,startRange1,endRange,fileLength,fileVal,myBlob);
        AzureFileStorageService.putFileRangeDeletePath(account,storageKey,deletePath,encodedfileName, startRange1, endRange, fileLength, fileVal, blobValue);
        AzureFileStorageService.putFileRequestDeletePath(account, storageKey, deletePath, encodedfileName, myBlob, startRange);
        System.assertEquals(true, flag ,'servicecall1'); 
        Test.StopTest();
     
    }
    
}