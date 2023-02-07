@isTest
public class recStatusUpsertForSalesBudgetBulkTest {
    
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
   
    static testMethod void recStatusUpsertForInventoryBulkTestMethod(){
       
        
         Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus.Batch_Status__c = 'Migration In Progress';
        updateBatchStatus.Record_Type__c  = 'Budget';
        updateBatchStatus.Period__c = 'Budget';
        updateBatchStatus.Sales_Year__c = '2022';
        updateBatchStatus.Total_Upload_Budget_Qty__c = '2022';
        updateBatchStatus.Total_Upload_Sales_Budget__c = '2022';
        updateBatchStatus.Total_Upload_Budget_Value_USD__c = '2022';
        updateBatchStatus.Total_Upload_Budget_Value_EUR__c = '2022';
        updateBatchStatus.Total_Net_Sales_Budget_Local__c = '2022';
        updateBatchStatus.Total_Net_Sales_Budget_USD__c = '2022';
        updateBatchStatus.Total_Net_Sales_Budget_EUR__c = '2022';
        insert updateBatchStatus;
        string returnBatchId = updateBatchStatus.Id;
        String batchId1 = updateBatchStatus.Id;
       
       /* Inventory_Transaction_Master__c invtrans = new Inventory_Transaction_Master__c();
        invtrans.Batch_Status__c = 'Migration In Progress';
        invtrans.Record_Type__c  = 'Budget';
        invtrans.Period__c = 'Q2 Review';
        invtrans.Sales_Year__c = '2022';
        insert invtrans;*/
        
        Data_Upload_Sales__c dataupload = new Data_Upload_Sales__c();
        dataupload.Upload_Batch_No__c = updateBatchStatus.id;
        dataupload.Sales_Data_Company__c = 'Vietnam';
       dataupload.Year__c  = '2020';
        dataupload.Period__c = 'Q1 Review'; 
            dataupload.Category__c = 'FLEXIBLE PACKAGING'; 
            dataupload.Sub_Category__c = 'APPAREL BAGS'; 
            dataupload.Vendor__c = 'DEBENHAMS'; 
            dataupload.Segment__c = 'abc';
            dataupload.Transaction_Currency__c = 'USD';
            dataupload.Month__c  = 'Jan';
         dataupload.ExRate_to_USD__c = 100;
         dataupload.ExRate_to_EUR__c = 100;
         dataupload.Unit_Sold__c = 100;
         dataupload.Sales_Transaction_Currency__c = 100;
         dataupload.Sales_EUR__c = 100;
         dataupload.Sales_USD__c = 100;
        dataupload.Budget_Net_Sales_Local__c = 100;
         dataupload.Budget_Net_Sales_EUR__c = 100;
         dataupload.Budget_Net_Sales_USD__c = 100;
        dataupload.Sub_CategoryGroup__c = 'Hangers';
        insert dataupload;
        
      //  Data_Upload_Sales__c dus = new Data_Upload_Sales__c();
       // insert dus;
       
         Budget_Transaction_Stage__c budgetTranscation = new Budget_Transaction_Stage__c();
        budgetTranscation.Retailer__c= 'DEBENHAMS';
        budgetTranscation.Period__c = 'Q1 Review';
        budgetTranscation.Retailer_Check__c = true;
        budgetTranscation.Mainetti_Company__c = 'Vietnam';
        budgetTranscation.Record_Status__c = '2 - Data Validation Successful';
        budgetTranscation.Upload_Batch_No__c = updateBatchStatus.Id;
        budgetTranscation.Business_Vertical__c = 'FLEXIBLE PACKAGING';
        budgetTranscation.SubCategory__c = 'APPAREL BAGS';
        budgetTranscation.Source__c = 'VIRGIN';
        budgetTranscation.ExRate_to_EUR__c = '234';
        budgetTranscation.ExRate_to_USD__c = '234';
        budgetTranscation.Jan_Qty__c = '100';
        budgetTranscation.Jan_Budget_Gross_Sales__c = '20';
        budgetTranscation.Jan_Budget_Net_Sales__c = '20';
         budgetTranscation.Jan_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Jan_Budget_Gross_Sales_EUR__c = '20';
          budgetTranscation.Jan_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Jan_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Feb_Qty__c = '100';
        budgetTranscation.Feb_Budget_Gross_Sales__c = '20';
        budgetTranscation.Feb_Budget_Net_Sales__c = '20';
         budgetTranscation.Feb_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Feb_Budget_Gross_Sales_EUR__c = '20';
          budgetTranscation.Feb_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Feb_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Mar_Qty__c = '100';
        budgetTranscation.Mar_Budget_Gross_Sales__c = '20';
        budgetTranscation.Mar_Budget_Net_Sales__c = '20';
         budgetTranscation.Mar_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Mar_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Mar_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Mar_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Apr_Qty__c = '100';
        budgetTranscation.Apr_Budget_Gross_Sales__c = '100';
        budgetTranscation.Apr_Budget_Net_Sales__c = '20';
         budgetTranscation.Apr_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Apr_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Apr_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Apr_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.May_Qty__c = '100';
        budgetTranscation.May_Budget_Gross_Sales__c = '20';
        budgetTranscation.May_Budget_Net_Sales__c = '20';
         budgetTranscation.May_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.May_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.May_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.May_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Jun_Qty__c = '100';
        budgetTranscation.Jun_Budget_Gross_Sales__c = '20';
        budgetTranscation.Jun_Budget_Net_Sales__c = '20';
         budgetTranscation.Jun_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Jun_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Jun_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Jun_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Jul_Qty__c = '100';
        budgetTranscation.Jul_Budget_Gross_Sales__c = '20';
        budgetTranscation.Jul_Budget_Net_Sales__c = '20';
         budgetTranscation.Jul_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Jul_Budget_Gross_Sales_EUR__c = '20';
        budgetTranscation.Jul_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Jul_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Aug_Qty__c = '100';
        budgetTranscation.Aug_Budget_Gross_Sales__c = '20';
        budgetTranscation.Aug_Budget_Net_Sales__c = '20';
         budgetTranscation.Aug_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Aug_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Aug_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Aug_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Sep_Qty__c = '100';
        budgetTranscation.Sep_Budget_Gross_Sales__c = '20';
        budgetTranscation.Sep_Budget_Net_Sales__c = '20';
         budgetTranscation.Sep_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Sep_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Sep_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Sep_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Oct_Qty__c = '100';
        budgetTranscation.Oct_Budget_Gross_Sales__c = '20';
        budgetTranscation.Oct_Budget_Net_Sales__c = '20';
         budgetTranscation.Oct_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Oct_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Oct_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Oct_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Nov_Qty__c = '100';
        budgetTranscation.Nov_Budget_Gross_Sales__c = '20';
        budgetTranscation.Nov_Budget_Net_Sales__c = '20';
         budgetTranscation.Nov_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Nov_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Nov_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Nov_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Dec_Qty__c = '100';
        budgetTranscation.Dec_Budget_Gross_Sales__c = '20';
        budgetTranscation.Dec_Budget_Net_Sales__c = '20';
         budgetTranscation.Dec_Budget_Gross_Sales_USD__c = '20';
        budgetTranscation.Dec_Budget_Gross_Sales_EUR__c = '20';
         budgetTranscation.Dec_Budget_Net_Sales_USD__c = '20';
        budgetTranscation.Dec_Budget_Net_Sales_EUR__c = '20';
        budgetTranscation.Year__c = '2020';
        budgetTranscation.ProductCategory__c = 'Hangers';
        insert budgetTranscation;
       
        List<Budget_Transaction_Stage__c> transferRecords1= new List<Budget_Transaction_Stage__c>();
        transferRecords1.add(budgetTranscation); 
        
        
        //////////////////////////////////////////////
        string csv = '[{"Company__c":"Hong Kong Packaging","Year__c":"2019","Week__c":"Wk45","Month__c":"Jan","Item_code__c":"484","Material__c":"PP","Source__c":"Virgin","Model__c":"1000","Printed_Logo__c":"demoLogo","Color__c":"BLACK","Customer__c":"xxxxx","Customer_local_name__c":"xxxx","Mainetti_Brand__c":"Mainetti","Category__c":"HANGERS & ACCESSORIES","Sub_Category__c":"HANGERS","Family__c":"BOTTOM","Order_Type__c":"3rd","Unit_Sold__c":"8000","Unit_Price_100_EUR__c":"10.65123","Unit_Price_100_USD__c":"12.40602","Net_Unit_Price_100__c":"11","Sales_EUR__c":"2","Sales_USD__c":"5","Transaction_Currency__c":"HKD","ExRate_to_EUR__c":"9.08505","ExRate_to_USD__c":"7.8","Local_Net_Unit_Pirce_100__c":"13","Sales_Transaction_Currency__c":"2438.527291","Shipped_To_Factory__c":"xxxxxx","Shipped_To_Country__c":"xxxxxx","Label__c":"NL","End_user__c":"NL","Vendor__c":"MACYS","Division__c":"FOB","Retailer_Brand__c":"MMG","Royalty_Rate__c":"USA","Market__c":"USA","Remarks__c":"CHINA","LOB__c":"AAF","SO_Number__c":"18001464","Production_Country__c":"CHINA","Local_Currency__c":"HKD","Gross_Sales_USD__c":"10"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;
       
        String batchId = value.Id ;
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
        customdataInv.storageKey__c ='+cwB88OyDsjc1o7Kh5Npinh0mTaJdmxOIzyVpS4oNYNWjK91thQGfGmOS8NhM07GVsA4fZ1mXRvq74QzNnQCg==';
        customdataInv.storageName__c = 'mcogs01';
        customdataInv.containerName__c = 'mcogs01files/SalesForce';
        insert customdataInv;
       
        recStatusUpsertForSalesBudgetBulk obj = new recStatusUpsertForSalesBudgetBulk(updateBatchStatus.Id,userEmail);
    //    Test.setMock(HttpCalloutMock.class, new SalesSuccesDataHttpWebService());
   //     getMasterData getMaster = new getMasterData();
    //    getMaster.getCSVFile(value.id);
        /////////////////////////////////////////////
             
         Test.setMock(HttpCalloutMock.class, new RestMock());
         Test.startTest();
        Database.executeBatch(obj);
        Database.BatchableContext BC;
        obj.start(BC);
        obj.execute(BC, transferRecords1);
        DataBase.executeBatch(obj);
        Test.stopTest();
       
    }
 

}