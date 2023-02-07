global class recStatusUpsertForSalesBudgetBulk implements Database.Batchable<sObject> , Database.Stateful {
    
   String query = 'select Mainetti_Company__c,Mainetti_Company_FB__c,Mainetti_Company_NF__c,CompYearPeriod__c,Year__c,Year_FB__c,Year_NF__c,Period__c,Period_FB__c,Period_NF__c,'+
'Business_Vertical__c,Business_Vertical_FB__c,Business_Vertical_NF__c,SubCategory__c,SubCategory_FB__c,SubCategory_NF__c,Retailer__c,Retailer_Check__c,Retailer_FB__c,'+
'Retailer_NF__c,Source__c,Source_FB__c,Source_NF__c,Local_Currency__c,Local_Currency_FB__c,Local_Currency_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_FB__c,ExRate_to_EUR_NF__c,'+
'ExRate_to_USD__c,ExRate_to_USD_FB__c,ExRate_to_USD_NF__c,Transaction_Master_Id__c,Upload_Batch_No__c,Malformed_Data__c,Error_Code__c,Remarks__c,Row_No__c,Record_Status__c,Market__c,CreatedById,Batch_No__c,'+
'Month__c,Month_FB__c,Month_NF__c,Jan_Qty__c,Jan_Qty_FB__c,Jan_Qty_NF__c,Jan_Budget_Gross_Sales__c,Jan_Budget_Gross_Sales_FB__c,Jan_Budget_Gross_Sales_NF__c,Jan_Budget_Gross_Sales_USD__c,Jan_Budget_Gross_Sales_EUR__c,Jan_Budget_Net_Sales__c,Jan_Budget_Net_Sales_FB__c,Jan_Budget_Net_Sales_NF__c,Jan_Budget_Net_Sales_EUR__c,Jan_Budget_Net_Sales_USD__c,'+
'Feb_Qty__c,Feb_Qty_FB__c,Feb_Qty_NF__c,Feb_Budget_Gross_Sales__c,Feb_Budget_Gross_Sales_FB__c,Feb_Budget_Gross_Sales_NF__c,Feb_Budget_Gross_Sales_USD__c,Feb_Budget_Gross_Sales_EUR__c,Feb_Budget_Net_Sales__c,Feb_Budget_Net_Sales_FB__c,Feb_Budget_Net_Sales_NF__c,Feb_Budget_Net_Sales_EUR__c,Feb_Budget_Net_Sales_USD__c,'+
'Mar_Qty__c,Mar_Qty_FB__c,Mar_Qty_NF__c,Mar_Budget_Gross_Sales__c,Mar_Budget_Gross_Sales_FB__c,Mar_Budget_Gross_Sales_NF__c,Mar_Budget_Gross_Sales_USD__c,Mar_Budget_Gross_Sales_EUR__c,Mar_Budget_Net_Sales__c,Mar_Budget_Net_Sales_FB__c,Mar_Budget_Net_Sales_NF__c,Mar_Budget_Net_Sales_EUR__c,Mar_Budget_Net_Sales_USD__c,'+
'Apr_Qty__c,Apr_Qty_FB__c,Apr_Qty_NF__c,Apr_Budget_Gross_Sales__c,Apr_Budget_Gross_Sales_FB__c,Apr_Budget_Gross_Sales_NF__c,Apr_Budget_Gross_Sales_USD__c,Apr_Budget_Gross_Sales_EUR__c,Apr_Budget_Net_Sales__c,Apr_Budget_Net_Sales_fb__c,Apr_Budget_Net_Sales_NF__c,Apr_Budget_Net_Sales_USD__c,Apr_Budget_Net_Sales_EUR__c,'+
'May_Qty__c,May_Qty_FB__c,May_Qty_NF__c,May_Budget_Gross_Sales__c,May_Budget_Gross_Sales_FB__c,May_Budget_Gross_Sales_NF__c,May_Budget_Gross_Sales_USD__c,May_Budget_Gross_Sales_EUR__c,May_Budget_Net_Sales__c,May_Budget_Net_Sales_FB__c,May_Budget_Net_Sales_NF__c,May_Budget_Net_Sales_EUR__c,May_Budget_Net_Sales_USD__c,'+
'Jun_Qty__c,Jun_Qty_FB__c,Jun_Qty_NF__c,Jun_Budget_Gross_Sales__c,Jun_Budget_Gross_Sales_FB__c,Jun_Budget_Gross_Sales_NF__c,Jun_Budget_Gross_Sales_USD__c,Jun_Budget_Gross_Sales_EUR__c,Jun_Budget_Net_Sales__c,Jun_Budget_Net_Sales_FB__c,Jun_Budget_Net_Sales_NF__c,Jun_Budget_Net_Sales_EUR__c,Jun_Budget_Net_Sales_USD__c,'+
'Jul_Qty__c,Jul_Qty_FB__c,Jul_Qty_NF__c,Jul_Budget_Gross_Sales__c,Jul_Budget_Gross_Sales_FB__c,Jul_Budget_Gross_Sales_NF__c,Jul_Budget_Gross_Sales_USD__c,Jul_Budget_Gross_Sales_EUR__c,Jul_Budget_Net_Sales__c,Jul_Budget_Net_Sales_FB__c,Jul_Budget_Net_Sales_NF__c,Jul_Budget_Net_Sales_EUR__c,Jul_Budget_Net_Sales_USD__c,'+
'Aug_Qty__c,Aug_Qty_FB__c,Aug_Qty_NF__c,Aug_Budget_Gross_Sales__c,Aug_Budget_Gross_Sales_FB__c,Aug_Budget_Gross_Sales_NF__c,Aug_Budget_Gross_Sales_USD__c,Aug_Budget_Gross_Sales_EUR__c,Aug_Budget_Net_Sales__c,Aug_Budget_Net_Sales_FB__c,Aug_Budget_Net_Sales_NF__c,Aug_Budget_Net_Sales_EUR__c,Aug_Budget_Net_Sales_USD__c,'+
'Sep_Qty__c,Sep_Qty_FB__c,Sep_Qty_NF__c,Sep_Budget_Gross_Sales__c,Sep_Budget_Gross_Sales_FB__c,Sep_Budget_Gross_Sales_NF__c,Sep_Budget_Gross_Sales_USD__c,Sep_Budget_Gross_Sales_EUR__c,Sep_Budget_Net_Sales__c,Sep_Budget_Net_Sales_FB__c,Sep_Budget_Net_Sales_NF__c,Sep_Budget_Net_Sales_EUR__c,Sep_Budget_Net_Sales_USD__c,'+
'Oct_Qty__c,Oct_Qty_FB__c,Oct_Qty_NF__c,Oct_Budget_Gross_Sales__c,Oct_Budget_Gross_Sales_FB__c,Oct_Budget_Gross_Sales_NF__c,Oct_Budget_Gross_Sales_USD__c,Oct_Budget_Gross_Sales_EUR__c,Oct_Budget_Net_Sales__c,Oct_Budget_Net_Sales_FB__c,Oct_Budget_Net_Sales_NF__c,Oct_Budget_Net_Sales_EUR__c,Oct_Budget_Net_Sales_USD__c,'+
'Nov_Qty__c,Nov_Qty_FB__c,Nov_Qty_NF__c,Nov_Budget_Gross_Sales__c,Nov_Budget_Gross_Sales_FB__c,Nov_Budget_Gross_Sales_NF__c,Nov_Budget_Gross_Sales_USD__c,Nov_Budget_Gross_Sales_EUR__c,Nov_Budget_Net_Sales__c,Nov_Budget_Net_Sales_FB__c,Nov_Budget_Net_Sales_NF__c,Nov_Budget_Net_Sales_EUR__c,Nov_Budget_Net_Sales_USD__c,'+
'Dec_Qty__c,Dec_Qty_FB__c,Dec_Qty_NF__c,Dec_Budget_Gross_Sales__c,Dec_Budget_Gross_Sales_FB__c,Dec_Budget_Gross_Sales_NF__c,Dec_Budget_Gross_Sales_USD__c,Dec_Budget_Gross_Sales_EUR__c,Dec_Budget_Net_Sales__c,Dec_Budget_Net_Sales_FB__c,Dec_Budget_Net_Sales_NF__c,Dec_Budget_Net_Sales_EUR__c,Dec_Budget_Net_Sales_USD__c,ProductCategory__c,Combination_Of_Qty_And_Budget_Value_NF__c from Budget_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchId order by Row_No__c';
     
    global String batchId;  
     private String userEmail;
    private List<Budget_Transaction_Stage__c> salesTransStageForCSV;
    public recStatusUpsertForSalesBudgetBulk(String batchId,String userEmail) {
        this.batchId = batchId; 
         this.userEmail = userEmail;
        
    }      
    global Database.querylocator start(Database.BatchableContext BC){
        System.debug('::::::::::::::: INSIDE THE START METHOD OF SALES UPLOAD BATCH recStatusUpsertForInventoryBulkPROCESSING :::::::::::::::::::::');
        return Database.getQueryLocator(query);            
    }    
    global void execute(Database.BatchableContext BC, List<Budget_Transaction_Stage__c> updateStage){
        System.debug('::::::::::::::: INSIDE THE EXECUTE METHOD OF SALES UPLOAD BATCH PROCESSING :::::::::::::::::::::');
        
         salesTransStageForCSV = updateStage;
        List<Budget_Transaction_Stage__c> salesTransStagUpdate = new List<Budget_Transaction_Stage__c>();
        for( Budget_Transaction_Stage__c stage : updateStage ){
            //  System.debug('::::::::::::::: INSIDE THE updateStage :::::::::::::::::::::');
            stage.Record_Status__c = '2 - Data Validation Successful';
            // System.debug('::::::::::::::: AFTER THE updateStage :::::::::::::::::::::');
            salesTransStagUpdate.add(stage);
        }
       
        if(salesTransStagUpdate != null && salesTransStagUpdate.size() > 0){
            try{            
                // Getting the total record count of the salesrecord for pagination
                Integer totalRecCountForUpdate = salesTransStagUpdate.size();
              //  system.debug('totalRecCountForUpdate:::'+totalRecCountForUpdate);
                Integer maxSizeForUpdate = 9000;
                if(totalRecCountForUpdate > maxSizeForUpdate){
                    for(Integer i = 0 ; i < (totalRecCountForUpdate / maxSizeForUpdate)+1 ; i++){
                        List<Budget_Transaction_Stage__c> salesTemp = new  List<Budget_Transaction_Stage__c>();
                        for(Integer j=(i*maxSizeForUpdate);(j<(i*maxSizeForUpdate)+maxSizeForUpdate) && j<totalRecCountForUpdate ; j++){
                            salesTemp.add(salesTransStagUpdate.get(j));
                        }
                        update salesTemp;
                    }                    
                }else{
                    update salesTransStagUpdate;
                }
                
                boolean appendStatus = appendUploadCSVFile(batchId,salesTransStageForCSV);
            List<Data_Upload_Sales__c> convertedDataUploadList = getDataUploadList( salesTransStageForCSV);
            boolean appendConvertedStatus = appendConvertedCSVFile(batchId, convertedDataUploadList);
               
            }catch(DMLException e){                
                system.debug('Error in processSalesData: during DataUploadTransaction'+e.getMessage());            
            }
    }
    }
    global void finish(Database.BatchableContext BC){ 
        system.debug('Start of Retailer Change salesBudgetSuccessData');
        Database.executeBatch(new salesBudgetSuccessData(batchId,userEmail),500);
system.debug('After of Retailer Change salesBudgetSuccessData');        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {userEmail};
            mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Batch Process Completed');
        mail.setPlainTextBody('Batch Process has completed');
        //Put the total records etc.. in the email body.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
   public boolean appendUploadCSVFile(String batchId,List<Budget_Transaction_Stage__c> salesTransStageForCSV){
        getSalesBudgetMasterData getMastData = new getSalesBudgetMasterData();
        Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Period__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c from Inventory_Transaction_Master__c where Id =: batchId ];
        String fileDelimiter = invTransMast.File_Delimiters__c;
        boolean createStatus = true;
        
        String csvFile;
        String csvColumnHeader = '';
        String contentType = 'text/plain';
        String fileName = invTransMast.Sales_Company__c+'+'+invTransMast.Period__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'.csv';
        String conVerTitle = 'SalesBudgetUploadedFile';
        List<String> csvRowValues = generateUploadCSVRow(salesTransStageForCSV,batchId,fileDelimiter);
        List<ContentVersion> conVerList =  getMastData.getContentDocumentVerIds(batchId,conVerTitle);
        if(conVerList.size() == 0){
            
           csvColumnHeader = 'Mainetti Company'+','+'Budget Year'+','+'Period'+','+'Business Vertical'+','+'SubCategory'+','+'Retailer'+','+'Source'+','+'Local Currency'+','+'ExRate to USD'+','+'ExRate To EUR'+','+'Jan Qty'+','+'Jan Budget Gross Sales'+','+'Jan Budget Net Sales'+','+'Feb Qty'+','+'Feb Budget Gross Sales'+','+'Feb Budget Net Sales'+','+'Mar Qty'+','+'Mar Budget Gross Sales'+','+'Mar Budget Net Sales'+','+'Apr Qty'+','+'Apr Budget Gross Sales'+','+'Apr Budget Net Sales'+','+'May Qty'+','+'May Budget Gross Sales'+','+'May Budget Net Sales'+','+'Jun Qty'+','+'Jun Budget Gross Sales'+','+'Jun Budget Net Sales'+','+'Jul Qty'+','+'Jul Budget Gross Sales'+','+'Jul Budget Net Sales'+','+'Aug Qty'+','+'Aug Budget Gross Sales'+','+'Aug Budget Net Sales'+','+'Sep Qty'+','+'Sep Budget Gross Sales'+','+'Sep Budget Net Sales'+','+'Oct Qty'+','+'Oct Budget Gross Sales'+','+'Oct Budget Net Sales'+','+'Nov Qty '+','+'Nov Budget Gross Sales'+','+'Nov Budget Net Sales'+','+'Dec Qty'+','+'Dec Budget Gross Sales'+','+'Dec Budget Net Sales'+','+'Batch No\n';
        }
        csvFile = csvColumnHeader + String.join(csvRowValues,'\n');
        boolean delStatus =  getMastData.deleteCSVFile(batchId);
        
        createStatus = new getSalesBudgetMasterData().createDocument(batchId,csvFile,fileName,conVerTitle);
        return  createStatus ;
    } 
    public boolean appendConvertedCSVFile(String batchId,List<Data_Upload_Sales__c> salesTransStageForCSV){
        getSalesBudgetMasterData getMastData = new getSalesBudgetMasterData();
        Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Sales_Month__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c,Period__c from Inventory_Transaction_Master__c where Id =: batchId ];
        String fileDelimiter = invTransMast.File_Delimiters__c;
        boolean createStatus = true;
        
        String csvFile;
        String csvColumnHeader = '';
        String contentType = 'text/plain';
        String fileName = invTransMast.Sales_Company__c+'+'+invTransMast.Period__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'_conv.csv';
        
        List<String> csvRowValues = generateConvertedCSVRow(salesTransStageForCSV,batchId,fileDelimiter);
         String conVerTitle = 'SalesBudgetConvertedFile';
        List<ContentVersion> conVerList =  getMastData.getContentDocumentVerIds(batchId,conVerTitle);
        if(conVerList.size() == 0){
            
           // csvColumnHeader = 'Mainetti Company'+','+'Year'+','+'Period'+','+'Business Vertical'+','+'Category'+','+'Retailer'+','+'Market'+','+'Local Currency'+','+'Month'+','+'ExRate to USD'+','+'ExRate To EUR'+','+'Qty'+','+'Sales Budget(Local)'+','+'Sales Budget(USD)'+','+'Sales Budget(EUR)\n';  
       // csvColumnHeader = 'Mainetti Company'+','+'Budget Year'+','+'Period'+','+'Business Vertical'+','+'ProductCategory'+','+'SubCategory'+','+'Source'+','+'Retailer'+','+'Market'+','+'Local Currency'+','+'Month'+','+'ExRate to USD'+','+'ExRate To EUR'+','+'Qty'+','+'Sales Budget(Local)'+','+'Sales Budget(USD)'+','+'Sales Budget(EUR)'+','+'Batch No\n';  
       csvColumnHeader = 'Mainetti Company'+','+'Budget Year'+','+'Period'+','+'Business Vertical'+','+'SubCategory'+','+'Category'+','+'Source'+','+'Retailer'+','+'Market'+','+'Local Currency'+','+'Month'+','+'ExRate to USD'+','+'ExRate To EUR'+','+'Qty'+','+'Budget Gross Sales(Local)'+','+'Budget Gross Sales(USD)'+','+'Budget Gross Sales(EUR)'+','+'Budget Net Sales(Local)'+','+'Budget Net Sales(USD)'+','+'Budget Net Sales(EUR)'+','+'Batch No\n';  
       
        }
        csvFile = csvColumnHeader + String.join(csvRowValues,'\n');
        // boolean delStatus =  getMastData.deleteCSVFile(batchId);
       
        createStatus = new getSalesBudgetMasterData().createDocument(batchId,csvFile,fileName,conVerTitle);
        //boolean uploadStatus =  createCSVFileAndUploadToAzure(batchId,conVerTitle);
        return  createStatus ;
    }
    
   
    global List<String>  generateUploadCSVRow(List<Budget_Transaction_Stage__c> salesTransStageForCSV, String batchId,String fileDelimiter){
        List<String> csvRowValues = new List<String>();       
        for(Budget_Transaction_Stage__c saleTranStage : salesTransStageForCSV){

            
            String MainettiCompany = saleTranStage.Mainetti_Company__c != null ? saleTranStage.Mainetti_Company__c : '';
            String year = saleTranStage.Year__c != null ? saleTranStage.Year__c : '';
            String Period = saleTranStage.Period__c != null ? saleTranStage.Period__c : '';
            String BusinessVertical = saleTranStage.Business_Vertical__c != null ? saleTranStage.Business_Vertical__c : '';
            String SubCategory = saleTranStage.SubCategory__c != null ? saleTranStage.SubCategory__c : '';
            String Retailer = saleTranStage.Retailer__c != null ? saleTranStage.Retailer__c : '';
            String Source = saleTranStage.Source__c != null ? saleTranStage.Source__c : '';
            String LocalCurrency = saleTranStage.Local_Currency__c != null ? saleTranStage.Local_Currency__c : '';
            String ExRatetoUSD = saleTranStage.ExRate_to_USD__c != null ? saleTranStage.ExRate_to_USD__c : '';
            String ExRateToEUR = saleTranStage.ExRate_to_EUR__c != null ? saleTranStage.ExRate_to_EUR__c : '';
            String JanQty = saleTranStage.Jan_Qty__c != null ? saleTranStage.Jan_Qty__c : '';
            String JanBudgetValue = saleTranStage.Jan_Budget_Gross_Sales__c != null ? saleTranStage.Jan_Budget_Gross_Sales__c : '';
            String JanBudgetNetSales = saleTranStage.Jan_Budget_Net_Sales__c != null ? saleTranStage.Jan_Budget_Net_Sales__c : '';
            String FebQty = saleTranStage.Feb_Qty__c != null ? saleTranStage.Feb_Qty__c : '';
            String FebBudgetValue = saleTranStage.Feb_Budget_Gross_Sales__c != null ? saleTranStage.Feb_Budget_Gross_Sales__c : '';
            String FebBudgetNetSales = saleTranStage.Feb_Budget_Net_Sales__c != null ? saleTranStage.Feb_Budget_Net_Sales__c : '';
            String MarQty = saleTranStage.Mar_Qty__c != null ? saleTranStage.Mar_Qty__c : '';
            String MarBudgetValue = saleTranStage.Mar_Budget_Gross_Sales__c != null ? saleTranStage.Mar_Budget_Gross_Sales__c : '';
            String MarBudgetNetSales = saleTranStage.Mar_Budget_Net_Sales__c != null ? saleTranStage.Mar_Budget_Net_Sales__c : '';
            String AprQty = saleTranStage.Apr_Qty__c != null ? saleTranStage.Apr_Qty__c : '';
            String AprBudgetValue = saleTranStage.Apr_Budget_Gross_Sales__c != null ? saleTranStage.Apr_Budget_Gross_Sales__c : '';
            String AprBudgetNetSales = saleTranStage.Apr_Budget_Net_Sales__c != null ? saleTranStage.Apr_Budget_Net_Sales__c : '';
            String MayQty = saleTranStage.May_Qty__c != null ? saleTranStage.May_Qty__c : '';
            String MayBudgetValue = saleTranStage.May_Budget_Gross_Sales__c != null ? saleTranStage.May_Budget_Gross_Sales__c : '';
            String MayBudgetNetSales = saleTranStage.May_Budget_Net_Sales__c != null ? saleTranStage.May_Budget_Net_Sales__c : '';
            String JunQty = saleTranStage.Jun_Qty__c != null ? saleTranStage.Jun_Qty__c : '';
            String JunBudgetValue = saleTranStage.Jun_Budget_Gross_Sales__c != null ? saleTranStage.Jun_Budget_Gross_Sales__c : '';
            String JunBudgetNetSales = saleTranStage.Jun_Budget_Net_Sales__c != null ? saleTranStage.Jun_Budget_Net_Sales__c : '';
            String JulQty = saleTranStage.Jul_Qty__c != null ? saleTranStage.Jul_Qty__c : '';
            String JulBudgetValue = saleTranStage.Jul_Budget_Gross_Sales__c != null ? saleTranStage.Jul_Budget_Gross_Sales__c : '';
            String JulBudgetNetSales = saleTranStage.Jul_Budget_Net_Sales__c != null ? saleTranStage.Jul_Budget_Net_Sales__c : '';
            String AugQty = saleTranStage.Aug_Qty__c != null ? saleTranStage.Aug_Qty__c : '';
            String AugBudgetValue = saleTranStage.Aug_Budget_Gross_Sales__c != null ? saleTranStage.Aug_Budget_Gross_Sales__c : '';
            String AugBudgetNetSales = saleTranStage.Aug_Budget_Net_Sales__c != null ? saleTranStage.Aug_Budget_Net_Sales__c : '';
            String SepQty = saleTranStage.Sep_Qty__c != null ? saleTranStage.Sep_Qty__c : '';
            String SepBudgetValue = saleTranStage.Sep_Budget_Gross_Sales__c != null ? saleTranStage.Sep_Budget_Gross_Sales__c : '';
            String SepBudgetNetSales = saleTranStage.Sep_Budget_Net_Sales__c != null ? saleTranStage.Sep_Budget_Net_Sales__c : '';
            String OctQty = saleTranStage.Oct_Qty__c != null ? saleTranStage.Oct_Qty__c : '';
            String OctBudgetValue = saleTranStage.Oct_Budget_Gross_Sales__c != null ? saleTranStage.Oct_Budget_Gross_Sales__c : '';
            String OctBudgetNetSales = saleTranStage.Oct_Budget_Net_Sales__c != null ? saleTranStage.Oct_Budget_Net_Sales__c : '';
            String NovQty = saleTranStage.Nov_Qty__c != null ? saleTranStage.Nov_Qty__c : '';
            String NovBudgetValue = saleTranStage.Nov_Budget_Gross_Sales__c != null ? saleTranStage.Nov_Budget_Gross_Sales__c : '';
            String NovBudgetNetSales = saleTranStage.Nov_Budget_Net_Sales__c != null ? saleTranStage.Nov_Budget_Net_Sales__c : '';
            String DecQty = saleTranStage.Dec_Qty__c != null ? saleTranStage.Dec_Qty__c : '';
            String DecBudgetValue = saleTranStage.Dec_Budget_Gross_Sales__c != null ? saleTranStage.Dec_Budget_Gross_Sales__c : ''; 
            String DecBudgetNetSales = saleTranStage.Dec_Budget_Net_Sales__c != null ? saleTranStage.Dec_Budget_Net_Sales__c : '';
             String BatchNo = saleTranStage.Batch_No__c != null ? saleTranStage.Batch_No__c : ''; 
           String rowStr = '"'+ MainettiCompany + '","' + year + '","' + Period + '","' + BusinessVertical + '","' + SubCategory + '","' + Retailer + '","' + source + '","' + LocalCurrency + '","' + ExRatetoUSD + '","' + ExRateToEUR + '","' +JanQty + '","' + JanBudgetValue + '","' + JanBudgetNetSales + '","' + FebQty + '","' + FebBudgetValue + '","'+ FebBudgetNetSales + '","' + MarQty+'","' + MarBudgetValue + '","' + MarBudgetNetSales + '","' + AprQty + '","' + AprBudgetValue + '","' + AprBudgetNetSales + '","' + MayQty + '","' +  MayBudgetValue + '","' + MayBudgetNetSales + '","' + JunQty + '","'  + JunBudgetValue + '","' + JunBudgetNetSales + '","' + JulQty  + '","' + JulBudgetValue  + '","' + JulBudgetNetSales + '","' + AugQty  + '","' + AugBudgetValue  + '","' + AugBudgetNetSales + '","' + SepQty + '","' + SepBudgetValue + '","' + SepBudgetNetSales + '","' + OctQty + '","' + OctBudgetValue + '","' + OctBudgetNetSales + '","' + NovQty + '","' + NovBudgetValue + '","' + NovBudgetNetSales + '","' + DecQty + '","' + DecBudgetValue + '","' + DecBudgetNetSales + '","' + BatchNo+'"';
            
            csvRowValues.add(rowStr); 
        }
        return csvRowValues;
    }    
    
      global List<String>  generateConvertedCSVRow(List<Data_Upload_Sales__c> salesTransStageForCSV, String batchId,String fileDelimiter){
        List<String> csvRowValues = new List<String>();       
        for(Data_Upload_Sales__c saleTranStage : salesTransStageForCSV){
            
                       decimal exrateusd = saleTranStage.ExRate_to_USD__c;
            decimal exrateeur = saleTranStage.ExRate_to_EUR__c;
            decimal unitsol = saleTranStage.Unit_Sold__c;
            decimal stc = saleTranStage.Sales_Transaction_Currency__c;
            decimal saleseurr = saleTranStage.Sales_EUR__c;
            decimal salesusdd = saleTranStage.Sales_USD__c;
             decimal netBudgetSales = saleTranStage.Budget_Net_Sales_Local__c;
            decimal netBudgetSaleseurr = saleTranStage.Budget_Net_Sales_EUR__c;
            decimal netBudgetSalesusdd = saleTranStage.Budget_Net_Sales_USD__c;
            
            string exrateusdstring = string.valueOf(exrateusd);
            string exrateeurstring = string.valueOf(exrateeur);
            string unitsolstring = string.valueOf(unitsol);
            string stcstring = string.valueOf(stc);
            string saleseurrstring = string.valueOf(saleseurr);
            string salesusddstring = string.valueOf(salesusdd);
             string netBudgetSalesString = string.valueOf(netBudgetSales);
            string netBudgetSalesEurrString = string.valueOf(netBudgetSaleseurr);
            string netBudgetSalesUsddString = string.valueOf(netBudgetSalesusdd);
            
            
            
            
            String company = saleTranStage.Sales_Data_Company__c != null ? saleTranStage.Sales_Data_Company__c : '';
            String year = saleTranStage.Year__c != null ? saleTranStage.Year__c : '';
            String period = saleTranStage.Budget_Period__c != null ? saleTranStage.Budget_Period__c : '';
            String category = saleTranStage.Category__c != null ? saleTranStage.Category__c : '';
            String subcategory = saleTranStage.Sub_Category__c != null ? saleTranStage.Sub_Category__c : '';
            String Source = saleTranStage.Source__c != null ? saleTranStage.Source__c : '';
            String vendor = saleTranStage.Vendor__c != null ? saleTranStage.Vendor__c : '';
            String segment = saleTranStage.Segment__c != null ? saleTranStage.Segment__c : '';
            String transactioncurrency = saleTranStage.Transaction_Currency__c != null ? saleTranStage.Transaction_Currency__c : '';
            String month = saleTranStage.Month__c != null ? saleTranStage.Month__c : '';
            String exratetousd = exrateusdstring != null ? exrateusdstring : '';
            String exratetoeur = exrateeurstring != null ? exrateeurstring : '';
            String unitsold = unitsolstring != null ? unitsolstring : '';
            String salestransactioncurrency = stcstring != null ? stcstring : '';
            String saleseur = saleseurrstring != null ? saleseurrstring : '';
            String salesusd = salesusddstring != null ? salesusddstring : '';
             String netBudgetSalesLocal = netBudgetSalesString != null ? netBudgetSalesString : '';
            String netBudgetSaleseur = netBudgetSalesEurrString != null ? netBudgetSalesEurrString : '';
            String netBudgetSalesusd = netBudgetSalesUsddString != null ? netBudgetSalesUsddString : '';
             String BatchNo = saleTranStage.dummybatchno__c != null ? saleTranStage.dummybatchno__c : '';
            system.debug('BatchNo::::'+BatchNo);
            String productCategory = saleTranStage.Sub_CategoryGroup__c != null ? saleTranStage.Sub_CategoryGroup__c : '';
            
            
           //String rowStr = '"'+ company + '","' + year + '","' + period + '","' + category + '","' + productCategory + '","' + subcategory + '","' + Source + '","' + vendor + '","' + segment + '","' + transactioncurrency + '","' + month + '","' + exratetousd + '","' +exratetoeur + '","' + unitsold + '","' + salestransactioncurrency + '","' + saleseur + '","'+salesusd+'","'+netBudgetSalesLocal+'","'+netBudgetSaleseur+'","'+netBudgetSalesusd+'","'+BatchNo+'"';
             String rowStr = '"'+ company + '","' + year + '","' + period + '","' + category + '","' + productCategory + '","' + subcategory + '","' + Source + '","' + vendor + '","' + segment + '","' + transactioncurrency + '","' + month + '","' + exratetousd + '","' +exratetoeur + '","' + unitsold + '","' + salestransactioncurrency + '","' + salesusd + '","'+saleseur+'","'+netBudgetSalesLocal+'","'+netBudgetSaleseur+'","'+netBudgetSalesusd+'","'+BatchNo+'"';
            
            
            
            csvRowValues.add(rowStr); 
        }
        system.debug('csvRowValues ::'+csvRowValues);
        return csvRowValues;
    } 
    
       public List<Data_Upload_Sales__c> getDataUploadList(List<Budget_Transaction_Stage__c> transferRecords){
        List<Data_Upload_Sales__c> insertRecord = new List<Data_Upload_Sales__c>();
        if(transferRecords.size() > 0){   
            //  List<Data_Upload_Sales__c> datauploadList = new List<Data_Upload_Sales__c>();
            for(Budget_Transaction_Stage__c trans: transferRecords){
                //int i;
                for (Integer i = 0; i < 12; i++){
                    String monthString = getmonthString(i);
                    String monthQtyFieldName = monthString + '_Qty__c';
                    String monthBudgetValFieldName = monthString + '_Budget_Gross_Sales__c';
                    String monthEURFieldName = monthString + '_Budget_Gross_Sales_EUR__c';
                    String monthUSDFieldName = monthString + '_Budget_Gross_Sales_USD__c';
                     String monthBudgetNetValFieldName = monthString + '_Budget_Net_Sales__c';
                    String monthNetSalesEURFieldName = monthString + '_Budget_Net_Sales_EUR__c';
                    String monthNetSalusUSDFieldName = monthString + '_Budget_Net_Sales_USD__c';
                    
                    Data_Upload_Sales__c salesTransMast = new Data_Upload_Sales__c();
                    salesTransMast.Upload_Batch_No__c = trans.Upload_Batch_No__c;
                    salesTransMast.Sales_Data_Company__c = trans.Mainetti_Company__c;
                    salesTransMast.Year__c = trans.Year__c;
                    salesTransMast.Source__c = trans.Source__c;
                    salesTransMast.Category__c = trans.Business_Vertical__c;
                    salesTransMast.Sub_Category__c = trans.SubCategory__c;
                    salesTransMast.Segment__c = trans.Market__c;
                    salesTransMast.ExRate_to_EUR__c = decimal.valueOf(trans.ExRate_to_EUR__c);
                    salesTransMast.ExRate_to_USD__c = decimal.valueOf(trans.ExRate_to_USD__c);
                    salesTransMast.Month__c = monthString;
                    string mqfn = string.valueof(trans.get(monthQtyFieldName));
                    salesTransMast.Unit_Sold__c = decimal.valueOf(mqfn);
                    string mefn = string.valueof(trans.get(monthEURFieldName));
                    salesTransMast.Sales_EUR__c = decimal.valueOf(mefn);
                    string mufn = string.valueof(trans.get(monthUSDFieldName));
                    salesTransMast.Sales_USD__c = decimal.valueOf(mufn);
                    string mbfn = string.valueof(trans.get(monthBudgetValFieldName));
                    salesTransMast.Sales_Transaction_Currency__c = decimal.valueOf(mbfn);
                    salesTransMast.Budget_Period__c = trans.Period__c;
                    salesTransMast.Vendor__c = trans.Retailer__c;
                    salesTransMast.Transaction_Currency__c = trans.Local_Currency__c;               
                   // salesTransMast.OwnerId = trans.CreatedById;
                    salesTransMast.Type__c = 'Budget';
                     string mbnf = string.valueof(trans.get(monthBudgetNetValFieldName));
                     string mnsuf = string.valueof(trans.get(monthNetSalesEURFieldName));
                     string mnsef = string.valueof(trans.get(monthNetSalusUSDFieldName));
                    salesTransMast.Budget_Net_Sales_Local__c = decimal.valueOf(mbnf);
                    salesTransMast.Budget_Net_Sales_USD__c = decimal.valueOf(mnsuf);
                    salesTransMast.Budget_Net_Sales_EUR__c = decimal.valueOf(mnsef);
                    salesTransMast.Sub_CategoryGroup__c = trans.ProductCategory__c;
                    salesTransMast.dummybatchno__c = trans.Batch_No__c;
                    insertRecord.add(salesTransMast);
                }
            }
        }
        return  insertRecord; 
    }
    
     public static String getmonthString(Integer ind){
        string monthname ;
        system.debug('monthname ::'+monthname);
        if(ind == 0){
            monthname = 'Jan';
            system.debug('monthname ::'+monthname);
        }
        if(ind == 1){
            monthname = 'Feb';
            system.debug('monthname ::'+monthname);
        }
        if(ind == 2){
            monthname = 'Mar';
            system.debug('monthname ::'+monthname);
        }
        if(ind == 3){
            monthname = 'Apr';
        }
        if(ind == 4){
            monthname = 'May';
        }
        if(ind == 5){
            monthname = 'Jun';
        }
        if(ind == 6){
            monthname = 'Jul';
        }
        if(ind == 7){
            monthname = 'Aug';
        }
        if(ind == 8){
            monthname = 'Sep';
        }
        if(ind == 9){
            monthname = 'Oct';
        }
        if(ind == 10){
            monthname = 'Nov';
        }
        if(ind == 11){
            monthname = 'Dec';
        }
        return monthname;
    }
    
    
}