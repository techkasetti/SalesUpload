@isTest
public class salesSuccessDataTest {
    
    static testMethod void salesSuccessDataTest(){
         
        
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus.Batch_Status__c = 'Migration In Progress';
        updateBatchStatus.Record_Type__c  = 'sales';
        insert updateBatchStatus;
        string returnBatchId = updateBatchStatus.Id;
        String batchId1 = updateBatchStatus.Id;
        string years = '2019';
        string months = 'May';
        
        
        //////////////////////////////////////////////////////////////
                      
        //  List<Sales_Transaction_Stage__c> transferRecords1 = new List<Sales_Transaction_Stage__c>();
        Sales_Transaction_Stage__c salesTransMast = new Sales_Transaction_Stage__c();
        salesTransMast.Upload_Batch_No__c = updateBatchStatus.Id;
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
        salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '190.65123';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
        salesTransMast.Transaction_Currency__c = 'hkd';
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
        salesTransMast.PO_Number__c = 'po14545';
        salesTransMast.Production_Country__c = 'CHINA';
        salesTransMast.Gross_Sales_USD__c = '12.2';
        salesTransMast.Freight_Charge_USD__c = 'abc';
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        salesTransMast.Model_NF__c = true;
        salesTransMast.Model_FB__c = false;
        salesTransMast.Color_FB__c = false;
        salesTransMast.Category_FB__c = false;
        salesTransMast.Market_FB__c = false;
        salesTransMast.Vendor_FB__c = false;
        salesTransMast.Company_FB__c = false;
        salesTransMast.Material_FB__c = false;
        salesTransMast.Shipped_To_Factory_FB__c = false;
        salesTransMast.Shipped_To_Country_FB__c = false;
        salesTransMast.Division_FB__c = false;
        salesTransMast.Item_code_FB__c = false;
        salesTransMast.Mainetti_Brand_FB__c = false;
        salesTransMast.Order_Type_FB__c = false;
        salesTransMast.Customer_FB__c = false;
        salesTransMast.Transaction_Currency_FB__c = false;
        salesTransMast.ExRate_to_EUR_FB__C = false;
        salesTransMast.ExRate_to_USD_FB__C = false;
        salesTransMast.STC_FB__c = false;
        salesTransMast.Sales_USD_FB__c = false;
        salesTransMast.Sales_EUR_FB__c = false;
        salesTransMast.Unit_Price_100_USD_FB__c = false;
        salesTransMast.Unit_Price_100_EUR_FB__c = false;
        salesTransMast.Local_Net_Unit_Pirce_FB__c = false;
        salesTransMast.Net_Unit_Price_100_FB__c = false;
        salesTransMast.Month_FB__c = false;
        salesTransMast.Source_FB__c = false;
        salesTransMast.Unit_Sold_FB__c = false;
        salesTransMast.Week_FB__c = false;
        salesTransMast.Year_FB__c = false;
        salesTransMast.SO_Number_FB__c = false;
        salesTransMast.LOB_FB__c = false;
        salesTransMast.Gross_Sales_USD_FB__c = false;
        salesTransMast.Freight_Charge_USD_FB__c =false;
        salesTransMast.Production_Country_FB__c = false;
        salesTransMast.Label_FB__c = false;
        salesTransMast.Retailer_Brand_FB__c = false;
        salesTransMast.Color_NF__c = false;
        salesTransMast.Market_NF__c = false;
        salesTransMast.Company_NF__c = false;
        salesTransMast.selected_ui_values__c = false;
        salesTransMast.SO_Number_NF__c = false;
        salesTransMast.LOB_NF__c = false;
      //  salesTransMast.unit_sold_warning__c = false;
        salesTransMast.ExRate_to_USD_NF__c= false;
        salesTransMast.ExRate_to_EUR_NF__c = false;
        salesTransMast.Calculation_Failed__c = false;
        salesTransMast.STC_NF__c = false;
        salesTransMast.Retailer_Brand_NF__c = false;
        salesTransMast.warning_consolidate_key__c = false;
        salesTransMast.Source_NF__c = false;
        salesTransMast.wrong_date__c = false;
        salesTransMast.Vendor_NF__c = true;
        salesTransMast.Retailer_Check__c = true;
        salesTransMast.Model_Check__c = true;
        salesTransMast.UnitSoldCombination__c = true;
        salesTransMast.UnitSoldCombinationNotFound__c = true;
        salesTransMast.unit_sold_warning__c = true;
        salesTransMast.Standard_Unit_Cost_100_EUR_FB__c = false;
        salesTransMast.Standard_Unit_Cost_100_EUR_NF__c = false;  
        salesTransMast.Standard_Unit_Cost_100_USD_FB__c = false;
        salesTransMast.Standard_Unit_Cost_100_USD_NF__c = false; 
        salesTransMast.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = false; 
        salesTransMast.Standard_Unit_Ex_Work_Cost_100_EUR_FB__c = false; 
        salesTransMast.Standard_Unit_Ex_Work_Cost_100_USD_FB__c = false; 
        salesTransMast.Standard_Unit_Ex_Work_Cost_100_USD_NF__c = false;
        salesTransMast.Standard_Unit_Industrial_Cost_100_EUR_FB__c = false; 
        salesTransMast.Standard_Unit_Industrial_Cost_100_EUR_NF__c = false; 
        salesTransMast.Standard_Unit_Industrial_Cost_100_USD_FB__c = false; 
        salesTransMast.Standard_Unit_Industrial_Cost_100_USD_NF__c = false;    
        salesTransMast.Net_Weight_KG_1000_FB__c = false;  
        salesTransMast.Net_Weight_KG_1000_NF__c = false; 
        salesTransMast.Net_Unit_Price_100_EUR_FB__c = false;  
        salesTransMast.Net_Unit_Price_100_EUR_NF__c = false;  
        salesTransMast.Net_Unit_Price_100_FB__c = false;  
        salesTransMast.Net_Unit_Price_100_NF__c = false; 
        salesTransMast.Final_Sales_Destination_FB__c = false; 
        salesTransMast.Final_Sales_Destination_NF__c = false;
        salesTransMast.Sales_Delivery_Date_FB__c = false;
        salesTransMast.Sales_Delivery_Date_NF__c = false;
        
        insert salesTransMast;
        
 
        
        List<Sales_Transaction_Stage__c> insertRecord  = new List<Sales_Transaction_Stage__c>();
        for(Integer i=0; i<=9901; i++){
            Sales_Transaction_Stage__c datauploadtrans = new Sales_Transaction_Stage__c();
            insertRecord.add(datauploadtrans);
        }
        // transferRecords1.add(salesTransMast);
        
        String company = salesTransMast.Company__c;
        String year = salesTransMast.Year__c ;
        String week = salesTransMast.Week__c;
        String month = salesTransMast.Month__c;
        String itemCode = salesTransMast.Item_code__c ;
        String material = salesTransMast.Material__c ;
        String source = salesTransMast.Source__c ;
        String model = salesTransMast.Model__c ;
        String printedLogo = salesTransMast.Printed_Logo__c ;
        String color = salesTransMast.Color__c ;
        String customer = salesTransMast.Customer__c;
        String customerLocalName = salesTransMast.Customer_local_name__c ;
        String mainettiBrand = salesTransMast.Mainetti_Brand__c;
        String category = salesTransMast.Category__c;
        String subCategory = salesTransMast.Sub_Category__c;
        String family = salesTransMast.Family__c ;
        String orderType = salesTransMast.Order_Type__c;
        String unitSold = salesTransMast.Unit_Sold__c;
        String netWeightKG1000 = salesTransMast.Net_Weight_KG_1000__c;
        String unitPrice100EUR = salesTransMast.Unit_Price_100_EUR__c;
        String unitPrice100USD = salesTransMast.Unit_Price_100_USD__c ;
        String netUnitPrice100 = salesTransMast.Net_Unit_Price_100__c ;
        String salesEUR = salesTransMast.Sales_EUR__c;
        String salesUSD = salesTransMast.Sales_USD__c;
        String transactionCurrency = salesTransMast.Transaction_Currency__c ;
        String exRateToEUR = salesTransMast.ExRate_to_EUR__c ;
        String exRateToUSD = salesTransMast.ExRate_to_USD__c ;
        String localNetUnitPirce100 = salesTransMast.Local_Net_Unit_Pirce_100__c ;
        String salesTransactionCurrency = salesTransMast.Sales_Transaction_Currency__c;
        String shippedToFactory = salesTransMast.Shipped_To_Factory__c ;
        String shippedToCountry = salesTransMast.Shipped_To_Country__c;
        String label = salesTransMast.Label__c ;
        String enduser = salesTransMast.End_user__c ;
        String vendor = salesTransMast.Vendor__c;
        String division = salesTransMast.Division__c ;
        String retailerBrand = salesTransMast.Retailer_Brand__c;
        String royaltyRate = salesTransMast.Royalty_Rate__c ;
        String market = salesTransMast.Market__c ;
        String remark = salesTransMast.Remark__c ;
        String lob = salesTransMast.LOB__c;
        String soNumber = salesTransMast.SO_Number__c ;
        String poNumber = salesTransMast.PO_Number__c ;
        String productionCountry = salesTransMast.Production_Country__c;
        String grossSalesUSD = salesTransMast.Gross_Sales_USD__c ;
        String freightChargeUSD = salesTransMast.Freight_Charge_USD__c ;
       
        //////////////////////////////////////////////////////////////
       
        
        Inventory_Transaction_Master__c invtrans = new Inventory_Transaction_Master__c();
        List<Sales_Transaction_Stage__c> transferRecords1 = new List<Sales_Transaction_Stage__c>();
        Sales_Transaction_Stage__c stageValue = new Sales_Transaction_Stage__c();
        stageValue.Color__c = 'GRAY';
        stageValue.Record_Status__c = '2 - Data Validation Successful';
        stageValue.Upload_Batch_No__c = invtrans.id;
        stageValue.Company__c = 'Hong Kong Packaging';
        stageValue.Year__c = '2019';
        stageValue.Unit_Sold__c = '234';
        stageValue.Net_Weight_KG_1000__c = '23';
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
        stageValue.Retailer_Country__c = 'United States';
        stageValue.Month__c = 'May';
        stageValue.Upload_Batch_No__c = updateBatchStatus.Id;
        stageValue.Royalty_Rate__c = '123456789';
        stageValue.Standard_Unit_Cost_100_EUR__c = '123456789';
         stageValue.Standard_Unit_Cost_100_USD__c = '123456789';
        stageValue.Net_Unit_Price_100_EUR__c = '1234567889';
        stageValue.Net_Unit_Price_100__c = '123456789';
        stageValue.Sales_Order_Date__c = '1-04-2021';
         stageValue.Sales_Delivery_Date__c = '1-04-2021';
        stageValue.Gross_Unit_Price_100_Local_Currency__c = '10';
        insert stageValue;
        
        List<Sales_Transaction_Stage__c> transferRecords= new List<Sales_Transaction_Stage__c>();
        transferRecords.add(stageValue); 
        
        Sales_Transaction_Stage__c stageValue1 = new Sales_Transaction_Stage__c();
        stageValue1.Color__c = 'GRAY';
        stageValue1.Record_Status__c = '2 - Data Validation Successful';
        stageValue1.Upload_Batch_No__c = invtrans.id;
        stageValue1.Company__c = 'Hong Kong Packaging';
        stageValue1.Year__c = '2019';
        stageValue1.Unit_Sold__c = '234';
        stageValue1.Net_Weight_KG_1000__c = '23';
        stageValue1.Unit_Price_100_EUR__c = '24';
        stageValue1.Unit_Price_100_USD__c = '25';
        stageValue1.Sales_EUR__c = '10';
        stageValue1.Sales_USD__c = '20';
        stageValue1.Unit_Sold__c = '234';
        stageValue1.ExRate_to_EUR__c = '234';
        stageValue1.ExRate_to_USD__c = '234';
        stageValue1.Local_Net_Unit_Pirce_100__c = '-';
        stageValue1.Sales_Transaction_Currency__c = '0';
        stageValue1.Gross_Sales_USD__c = '12.2';
        stageValue1.Freight_Charge_USD__c = '2.2';
        stageValue1.Retailer_Country__c = 'United States';
		stageValue1.Month__c = 'May';
        stageValue1.Royalty_Rate__c = '0';
        stageValue1.Standard_Unit_Cost_100_EUR__c = '0';
         stageValue1.Standard_Unit_Cost_100_USD__c = '0';
        stageValue1.Net_Unit_Price_100_EUR__c = '0';
        stageValue1.Net_Unit_Price_100__c = '0';
        stageValue1.Standard_Unit_Industrial_Cost_100_USD__c = '0';
        stageValue1.Standard_Unit_Industrial_Cost_100_EUR__c = '0';
        stageValue1.Standard_Unit_Ex_Work_Cost_100_USD__c = '0';
        stageValue1.Standard_Unit_Ex_Work_Cost_100_EUR__c = '0';
        stageValue1.Upload_Batch_No__c = updateBatchStatus.Id;
        stageValue1.Sales_Delivery_Date__c = '1-04-2021';
        stageValue1.Sales_Order_Date__c = '1-04-2021';
         stageValue1.Gross_Unit_Price_100_Local_Currency__c = '10';
        insert stageValue1;
        
        List<Sales_Transaction_Stage__c> transferRecords02= new List<Sales_Transaction_Stage__c>();
        transferRecords02.add(stageValue1); 
        
        //////////////////////////////////////////////
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Net_Weight_KG_1000__c":"80.89898","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","PO_Number__c":"PO123456","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
        
        String batchId = value.Id ;
        String userEmail = UserInfo.getUserEmail();
        Sales_Transaction_Stage__c salesTranscation = new Sales_Transaction_Stage__c();
        salesTranscation.Vendor__c= 'JC PENNEY';
        salesTranscation.Model__c = 'CS1Q';
        salesTranscation.Retailer_Check__c = true;
        salesTranscation.Model_Check__c = True;
        salesTranscation.Record_Status__c = '2 - Data Validation Successful';
        salesTranscation.Unit_Sold__c = '123';
        salesTranscation.Net_Weight_KG_1000__c = '123';
        salesTranscation.Unit_Price_100_EUR__c = '12';
        salesTranscation.Unit_Price_100_USD__c = '675';
        salesTranscation.Sales_EUR__c = '';
        salesTranscation.Sales_USD__c = '';
        salesTranscation.ExRate_to_EUR__c ='321';
        salesTranscation.ExRate_to_USD__c = '521';
        salesTranscation.Local_Net_Unit_Pirce_100__c = '989';
        salesTranscation.Sales_Transaction_Currency__c = '';
        salesTranscation.Gross_Sales_USD__c = '125';
        salesTranscation.Freight_Charge_USD__c = '323';
        salesTranscation.Upload_Batch_No__c = value.Id;
         salesTranscation.Year__c = '2019';
        salesTranscation.Month__c = 'May';
                salesTranscation.Royalty_Rate__c = '';
        salesTranscation.Standard_Unit_Cost_100_EUR__c = '';
         salesTranscation.Standard_Unit_Cost_100_USD__c = '';
        salesTranscation.Net_Unit_Price_100_EUR__c = '';
        salesTranscation.Standard_Unit_Industrial_Cost_100_USD__c = '';
        salesTranscation.Standard_Unit_Industrial_Cost_100_EUR__c = '';
        salesTranscation.Standard_Unit_Ex_Work_Cost_100_USD__c = '';
        salesTranscation.Standard_Unit_Ex_Work_Cost_100_EUR__c = '';
        salesTranscation.Net_Unit_Price_100__c = '';
        salesTranscation.Sales_Delivery_Date__c = '';
        salesTranscation.Sales_Order_Date__c = '';
         salesTranscation.Gross_Unit_Price_100_Local_Currency__c = '10';
        insert salesTranscation;
        
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
        
        salesSuccessData obj = new salesSuccessData(value.Id,userEmail);
        Test.setMock(HttpCalloutMock.class, new SalesSuccesDataHttpWebService()); 
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getCSVFile(value.id);

        Data_Upload_Sales__c data = new Data_Upload_Sales__c();
        data.Data_Row_Date__c = obj.getRowDate(years, months);
        insert data;
              
        
         Test.startTest();
        Database.executeBatch(obj);
        Database.BatchableContext bc;
        obj.start(bc);
        obj.execute(bc, transferRecords02);
        obj.getUploadDetails(batchId1);
       Date d =  obj.getRowDate('2019', 'may');
        
        DataBase.executeBatch(obj);
        Test.stopTest();
        System.assertEquals('2019', salesTranscation.Year__c,'putFileRequestTest');
    }
}