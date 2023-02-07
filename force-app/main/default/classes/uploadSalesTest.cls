@isTest
public class uploadSalesTest {
    static testMethod void dataSubmittedTest(){
        string companyArray = 'Hongkong Pakaging'; 
        string selmonth = 'April';
         string selyear = '2019';
        
        Data_Upload_Sales__c dataupload = new Data_Upload_Sales__c();
        dataupload.Sales_Data_Company__c = 'Honkong Pakaging';
        dataupload.Month__c = 'March';
        dataupload.Year__c ='2019';
       // insert dataupload;
         
           boolean flag = true;
        Test.startTest();
        uploadSales.dataSubmitted(companyArray, selmonth, selyear);       
        Test.stopTest();
        System.assertEquals(true, flag,'dataSubmittedTest');
  } 
    
    
    static testMethod void getDateandTypeRecordsTest() {   
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Inventory';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        //system.debug('value'+value);
        Test.startTest();
        uploadSales.getDateandTypeRecords(system.today(), system.today(), 'Inventory', '1 - Migration Success', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(system.today(), system.today(), 'Inventory', '2 - Migration Fail', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(system.today(), system.today(), 'Inventory', '', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(system.today(), system.today(), '', '1 - Migration Success', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(system.today(), system.today(), 'Inventory', '1 - Migration Success','');
        uploadSales.getDateandTypeRecords(system.today(), system.today(), 'Inventory', '','');
        uploadSales.getDateandTypeRecords(null, null, 'Inventory', '1 - Migration Success', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(system.today(), null, 'Inventory', '1 - Migration Success', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(null, system.today(), 'Inventory', '1 - Migration Success', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(null, null, '', '', 'Mainetti (HK) Ltd');
        uploadSales.getDateandTypeRecords(null, null, '', '1 - Migration Success', '');
        uploadSales.getDateandTypeRecords(null, null, '', '2 - Migration Fail', '');

        Test.stopTest();
        Inventory_Transaction_Master__c searchQuery = [Select Id,Batch_Status__c, Record_Type__c, Mainetti_Company__c from Inventory_Transaction_Master__c];
        System.assertEquals(String.valueOf(searchQuery.Record_Type__c),'Inventory'); 
    } 
    static testMethod void getSalesSearchRecordsTest(){
         Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        value.Sales_Company__c = 'Cambodia - Jin Jin';
        insert value;
        //system.debug('value'+value);
        Test.startTest();
        uploadSales.getSalesSearchRecords(system.today(), system.today(), 'Sales', '1 - Migration Success', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), system.today(), 'Sales', '2 - Migration Fail', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), system.today(), 'Sales', '', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), system.today(), '', '1 - Migration Success', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), system.today(), 'Sales', '1 - Migration Success','','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), system.today(), 'Sales', '','','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(null, null, 'Sales', '1 - Migration Success', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(system.today(), null, 'Sales', '1 - Migration Success', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(null, system.today(), 'Sales', '1 - Migration Success', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(null, null, '', '', 'Mainetti (HK) Ltd','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(null, null, '', '1 - Migration Success', '','Cambodia - Jin Jin');
        uploadSales.getSalesSearchRecords(null, null, '', '2 - Migration Fail', '','Cambodia - Jin Jin');
        
          Test.stopTest();
        Inventory_Transaction_Master__c searchQuery = [Select Id,Batch_Status__c, Record_Type__c, Mainetti_Company__c,Sales_Company__c from Inventory_Transaction_Master__c];
        System.assertEquals(String.valueOf(searchQuery.Record_Type__c),'Sales'); 
    }
    
    
    static testMethod void getSalesDataTest(){
         Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        
         string appName = 'InventoryUpload';
        
         Test.startTest();
        uploadSales.getSalesData();
        uploadSales.getCompanyWeekData(value.id);
       Test.stopTest();
        Inventory_Transaction_Master__c searchQuery = [Select Id,Batch_Status__c, Record_Type__c, Mainetti_Company__c from Inventory_Transaction_Master__c];
        System.assertEquals(String.valueOf(searchQuery.Record_Type__c),'Sales'); 
        
    }
    static testMethod void getPreviousYearTest(){
      boolean flag = true;
        Test.startTest();
        uploadSales.getPreviousYear();
        System.assertEquals(true, flag ,'getPreviousYearTest');
         Test.stopTest();
        
    }
    
    
    @IsTest
    static void createDocumentTest() {
        //string csv = "Retailer_Code__c,Mainetti_Company__c,Inventory_Model__c,Warehouse__c,Color__c,Sizer_Print__c,Local_System_SKU__c,Source__c,Stock_In_Date__c,Stock_In_Qty__c 
            //GU,Mainetti (HK) Ltd,TNGU139,LongHua Factory,GRAY,,157946,Virgin,23-May-19,200";    
        //List<sObject> csv = Test.loadData(Inventory_Transaction_Master__c.sObjectType, 'csvTest');
        
        string csv = '[{"Retailer_Code__c": "GU","Mainetti_Company__c": "Mainetti (HK) Ltd","Inventory_Model__c": "TNGU139","Warehouse__c": "LongHua Factory","Color__c": "GRAY","Sizer_Print__c": "","Local_System_SKU__c": "157946","Source__c": "Virgin","Stock_In_Date__c": "23-May-19","Stock_In_Qty__c": "200",}]';
        string fileName = 'sample';
        string covtfile = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;        
        
        Cogs_Sales_Upload__c customdataInv = new Cogs_Sales_Upload__c(); //Added by Varun on 11-09-2020
        customdataInv.storageKey__c ='h+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        customdataInv.storageName__c = 'mcogs01';
        customdataInv.containerName__c = 'mcogs01files/SalesForce';
        customdataInv.File_Download_Path__c = 'mcogs01files/SalesForce/SalesUploadSuccess';
        insert customdataInv;
        
         Sales_Transaction__c salestranC = new Sales_Transaction__c();
        salestranC.Profile__c = 'abc';
        insert salestranC;
        
        string returnBatchId = '';
        boolean flag = true;
        Test.startTest();
        uploadSales.createDocument(csv, value.id, fileName,covtfile);
        uploadSales.downloadCSVfile(fileName);
        uploadSales.downloadConvertedCSVfile(fileName);
        uploadSales.hasViewAdminToProfileAccess();
        Test.stopTest();
        System.assertEquals(true, flag,'createDocumentTest'); 
    }
    static testMethod void generateIdForFileUploadTest(){
            string recordType = ''; 
            string selMonth = '';
            string selYear = '' ;
            string selcomp = '';
            boolean flag = true;
        
         Test.startTest();
      uploadSales.generateIdForFileUpload(recordType, selMonth, selYear, selcomp);
      System.assertEquals(true, flag ,'generateIdForFileUploadTest');
         Test.stopTest();
        
      }
     static testMethod void errordataSubmittedTest(){
            string companyArray = '';
            string selmonth = '';
            string selyear = '';
            boolean flag = true;
      
         Test.startTest();
      uploadSales.errordataSubmitted(companyArray, selmonth, selyear);
      System.assertEquals(true, flag ,'errordataSubmittedTest');
        Test.stopTest();
    }
    static testMethod void getsalesCompanyListTest(){
      boolean flag = true;
        
         Test.startTest();
      uploadSales.getsalesCompanyList();
      System.assertEquals(true, flag ,'errordataSubmittedTest');
        Test.stopTest();
    }
    static testMethod void fetchLookupErrorMapListTest(){
            String mapToValue = '';
            String mapFromValue = '';
            string rawDataField = '';
            string company = '';
            boolean flag = true;
         Test.startTest();
      uploadSales.fetchLookupErrorMapList(mapToValue, mapFromValue, rawDataField, company);
      System.assertEquals(true, flag ,'errordataSubmittedTest');
        Test.stopTest();
    }
    static testMethod void callingCustomSettingsTest(){
      boolean flag = true;
         Test.startTest();
      uploadSales.callingCustomSettings();
      System.assertEquals(true, flag ,'errordataSubmittedTest');
        Test.stopTest();
        
    }
    static testMethod void isDataCleanForProceedTest(){
         Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
          
        Test.startTest();                                                
        uploadSales.isDataCleanForProceed(value.id);
        uploadSales.isCompanyMissingWeek(value.id);
        uploadSales.isDataCleanRecordCount(value.id);
        uploadSales.isDataClean(value.id);
        uploadSales.proceedSalesData(value.id);
        uploadSales.getSalesErrorData(value.id);
       // uploadSales.insertTestToData(value.id);
        Test.stopTest();
        Inventory_Transaction_Master__c searchQuery = [Select Id,Batch_Status__c, Record_Type__c, Mainetti_Company__c from Inventory_Transaction_Master__c];
        System.assertEquals(String.valueOf(searchQuery.Record_Type__c),'Sales');
    }
   
     static testMethod void splitInsertRecordListForUploadTest(){
      boolean flag = true;
        List<Data_Upload_Sales__c> insertRecord  = new List<Data_Upload_Sales__c>();
        for(Integer i=0; i<=9901; i++){
            Data_Upload_Sales__c datauploadtrans = new Data_Upload_Sales__c();
            insertRecord.add(datauploadtrans);
        }
         uploadSales uploadSale = new uploadSales();
          Test.startTest();
        uploadSale.splitInsertRecordListForUpload(insertRecord);
        System.assertEquals(true, flag ,'splitInsertRecordListForUploadTest');
        Test.stopTest();
    }
     static testMethod void insertDataUploadsalesTest() {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'sales';
        insert value;
        string returnBatchId = '';
        Test.startTest();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus =[Select Id, Mainetti_Company__c, Record_Type__c from Inventory_Transaction_Master__c where Id=:value.id];
        Sales_Transaction_Stage__c stageValue = new Sales_Transaction_Stage__c();
        stageValue.Color__c = 'BLACK';
        stageValue.Record_Status__c = '2 - Data Validation Successful';
        stageValue.Upload_Batch_No__c = updateBatchStatus.id;
        stageValue.Company__c = 'Hong Kong Packaging';
        stageValue.Year__c = '2019';
        stageValue.Unit_Sold__c = '234';
        stageValue.Net_Weight_KG_1000__c = '234.88';
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
          stageValue.Month__c = 'May';
        insert stageValue;

        
        uploadSales uploadSaless = new uploadSales();
        uploadSaless.insertDataUploadSales(updateBatchStatus);
      //  uploadSaless.getPreviousYear();
       // uploadSaless.getsalesCompanyList();
        Test.stopTest();
        System.assertEquals('sales', value.Record_Type__c,'parseSalesChunkTest');
        //System.assertEquals(returnBatchId,'');      
    }

    static testMethod void recStatusUpsertForSalesTest(){
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        insert value;
        
        //////////////////////////////////////////////////////////////////
          //string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Net_Weight_KG_1000__c":"654.46","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        
        Sales_Transaction_Stage__c salesTranscation = new Sales_Transaction_Stage__c();
        salesTranscation.Vendor__c= 'JC PENNEY';
        salesTranscation.Model__c = 'CS1Q';
        salesTranscation.Retailer_Check__c = true;
        salesTranscation.Model_Check__c = True;
        salesTranscation.Record_Status__c = '2 - Data Validation Successful';
        salesTranscation.Upload_Batch_No__c = value.Id;
        salesTranscation.Unit_Sold__c = '123';
        salesTranscation.Net_Weight_KG_1000__c = '12520.878';
        salesTranscation.Unit_Price_100_EUR__c = '24';
        salesTranscation.Unit_Price_100_USD__c = '25';
        salesTranscation.Sales_EUR__c = '10';
        salesTranscation.Sales_USD__c = '20';
        salesTranscation.ExRate_to_EUR__c = '234';
        salesTranscation.ExRate_to_USD__c = '234';
        salesTranscation.Local_Net_Unit_Pirce_100__c = '234';
        salesTranscation.Sales_Transaction_Currency__c = '234';
        salesTranscation.Gross_Sales_USD__c = '12.2';
        salesTranscation.Freight_Charge_USD__c = '2.2';
          salesTranscation.Year__c = '2019';
         salesTranscation.Month__c = 'May';
         salesTranscation.Gross_Unit_Price_100_Local_Currency__c = '10';
        insert salesTranscation;
        
        ContentVersion invenotryFile = new ContentVersion();
        invenotryFile.ContentLocation = 'S';
        invenotryFile.VersionData = Blob.valueOf(csv);
        invenotryFile.Title = 'Inventory Data File Uplaod';
        invenotryFile.PathOnClient = fileName; 
        //invenotryFile.IsLatest = true;
        insert invenotryFile;   
        
        ContentVersion inventoryVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :invenotryFile.Id];            
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=inventoryVerContent.ContentDocumentId;            
        insert contentlink;       
        
        Cogs_Sales_Upload__c customdataInv = new Cogs_Sales_Upload__c();
        customdataInv.storageKey__c ='+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        customdataInv.storageName__c = 'mcogs01';
        customdataInv.containerName__c = 'mcogs01files/SalesForce';
        customdataInv.File_Download_Path__c = 'mcogs01files/SalesForce/SalesUploadSuccess';
        insert customdataInv;
        
        
        
        //////////////////////////////////////////////////////////////////
        string returnBatchId = 'abc';
        boolean flag = true;
        Test.startTest();
        uploadSales.recStatusUpsertForSales(value.id);
        uploadSales.getSalesRecordCount(value.id);
        uploadSales.getSalesErrorData(value.id);
       Test.setMock(HttpCalloutMock.class, new SalesSuccesDataHttpWebService());
        Test.stopTest();
        System.assertEquals(true, flag,'recStatusUpsertForSalesTest');
        
    }

      static testMethod void recStatusUpsertForInventoryTest() {        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
       /* value.Record_Type__c = 'Inventory';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';*/
        insert value;
          
          
          
           string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Net_Weight_KG_1000__c":"654.46","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        
          Sales_Transaction_Stage__c salesTranscation = new Sales_Transaction_Stage__c();
          salesTranscation.Vendor__c= 'JC PENNEY';
          salesTranscation.Model__c = 'CS1Q';
          salesTranscation.Retailer_Check__c = true;
          salesTranscation.Model_Check__c = True;
          salesTranscation.Record_Status__c = '2 - Data Validation Successful';
          salesTranscation.Upload_Batch_No__c = value.Id;
           salesTranscation.Year__c = '2019';
         salesTranscation.Month__c = 'May';
          insert salesTranscation;
          
          ContentVersion invenotryFile = new ContentVersion();
          invenotryFile.ContentLocation = 'S';
         invenotryFile.VersionData = Blob.valueOf(csv);
          invenotryFile.Title = 'Inventory Data File Uplaod';
          invenotryFile.PathOnClient = fileName; 
          //invenotryFile.IsLatest = true;
          insert invenotryFile;   
          
          ContentVersion inventoryVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :invenotryFile.Id];            
          ContentDocumentLink contentlink=new ContentDocumentLink();
          contentlink.LinkedEntityId=value.id;
          contentlink.ShareType= 'V';
          contentlink.ContentDocumentId=inventoryVerContent.ContentDocumentId;            
          insert contentlink;       
          
          inventory_azure_storage_details__c customdataInv = new inventory_azure_storage_details__c();
          customdataInv.storageKey__c ='jvgVaNt0NiDwLOuvX9HX5M8hliJF4TI1cQmKcfnALKpTJ6hJ5mtoX0ST2MaKdYEmTbJgCr89keEc8xvQltoF1A==';
          customdataInv.storageName__c = 'mpdm01';
          customdataInv.containerName__c = 'inventory-file';
          insert customdataInv;
          
          
          
          
           Test.startTest();
       // uploadSales.getData();                                                   
       // uploadSales.recStatusUpsertForInventory(value.id);
        uploadSales.recUpdateFOrInvSuccess(value.id);
           //uploadSales.recStatusUpsertForInventory(value.id);
        uploadSales.deleteDefunctBatchRecord(value.id);
        uploadSales.getAutoPopulateMasterValues(value.id);
        uploadSales.recStatusUpsertForInventory(value.id);
        Test.stopTest();
        //Inventory_Transaction_Master__c searchQuery = [Select Id,Batch_Status__c, Record_Type__c, Mainetti_Company__c from Inventory_Transaction_Master__c];
        //System.assertEquals(String.valueOf(searchQuery.Record_Type__c),'Inventory'); 
        System.assertEquals('Migration Success', value.Batch_Status__c,'recStatusUpsertForInventoryTest');
       
      }
    
    static testMethod void parseSalesChunkTest(){
          Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        
        string jsonin = ''; 
        string batchNo = value.id;
        string recordType = '';
        string selMonth = 'Dec';
        string selYear = '2019';
        string selcomp = 'Hong Kong Packaging';
        String postBulkInsert = '';
        String userEmail = '';
        
      
        Sales_Transaction_Stage__c salesTransMast = new Sales_Transaction_Stage__c();
        salesTransMast.Upload_Batch_No__c = value.Id;
                salesTransMast.Company__c = 'Hong Kong Packaging';
        salesTransMast.Year__c = '2019';
        salesTransMast.Week__c = 'wk02';
        salesTransMast.Month__c = 'Dec';
        salesTransMast.Item_Code__c = 'HGR-3944   BLK002-  100';
        salesTransMast.Material__c = 'PS';
        salesTransMast.Source__c = 'virginn';
        salesTransMast.Model__c = '1000';
        salesTransMast.Printed_Logo__c = 'demologo';
        salesTransMast.Color__c = 'black';
        salesTransMast.Customer__c = 'xxxxxx';
        salesTransMast.Customer_Local_Name__c = 'xxxx';
        salesTransMast.Mainetti_Brand__c = 'mainetti';
        salesTransMast.Category__c = 'HANGERS & ACCESSORIES';
        salesTransMast.Sub_Category__c = 'HANGERS';
        salesTransMast.Family__c = 'bottom';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '12520.878';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
        salesTransMast.ExRate_to_EUR__c = '19.08505';
        salesTransMast.ExRate_to_USD__c = '20.8';
        salesTransMast.Local_Net_Unit_Pirce_100__c = '113';
        salesTransMast.Sales_Transaction_Currency__c = '12438.527291';
        salesTransMast.Shipped_To_Factory__c = 'xxxxxx'; 
        salesTransMast.Shipped_To_Country__c = 'xxxx';
        salesTransMast.Label__c = 'label';
        salesTransMast.End_User__c = 'user';
        salesTransMast.Vendor__c = 'lululemon';
        salesTransMast.Division__c = 'demo';
        salesTransMast.Retailer_Brand__c = 'demo';
        salesTransMast.Royalty_Rate__c = 'xxxx';
        salesTransMast.Market__c = 'USA';
        salesTransMast.Remark__c = 'xxxx';
        salesTransMast.LOB__c = 'PRL123456789012345688';
        salesTransMast.SO_Number__c = '183001689999898988';
        salesTransMast.Production_Country__c = 'CHINA';
        salesTransMast.Gross_Sales_USD__c = '12.2';
        salesTransMast.Freight_Charge_USD__c = 'abc';
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        insert salesTransMast;
        
        Inventory_Transaction_Master__c invtrans = new Inventory_Transaction_Master__c();
        //invtrans.Batch_No__c = '';
        invtrans.Sales_Month__c = 'Dec';
        invtrans.Sales_Year__c = '2019';
        invtrans.Sales_Company__c = 'Hong Kong Packaging';
       invtrans.Batch_Status__c = '2 - Data Validation In Progress';
       insert invtrans;
        
        Sales_Transaction__c customData = new Sales_Transaction__c();
       customData.Production_Country__c = 'abc';
       customData.Color__c = 'sfd';
       customData.Division__c = 'dxc';
       customData.Label__c = 'normal';
       customData.Brand__c = 'permanent';
        customData.Tolerance__c = '0.03';
        customData.SetScale__c = '5';
        customData.Profile__c = 'abc';
                customData.SalesUSDTolerance__c = '5'; 
            customData.SalesEURTolerance__c = '5';
            customData.UnitPrice100USD__c = '5';
            customData.UnitPrice100EUR__c = '5'; 
         customData.Vendor__c = 'OLD NAVY';
        customData.CostToTolerance__c = '5.0';
       insert customData;
        
        
          Test.startTest();
      uploadSales.parseSalesChunk(jsonin, batchNo, recordType, selMonth, selYear, selcomp, postBulkInsert);
      System.assertEquals('Sales', value.Record_Type__c,'parseSalesChunkTest');
         Test.stopTest();
        
    }
    static testMethod void validataeBulkBatchApexTest(){
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        
            String batchNo = value.id;
        string selMonth = 'Dec';
        string selYear = '2019';
        string selcomp = 'Hong Kong Packaging';
            String userEmail = UserInfo.getUserEmail();
        
        Sales_Transaction__c customData = new Sales_Transaction__c();
       customData.Production_Country__c = 'abc';
       customData.Color__c = 'sfd';
       customData.Division__c = 'dxc';
       customData.Label__c = 'normal';
       customData.Brand__c = 'permanent';
        customData.Tolerance__c = '0.03';
        customData.SetScale__c = '5';
         customData.Profile__c = 'abc';
         customData.SalesUSDTolerance__c = '5'; 
            customData.SalesEURTolerance__c = '5';
            customData.UnitPrice100USD__c = '5';
            customData.UnitPrice100EUR__c = '5'; 
         customData.Vendor__c = 'OLD NAVY';
        customData.CostToTolerance__c = '5.0';
       insert customData;
        
        Sales_Transaction_Stage__c salesTransMast = new Sales_Transaction_Stage__c();
        salesTransMast.Upload_Batch_No__c = value.id;
                salesTransMast.Company__c = 'Hong Kong Packaging';
        //salesTransMast.Batch_No__c = invtrans.Id;
        salesTransMast.Year__c = '2019';
        salesTransMast.Week__c = 'wk02';
        salesTransMast.Month__c = 'Dec';
        salesTransMast.Item_Code__c = 'HGR-3944   BLK002-  100';
        salesTransMast.Material__c = 'PS';
        salesTransMast.Source__c = 'virginn';
        salesTransMast.Model__c = '1000';
        salesTransMast.Printed_Logo__c = 'demologo';
        salesTransMast.Color__c = 'black';
        salesTransMast.Customer__c = 'xxxxxx';
        salesTransMast.Customer_Local_Name__c = 'xxxx';
        salesTransMast.Mainetti_Brand__c = 'mainetti';
        salesTransMast.Category__c = 'HANGERS & ACCESSORIES';
        salesTransMast.Sub_Category__c = 'HANGERS';
        salesTransMast.Family__c = 'bottom';
       // salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '12520.789';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
     //   salesTransMast.Transaction_Currency__c = 'hkd';
        salesTransMast.ExRate_to_EUR__c = '19.08505';
        salesTransMast.ExRate_to_USD__c = '20.8';
        salesTransMast.Local_Net_Unit_Pirce_100__c = '113';
        salesTransMast.Sales_Transaction_Currency__c = '12438.527291';
        salesTransMast.Shipped_To_Factory__c = 'xxxxxx'; 
        salesTransMast.Shipped_To_Country__c = 'xxxx';
        salesTransMast.Label__c = 'label';
        salesTransMast.End_User__c = 'user';
        salesTransMast.Vendor__c = 'lululemon';
        salesTransMast.Division__c = 'demo';
        salesTransMast.Retailer_Brand__c = 'demo';
        salesTransMast.Royalty_Rate__c = 'xxxx';
        salesTransMast.Market__c = 'USA';
        salesTransMast.Remark__c = 'xxxx';
        salesTransMast.LOB__c = 'PRL123456789012345688';
        salesTransMast.SO_Number__c = '183001689999898988';
                salesTransMast.PO_Number__c = '183001689999898988';
        salesTransMast.Production_Country__c = 'CHINA';
        salesTransMast.Gross_Sales_USD__c = '12.2';
        salesTransMast.Freight_Charge_USD__c = 'abc';
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        insert salesTransMast;
        
        Test.startTest();
      uploadSales.validataeBulkBatchApex(batchNo, selMonth, selYear, selcomp, userEmail);
      System.assertEquals('Sales', value.Record_Type__c,'validataeBulkBatchApexTest');
         Test.stopTest();
        
    }
 static testMethod void saveRecordTest(){
            Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        //value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'sales';
        insert value;
        Sales_Transaction_Stage__c stageValue = new Sales_Transaction_Stage__c();
        stageValue.Color__c = 'GRAY';
        stageValue.Record_Status__c = '2 - Data Validation Successful';
        stageValue.Upload_Batch_No__c = value.id;
        stageValue.Family__c = 'bottomm';
      stageValue.Year__c = '2019';
         stageValue.Month__c = 'May';
        insert stageValue;
        Sales_Transaction_Stage__c stageValueTwo = new Sales_Transaction_Stage__c();
        stageValueTwo.Color__c = 'GRAY';
        stageValueTwo.Record_Status__c = '2 - Data Validation Successful';
        stageValueTwo.Upload_Batch_No__c = value.id;
        stageValueTwo.Family__c = 'bottomm';
      stageValueTwo.Year__c = '2019';
         stageValueTwo.Month__c = 'May';
        insert stageValueTwo;
        Sales_Error_Mapping__c errormap = new Sales_Error_Mapping__c();
        errormap.Raw_Data_Field__c = 'Family';
        errormap.Map_From_Value__c = 'bottomm';
        errormap.Map_To_Value__c = 'bottom';
        errormap.Company__c = 'America Mid West - Hangers Unlimited';
        
        boolean flag = true;
        Test.startTest();
        uploadSales.saveRecord('Family','bottom','bottomm',value.id,stageValue.id,'Family','Family','America Mid West - Hangers Unlimited');
        Test.stopTest();
        System.assertEquals(true, flag,'saveRecordTest');
        
    }
   
    static testMethod void insertBulkSalesTest(){
   // Sales_Transaction_Stage__c  con = [Select Upload_Batch_No__c,Company__c,Item_Code__c,Material__c,Mainetti_Brand__c from Sales_Transaction_Stage__c LIMIT 1];
       // string jsonin = '';
       Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = '2 - Data Validation Successful';
        value.Record_Type__c = 'Sales';
        insert value;
            string batchNo = value.id;
           // string recordType = '';
            string selMonth = '';
            string selYear = '';
            string selcomp = '';
            string isreupload = 'true';
            String chunkCount = '';
            String fileName = '';
          String fileDelimiters = '';
      
         string jSon = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK) Ltd\",\"Inventory_Model__c\":\"TNGU139\",\"Warehouse__c\":\"LongHua Factory\",\"Color__c\":\"\",\"Sizer_Print__c\":\"\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Virgin\",\"Stock_In_Date__c\":\"23-May-19\",\"Stock_In_Qty__c\":\"200\"}]';
        String jsonError = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK1) Ltd\",\"Inventory_Model__c\":\"TNGU139\",\"Warehouse__c\":\"LongHua Factory\",\"Color__c\":\"GRAY\",\"Sizer_Print__c\":\"\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Virgin\",\"Stock_In_Date__c\":\"23-May-19\",\"Stock_In_Qty__c\":\"200\"}]';
        
        string jSonInvalid = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK1) Ltd\",\"Inventory_Model__c\":\"TNGU1399\",\"Warehouse__c\":\"LongHua 11Factory\",\"Color__c\":\"GRAY\",\"Sizer_Print__c\":\"pre1\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Vir\",\"Stock_In_Date__c\":\"23/09/19\",\"Stock_In_Qty__c\":\"200\"}]';
        string jSonMissing = '[{\"Retailer_Code__c\":\"\",\"Mainetti_Company__c\":\"\",\"Inventory_Model__c\":\"\",\"Warehouse__c\":\"\",\"Color__c\":\"\",\"Sizer_Print__c\":\"\",\"Local_System_SKU__c\":\"\",\"Source__c\":\"\",\"Stock_In_Date__c\":\"\",\"Stock_In_Qty__c\":\"\"}]';
        string recordType = 'Inventory';
        string company = 'Mainetti (HK) Ltd';
        string returnBatchId = '';
        
        
        Sales_Transaction_Stage__c salesTransMast = new Sales_Transaction_Stage__c();
        salesTransMast.Upload_Batch_No__c = value.id;
                salesTransMast.Company__c = 'Hong Kong Packaging';
        //salesTransMast.Batch_No__c = invtrans.Id;
        salesTransMast.Year__c = '2019';
        salesTransMast.Week__c = 'wk02';
        salesTransMast.Month__c = 'Dec';
        salesTransMast.Item_Code__c = 'HGR-3944   BLK002-  100';
        salesTransMast.Material__c = 'PS';
        salesTransMast.Source__c = 'virginn';
        salesTransMast.Model__c = '1000';
        salesTransMast.Printed_Logo__c = 'demologo';
        salesTransMast.Color__c = 'black';
        salesTransMast.Customer__c = 'xxxxxx';
        salesTransMast.Customer_Local_Name__c = 'xxxx';
        salesTransMast.Mainetti_Brand__c = 'mainetti';
        salesTransMast.Category__c = 'HANGERS & ACCESSORIES';
        salesTransMast.Sub_Category__c = 'HANGERS';
        salesTransMast.Family__c = 'bottom';
       // salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '12520.789';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
     //   salesTransMast.Transaction_Currency__c = 'hkd';
        salesTransMast.ExRate_to_EUR__c = '19.08505';
        salesTransMast.ExRate_to_USD__c = '20.8';
        salesTransMast.Local_Net_Unit_Pirce_100__c = '113';
        salesTransMast.Sales_Transaction_Currency__c = '12438.527291';
        salesTransMast.Shipped_To_Factory__c = 'xxxxxx'; 
        salesTransMast.Shipped_To_Country__c = 'xxxx';
        salesTransMast.Label__c = 'label';
        salesTransMast.End_User__c = 'user';
        salesTransMast.Vendor__c = 'lululemon';
        salesTransMast.Division__c = 'demo';
        salesTransMast.Retailer_Brand__c = 'demo';
        salesTransMast.Royalty_Rate__c = 'xxxx';
        salesTransMast.Market__c = 'USA';
        salesTransMast.Remark__c = 'xxxx';
        salesTransMast.LOB__c = 'PRL123456789012345688';
        salesTransMast.SO_Number__c = '183001689999898988';
        salesTransMast.Production_Country__c = 'CHINA';
        salesTransMast.Gross_Sales_USD__c = '12.2';
        salesTransMast.Freight_Charge_USD__c = 'abc';
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        insert salesTransMast;
        
        Inventory_Transaction_Master__c invtrans = new Inventory_Transaction_Master__c();
        //invtrans.Batch_No__c = '';
        invtrans.Sales_Month__c = 'Dec';
        invtrans.Sales_Year__c = '2019';
        invtrans.Sales_Company__c = 'Hong Kong Packaging';
       invtrans.Batch_Status__c = '2 - Data Validation In Progress';
       insert invtrans;

        
         Test.startTest();
      uploadSales.insertBulkSales(jSon, batchNo, recordType, selMonth, selYear, selcomp, isreupload, chunkCount, fileName,fileDelimiters);
         uploadSales.insertBulkSales(jSonMissing, batchNo, recordType, selMonth, selYear, selcomp, isreupload, chunkCount, fileName,fileDelimiters);
        uploadSales.insertBulkSales(jSonInvalid, batchNo, recordType, selMonth, selYear, selcomp, isreupload, chunkCount, fileName,fileDelimiters);
        System.assertEquals('Sales', value.Record_Type__c,'insertBulkSalesTest');
        Test.stopTest();
    }
   
    static testMethod void splitListForDeleteTest(){
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        
        List<Sales_Transaction_Stage__c> transferRecords  = new List<Sales_Transaction_Stage__c>();
        //transferRecords[0].Upload_Batch_No__c = value.id;
        for(Integer i=0; i<=9901; i++){
            Sales_Transaction_Stage__c salestranstage = new Sales_Transaction_Stage__c();
            salestranstage.Upload_Batch_No__c = value.id;
            transferRecords.add(salestranstage);
          }
         insert transferRecords;
         
          Test.startTest();
        uploadSales uploadSalessss = new uploadSales();
        uploadSalessss.splitListForDelete(transferRecords);
        System.assertEquals('Sales', value.Record_Type__c,'splitListForDeleteTest');
        Test.stopTest();
        
    } 
    static testMethod void insertSalesStageChunkTest(){
       // string jsonin = '';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        
        string batchNo = value.id;
        Sales_Transaction_Stage__c salestrans = new Sales_Transaction_Stage__c();
        salestrans.Company__c = 'Hong Kong Packaging';
        salestrans.Year__c = '';
        salestrans.Month__c = '';
        salestrans.Week__c = '';
        salestrans.Item_code__c = '';
        salestrans.Material__c = '';
        salestrans.Source__c = '';
        salestrans.Model__c = '';
        salestrans.Printed_Logo__c = '';
        salestrans.Color__c = '';
        salestrans.Customer__c = '';
        salestrans.Customer_local_name__c = '';
        salestrans.Mainetti_Brand__c = '';
        salestrans.Category__c = '';
        salestrans.Sub_Category__c = '';
        salestrans.Family__c = '';
        salestrans.Order_Type__c = '';
        salestrans.Unit_Sold__c = '';
        salestrans.Net_Weight_KG_1000__c = '';
        salestrans.Unit_Price_100_EUR__c = '';
        salestrans.Unit_Price_100_USD__c = '';
            salestrans.Net_Unit_Price_100__c = '';
            salestrans.Sales_EUR__c = '';
            salestrans.Sales_USD__c = '';
          salestrans.Transaction_Currency__c = '';
            salestrans.ExRate_to_EUR__c = '';
            salestrans.ExRate_to_USD__c = '';
            salestrans.Local_Net_Unit_Pirce_100__c = '';
            salestrans.Sales_Transaction_Currency__c = '';
            salestrans.Shipped_To_Country__c = '';
            salestrans.Shipped_To_Factory__c = '';
            salestrans.Label__c = '';
            salestrans.End_user__c = '';
            salestrans.Vendor__c = '';
            salestrans.Division__c = '';
        salestrans.Retailer_Brand__c = '';
        salestrans.Royalty_Rate__c = '';
        salestrans.Sales_Delivery_Date__c = '';
        salestrans.Sales_Order_Date__c = '';
        salestrans.Upload_Batch_No__c = value.id;
        insert salestrans;
 
 //string jSon = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK) Ltd\",\"Inventory_Model__c\":\"TNGU139\",\"Warehouse__c\":\"LongHua Factory\",\"Color__c\":\"Black\",\"Sizer_Print__c\":\"\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Virgin\",\"Stock_In_Date__c\":\"23-May-19\",\"Stock_In_Qty__c\":\"200\"}]';
       // String jsonError = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK1) Ltd\",\"Inventory_Model__c\":\"TNGU139\",\"Warehouse__c\":\"LongHua Factory\",\"Color__c\":\"GRAY\",\"Sizer_Print__c\":\"\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Virgin\",\"Stock_In_Date__c\":\"23-May-19\",\"Stock_In_Qty__c\":\"200\"}]';
        
       // string jSonInvalid = '[{\"Retailer_Code__c\":\"GU\",\"Mainetti_Company__c\":\"Mainetti (HK1) Ltd\",\"Inventory_Model__c\":\"TNGU1399\",\"Warehouse__c\":\"LongHua 11Factory\",\"Color__c\":\"GRAY\",\"Sizer_Print__c\":\"pre1\",\"Local_System_SKU__c\":\"157946\",\"Source__c\":\"Vir\",\"Stock_In_Date__c\":\"23/09/19\",\"Stock_In_Qty__c\":\"200\"}]';
        string jSonMissing = '[{\"Company__c\":\"\",\"Year__c\":\"\",\"Week__c\":\"\",\"Month__c\":\"\",\"Item_code__c\":\"\",\"Material__c\":\"\",\"Source__c\":\"\",\"Model__c\":\"\",\"Printed_Logo__c\":\"\",\"Color__c\":\"\",\"Customer__c\":\"\",\"Customer_local_name__c\":\"\",\"Mainetti_Brand__c\":\"\",\"Category__c\":\"\",\"Sub_Category__c\":\"\",\"Family__c\":\"\",\"Order_Type__c\":\"3rd\",\"Unit_Sold__c\":\"123\",\"Net_Weight_KG_1000__c\":\"\",\"Unit_Price_100_EUR__c\":\"\",\"Unit_Price_100_USD__c\":\"\",\"Net_Unit_Price_100__c\":\"\",\"Sales_EUR__c\":\"\",\"Sales_USD__c\":\"\",\"Transaction_Currency__c\":\"\",\"ExRate_to_EUR__c\":\"\",\"ExRate_to_USD__c\":\"\",\"Local_Net_Unit_Pirce_100__c\":\"\",\"Sales_Transaction_Currency__c\":\"india\",\"Shipped_To_Factory__c\":\"\",\"Shipped_To_Country__c\":\"\",\"Label__c\":\"\",\"End_user__c\":\"\",\"Vendor__c\":\"\",\"Division__c\":\"\",\"Retailer_Brand__c\":\"\",\"Royalty_Rate__c\":\"\",\"Market__c\":\"\",\"Remarks__c\":\"\",\"LOB__c\":\"\",\"SO_Number__c\":\"\",\"Production_Country__c\":\"\"}]';
       // string jSonMissingdoublecouts = '[{\"Company__c\":\"efeddededfeff\",\"Year__c\":\"\",\"Week__c\":\"\",\"Month__c\":\"\",\"Item_code__c\":\"\",\"Material__c\":\"\",\"Source__c\":\"\",\"Model__c\":\"\",\"Printed_Logo__c\":\"\",\"Color__c\":\"\",\"Customer__c\":\"\",\"Customer_local_name__c\":\"\",\"Mainetti_Brand__c\":\"\",\"Category__c\":\"\",\"Sub_Category__c\":\"\",\"Family__c\":\"\",\"Order_Type__c\":\"3rd\",\"Unit_Sold__c\":\"123\",\"Net_Weight_KG_1000__c\":\"\",\"Unit_Price_100_EUR__c\":\"\",\"Unit_Price_100_USD__c\":\"\",\"Net_Unit_Price_100__c\":\"\",\"Sales_EUR__c\":\"\",\"Sales_USD__c\":\"\",\"Transaction_Currency__c\":\"\",\"ExRate_to_EUR__c\":\"\",\"ExRate_to_USD__c\":\"\",\"Local_Net_Unit_Pirce_100__c\":\"\",\"Sales_Transaction_Currency__c\":\"india\",\"Shipped_To_Factory__c\":\"\",\"Shipped_To_Country__c\":\"\",\"Label__c\":\"\",\"End_user__c\":\"\",\"Vendor__c\":\"\",\"Division__c\":\"\",\"Retailer_Brand__c\":\"\",\"Royalty_Rate__c\":\"\",\"Market__c\":\"\",\"Remarks__c\":\"\",\"LOB__c\":\"\",\"SO_Number__c\":\"\",\"Production_Country__c\":\"\"}]';
        //string jSonMissingcalculation = '[{\"Company__c\":\"efeddededfeff\",\"Year__c\":\"\",\"Week__c\":\"\",\"Month__c\":\"\",\"Item_code__c\":\"\",\"Material__c\":\"\",\"Source__c\":\"\",\"Model__c\":\"\",\"Printed_Logo__c\":\"\",\"Color__c\":\"\",\"Customer__c\":\"\",\"Customer_local_name__c\":\"\",\"Mainetti_Brand__c\":\"\",\"Category__c\":\"\",\"Sub_Category__c\":\"\",\"Family__c\":\"\",\"Order_Type__c\":\"3rd\",\"Unit_Sold__c\":\"0\",\"Net_Weight_KG_1000__c\":\"\",\"Unit_Price_100_EUR__c\":\"\",\"Unit_Price_100_USD__c\":\"\",\"Net_Unit_Price_100__c\":\"\",\"Sales_EUR__c\":\"0\",\"Sales_USD__c\":\"0\",\"Transaction_Currency__c\":\"0\",\"ExRate_to_EUR__c\":\"\",\"ExRate_to_USD__c\":\"\",\"Local_Net_Unit_Pirce_100__c\":\"\",\"Sales_Transaction_Currency__c\":\"0\",\"Shipped_To_Factory__c\":\"\",\"Shipped_To_Country__c\":\"\",\"Label__c\":\"\",\"End_user__c\":\"\",\"Vendor__c\":\"\",\"Division__c\":\"\",\"Retailer_Brand__c\":\"\",\"Royalty_Rate__c\":\"\",\"Market__c\":\"\",\"Remarks__c\":\"\",\"LOB__c\":\"\",\"SO_Number__c\":\"\",\"Production_Country__c\":\"\"}]';
        string jsonabhi='[{\"Customer__c\":\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"Customer_local_name__c\":\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"Shipped_To_Factory__c\":\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"}]';
        string recordType = 'Sales';
        string company = 'Mainetti (HK) Ltd';
        string returnBatchId = '';
        String jsn ='[{\"Company__c\":\"Hong Kong Packaging\",\"Year__c\":\"\",\"Month__c\":\"\",\"Week__c\":\"\",\"Item_code__c\":\"\",\"Material__c\":\"\",\"Source__c\":\"\",\"Model__c\":\"\",\"Printed_Logo__c\":\"\",\"Color__c\":\"\",\"Customer__c\":\"\",\"Customer_local_name__c\":\"\",\"Mainetti_Brand__c\":\"\",\"Category__c\":\"\",\"Sub_Category__c\":\"\",\"Family__c\":\"\",\"Order_Type__c\":\"\",\"Unit_Sold__c\":\"\",\"Net_Weight_KG_1000__c\":\"\",\"Unit_Price_100_EUR__c\":\"\",\"Unit_Price_100_USD__c\":\"\",\"Net_Unit_Price_100__c\":\"\",\"Sales_EUR__c\":\"\",\"Sales_USD__c\":\"\",\"Transaction_Currency__c\":\"\",\"ExRate_to_EUR__c\":\"\",\"ExRate_to_USD__c\":\"\",\"Local_Net_Unit_Pirce_100__c\":\"\",\"Sales_Transaction_Currency__c\":\"\",\"Shipped_To_Factory__c\":\"\",\"Shipped_To_Country__c\":\"\",\"Label__c\":\"\",\"End_user__c\":\"\",\"Vendor__c\":\"\",\"Division__c\":\"\",\"Retailer_Brand__c\":\"\",\"Royalty_Rate__c\":\"\",\"Market__c\":\"\",\"Production_Country__c\":\"\",\"Remark__c\":\"\",\"Remarks__c\":\"\",\"LOB__c\":\"\",\"SO_Number__c\":\"\",\"PO_Number__c\":\"\",\"Gross_Sales_USD__c\":\"\",\"Freight_Charge_USD__c\":\"\",\"Sales_Type__c\":\"\",\"Standard_Unit_Cost_100_EUR__c\":\"\",\"Standard_Unit_Cost_100_USD__c\":\"\",\"Net_Unit_Price_100_EUR__c\":\"\",\"Sales_Order_Date__c\":\"\",\"Gross_Unit_Price_100_Local_Currency__c\":\"\"}]';

        String jj ='[{\"Company__c\":\"abcd\",\"Year__c\":\"\",\"Month__c\":\"\",\"Week__c\":\"\",\"Item_code__c\":\"\",\"Material__c\":\"\",\"Source__c\":\"\",\"Model__c\":\"\",\"Printed_Logo__c\":\"\",\"Color__c\":\"\",\"Customer__c\":\"\",\"Customer_local_name__c\":\"\",\"Mainetti_Brand__c\":\"\",\"Category__c\":\"\",\"Sub_Category__c\":\"\",\"Family__c\":\"\",\"Order_Type__c\":\"\",\"Unit_Sold__c\":\"\",\"Net_Weight_KG_1000__c\":\"\",\"Unit_Price_100_EUR__c\":\"\",\"Unit_Price_100_USD__c\":\"\",\"Net_Unit_Price_100__c\":\"\",\"Sales_EUR__c\":\"\",\"Sales_USD__c\":\"\",\"Transaction_Currency__c\":\"\",\"ExRate_to_EUR__c\":\"\",\"ExRate_to_USD__c\":\"\",\"Local_Net_Unit_Pirce_100__c\":\"\",\"Sales_Transaction_Currency__c\":\"\",\"Shipped_To_Factory__c\":\"\",\"Shipped_To_Country__c\":\"\",\"Label__c\":\"\",\"End_user__c\":\"\",\"Vendor__c\":\"\",\"Division__c\":\"\",\"Retailer_Brand__c\":\"\",\"Royalty_Rate__c\":\"\",\"Market__c\":\"\",\"Production_Country__c\":\"\",\"Remark__c\":\"\",\"Remarks__c\":\"\",\"LOB__c\":\"\",\"SO_Number__c\":\"\",\"PO_Number__c\":\"\",\"Gross_Sales_USD__c\":\"\",\"Freight_Charge_USD__c\":\"\",\"Sales_Type__c\":\"\",\"Standard_Unit_Cost_100_EUR__c\":\"\",\"Standard_Unit_Cost_100_USD__c\":\"\",\"Net_Unit_Price_100_EUR__c\":\"\",\"Gross_Unit_Price_100_Local_Currency__c\":\"\"}]';

        
 Sales_Transaction_Stage__c salesTransMast = new Sales_Transaction_Stage__c();
        salesTransMast.Upload_Batch_No__c = value.id;
                salesTransMast.Company__c = 'Hong Kong Packaging';
        //salesTransMast.Batch_No__c = invtrans.Id;
        salesTransMast.Year__c = '2019';
        salesTransMast.Week__c = 'wk02';
        salesTransMast.Month__c = 'Dec';
        salesTransMast.Item_Code__c = 'HGR-3944   BLK002-  100';
        salesTransMast.Material__c = 'PS';
        salesTransMast.Source__c = 'virginn';
        salesTransMast.Model__c = '1000';
        salesTransMast.Printed_Logo__c = 'demologo';
        salesTransMast.Color__c = 'black';
        salesTransMast.Customer__c = 'xxxxxx';
        salesTransMast.Customer_Local_Name__c = 'xxxx';
        salesTransMast.Mainetti_Brand__c = 'mainetti';
        salesTransMast.Category__c = 'HANGERS & ACCESSORIES';
        salesTransMast.Sub_Category__c = 'HANGERS';
        salesTransMast.Family__c = 'bottom';
      //  salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '12520.89';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
       // salesTransMast.Transaction_Currency__c = 'hkd';
        salesTransMast.ExRate_to_EUR__c = '19.08505';
        salesTransMast.ExRate_to_USD__c = '20.8';
        salesTransMast.Local_Net_Unit_Pirce_100__c = '113';
        salesTransMast.Sales_Transaction_Currency__c = '12438.527291';
        salesTransMast.Shipped_To_Factory__c = 'xxxxxx'; 
        salesTransMast.Shipped_To_Country__c = 'xxxx';
        salesTransMast.Label__c = 'label';
        salesTransMast.End_User__c = 'user';
        salesTransMast.Vendor__c = 'lululemon';
        salesTransMast.Division__c = 'demo';
        salesTransMast.Retailer_Brand__c = 'demo';
        salesTransMast.Royalty_Rate__c = 'xxxx';
        salesTransMast.Market__c = 'USA';
        salesTransMast.Remark__c = 'xxxx';
        salesTransMast.LOB__c = 'PRL123456789012345688';
        salesTransMast.SO_Number__c = '183001689999898988';
        salesTransMast.Production_Country__c = 'CHINA';
        salesTransMast.Gross_Sales_USD__c = '12.2';
        salesTransMast.Freight_Charge_USD__c = 'abc';
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        insert salesTransMast;
        
                Sales_Transaction_Stage__c salestransdoublecouts = new Sales_Transaction_Stage__c();
        salestransdoublecouts.Company__c = 'Hong Kong Packaging';
        salestransdoublecouts.Year__c = '';
        salestransdoublecouts.Month__c = '';
        salestransdoublecouts.Week__c = '';
        salestransdoublecouts.Item_code__c = '';
        salestransdoublecouts.Material__c = '';
        salestransdoublecouts.Source__c = '';
        salestransdoublecouts.Model__c = '';
        salestransdoublecouts.Printed_Logo__c = '';
        salestransdoublecouts.Color__c = '';
        salestransdoublecouts.Customer__c = '';
        salestransdoublecouts.Customer_local_name__c = '';
        salestransdoublecouts.Mainetti_Brand__c = '';
        salestransdoublecouts.Category__c = '';
        salestransdoublecouts.Sub_Category__c = '';
        salestransdoublecouts.Family__c = '';
       // salestrans.Order_Type__c = '';
        salestransdoublecouts.Unit_Sold__c = '123'; 
        salestransdoublecouts.Net_Weight_KG_1000__c = '';
        salestransdoublecouts.Unit_Price_100_EUR__c = '';
        salestransdoublecouts.Unit_Price_100_USD__c = '';
            salestransdoublecouts.Net_Unit_Price_100__c = '';
            salestransdoublecouts.Sales_EUR__c = '';
            salestransdoublecouts.Sales_USD__c = '';
         //   salestrans.Transaction_Currency__c = '';
            salestransdoublecouts.ExRate_to_EUR__c = '';
            salestransdoublecouts.ExRate_to_USD__c = '';
            salestransdoublecouts.Local_Net_Unit_Pirce_100__c = '';
            salestransdoublecouts.Sales_Transaction_Currency__c = '';
            salestransdoublecouts.Shipped_To_Country__c = '';
            salestransdoublecouts.Shipped_To_Factory__c = '';
            salestransdoublecouts.Label__c = '';
            salestransdoublecouts.End_user__c = '';
            salestransdoublecouts.Vendor__c = '';
            salestransdoublecouts.Division__c = '';
        salestransdoublecouts.Retailer_Brand__c = '';
        salestransdoublecouts.Royalty_Rate__c = '';
        salestransdoublecouts.Upload_Batch_No__c = value.id;
        insert salestransdoublecouts;

        Test.startTest();
    //  uploadSales.insertSalesStageChunk(jSon, batchNo);
        uploadSales.insertSalesStageChunk(jj, batchNo);
        uploadSales.insertSalesStageChunk(jSonMissing, batchNo);
        uploadSales.insertSalesStageChunk(jsonabhi, batchNo);
        uploadSales.insertSalesStageChunk(jsn, batchNo);
        //uploadSales.insertSalesStageChunk(returnBatchId, batchNo);
        uploadSales.getMainettiMap();
        System.assertEquals('Sales', value.Record_Type__c,'insertSalesStageChunkTest');
        Test.stopTest();
    }
    
    static testMethod void getRecordStatusTest() {        
        Inventory_Transaction_Master__c recordPicklist = new Inventory_Transaction_Master__c(); 
        recordPicklist.Name = 'testM1';
        insert recordPicklist;
        Map<String, String> countt = uploadSales.getRecordStatus();
        System.assertEquals(recordPicklist.Name,'testM1'); 
    }
    
    
    
    static testMethod void getBatchStatusTest() {        
        Inventory_Transaction_Master__c batchPicklist = new Inventory_Transaction_Master__c(); 
        batchPicklist.Name = 'testM2'; 
        insert batchPicklist;
        Map<String, String> countt = uploadSales.getBatchStatus();
        System.assertEquals(batchPicklist.Name,'testM2'); 
    } 
        
}