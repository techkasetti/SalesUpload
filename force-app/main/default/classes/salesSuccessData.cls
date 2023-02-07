global class salesSuccessData implements Database.Batchable<sObject> ,Database.AllowsCallouts, Database.Stateful {
    //  global class salesSuccessData implements Database.Batchable<sObject> ,Database.AllowsCallouts {
    
    String fetchSuccessdata = 'SELECT unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Week_FB__c,Year_FB__c,Source_FB__c,Month_FB__c,Unit_Sold_FB__c,Local_Net_Unit_Pirce_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_USD_FB__c,ExRate_to_EUR_FB__c,Calculation_Failed__c,Remark__c,Label__c,End_user__c,Royalty_Rate__c,Printed_Logo__c,Customer_local_name__c,Net_Unit_Price_100__c,Local_Net_Unit_Pirce_100__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c, Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c, Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c, Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c, Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c, Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c, Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c, ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c, Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,  Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,  Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,wrong_date__c,  Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Label_FB__c,Retailer_Check__c,Model_Check__c,ProductCategory__c,Segments__c,Batch_No__c,Retailer_Country__c,Sales_Type__c ,ErrorMapHistory__c ,Sales_Type_NF__c,Standard_Unit_Cost_100_EUR__c,Standard_Unit_Cost_100_EUR_FB__c,Standard_Unit_Cost_100_EUR_NF__c,Standard_Unit_Cost_100_USD__c,Standard_Unit_Cost_100_USD_FB__c,Standard_Unit_Cost_100_USD_NF__c,Net_Unit_Price_100_EUR__c,Net_Unit_Price_100_EUR_FB__c,Net_Unit_Price_100_EUR_NF__c,Net_Unit_Price_100_NF__c, Standard_Unit_Ex_Work_Cost_100_EUR__c, Standard_Unit_Ex_Work_Cost_100_EUR_NF__c ,Standard_Unit_Ex_Work_Cost_100_EUR_FB__c, Standard_Unit_Ex_Work_Cost_100_USD__c, Standard_Unit_Ex_Work_Cost_100_USD_FB__c, Standard_Unit_Ex_Work_Cost_100_USD_NF__c, Standard_Unit_Industrial_Cost_100_EUR__c, Standard_Unit_Industrial_Cost_100_EUR_FB__c, Standard_Unit_Industrial_Cost_100_EUR_NF__c , Standard_Unit_Industrial_Cost_100_USD__c , Standard_Unit_Industrial_Cost_100_USD_FB__c, Standard_Unit_Industrial_Cost_100_USD_NF__c ,Final_Sales_Destination__c, Final_Sales_Destination_FB__c, Final_Sales_Destination_NF__c,CreatedById, Sales_Delivery_Date__c,Sales_Delivery_Date_FB__c,Sales_Delivery_Date_NF__c,Sales_Order_Date__c,Sales_Order_Date_FB__c,Sales_Order_Date_NF__c,Gross_Unit_Price_100_Local_Currency__c,Gross_Unit_Price_100_Local_Currency_FB__c,Gross_Unit_Price_100_Local_Currency_NF__c ,Region__c,Cogs_Country__c,Company_Group_Name__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c,Retailer_Type__c FROM Sales_Transaction_Stage__c   WHERE Upload_Batch_No__c=:batchId and Record_Status__c =\'2 - Data Validation Successful\'';
    String email;
    global String batchId;
    global String userEmail;
    global Boolean insertStatus;    
    global boolean uploadStatus;
    global boolean uploadSalesSuccessFile;
    global String fileName;
    private List<Sales_Transaction_Stage__c> salesTransStageForCSV = new List<Sales_Transaction_Stage__c>();
    public salesSuccessData( String batchId,String userEmail) {
        this.batchId = batchId;
        this.userEmail = userEmail; 
    }
    global Database.querylocator start(Database.BatchableContext bc){
        
			uploadStatus =  createCSVFileAndUploadToAzure(batchId);
        if(uploadStatus)
        {
            Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
            updateBatchStatus.Id = batchId;
            updateBatchStatus.Batch_Status__c = '7 - Migration In Progress';
            update updateBatchStatus;
            insertStatus = true;
        }     
        else
        {
           fetchSuccessdata = null; 
        }
        return Database.getQueryLocator(fetchSuccessdata);        
    }
    
    global void execute(Database.BatchableContext bc, List<Sales_Transaction_Stage__c> transferRecords){ 
        //  system.debug('Inside Execute  uploadStatus :::'+uploadStatus);
        //getSalesMasterData masterData = new getSalesMasterData();
        List<Data_Upload_Sales__c> insertRecord = new List<Data_Upload_Sales__c>();
        // Map<String ,String> regionValMap = getParterCmpyRegion();
        system.debug('transferRecords ::'+transferRecords);
        if(transferRecords.size() > 0){           
            for(Sales_Transaction_Stage__c trans: transferRecords){
                
                //String SalesCmpyregion = getParterCmpyRegion(salesDataCompany);
                
                Data_Upload_Sales__c salesTransMast = new Data_Upload_Sales__c();
                salesTransMast.Upload_Batch_No__c = trans.Upload_Batch_No__c;
                salesTransMast.Sales_Data_Company__c = trans.Company__c;
                salesTransMast.Region__c = trans.Region__c;
                salesTransMast.Cogs_Country__c = trans.Cogs_Country__c;
                salesTransMast.Company_Group_Name__c = trans.Company_Group_Name__c;
                salesTransMast.Year__c = trans.Year__c;
                salesTransMast.Week__c = trans.Week__c;
                salesTransMast.Month__c = trans.Month__c;
                salesTransMast.Item_Code__c = trans.Item_Code__c;
                salesTransMast.Material__c = trans.Material__c;
                salesTransMast.Source__c = trans.Source__c;
                salesTransMast.Model__c = trans.Model__c;
                salesTransMast.Printed_Logo__c = trans.Printed_Logo__c;
                salesTransMast.Color__c = trans.Color__c;
                salesTransMast.Customer__c = trans.Customer__c;
                salesTransMast.Customer_Local_Name__c = trans.Customer_Local_Name__c;
                salesTransMast.Mainetti_Brand__c = trans.Mainetti_Brand__c;
                salesTransMast.Category__c = trans.Category__c;
                salesTransMast.Sub_CategoryGroup__c = trans.ProductCategory__c;
                salesTransMast.Sub_Category__c = trans.Sub_Category__c;
                salesTransMast.Family__c = trans.Family__c;
                salesTransMast.Order_Type__c = trans.Order_Type__c;
                salesTransMast.Unit_Sold__c = decimal.valueOf(trans.Unit_Sold__c.replaceAll(',',''));
                salesTransMast.Net_Weight_KG_1000__c = decimal.valueOf(trans.Net_Weight_KG_1000__c.replaceAll(',',''));
                salesTransMast.Unit_Price_100_EUR__c = decimal.valueOf(trans.Unit_Price_100_EUR__c.replaceAll(',','')).setScale(4);
                salesTransMast.Unit_Price_100_USD__c = decimal.valueOf(trans.Unit_Price_100_USD__c.replaceAll(',','')).setScale(4);
                salesTransMast.Record_Type__c = 'Sales';
                if(trans != null && trans.Net_Weight_KG_1000__c == null)
                {
                    trans.Net_Weight_KG_1000__c = '0';
                    salesTransMast.Net_Weight_KG_1000__c = decimal.valueOf(trans.Net_Weight_KG_1000__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Net_Weight_KG_1000__c = decimal.valueOf(trans.Net_Weight_KG_1000__c.replaceAll(',',''));
                } 
                
                if(trans != null && trans.Net_Unit_Price_100__c == null)
                {
                    trans.Net_Unit_Price_100__c = '0';
                    salesTransMast.Net_Unit_Price_100__c = decimal.valueOf(trans.Net_Unit_Price_100__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Net_Unit_Price_100__c = decimal.valueOf(trans.Net_Unit_Price_100__c.replaceAll(',',''));
                } 
                if(trans != null && trans.Sales_EUR__c == null)
                {
                    trans.Sales_EUR__c = '0';
                    salesTransMast.Sales_EUR__c = decimal.valueOf(trans.Sales_EUR__c);
                }
                else
                {
                    salesTransMast.Sales_EUR__c = decimal.valueOf(trans.Sales_EUR__c.replaceAll(',','')).setScale(4);
                }
                if(trans != null && trans.Sales_USD__c == null)
                {
                    trans.Sales_USD__c = '0';
                    salesTransMast.Sales_USD__c = decimal.valueOf(trans.Sales_USD__c.replaceAll('','0'));
                }
                else
                {
                    salesTransMast.Sales_USD__c = decimal.valueOf(trans.Sales_USD__c.replaceAll(',','')).setScale(4);
                }
                salesTransMast.Transaction_Currency__c = trans.Transaction_Currency__c;
                salesTransMast.ExRate_to_EUR__c = decimal.valueOf(trans.ExRate_to_EUR__c.replaceAll(',','')).setScale(4);
                salesTransMast.ExRate_to_USD__c = decimal.valueOf(trans.ExRate_to_USD__c.replaceAll(',','')).setScale(4);
                // Added by sai 07-08-2020 Starting
                if(trans.Local_Net_Unit_Pirce_100__c == '-')
                {
                    salesTransMast.Local_Net_Unit_Pirce_100__c = decimal.valueOf(trans.Local_Net_Unit_Pirce_100__c.replaceAll('-','0'));
                }
                else
                {
                    salesTransMast.Local_Net_Unit_Pirce_100__c = decimal.valueOf(trans.Local_Net_Unit_Pirce_100__c.replaceAll(',','')).setScale(4);
                }
                // Added by sai 07-08-2020 Ending
                if(trans != null && trans.Sales_Transaction_Currency__c == null)
                {
                    trans.Sales_Transaction_Currency__c = '0';
                    salesTransMast.Sales_Transaction_Currency__c = decimal.valueOf(trans.Sales_Transaction_Currency__c.replaceAll('','0'));
                }
                else
                {
                    salesTransMast.Sales_Transaction_Currency__c = decimal.valueOf(trans.Sales_Transaction_Currency__c.replaceAll(',','')).setScale(4);
                }
                salesTransMast.Shipped_To_Factory__c = trans.Shipped_To_Factory__c; 
                salesTransMast.Shipped_To_Country__c = trans.Shipped_To_Country__c;
                salesTransMast.Label__c = trans.Label__c;
                salesTransMast.End_User__c = trans.End_User__c;
                salesTransMast.Vendor__c = trans.Vendor__c;
                salesTransMast.Division__c = trans.Division__c;
                salesTransMast.Royalty_Rate__c = trans.Royalty_Rate__c;
                salesTransMast.Retailer_Brand__c = trans.Retailer_Brand__c;                
                salesTransMast.Market__c = trans.Market__c;
                salesTransMast.Remark__c = trans.Remark__c;
                salesTransMast.LOB__c = trans.LOB__c;
                salesTransMast.SO_Number__c = trans.SO_Number__c;
                salesTransMast.PO_Number__c = trans.PO_Number__c;
                salesTransMast.Production_Countries__c = trans.Production_Country__c;
                salesTransMast.Final_Sales_Destinations__c = trans.Final_Sales_Destination__c;
                salesTransMast.Gross_Sales_USD__c = decimal.valueOf(trans.Gross_Sales_USD__c.replaceAll(',',''));
                salesTransMast.Freight_Charge_USD__c = decimal.valueOf(trans.Freight_Charge_USD__c.replaceAll(',',''));
                salesTransMast.Data_Row_Date__c = getRowDate( trans.Year__c,trans.Month__c);
                // Added by Sai 05-08-2020
                salesTransMast.Retailer_Country__c = trans.Retailer_Country__c;
                salesTransMast.Retailer_Type__c = trans.Retailer_Type__c;
                system.debug('trans.Sales_Type__c:::::'+trans.Sales_Type__c);
                salesTransMast.Sales_Type__c = trans.Sales_Type__c;
                salesTransMast.Segment__c = trans.Segments__c;
                salesTransMast.ErrorMapHistory__c = trans.ErrorMapHistory__c;
                // Added by Sai 20-11-2020
                if(trans != null && trans.Standard_Unit_Cost_100_EUR__c == null)
                {
                    trans.Standard_Unit_Cost_100_EUR__c = '0';
                    salesTransMast.Standard_Unit_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Cost_100_EUR__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Cost_100_EUR__c.replaceAll(',',''));
                } 
                if(trans != null && trans.Standard_Unit_Cost_100_USD__c == null)
                {
                    trans.Standard_Unit_Cost_100_USD__c = '0';
                    salesTransMast.Standard_Unit_Cost_100_USD__c = decimal.valueOf(trans.Standard_Unit_Cost_100_USD__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Cost_100_USD__c = decimal.valueOf(trans.Standard_Unit_Cost_100_USD__c.replaceAll(',',''));
                } 
                
                
                // Added by Bharath 11-01-2021
                if(trans != null && trans.Standard_Unit_Ex_Work_Cost_100_EUR__c == null)
                {
                    trans.Standard_Unit_Ex_Work_Cost_100_EUR__c = '0';
                    salesTransMast.Standard_Unit_Ex_Work_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Ex_Work_Cost_100_EUR__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Ex_Work_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Ex_Work_Cost_100_EUR__c.replaceAll(',',''));
                } 
                if(trans != null && trans.Standard_Unit_Ex_Work_Cost_100_USD__c	 == null)
                {
                    trans.Standard_Unit_Ex_Work_Cost_100_USD__c	 = '0';
                    salesTransMast.Standard_Unit_Ex_Work_Cost_100_USD__c	 = decimal.valueOf(trans.Standard_Unit_Ex_Work_Cost_100_USD__c	.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Ex_Work_Cost_100_USD__c	 = decimal.valueOf(trans.Standard_Unit_Ex_Work_Cost_100_USD__c	.replaceAll(',',''));
                } 
                
                
                if(trans != null && trans.Standard_Unit_Industrial_Cost_100_EUR__c == null)
                {
                    trans.Standard_Unit_Industrial_Cost_100_EUR__c = '0';
                    salesTransMast.Standard_Unit_Industrial_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Industrial_Cost_100_EUR__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Industrial_Cost_100_EUR__c = decimal.valueOf(trans.Standard_Unit_Industrial_Cost_100_EUR__c.replaceAll(',',''));
                } 
                if(trans != null && trans.Standard_Unit_Industrial_Cost_100_USD__c	 == null)
                {
                    trans.Standard_Unit_Industrial_Cost_100_USD__c	 = '0';
                    salesTransMast.Standard_Unit_Industrial_Cost_100_USD__c	 = decimal.valueOf(trans.Standard_Unit_Industrial_Cost_100_USD__c	.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Standard_Unit_Industrial_Cost_100_USD__c	 = decimal.valueOf(trans.Standard_Unit_Industrial_Cost_100_USD__c	.replaceAll(',',''));
                }              
                if(trans != null && trans.Net_Unit_Price_100_EUR__c == null)
                {
                    trans.Net_Unit_Price_100_EUR__c = '0';
                    salesTransMast.Net_Unit_Price_100_EUR__c = decimal.valueOf(trans.Net_Unit_Price_100_EUR__c.replaceAll(',',''));
                }
                else
                {
                    salesTransMast.Net_Unit_Price_100_EUR__c = decimal.valueOf(trans.Net_Unit_Price_100_EUR__c.replaceAll(',',''));
                } 
                salesTransMast.Sales_Order_Date__c = trans.Sales_Order_Date__c;
                salesTransMast.Sales_Delivery_Date__c = trans.Sales_Delivery_Date__c;
                salesTransMast.Gross_Unit_Price_100_Local_Currency__c =  decimal.valueOf(trans.Gross_Unit_Price_100_Local_Currency__c.replaceAll(',',''));
                
                //Added on 15/01/21 ------Start 
                salesTransMast.OwnerId = trans.CreatedById;
                //Added on 15/01/21 ------ End 
                /*if(trans.Unit_Sold__c != '0' ){   
insertRecord.add(salesTransMast);
} */
                insertRecord.add(salesTransMast);
                salesTransMast = null;
            }
            
            if(insertRecord.size()>0){
                try{
                    //  system.debug('Execute Upload Status uploadStatus ::' +uploadStatus);
                        //insert insertRecord;
                        new uploadSales().splitInsertRecordListForUpload(insertRecord);
                        //delete transferRecords;
                        new uploadSales().splitListForDelete(transferRecords);

                    //  boolean appendUserStatus = appendTheUserUploadedCSVFile(batchId,salesTransStageForCSV);
                }catch(DMLException e){   
                    insertStatus = false;
                    system.debug('Error in insertDataUploadSales: during DataUploadSales'+e.getMessage());
                }
            }  
        }
        
    }
    global void finish(Database.BatchableContext bc){
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus.Id = batchId;
        updateBatchStatus.Batch_Process__c='Completed';
        system.debug('insertStatus::::'+insertStatus+'uploadStatus::::'+uploadStatus);
        if(insertStatus && uploadStatus){
            String recCount = getUploadDetails(batchId);
            updateBatchStatus.Total_Row_Count__c = Integer.valueOf(recCount);
            updateBatchStatus.Batch_Status__c = '8 - Migration Success';
        }else{
            updateBatchStatus.Batch_Status__c = '9 - Migration Fail';
        }        
        update updateBatchStatus;
        
        Inventory_Transaction_Master__c query = [SELECT Batch_No__c FROM Inventory_Transaction_Master__c WHERE Id =: batchId ];
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {userEmail};
            mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Sales Batch Process Completed , Ref Batch No :'+query.Batch_No__c);
        mail.setPlainTextBody('Hello,\n\n Your Sales File Upload process has been completed,\n Please proceed to the application and go to the File Upload Screen & Check the upload Status for next steps.. \n\n Warm Regards \n Admin');
        //Put the total records etc.. in the email body.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   
        
    }
    public Date getRowDate( string year,string month)
    {
        Map <String, Integer> monthNumber = new Map <String, Integer> {'jan'=>1, 'feb'=>2
            , 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9
            , 'oct'=>10, 'nov'=>11, 'dec'=>12};
                
                Integer dayStart = Integer.valueOf('01');
        Integer monthStart = monthNumber.get(month.toLowerCase());
        Integer yearStart = Integer.valueOf(year);    
        Date parsedDateStart = Date.newInstance(yearStart,monthStart,dayStart); 
        
        return parsedDateStart;
    }
        
    global  boolean createCSVFileAndUploadToAzure(String batchId){
        system.debug(' createCSVFileAndUploadToAzure  ::: batchId ::'+batchId);
        boolean fileCreationNUploadToAzure = true;
        
        
        /************************************update the Azure URL **************************************/

            Inventory_Transaction_Master__c transMast = new Inventory_Transaction_Master__c();
            transMast.Id = batchId;
            transMast.Batch_Status__c = '6 - Azure File Upload Successful';
            try{
                update transMast;
            }catch(DMLException ex){
                fileCreationNUploadToAzure = false;
                System.debug('DML Exception during the 6 - Azure File Upload Successful'+ex.getMessage());
            }                  
        system.debug('fileCreationNUploadToAzure ::'+fileCreationNUploadToAzure);
        return fileCreationNUploadToAzure;
    }
    
    public String getUploadDetails(String batchId){
        String recCount='';    
        AggregateResult[] groupedResults = [select  Count(Id) recCount from Data_Upload_Sales__c where Upload_Batch_No__c=:batchId];
        for (AggregateResult ar : groupedResults)  {
            recCount = String.valueOf(ar.get('recCount'));
        }      
        return recCount;
    }   
    
    
}