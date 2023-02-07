public with sharing class uploadSales {
    
    
    @AuraEnabled
    public static Integer dataSubmitted(string companyArray, string selmonth, string selyear)
    {
        List<string> companyList = companyArray.split(',');
        Set<String> companyName = new Set<String>(); 
        for (string valFormt : companyList){
            if(string.isNotBlank(valFormt)){
                companyName.add(valFormt);
               // system.debug('companyList'+companyList);
               // system.debug('companyName'+companyName);
            }
        }     
        List<Data_Upload_Sales__c> fetchData = new List<Data_Upload_Sales__c> ();
       // system.debug('fetchData'+fetchData);
        Integer fetchdataSize = fetchData.size();
        return fetchdataSize;        
    }
    
    
    
    //get Inventory Transcation Master Record Status Picklist Values
    @AuraEnabled 
    public static Map<String, String> getRecordStatus(){
        Map<String, String> options = new Map<String, String>();
        Schema.DescribeFieldResult fieldResult = Inventory_Transaction_Master__c.Record_Type__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            //Put Picklist Value & Label in Map
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }    
    //get Inventory Transcation Master Batch Status Picklist Values
    @AuraEnabled 
    public static Map<String, String> getBatchStatus(){
        Map<String, String> options = new Map<String, String>();
        Schema.DescribeFieldResult fieldResult = Inventory_Transaction_Master__c.Batch_Status__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            //Put Picklist Value & Label in Map
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
    
    @AuraEnabled 
    public static Map<String, String> getMainettiMap(){
        getSalesMasterData mainettiMap = new getSalesMasterData();
        return mainettiMap.getManitteCompanyPicklistMap();
    }    
    @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getDateandTypeRecords(date fromDate, date toDate, string recordStatus, string batchStatus, string mainettiCmp){
        recordStatus = 'Sales';
        string searchQuery = 'select Id, Batch_No__c, Batch_Status__c, File_Uploaded_By__c, Record_Type__c,Azure_File_Link__c,Mainetti_Company__c,Total_Row_Count__c,Uploaded_Total_Stock_In_Qty__c,company_week__c,Batch_Process__c,CreatedDate from Inventory_Transaction_Master__c';
        if(!String.isBlank(string.valueOf(fromDate)) || !String.isBlank(string.valueOf(toDate))||!String.isBlank(recordStatus)||!String.isBlank(batchStatus)||!String.isBlank(mainettiCmp)){
            searchQuery += ' where ';
        }        
        boolean dateFieldFrmPresent = false;
        boolean dateFieldToPresent = false;
        boolean recordStatusPresent = false;
        boolean batchStatusPresent = false;
        if(!String.isBlank(string.valueOf(fromDate)) || !String.isBlank(string.valueOf(toDate))){
            if(!String.isBlank(string.valueOf(fromDate)) && !String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:fromDate AND DAY_ONLY(CreatedDate) <=:toDate';       
                dateFieldFrmPresent = true; 
                dateFieldToPresent = true;
            }
            if(!String.isBlank(string.valueOf(fromDate)) && String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:fromDate';
                dateFieldFrmPresent = true;
            }
            if(String.isBlank(string.valueOf(fromDate)) && !String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:toDate';
                dateFieldToPresent = true;
            }            
        }
        if(!String.isBlank(recordStatus)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true){
                searchQuery += ' AND Record_Type__c=:recordStatus';
            }else{
                searchQuery += ' Record_Type__c=:recordStatus';
            }
            recordStatusPresent = true;
        }
        if(!String.isBlank(batchStatus)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true || recordStatusPresent==true ){
                if(batchStatus == '1 - Migration Success'){
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' AND Batch_Status__c=:batchStatus';
                }
                else{
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' AND Batch_Status__c!=:batchStatus'; 
                }            	
            }else{                
                if(batchStatus == '1 - Migration Success'){
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' Batch_Status__c=:batchStatus';
                }
                else{
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' Batch_Status__c!=:batchStatus';
                } 
            }
            batchStatusPresent = true;
        }
        if(!String.isBlank(mainettiCmp)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true || recordStatusPresent==true || batchStatusPresent==true){
                searchQuery += ' AND Mainetti_Company__c=:mainettiCmp';
            }else{
                searchQuery += ' Mainetti_Company__c=:mainettiCmp';
            }
        }
        searchQuery += ' order by CreatedDate';
        List<Inventory_Transaction_Master__c> fetchdata= Database.query(searchQuery);     
        return fetchdata;
    }
    
    @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getSalesSearchRecords(date fromDate, date toDate, string recordStatus, string batchStatus, string batchNo, string selCompany){
       // system.debug(fromDate);
        recordStatus = 'Sales';
        string searchQuery = 'select Id,upload_file_name__c,Upload_Converted_File_Name__c, Reprocessing__c,Batch_No__c, Batch_Status__c, File_Uploaded_By__c, Record_Type__c,Azure_File_Link__c,Mainetti_Company__c,Total_Row_Count__c,Uploaded_Total_Stock_In_Qty__c,company_week__c,Batch_Process__c,CreatedDate,Sales_Company__c,Sales_Month__c,Sales_Year__c,Sales_Market__c,Void__c,Void_Reason__c from Inventory_Transaction_Master__c'; 
        
        if(!String.isBlank(string.valueOf(fromDate)) || !String.isBlank(string.valueOf(toDate))||!String.isBlank(recordStatus)||!String.isBlank(batchStatus)||!String.isBlank(batchNo) || !String.isBlank(selCompany)){
            searchQuery += ' where ';
        }        
        boolean dateFieldFrmPresent = false;
        boolean dateFieldToPresent = false;
        boolean recordStatusPresent = false;
        boolean batchStatusPresent = false;
        boolean selectedCompanyPresent = false;
      //  system.debug('selCompany:::'+selCompany);
        if(!String.isBlank(string.valueOf(fromDate)) || !String.isBlank(string.valueOf(toDate))){
            if(!String.isBlank(string.valueOf(fromDate)) && !String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:fromDate AND DAY_ONLY(CreatedDate) <=:toDate';       
                dateFieldFrmPresent = true; 
                dateFieldToPresent = true;
            }
            if(!String.isBlank(string.valueOf(fromDate)) && String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:fromDate';
                dateFieldFrmPresent = true;
            }
            if(String.isBlank(string.valueOf(fromDate)) && !String.isBlank(string.valueOf(toDate))){
                searchQuery += ' DAY_ONLY(CreatedDate) >=:toDate';
                dateFieldToPresent = true;
            }            
        }
        if(!String.isBlank(recordStatus)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true){
                searchQuery += ' AND Record_Type__c=:recordStatus';
            }else{
                searchQuery += ' Record_Type__c=:recordStatus';
            }
            recordStatusPresent = true;
        }
        if(!String.isBlank(batchStatus)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true || recordStatusPresent==true ){
                if(batchStatus == '1 - Migration Success'){
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' AND Batch_Status__c=:batchStatus';
                }
                else{
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' AND Batch_Status__c!=:batchStatus';
                }            	
            }else{                
                if(batchStatus == '1 - Migration Success'){
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' Batch_Status__c=:batchStatus';
                }
                else{
                    batchStatus = '8 - Migration Success';
                    searchQuery += ' Batch_Status__c!=:batchStatus';
                } 
            }
            batchStatusPresent = true;
        }
        if(!String.isBlank(selCompany)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true || recordStatusPresent==true || batchStatusPresent==true){
                searchQuery += ' AND Sales_Company__c=:selCompany';
            }else{
                searchQuery += ' Sales_Company__c=:selCompany';
            }   
            selectedCompanyPresent = true;
        }
        if(!String.isBlank(batchNo)){
            if(dateFieldFrmPresent==true || dateFieldToPresent==true || recordStatusPresent==true || batchStatusPresent==true ||selectedCompanyPresent == true ){
                searchQuery += ' AND Batch_No__c=:batchNo';
            }else{
                searchQuery += ' Batch_No__c=:batchNo';
            }
        }
        
        searchQuery += ' order by CreatedDate desc LIMIT 50';
        List<Inventory_Transaction_Master__c> fetchdata= Database.query(searchQuery);      
        return fetchdata;
    }
    
    @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getCompanyWeekData(string batchid){
        List<Inventory_Transaction_Master__c> companyWeekData;
        if(
            Inventory_Transaction_Master__c.SObjectType.getDescribe().isAccessible()
        ) {
            companyWeekData=[Select company_week__c from Inventory_Transaction_Master__c where Id=:batchid];
        }
        return companyWeekData;
    } 
    
    
    @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getSalesData(){
        string searchQuery = 'select Id, upload_file_name__c,Upload_Converted_File_Name__c, Batch_No__c, Reprocessing__c,Batch_Status__c, File_Uploaded_By__c, Record_Type__c,Azure_File_Link__c,Mainetti_Company__c,Total_Row_Count__c,Uploaded_Total_Stock_In_Qty__c,company_week__c,Sales_Company__c,Sales_Month__c,Sales_Market__c,Sales_Year__c,Batch_Process__c,CreatedDate,Void__c,Void_Reason__c from Inventory_Transaction_Master__c'; 
        
        string itsSales = 'Sales';
        searchQuery += ' where Record_Type__c =: itsSales';
        //searchQuery += ' order by CreatedDate desc LIMIT 80';
        searchQuery += ' order by LASTMODIFIEDDATE desc LIMIT 80'; //edited by tony from CreatedDate To LASTMODIFIEDDATE 20220518
        List<Inventory_Transaction_Master__c> fetchdata= Database.query(searchQuery);
        return fetchdata;
    }  
    
    @AuraEnabled
    public static List<integer> getPreviousYear() {
        List<integer> prevYear = new List<integer>();
        Integer currentYear = System.Today().year();
        prevYear.add(currentYear);
        prevYear.add(currentYear-1);
        return prevYear;        
    }    
    @AuraEnabled
    public static boolean createDocument(string csv, string batchNo,String fileName,String contVerTitle) { 
        boolean createStatus = new getSalesMasterData().createDocument(batchNo,csv,fileName,contVerTitle);
        return createStatus;
    }    
    
    public class ApplicationException extends Exception {}
    
    
    public static Integer getSalesRecordCount(string batchid){
        
        AggregateResult[] fetchErrordata;
        if(
            Sales_Transaction_Stage__c.SObjectType.getDescribe().isAccessible()
        ) {
            fetchErrordata=[Select Count(Id) recordCount from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId];
        }
        Integer recCount = 0;
        if(!fetchErrordata.isEmpty()){
            for (AggregateResult salesErrCnt : fetchErrordata){
                recCount = Integer.valueOf(salesErrCnt.get('recordCount'));
            }
        }
        return recCount;
    }
    //Get error details of Sales_Transaction_Stage__c.
    @AuraEnabled
    public static List<Sales_Transaction_Stage__c> getSalesErrorData(string batchid){
        List <Sales_Transaction_Stage__c> fetchFamily= new List<Sales_Transaction_Stage__c>();
        Map<string,string> familyMap = new Map<string,string>(); 
        List<Sales_Transaction_Stage__c> fetchErrordata=[Select unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Week_FB__c,Year_FB__c,Source_FB__c,Month_FB__c,Unit_Sold_FB__c,Local_Net_Unit_Pirce_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_USD_FB__c,ExRate_to_EUR_FB__c,Calculation_Failed__c,Label__c,Remark__c,Royalty_Rate__c,End_user__c,Printed_Logo__c,Customer_local_name__c,Net_Unit_Price_100__c,Local_Net_Unit_Pirce_100__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c,
                                                         Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c,
                                                         Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,
                                                         Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c,
                                                         Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c,
                                                         Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c,
                                                         Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c,
                                                         Color__c,Color_FB__c,Color_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c,ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c,
                                                         Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,
                                                         Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,
                                                         Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,wrong_date__c,
                                                         Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Label_FB__c,Net_Unit_Price_100_NF__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId];
        
        
        Integer fetchErrordataSize = fetchErrordata.size();
        return fetchErrordata;
    }
    
    @AuraEnabled
    public static boolean recStatusUpsertForSales(string batchid){
        boolean status = true;
        
        Inventory_Transaction_Master__c updateMasterCompany = new Inventory_Transaction_Master__c();
        updateMasterCompany.company_week__c = '';
        updateMasterCompany.Batch_Status__c='4 - Data Validation Successful';   
        updateMasterCompany.Id = batchId;
        if(Inventory_Transaction_Master__c.SObjectType.getDescribe().isUpdateable()){
            update updateMasterCompany;
        }
        //Inventory_Transaction_Master__c query = [select Sales_Month__c,Sales_Year__c,Sales_Company__c from Inventory_Transaction_Master__c where Id =: batchId ];
        string userEmail = UserInfo.getUserEmail();
        //   Database.executeBatch(new salesSuccessData(batchId,userEmail),2000);
        return status;        
    }    
    //Get success details of Sales_Transaction_Stage__c.
    @AuraEnabled
    public static List<Sales_Transaction_Stage__c> getSalesSuccessData(string batchid,Integer pageNumber,Integer recordToFetch){
        Integer offSet = ((pageNumber - 1) * recordToFetch); 
        List<Sales_Transaction_Stage__c> fetchSuccessdata=[Select unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Week_FB__c,Year_FB__c,Source_FB__c,Month_FB__c,Unit_Sold_FB__c,Local_Net_Unit_Pirce_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_USD_FB__c,ExRate_to_EUR_FB__c,Calculation_Failed__c,Remark__c,Label__c,End_user__c,Royalty_Rate__c,Printed_Logo__c,Customer_local_name__c,Net_Unit_Price_100__c,Local_Net_Unit_Pirce_100__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c,
                                                           Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c,
                                                           Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,
                                                           Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c,
                                                           Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c,
                                                           Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c,
                                                           Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c,
                                                           
                                                           Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c,
                                                           ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c,
                                                           Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,
                                                           Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,
                                                           Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,wrong_date__c,
                                                           Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Label_FB__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c from Sales_Transaction_Stage__c where Upload_Batch_No__c=:BatchId and Record_Status__c ='2 - Data Validation Successful' LIMIT :recordToFetch  OFFSET :offSet ];
        Integer fetchSuccessdataSize = fetchSuccessdata.size();        
        return fetchSuccessdata;
    }
    
    
    //insert stage records into Sales_Transaction_Stage__c
    public static boolean insertSalesStageChunk(string jsonin, string batchNo){        
        boolean insertStatus = true;        
        double rowNo;
        List<Sales_Transaction_Stage__c> deserializedSales = (List<Sales_Transaction_Stage__c>) System.JSON.deserialize(jsonin, List<Sales_Transaction_Stage__c>.class);
      //  system.debug('deserializedSales::::'+deserializedSales);
        List<Sales_Transaction_Stage__c> transbatchid = new  List<Sales_Transaction_Stage__c>();
        List<Sales_Transaction_Stage__c> transErrorRow = new  List<Sales_Transaction_Stage__c>();
        
        Integer totalCount = [SELECT  COUNT() FROM Sales_Transaction_Stage__c where Upload_Batch_No__c =: batchNo];
        rowNo = (totalCount+1);
      //  system.debug(rowNo);
        double firstRowCount = 1;
        double count = 1;
        if(deserializedSales.size() >0){
          //  system.debug('deserializedSales.size()'+deserializedSales.size());
            double inputFileRowCount = deserializedSales.size(); 
           // system.debug(inputFileRowCount);
            for(Sales_Transaction_Stage__c trans: deserializedSales){
              //  system.debug(trans.Customer__c);
                boolean isInserted = false;
                boolean isInsertedCal = false; 
                //Added By SUSHIL starts 17-09-22 (Trim the CSV file Customer,Local Name &Ship to Factory field to 100 character)
                if(string.isNotBlank(trans.Customer__c)){
                    String trimCustomer = trans.Customer__c;
                  //  system.debug('trimCustomer>>'+trimCustomer.length());
                    Integer maxSize = 100;
                    if(trimCustomer.length() > maxSize ){
                        trimCustomer = trimCustomer.substring(0, maxSize);
                        trans.Customer__c=trimCustomer;
                        //system.debug(' trans.trimCustomer>>>'+ trans.Customer__c);
                       // system.debug(' trans.trimCustomerAfterTrim>>>'+ trimCustomer.length());
                    }
                }
                if(string.isNotBlank(trans.Customer_local_name__c)){
                    String trimCustomLocalName = trans.Customer_local_name__c;
                   // system.debug('trimCustomLocalName>>'+trimCustomLocalName.length());
                    Integer maxSize = 100;
                    if(trimCustomLocalName.length() > maxSize ){
                        trimCustomLocalName = trimCustomLocalName.substring(0, maxSize);
                        trans.Customer_local_name__c=trimCustomLocalName;
                        //system.debug(' trans.Customer_local_name__c>>>'+ trans.Customer_local_name__c);
                        //system.debug(' trans.Customer_local_name__cafterTrim>>>'+ trimCustomLocalName.length());
                    }
                }
                if(string.isNotBlank(trans.Shipped_To_Factory__c)){
                    String trimShipToFactory = trans.Shipped_To_Factory__c;
                    //system.debug('trimShipToFactory>>'+trimShipToFactory.length());
                    Integer maxSize = 100;
                    if(trimShipToFactory.length() > maxSize ){
                        trimShipToFactory = trimShipToFactory.substring(0, maxSize);
                        trans.Shipped_To_Factory__c=trimShipToFactory;
                        //system.debug(' trans.Shipped_To_Factory__c>>>'+ trans.Shipped_To_Factory__c);
                       // system.debug(' trans.Shipped_To_Factory__cafterTrim>>>'+ trimShipToFactory.length());
                    }
                }
                //Added By SUSHIL Ends
                
               // system.debug('trans::::'+trans);
                if((inputFileRowCount)== rowNo){
                   // system.debug((inputFileRowCount)== rowNo);
                    /*  if(count == 9999)
{
// system.debug('count'+count);
}   

if( string.isBlank(trans.Company__c) && string.isBlank(trans.Year__c) && string.isBlank(trans.Month__c) 
&& string.isBlank(trans.Week__c) && string.isBlank(trans.Item_code__c) && string.isBlank(trans.Material__c)
&& string.isBlank(trans.Source__c) && string.isBlank(trans.Model__c) && string.isBlank(trans.Printed_Logo__c) 
&& string.isBlank(trans.Color__c) && string.isBlank(trans.Customer__c) && string.isBlank(trans.Customer_local_name__c)
&& string.isBlank(trans.Mainetti_Brand__c) && string.isBlank(trans.Category__c) 
&& string.isBlank(trans.Sub_Category__c) && string.isBlank(trans.Family__c) && string.isBlank(trans.Order_Type__c)
&& string.isBlank(trans.Unit_Sold__c) && string.isBlank(trans.Unit_Price_100_EUR__c) && string.isBlank(trans.Unit_Price_100_USD__c)
&& string.isBlank(trans.Net_Unit_Price_100__c) && string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
&& string.isBlank(trans.Transaction_Currency__c) && string.isBlank(trans.ExRate_to_EUR__c) && string.isBlank(trans.ExRate_to_USD__c) 
&& string.isBlank(trans.Local_Net_Unit_Pirce_100__c) && string.isBlank(trans.Sales_Transaction_Currency__c)
&& string.isBlank(trans.Shipped_To_Factory__c) && string.isBlank(trans.Shipped_To_Country__c)
&& string.isBlank(trans.Label__c) && string.isBlank(trans.End_user__c) && string.isBlank(trans.Vendor__c) 
&& string.isBlank(trans.Division__c) && string.isBlank(trans.Retailer_Brand__c) && string.isBlank(trans.Royalty_Rate__c)
&& string.isBlank(trans.Market__c) && string.isBlank(trans.Production_Country__c) && string.isBlank(trans.Remark__c) 
&& string.isBlank(trans.Remarks__c)  && string.isBlank(trans.LOB__c)  && string.isBlank(trans.SO_Number__c)
&& string.isBlank(trans.Gross_Sales_USD__c) && string.isBlank(trans.Freight_Charge_USD__c )
&& string.isBlank(trans.Sales_Type__c ) && string.isBlank(trans.Standard_Unit_Cost_100_EUR__c )
&& string.isBlank(trans.Standard_Unit_Cost_100_USD__c) && string.isBlank(trans.Net_Unit_Price_100_EUR__c )  && string.isBlank(trans.Sales_Order_Date__c ) 
&& string.isBlank(trans.Sales_Order_Date__c )  && string.isBlank(trans.Gross_Unit_Price_100_Local_Currency__c ))
{

//   system.debug('1');
}*/
                    //  when the recors is in double couts Starting
                    if( string.isNotBlank(trans.Company__c) && string.isBlank(trans.Year__c) && string.isBlank(trans.Month__c) 
                       && string.isBlank(trans.Week__c) && string.isBlank(trans.Item_code__c) && string.isBlank(trans.Material__c)
                       && string.isBlank(trans.Source__c) && string.isBlank(trans.Model__c) && string.isBlank(trans.Printed_Logo__c) 
                       && string.isBlank(trans.Color__c) && string.isBlank(trans.Customer__c) && string.isBlank(trans.Customer_local_name__c)
                       && string.isBlank(trans.Mainetti_Brand__c) && string.isBlank(trans.Category__c) 
                       && string.isBlank(trans.Sub_Category__c) && string.isBlank(trans.Family__c) && string.isBlank(trans.Order_Type__c)
                       && string.isBlank(trans.Unit_Sold__c) && string.isBlank(trans.Net_Weight_KG_1000__c) && string.isBlank(trans.Unit_Price_100_EUR__c)  && string.isBlank(trans.Unit_Price_100_USD__c)
                       && string.isBlank(trans.Net_Unit_Price_100__c) && string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
                       && string.isBlank(trans.Transaction_Currency__c) && string.isBlank(trans.ExRate_to_EUR__c) && string.isBlank(trans.ExRate_to_USD__c) 
                       && string.isBlank(trans.Local_Net_Unit_Pirce_100__c) && string.isBlank(trans.Sales_Transaction_Currency__c)
                       && string.isBlank(trans.Shipped_To_Factory__c) && string.isBlank(trans.Shipped_To_Country__c)
                       && string.isBlank(trans.Label__c) && string.isBlank(trans.End_user__c) && string.isBlank(trans.Vendor__c) 
                       && string.isBlank(trans.Division__c) && string.isBlank(trans.Retailer_Brand__c) && string.isBlank(trans.Royalty_Rate__c)
                       && string.isBlank(trans.Market__c) && string.isBlank(trans.Production_Country__c) && string.isBlank(trans.Remark__c) 
                       && string.isBlank(trans.Remarks__c)  && string.isBlank(trans.LOB__c)  && string.isBlank(trans.SO_Number__c) && string.isBlank(trans.PO_Number__c)
                       && string.isBlank(trans.Gross_Sales_USD__c) && string.isBlank(trans.Freight_Charge_USD__c ) 
                       && string.isBlank(trans.Sales_Type__c ) && string.isBlank(trans.Standard_Unit_Cost_100_EUR__c )
                       && string.isBlank(trans.Standard_Unit_Cost_100_USD__c)&& string.isBlank(trans.Net_Unit_Price_100_EUR__c ) && string.isBlank(trans.Sales_Order_Date__c )  
                       && string.isBlank(trans.Sales_Order_Date__c )  && string.isBlank(trans.Gross_Unit_Price_100_Local_Currency__c ))
                    {
                       // system.debug('2');
                        string  remarks = 'Malformed Data';
                        STRING errorCode = 'ERR-0093,';                          
                        Sales_Transaction_Stage__c transerror = new Sales_Transaction_Stage__c();
                        transerror.Row_No__c = rowNo;
                        transerror.Upload_Batch_No__c = batchNo;
                        transerror.Transaction_Master_Id__c = batchNo;
                        transerror.Record_Status__c = '1 - Error In Data Validation';                 
                        transerror.Error_Code__c = errorCode;
                        transerror.Malformed_Data__c = true;                        
                        transErrorRow.add(transerror);
                        rowNo++;
                        isInserted = true;
                    }
                    //  when the recors is in double couts Ending
                    if( (trans.Unit_Sold__c == '0' && trans.Sales_EUR__c == '0' && trans.Sales_USD__c == '0' && trans.Sales_Transaction_Currency__c == '0') ||  (string.isBlank(trans.Unit_Sold__c) &&  string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
                                                                                                                                                                 && string.isBlank(trans.Sales_Transaction_Currency__c)) || (trans.Unit_Sold__c == '-' && trans.Sales_EUR__c == '-' && trans.Sales_USD__c == '-' && trans.Sales_Transaction_Currency__c == '-'))
                    {
                       // system.debug('3');
                    }else{
                       // system.debug('4');
                        trans.Row_No__c =rowNo;
                        trans.Upload_Batch_No__c = batchNo;
                        trans.Transaction_Master_Id__c = batchNo;
                        transbatchid.add(trans);
                        rowNo++;
                        //  system.debug('########Regular Insert 01'+rowNo);
                    }            
                }else{ 
                   // system.debug('5');
                    
                    
                    /*   if( string.isBlank(trans.Company__c) && string.isBlank(trans.Year__c) && string.isBlank(trans.Month__c) 
&& string.isBlank(trans.Week__c) && string.isBlank(trans.Item_code__c) && string.isBlank(trans.Material__c)
&& string.isBlank(trans.Source__c) && string.isBlank(trans.Model__c) && string.isBlank(trans.Printed_Logo__c) 
&& string.isBlank(trans.Color__c) && string.isBlank(trans.Customer__c) && string.isBlank(trans.Customer_local_name__c)
&& string.isBlank(trans.Mainetti_Brand__c) && string.isBlank(trans.Category__c) 
&& string.isBlank(trans.Sub_Category__c) && string.isBlank(trans.Family__c) && string.isBlank(trans.Order_Type__c)
&& string.isBlank(trans.Unit_Sold__c) && string.isBlank(trans.Unit_Price_100_EUR__c) && string.isBlank(trans.Unit_Price_100_USD__c)
&& string.isBlank(trans.Net_Unit_Price_100__c) && string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
&& string.isBlank(trans.Transaction_Currency__c) && string.isBlank(trans.ExRate_to_EUR__c) && string.isBlank(trans.ExRate_to_USD__c) 
&& string.isBlank(trans.Local_Net_Unit_Pirce_100__c) && string.isBlank(trans.Sales_Transaction_Currency__c)
&& string.isBlank(trans.Shipped_To_Factory__c) && string.isBlank(trans.Shipped_To_Country__c)
&& string.isBlank(trans.Label__c) && string.isBlank(trans.End_user__c) && string.isBlank(trans.Vendor__c) 
&& string.isBlank(trans.Division__c) && string.isBlank(trans.Retailer_Brand__c) && string.isBlank(trans.Royalty_Rate__c)
&& string.isBlank(trans.Market__c) && string.isBlank(trans.Production_Country__c) && string.isBlank(trans.Remark__c) 
&& string.isBlank(trans.Remarks__c)  && string.isBlank(trans.LOB__c)  && string.isBlank(trans.SO_Number__c)
&& string.isBlank(trans.Gross_Sales_USD__c) && string.isBlank(trans.Freight_Charge_USD__c) && string.isBlank(trans.Sales_Type__c ) 
&& string.isBlank(trans.Standard_Unit_Cost_100_EUR__c )&& string.isBlank(trans.Standard_Unit_Cost_100_USD__c	 ) 
&& string.isBlank(trans.Net_Unit_Price_100_EUR__c ) && string.isBlank(trans.Sales_Order_Date__c )  
&& string.isBlank(trans.Sales_Order_Date__c ) && string.isBlank(trans.Gross_Unit_Price_100_Local_Currency__c ))
{
// system.debug('6');
}*/
                    if( string.isNotBlank(trans.Company__c) && string.isBlank(trans.Year__c) && string.isBlank(trans.Month__c) 
                       && string.isBlank(trans.Week__c) && string.isBlank(trans.Item_code__c) && string.isBlank(trans.Material__c)
                       && string.isBlank(trans.Source__c) && string.isBlank(trans.Model__c) && string.isBlank(trans.Printed_Logo__c) 
                       && string.isBlank(trans.Color__c) && string.isBlank(trans.Customer__c) && string.isBlank(trans.Customer_local_name__c)
                       && string.isBlank(trans.Mainetti_Brand__c) && string.isBlank(trans.Category__c) 
                       && string.isBlank(trans.Sub_Category__c) && string.isBlank(trans.Family__c) && string.isBlank(trans.Order_Type__c)
                       && string.isBlank(trans.Unit_Sold__c) && string.isBlank(trans.Net_Weight_KG_1000__c) && string.isBlank(trans.Unit_Price_100_EUR__c) && string.isBlank(trans.Unit_Price_100_USD__c)
                       && string.isBlank(trans.Net_Unit_Price_100__c) && string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
                       && string.isBlank(trans.Transaction_Currency__c) && string.isBlank(trans.ExRate_to_EUR__c) && string.isBlank(trans.ExRate_to_USD__c) 
                       && string.isBlank(trans.Local_Net_Unit_Pirce_100__c) && string.isBlank(trans.Sales_Transaction_Currency__c)
                       && string.isBlank(trans.Shipped_To_Factory__c) && string.isBlank(trans.Shipped_To_Country__c)
                       && string.isBlank(trans.Label__c) && string.isBlank(trans.End_user__c) && string.isBlank(trans.Vendor__c) 
                       && string.isBlank(trans.Division__c) && string.isBlank(trans.Retailer_Brand__c) && string.isBlank(trans.Royalty_Rate__c)
                       && string.isBlank(trans.Market__c) && string.isBlank(trans.Production_Country__c) && string.isBlank(trans.Remark__c) 
                       && string.isBlank(trans.Remarks__c)  && string.isBlank(trans.LOB__c)  && string.isBlank(trans.SO_Number__c) && string.isBlank(trans.PO_Number__c)
                       && string.isBlank(trans.Gross_Sales_USD__c) && string.isBlank(trans.Freight_Charge_USD__c ) && string.isBlank(trans.Sales_Type__c )
                       && string.isBlank(trans.Standard_Unit_Cost_100_EUR__c )&& string.isBlank(trans.Standard_Unit_Cost_100_USD__c	 ) 
                       && string.isBlank(trans.Net_Unit_Price_100_EUR__c ) && string.isBlank(trans.Gross_Unit_Price_100_Local_Currency__c )
                       && string.isBlank(trans.Standard_Unit_Material_Cost_100_EUR__c )&& string.isBlank(trans.Standard_Unit_Material_Cost_100_USD__c))
                       
            
                    {
                      //  system.debug('7');
                        string  remarks = 'Malformed Data';
                        STRING errorCode = 'ERR-0093,';
                        Sales_Transaction_Stage__c transerror2 = new Sales_Transaction_Stage__c ();
                        transerror2.Row_No__c = rowNo;
                        transerror2.Error_Code__c = errorCode;
                        transerror2.Malformed_Data__c = true;
                        transerror2.Upload_Batch_No__c = batchNo;
                        transerror2.Transaction_Master_Id__c = batchNo;
                        transerror2.Record_Status__c = '1 - Error In Data Validation';           
                       // system.debug('2.Error_Code__c'+transerror2.Error_Code__c);    
                        transErrorRow.add(transerror2);
                        // system.debug('7:::rowNo Before Increment'+rowNo);
                        rowNo++;
                        isInsertedCal = true;
                       // system.debug('7:::rowNo'+rowNo);
                    }
                    if((trans.Unit_Sold__c == '0' && trans.Sales_EUR__c == '0' && trans.Sales_USD__c == '0' && trans.Sales_Transaction_Currency__c == '0') ||  (string.isBlank(trans.Unit_Sold__c) &&  string.isBlank(trans.Sales_EUR__c) && string.isBlank(trans.Sales_USD__c) 
                                                                                                                                                                && string.isBlank(trans.Sales_Transaction_Currency__c)) || (trans.Unit_Sold__c == '-' && trans.Sales_EUR__c == '-' && trans.Sales_USD__c == '-' && trans.Sales_Transaction_Currency__c == '-'))
                    {        
                       // system.debug('8');
                    }else{                        
                        trans.Row_No__c =rowNo;
                        trans.Upload_Batch_No__c = batchNo;
                        trans.Transaction_Master_Id__c = batchNo;
                        transbatchid.add(trans);                        
                        rowNo++;      
                      //  system.debug('########Regular Insert 2    '+rowNo);
                    }
                }
            }
        }
        
        try{
            // inserting error rows           
            if(transErrorRow.size()>0){
                if(Sales_Transaction_Stage__c.SObjectType.getDescribe().isCreateable()){ 
                    insert transErrorRow;
                }
            }
            if(transbatchid.size()>0){ 
                if(Sales_Transaction_Stage__c.SObjectType.getDescribe().isCreateable()){ 
                    insert transbatchid;
                }
            }else {
                insertStatus = false;
            }
        }catch(DMLException e){ 
           // system.debug('Error message during insertSalesRowChunk  ::::::'+e.getMessage());
            insertStatus = false;
        }
       // system.debug('insertStatus   ::::'+insertStatus);
        return insertStatus;      
    }
    //insert stage records into Sales_Transaction_Stage__c
    
    
    public boolean insertDataUploadSales(Inventory_Transaction_Master__c updateBatchStatus){
        boolean insertStatus = true;
        getSalesMasterData masterData = new getSalesMasterData();
        double totalRecordCount =  double.valueOf(uploadSales.getSalesRecordCount(updateBatchStatus.Id));
        double pageRecordToFetch = 9900;
        double totalPageCount = Math.ceil(totalRecordCount/ pageRecordToFetch );        
        if(totalPageCount==0){
            totalPageCount = 1;
        }
        Integer totalPages = Integer.valueOf(totalPageCount);
        Integer recordToFetch = Integer.valueOf(pageRecordToFetch);
        List<Sales_Transaction_Stage__c> transferRecords = new List<Sales_Transaction_Stage__c>();
        for(Integer pageNumber=1;pageNumber<=totalPages;pageNumber++){
            List<Sales_Transaction_Stage__c> subListTransferRecords =  getSalesSuccessData(updateBatchStatus.Id,pageNumber,recordToFetch);
            transferRecords.addAll(subListTransferRecords);
        }
        List<Data_Upload_Sales__c> insertRecord = new List<Data_Upload_Sales__c>();
        if(transferRecords.size() > 0){            
            updateBatchStatus.Batch_Status__c = '7 - Migration In Progress';
            update updateBatchStatus;
            for(Sales_Transaction_Stage__c trans: transferRecords){
                Data_Upload_Sales__c salesTransMast = new Data_Upload_Sales__c();
                salesTransMast.Upload_Batch_No__c = trans.Upload_Batch_No__c;
                salesTransMast.Sales_Data_Company__c = trans.Company__c;
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
                salesTransMast.Sub_Category__c = trans.Sub_Category__c;
                salesTransMast.Family__c = trans.Family__c;
                salesTransMast.Order_Type__c = trans.Order_Type__c;
                salesTransMast.Unit_Sold__c = decimal.valueOf(trans.Unit_Sold__c.replaceAll(',',''));
                salesTransMast.Net_Weight_KG_1000__c = decimal.valueOf(trans.Net_Weight_KG_1000__c);
                salesTransMast.Unit_Price_100_EUR__c = decimal.valueOf(trans.Unit_Price_100_EUR__c);
                salesTransMast.Unit_Price_100_USD__c = decimal.valueOf(trans.Unit_Price_100_USD__c);
                // salesTransMast.Net_Unit_Price_100__c = trans.Net_Unit_Price_100__c;
                salesTransMast.Sales_EUR__c = decimal.valueOf(trans.Sales_EUR__c);
                salesTransMast.Sales_USD__c = decimal.valueOf(trans.Sales_USD__c);
                salesTransMast.Transaction_Currency__c = trans.Transaction_Currency__c;
                salesTransMast.ExRate_to_EUR__c = decimal.valueOf(trans.ExRate_to_EUR__c);
                salesTransMast.ExRate_to_USD__c = decimal.valueOf(trans.ExRate_to_USD__c);
                salesTransMast.Local_Net_Unit_Pirce_100__c = decimal.valueOf(trans.Local_Net_Unit_Pirce_100__c.replaceAll('-','0'));
                salesTransMast.Sales_Transaction_Currency__c = decimal.valueOf(trans.Sales_Transaction_Currency__c.replaceAll(',',''));
                salesTransMast.Shipped_To_Factory__c = trans.Shipped_To_Factory__c; 
                salesTransMast.Shipped_To_Country__c = trans.Shipped_To_Country__c;
                salesTransMast.Label__c = trans.Label__c;
                salesTransMast.End_User__c = trans.End_User__c;
                salesTransMast.Vendor__c = trans.Vendor__c;
                salesTransMast.Division__c = trans.Division__c;
                salesTransMast.Retailer_Brand__c = trans.Retailer_Brand__c;
                salesTransMast.Royalty_Rate__c = trans.Royalty_Rate__c;
                salesTransMast.Market__c = trans.Market__c;
                salesTransMast.Remark__c = trans.Remark__c;
                salesTransMast.LOB__c = trans.LOB__c;
                salesTransMast.SO_Number__c = trans.SO_Number__c;
                salesTransMast.PO_Number__c = trans.PO_Number__c;
                salesTransMast.Production_Country__c = trans.Production_Country__c;
                salesTransMast.Gross_Sales_USD__c = decimal.valueOf(trans.Gross_Sales_USD__c);
                salesTransMast.Freight_Charge_USD__c = decimal.valueOf(trans.Freight_Charge_USD__c);
                if(trans.Unit_Sold__c != '0' && trans.Sales_EUR__c != '0' && trans.Sales_USD__c != '0'){
                    insertRecord.add(salesTransMast);
                }
            }
            if(insertRecord.size()>0){
                try{
                    //insert insertRecord;
                    splitInsertRecordListForUpload(insertRecord);
                    //delete transferRecords;
                    splitListForDelete(transferRecords);
                }catch(DMLException e){   
                    insertStatus = false;
                }
            }            
        }
        return insertStatus;
    }
    public void splitInsertRecordListForUpload(List<Data_Upload_Sales__c> insertRecord){        
        Integer totalRecCountForUpdate = insertRecord.size();
        Integer maxSizeForUpdate = 9900;
        List<Data_Upload_Sales__c> uploadTemp = new  List<Data_Upload_Sales__c>();
        if(totalRecCountForUpdate > maxSizeForUpdate){
            for(Integer i = 0 ; i < (totalRecCountForUpdate / maxSizeForUpdate)+1 ; i++){
                // List<Data_Upload_Sales__c> uploadTemp = new  List<Data_Upload_Sales__c>();
                for(Integer j=(i*maxSizeForUpdate);(j<(i*maxSizeForUpdate)+maxSizeForUpdate) && j<totalRecCountForUpdate ; j++){
                    uploadTemp.add(insertRecord.get(j));
                }
                
            }
            if(Data_Upload_Sales__c.SObjectType.getDescribe().isCreateable()){ 
                insert uploadTemp;
            }
        }else{
            if(Data_Upload_Sales__c.SObjectType.getDescribe().isCreateable()){
                insert insertRecord;
            }
        }
    }
    public void splitListForDelete(List<Sales_Transaction_Stage__c> transferRecords){        
        Integer totalRecCountForUpdate = transferRecords.size();
        Integer maxSizeForUpdate = 9900;
        //List<Sales_Transaction_Stage__c> demandTemp = new  List<Sales_Transaction_Stage__c>();
        if(totalRecCountForUpdate > maxSizeForUpdate){
            for(Integer i = 0 ; i < (totalRecCountForUpdate / maxSizeForUpdate)+1 ; i++){
                List<Sales_Transaction_Stage__c> demandTemp = new  List<Sales_Transaction_Stage__c>();
                for(Integer j=(i*maxSizeForUpdate);(j<(i*maxSizeForUpdate)+maxSizeForUpdate) && j<totalRecCountForUpdate ; j++){
                    demandTemp.add(transferRecords.get(j));
                }
                delete demandTemp; 
            }
            // if(Sales_Transaction_Stage__c.SObjectType.getDescribe().isDeleteable()){
            //delete demandTemp;
            //  }
        }else{
            //if(Sales_Transaction_Stage__c.SObjectType.getDescribe().isDeleteable()){
            delete transferRecords;
            // }
        }
    }
    @AuraEnabled
    public static boolean saveRecord(string recordType, string newValue,string oldValue,String batchId,String recordId,String errMap, String pickListToRemove,String companyName)
    {
        // boolean saveStatus = new processSalesData().updateTransStagNInsertErrorMapValues(recordType,oldValue,newValue,batchId,companyName,errMap,pickListToRemove);     
        boolean saveStatus = true;
        return saveStatus;
    }
    
    @AuraEnabled
    public static String proceedSalesData(string batchid){
        string returnString = 'false';        
        
        AggregateResult[] fetchWarningdata=[Select count(Id) recordCount from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId and Source_FB__c = false and Month_FB__c = false and  (warning_consolidate_key__c = true OR unit_sold_warning__c = true) and SO_Number_FB__c = false and SO_Number_NF__c= false and LOB_FB__c= false and LOB_NF__c= false and
                                            Company_FB__c= false and Customer_FB__c= false and Calculation_Failed__c= false and Transaction_Currency_FB__c= false and Transaction_Currency_NF__c= false and selected_ui_values__c = false and Freight_Charge_USD_FB__c = false and Freight_Charge_USD_NF__c = false and Gross_Sales_USD_FB__c = false and Gross_Sales_USD_NF__c = false and
                                            Division_FB__c= false and Division_NF__c= false and Mainetti_Brand_FB__c= false and Mainetti_Brand_NF__c= false and Item_code_FB__c= false and Item_code_NF__c= false and 
                                            Production_Country_FB__c= false and Production_Country_NF__c= false and Retailer_Brand_FB__c= false and Retailer_Brand_NF__c= false and
                                            Material_FB__c= false and Material_NF__c= false and Company_NF__c= false and Model_FB__c= false and Model_NF__c= false and Market_FB__c= false and Market_NF__c= false and Vendor_FB__c= false and Vendor_NF__c= false and
                                            Category_FB__c= false and Category_NF__c= false and Sub_Category_FB__c= false and Sub_Category_NF__c= false and Order_Type_FB__c= false and Order_Type_NF__c= false and
                                            Shipped_To_Country_FB__c= false and Shipped_To_Country_NF__c= false and Shipped_To_Factory_FB__c= false and Shipped_To_Factory_NF__c= false and
                                            Color_FB__c= false and Color_NF__c= false and Country_NF__c= false and SM_NF__c= false and ExRate_to_EUR_NF__c= false and
                                            ExRate_to_USD_NF__c= false and Local_Currency_NF__c= false and Local_Currency_FB__c= false and Month_NF__c= false and Retailer_Code_NF__c= false and
                                            SL_NF__c= false and Source_NF__c= false and US_NF__c= false and UOM_NF__c= false and Week_NF__c= false and Year_NF__c= false and
                                            Family_FB__c= false and Family_NF__c= false and STC_FB__c= false and STC_NF__c= false and Sales_EUR_FB__c= false and Sales_EUR_NF__c= false and
                                            Sales_USD_FB__c= false and Sales_USD_NF__c= false and Unit_Price_100_EUR_FB__c= false and Unit_Price_100_EUR_NF__c= false and wrong_date__c= false and
                                            Unit_Price_100_USD_FB__c= false and Unit_Price_100_USD_NF__c= false and Net_Unit_Price_100_FB__c = false and Local_Net_Unit_Pirce_FB__c = false and Local_Net_Unit_Pirce_NF__c = false and Unit_Sold_FB__c = false and Year_FB__c = false and Week_FB__c = false and Label_FB__c = false and Net_Weight_KG_1000_FB__c = false and Net_Weight_KG_1000_NF__c = false];
        Integer warningRecCount = 0;
        if(!fetchWarningdata.isEmpty()){
            for (AggregateResult  salesWarCnt : fetchWarningdata){
                warningRecCount = Integer.valueOf(salesWarCnt.get('recordCount'));
            }
        }
        
        boolean isCleanData = false;        
        Integer cleanDataSize =  isDataCleanRecordCount(batchid);
      //  system.debug('cleanDataSize::::'+cleanDataSize);
        Integer fullRecordsSize = getSalesRecordCount(batchid);
       // system.debug('fullRecordsSize::::'+fullRecordsSize);
        //If clean data and full record size is same then there are no errors.
        if(cleanDataSize == fullRecordsSize){
            isCleanData = true;
        }
        integer warningSize = warningRecCount;
        if(warningSize > 0){
            returnString = 'true';
        }
        List<Inventory_Transaction_Master__c> fetchCompanyweekData =[select company_week__c from Inventory_Transaction_Master__c where Id=:batchid];
        String companyValue = fetchCompanyweekData[0].company_week__c;
        if(String.isNotBlank(companyValue)){
            returnString += '#'+'true';
        }else{
            returnString += '#'+'false';
        }
        if(!isCleanData){
            returnString = 'false'+'#'+'false';
        }
        if(cleanDataSize == 0 && fullRecordsSize == 0 && warningSize == 0 && isCleanData && returnString == 'false#false'){
            returnString = '$';
        }
        return returnString;
    }
    @AuraEnabled   
    public static List<Sales_Transaction_Stage__c> isDataClean(string batchid){
        List<Sales_Transaction_Stage__c> fetchErrordata = new List<Sales_Transaction_Stage__c>();
        fetchErrordata=[Select Id from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId and Source_FB__c = false and Month_FB__c = false and ErrorMapData__c = null and SO_Number_FB__c = false and SO_Number_NF__c= false and LOB_FB__c= false and LOB_NF__c= false and
                        Company_FB__c= false and Customer_FB__c= false and Calculation_Failed__c= false and Transaction_Currency_FB__c= false and Transaction_Currency_NF__c= false and selected_ui_values__c = false and Freight_Charge_USD_FB__c = false and Freight_Charge_USD_NF__c = false and Gross_Sales_USD_FB__c = false and Gross_Sales_USD_NF__c = false and
                        Division_FB__c= false and Division_NF__c= false and Mainetti_Brand_FB__c= false and Mainetti_Brand_NF__c= false and Item_code_FB__c= false and Item_code_NF__c= false and
                        Production_Country_FB__c= false and Production_Country_NF__c= false and Retailer_Brand_FB__c= false and Retailer_Brand_NF__c= false and
                        Material_FB__c= false and Material_NF__c= false and Company_NF__c= false and Model_FB__c= false and Model_NF__c= false and Market_FB__c= false and Market_NF__c= false and Vendor_FB__c= false and Vendor_NF__c= false and
                        Category_FB__c= false and Category_NF__c= false and Sub_Category_FB__c= false and Sub_Category_NF__c= false and Order_Type_FB__c= false and Order_Type_NF__c= false and
                        Shipped_To_Country_FB__c= false and Shipped_To_Country_NF__c= false and Shipped_To_Factory_FB__c= false and Shipped_To_Factory_NF__c= false and
                        Color_FB__c= false and Color_NF__c= false and Country_NF__c= false and SM_NF__c= false and ExRate_to_EUR_NF__c= false and
                        ExRate_to_USD_NF__c= false and Local_Currency_NF__c= false and Local_Currency_FB__c= false and Month_NF__c= false and Retailer_Code_NF__c= false and
                        SL_NF__c= false and Source_NF__c= false and US_NF__c= false and UOM_NF__c= false and Week_NF__c= false and Year_NF__c= false and
                        Family_FB__c= false and Family_NF__c= false and STC_FB__c= false and STC_NF__c= false and Sales_EUR_FB__c= false and Sales_EUR_NF__c= false and
                        Sales_USD_FB__c= false and Sales_USD_NF__c= false and Unit_Price_100_EUR_FB__c= false and Unit_Price_100_EUR_NF__c= false and wrong_date__c= false and
                        Unit_Price_100_USD_FB__c= false and Unit_Price_100_USD_NF__c= false and Net_Unit_Price_100_FB__c = false and Local_Net_Unit_Pirce_FB__c = false and Local_Net_Unit_Pirce_NF__c = false and Unit_Sold_FB__c = false and Year_FB__c = false and Week_FB__c = false and Label_FB__c = false and Net_Weight_KG_1000_FB__c = false and Net_Weight_KG_1000_NF__c = false];
        return fetchErrordata;
    }
    public static Integer isDataCleanRecordCount(string batchid){
        
        AggregateResult[] fetchErrordata =[Select count(Id) recordCount from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId and Source_FB__c = false and Month_FB__c = false and SO_Number_FB__c = false and SO_Number_NF__c= false and LOB_FB__c= false and LOB_NF__c= false and
                                           Company_FB__c= false and Customer_FB__c= false and Calculation_Failed__c= false and Transaction_Currency_FB__c= false and Transaction_Currency_NF__c= false and selected_ui_values__c = false and Freight_Charge_USD_FB__c = false and Freight_Charge_USD_NF__c = false and Gross_Sales_USD_FB__c = false and Gross_Sales_USD_NF__c = false and
                                           Division_FB__c= false and Division_NF__c= false and Mainetti_Brand_FB__c= false and Mainetti_Brand_NF__c= false and Item_code_FB__c= false and Item_code_NF__c= false and
                                           Production_Country_FB__c= false and Production_Country_NF__c= false and Retailer_Brand_FB__c= false and Retailer_Brand_NF__c= false and
                                           Material_FB__c= false and Material_NF__c= false and Company_NF__c= false and Model_FB__c= false and Model_NF__c= false and Market_FB__c= false and Market_NF__c= false and Vendor_FB__c= false and Vendor_NF__c= false and
                                           Category_FB__c= false and Category_NF__c= false and Sub_Category_FB__c= false and Sub_Category_NF__c= false and Order_Type_FB__c= false and Order_Type_NF__c= false and
                                           Shipped_To_Country_FB__c= false and Shipped_To_Country_NF__c= false and Shipped_To_Factory_FB__c= false and Shipped_To_Factory_NF__c= false and
                                           Color_FB__c= false and Color_NF__c= false and Country_NF__c= false and SM_NF__c= false and ExRate_to_EUR_NF__c= false and
                                           ExRate_to_USD_NF__c= false and Local_Currency_NF__c= false and Local_Currency_FB__c= false and Month_NF__c= false and Retailer_Code_NF__c= false and
                                           SL_NF__c= false and Source_NF__c= false and US_NF__c= false and UOM_NF__c= false and Week_NF__c= false and Year_NF__c= false and
                                           Family_FB__c= false and Family_NF__c= false and STC_FB__c= false and STC_NF__c= false and Sales_EUR_FB__c= false and Sales_EUR_NF__c= false and
                                           Sales_USD_FB__c= false and Sales_USD_NF__c= false and Unit_Price_100_EUR_FB__c= false and Unit_Price_100_EUR_NF__c= false and wrong_date__c= false and
                                           Unit_Price_100_USD_FB__c= false and Unit_Price_100_USD_NF__c= false and Net_Unit_Price_100_FB__c = false and Local_Net_Unit_Pirce_FB__c = false and Local_Net_Unit_Pirce_NF__c = false and Unit_Sold_FB__c = false and Year_FB__c = false and Week_FB__c = false and Label_FB__c = false and Net_Weight_KG_1000_FB__c = false and Net_Weight_KG_1000_NF__c = false];
        
        Integer recCount = 0;
        if(!fetchErrordata.isEmpty()){
            for (AggregateResult salesErrCnt : fetchErrordata){
                recCount = Integer.valueOf(salesErrCnt.get('recordCount'));
            }
        }
        return recCount;        
    }
    
    @AuraEnabled   
    public static List<Inventory_Transaction_Master__c> isCompanyMissingWeek(string batchid){
        List<Inventory_Transaction_Master__c> fetchData = new List<Inventory_Transaction_Master__c>();
        fetchData = [Select Id from Inventory_Transaction_Master__c where Id=:batchid and company_week__c <> null];
        return fetchData;
    }
    
    @AuraEnabled   
    public static List<Sales_Transaction_Stage__c> isDataCleanForProceed(string batchid){
        List<Sales_Transaction_Stage__c> fetchErrordata = new List<Sales_Transaction_Stage__c>();
        fetchErrordata=[Select Id from Sales_Transaction_Stage__c where Transaction_Master_Id__c=:BatchId and (unit_sold_warning__c = true OR warning_consolidate_key__c  = true OR Source_FB__c = true OR Month_FB__c = true OR ErrorMapData__c <> null OR SO_Number_FB__c = true OR SO_Number_NF__c= true OR LOB_FB__c= true OR LOB_NF__c= true OR
                                                                                                               Company_FB__c= true OR Customer_FB__c= true OR Calculation_Failed__c= true OR Transaction_Currency_FB__c= true OR Transaction_Currency_NF__c= true OR selected_ui_values__c = true OR Freight_Charge_USD_FB__c = true OR Freight_Charge_USD_NF__c = true OR Gross_Sales_USD_FB__c = true OR Gross_Sales_USD_NF__c = true OR
                                                                                                               Division_FB__c= true OR Division_NF__c= true OR Mainetti_Brand_FB__c= true OR Mainetti_Brand_NF__c= true OR Item_code_FB__c= true OR Item_code_NF__c= true OR
                                                                                                               Production_Country_FB__c= true OR Production_Country_NF__c= true OR Retailer_Brand_FB__c= true OR Retailer_Brand_NF__c= true OR
                                                                                                               Material_FB__c= true OR Material_NF__c= true OR Company_NF__c= true OR Model_FB__c= true OR Model_NF__c= true OR Market_FB__c= true OR Market_NF__c= true OR Vendor_FB__c= true OR Vendor_NF__c= true OR
                                                                                                               Category_FB__c= true OR Category_NF__c= true OR Sub_Category_FB__c= true OR Sub_Category_NF__c= true OR Order_Type_FB__c= true OR Order_Type_NF__c= true OR
                                                                                                               Shipped_To_Country_FB__c= true OR Shipped_To_Country_NF__c= true OR Shipped_To_Factory_FB__c= true OR Shipped_To_Factory_NF__c= true OR
                                                                                                               Color_FB__c= true OR Color_NF__c= true OR Country_NF__c= true OR SM_NF__c= true OR ExRate_to_EUR_NF__c= true OR
                                                                                                               ExRate_to_USD_NF__c= true OR Local_Currency_NF__c= true OR Local_Currency_FB__c= true OR Month_NF__c= true OR Retailer_Code_NF__c= true OR
                                                                                                               SL_NF__c= true OR Source_NF__c= true OR US_NF__c= true OR UOM_NF__c= true OR Week_NF__c= true OR Year_NF__c= true OR
                                                                                                               Family_FB__c= true OR Family_NF__c= true OR STC_FB__c= true OR STC_NF__c= true OR Sales_EUR_FB__c= true OR Sales_EUR_NF__c= true OR
                                                                                                               Sales_USD_FB__c= true OR Sales_USD_NF__c= true OR Unit_Price_100_EUR_FB__c= true OR Unit_Price_100_EUR_NF__c= true OR wrong_date__c= true OR
                                                                                                               Unit_Price_100_USD_FB__c= true OR Unit_Price_100_USD_NF__c= true OR Net_Unit_Price_100_FB__c = true OR Local_Net_Unit_Pirce_FB__c = true OR Local_Net_Unit_Pirce_NF__c = true OR Unit_Sold_FB__c = true OR Year_FB__c = true OR Week_FB__c = true OR Label_FB__c = true OR Net_Weight_KG_1000_FB__c = true OR Net_Weight_KG_1000_NF__c = true)];
        return fetchErrordata;
    }
    
    @AuraEnabled
    public static integer callingCustomSettings(){
        Sales_Transaction__c customData = Sales_Transaction__c.getInstance();
        integer dateValue = integer.valueOf(customData.date__c);
        return dateValue;
    }
    
    // Custom Lookup for Family
    @AuraEnabled
    public static List < Sales_Error_Mapping__c > fetchLookupErrorMapList(String mapToValue,String mapFromValue, string rawDataField,string company) {
        String searchKey = '%' + mapToValue + '%';
        List < Sales_Error_Mapping__c > lstOfErrorMapto;
        if(
            Sales_Error_Mapping__c.SObjectType.getDescribe().isAccessible()
        ) {
            lstOfErrorMapto = [Select Map_From_Value__c, Map_To_Value__c from Sales_Error_Mapping__c where Raw_Data_Field__c =:rawDataField and Company__c=:company and Map_From_Value__c=:mapFromValue and Map_To_Value__c like : searchKey];
        }
        return lstOfErrorMapto;
    }
    
    @AuraEnabled 
    public static map<string,string> getsalesCompanyList()
    {      
        Map<string,string> salesCompMap = new Map<string,string>();      
        Schema.DescribeFieldResult fieldResult = Partner__c.Sales_Data_Company__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            salesCompMap.put(p.getValue(), p.getLabel());
        }
        return salesCompMap;
    }
    
    @AuraEnabled
    public static String errordataSubmitted(string companyArray, string selmonth, string selyear)
    {
        List<string> companyList = companyArray.split(',');
        Set<String> companyName = new Set<String>();
        for (string valFormt : companyList){
            if(string.isNotBlank(valFormt)){
                companyName.add(valFormt);
            }
        }   
        
        List<Inventory_Transaction_Master__c> fetchData = [select Sales_Company__c,Sales_Month__c,Sales_Year__c,Batch_Status__c from  Inventory_Transaction_Master__c where Sales_Company__c =:companyArray and Sales_Month__c =: selmonth and Sales_Year__c =: selyear and  Record_Type__c='Sales' order by CreatedDate desc LIMIT 1];
        String batchStatus = '';
        for (Inventory_Transaction_Master__c transMast : fetchData){
            batchStatus = transMast.Batch_Status__c;
          //  system.debug('batchStatus::::'+batchStatus);
        }   
        Integer fetchdataSize = fetchData.size();
       // system.debug('fetchdataSize::::'+fetchdataSize);
        return batchStatus;        
    }
    
    
    
    @AuraEnabled
    public static String insertBulkSales(string jsonin, string batchNo,string recordType, string selMonth, string selYear, string selcomp,string isreupload,String chunkCount,String fileName,string fileDelimiters) {
      //  System.debug('###### START insertBulkSales :::: chunkCount::::'+chunkCount);
        boolean isReUploadLocal = Boolean.valueOf(isreupload);
        if(isReUploadLocal){
           // System.debug('#################### INSIDE ISREUPLOAD');
            Database.executeBatch(new deleteTheRecordsBasedonId(batchNo),2000);
            batchNo = '';
        }
        boolean insertStatus =true;        
        String returnBatchId;
        
        if(String.isBlank(batchNo)) {
            Inventory_Transaction_Master__c transactions = new Inventory_Transaction_Master__c();
            transactions.File_Uploaded_By__c = userInfo.getFirstName() + ','+ userInfo.getLastName();
            transactions.Record_Type__c = recordType;
            transactions.Sales_Company__c = selcomp;
            transactions.Sales_Month__c = selMonth;
            transactions.Sales_Year__c = selYear;    
            transactions.upload_file_name__c = EncodingUtil.urlEncode(fileName, 'UTF-8');
            transactions.File_Delimiters__c = fileDelimiters;
           // system.debug('transactions records ::::'+transactions);
            try{
                if(
                    Inventory_Transaction_Master__c.SObjectType.getDescribe().isCreateable()){
                        insert transactions;
                    }
                batchNo = transactions.Id;
            }catch(DMLException e){   
                insertStatus = false;
               // system.debug('Error in insertDataUploadSales: during DataUploadSales'+e.getMessage());
            }
        }
        boolean status = false;
        if(insertStatus){
            if(jsonin!= null){
               // System.debug('##############jsonin:::::'+jsonin);
               // System.debug('##############batchNo:::::'+batchNo);
                status=insertSalesStageChunk(jsonin,batchNo); 
               // system.debug('status   :::::'+status);
            }            
        }        
        if(status){
            returnBatchId = batchNo;
        }else{
            returnBatchId ='';
        }       
       // system.debug('returnBatchId    ::::'+returnBatchId);
        return returnBatchId;
    }
    @AuraEnabled
    public static String generateIdForFileUpload(string recordType, string selMonth, string selYear, string selcomp) {
        String batchId;        
        Inventory_Transaction_Master__c transactions = new Inventory_Transaction_Master__c();
        transactions.File_Uploaded_By__c = userInfo.getFirstName() + ','+ userInfo.getLastName();
        transactions.Record_Type__c = recordType;
        transactions.Sales_Company__c = selcomp;
        transactions.Sales_Month__c = selMonth;
        transactions.Sales_Year__c = selYear;    
        //Transactions.upload_file_name__c = EncodingUtil.urlEncode(fileName, 'UTF-8');
        try{
            if(
                Inventory_Transaction_Master__c.SObjectType.getDescribe().isCreateable()){
                    insert transactions;
                }
            batchId = transactions.Id;
        }catch(DMLException e){   
           // system.debug('Error in generateIdForFileUpload: during DataUploadSales'+e.getMessage());
        }
        return batchId;
    }
    public static boolean validataeBulkBatchApex(String batchNo,String selMonth,String selYear,String selcomp,String userEmail){
        
        boolean validateBulkStatus = true;
        validateSalesRowsBulk validateBulk = new validateSalesRowsBulk(batchNo,selMonth,selYear,selcomp,userEmail);
        Database.executeBatch(validateBulk,1250);
        // Database.executeBatch(validateBulk,2);
        return validateBulkStatus;
    } 
    @AuraEnabled
    public static String parseSalesChunk(string jsonin, string batchNo, string recordType, string selMonth, string selYear, string selcomp, String postBulkInsert) {
        string returnBatchId = '';
       // system.debug('batchNo   ::::'+batchNo);
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        boolean recordStatus = true;   
        boolean proceedStatus = false;
        boolean isInsertRequired = boolean.valueOf(postBulkInsert);
        if(recordStatus){
            returnBatchId = batchNo;
            
            updateBatchStatus.Id = batchNo;               
            updateBatchStatus.Batch_Status__c='2 - Data Validation In Progress';
            update updateBatchStatus;
            string userEmail = UserInfo.getUserEmail();
            // calling the validateSalesRowsBulk Batch Apex
           // system.debug('batchNo '+batchNo);
            validataeBulkBatchApex(batchNo,selMonth,selYear,selcomp,userEmail);
            
        }   
       // system.debug('returnBatchId    :::::'+returnBatchId);
        return returnBatchId;
    }      
    
    @AuraEnabled
    public static boolean recStatusUpsertForInventory(string batchid){
        boolean status = true;
        string userEmail = UserInfo.getUserEmail();
        recStatusUpsertForInventoryBulk validateBulk = new recStatusUpsertForInventoryBulk(batchId,userEmail);
        Database.executeBatch(validateBulk,2000);	
        return status;        
    }  
    
    @AuraEnabled
    public static boolean recUpdateFOrInvSuccess(string batchid){
        boolean status = true;
        Inventory_Transaction_Master__c updateCheckbox = new Inventory_Transaction_Master__c();
        updateCheckbox.Id = batchid;
        updateCheckbox.Success_Notification__c = true;
        updateCheckbox.Reprocessing__c = false;
        try {
            update updateCheckbox;
        } catch (DMLException e) {
            status = false;
        }
        return status; 
    }
    /***************Delete the Batch Process records which have become defunct due to some exception****/
    @AuraEnabled
    public static boolean deleteDefunctBatchRecord(String batchId){
        boolean status = true;
       // System.debug('#############INSIDE THE DELETE DEFUNCT BATCH METHOD#########'+batchId);
        Database.executeBatch(new deleteTheRecordsBasedonId(batchId),2000);
        return status;
    }
    @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getAutoPopulateMasterValues(String batchId){
        List<Inventory_Transaction_Master__c> masterData= [Select Sales_Company__c,Sales_Month__c,Sales_Year__c from Inventory_Transaction_Master__c where id =:batchId ];
        return masterData;
    }
    
    @AuraEnabled
    public static String downloadCSVfile(String fileName){
        String fileLink;
       // system.debug('fileName:::'+fileName);
        fileLink = new AzureFileStorageService().downloadAzureFile(fileName);
        return fileLink;
    }
    @AuraEnabled
    public static String downloadConvertedCSVfile(String fileName){
        String fileLink;
       // system.debug('fileName:::'+fileName);
        fileLink = new AzureFileStorageService().downloadConvertedAzureFile(fileName);
        //system.debug('fileLink ::'+fileLink);
        return fileLink;
    }
    @AuraEnabled
    public static boolean hasViewAdminToProfileAccess(){
        boolean status;
      //  system.debug('status::::'+status);
        List<Profile> profile ;
        
        profile = [SELECT Id, Name FROM Profile WHERE Id=:userinfo.getProfileId() LIMIT 1];
        String myProflieName = profile[0].Name;
       // system.debug('myProflieName:::'+myProflieName);
        Sales_Transaction__c customData = Sales_Transaction__c.getInstance();
        string profileName = customData.Profile__c;
       // system.debug('profileName:::'+profileName);
        List<string> profileNameList = profileName.split(',');
       // system.debug('profileNameList:::'+profileNameList);
        for (string valFormt : profileNameList){
           // system.debug('valFormt:::'+valFormt);
            if(valFormt.equals(myProflieName))
            {
                status = true;
                break;
               // system.debug('myProflieName::Inside Condition::::'+myProflieName+'Statusss1:::'+status);
            } 
        }
        return status;
    }
}