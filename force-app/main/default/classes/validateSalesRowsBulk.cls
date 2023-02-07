global class validateSalesRowsBulk implements Database.Batchable<sObject>, Database.Stateful {
      
    String query = 'SELECT unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Week_FB__c,Year_FB__c,Source_FB__c,Month_FB__c,Unit_Sold_FB__c,Local_Net_Unit_Pirce_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_USD_FB__c,ExRate_to_EUR_FB__c,Calculation_Failed__c,Remark__c,Label__c,End_user__c,Royalty_Rate__c,Printed_Logo__c,Customer_local_name__c,Net_Unit_Price_100__c,Local_Net_Unit_Pirce_100__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c, Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c, Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c, Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c, Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c, Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c, Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c, ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c, Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,  Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,  Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,wrong_date__c,  Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Label_FB__c,Retailer_Check__c,Model_Check__c,ProductCategory__c,Segments__c,Batch_No__c,Retailer_Country__c,Sales_Type__c,Sales_Type_NF__c,Standard_Unit_Cost_100_EUR__c,Standard_Unit_Cost_100_EUR_FB__c,Standard_Unit_Cost_100_EUR_NF__c,Standard_Unit_Cost_100_USD__c,Standard_Unit_Cost_100_USD_FB__c,Standard_Unit_Cost_100_USD_NF__c,Net_Unit_Price_100_EUR__c,Net_Unit_Price_100_EUR_FB__c,Net_Unit_Price_100_EUR_NF__c,Net_Unit_Price_100_NF__c ,Standard_Unit_Ex_Work_Cost_100_EUR__c, Standard_Unit_Ex_Work_Cost_100_EUR_NF__c ,Standard_Unit_Ex_Work_Cost_100_EUR_FB__c, Standard_Unit_Ex_Work_Cost_100_USD__c, Standard_Unit_Ex_Work_Cost_100_USD_FB__c, Standard_Unit_Ex_Work_Cost_100_USD_NF__c, Standard_Unit_Industrial_Cost_100_EUR__c, Standard_Unit_Industrial_Cost_100_EUR_FB__c, Standard_Unit_Industrial_Cost_100_EUR_NF__c , Standard_Unit_Industrial_Cost_100_USD__c , Standard_Unit_Industrial_Cost_100_USD_FB__c, Standard_Unit_Industrial_Cost_100_USD_NF__c ,Final_Sales_Destination__c, Final_Sales_Destination_FB__c, Final_Sales_Destination_NF__c,Local_Net_Unit_Pirce_NF__c,Record_Status__c,Malformed_Data__c,Sales_Delivery_Date__c,Sales_Delivery_Date_FB__c,Sales_Delivery_Date_NF__c,Sales_Order_Date__c,Sales_Order_Date_FB__c,Sales_Order_Date_NF__c,Gross_Unit_Price_100_Local_Currency__c,Gross_Unit_Price_100_Local_Currency_FB__c,Gross_Unit_Price_100_Local_Currency_NF__c ,Region__c,Cogs_Country__c,Company_Group_Name__c, Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,	Net_Weight_KG_1000_NF__c,PO_Number__c,Retailer_Type__c,Nomination__c,Standard_Unit_Material_Cost_100_EUR__c,Standard_Unit_Material_Cost_100_EUR_FB__c,Standard_Unit_Material_Cost_100_EUR_NF__c,Standard_Unit_Material_Cost_100_USD__c,Standard_Unit_Material_Cost_100_USD_FB__c,Standard_Unit_Material_Cost_100_USD_NF__c FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchId order by Row_No__c';
    private String selMonth;
    private String selYear;
    private String selcomp;
    private String email;
    private String batchId;
    private String userEmail;  
    private String returnBatchId;
    private List<Sales_Transaction_Stage__c> salesTransStageForCSV;
    
    public validateSalesRowsBulk(String batchId,String selMonth,String selYear,String selcomp,String userEmail) {
        this.batchId = batchId;
        this.selMonth = selMonth;
        this.selYear = selYear;
        this.selcomp = selcomp;
        this.userEmail = userEmail;
    }    
    global class  recordValidationStatus{
        public Boolean validateStatus { get; set; }
        public Boolean updateCheckbox { get; set; }        
    }    
    global Database.querylocator start(Database.BatchableContext bc){        
        //System.debug('::::::::::::::: INSIDE THE START METHOD OF SALES UPLOAD BATCH PROCESSING :::::::::::::::::::::');
        Inventory_Transaction_Master__c  updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus.Id = batchId;
        updateBatchStatus.Batch_Process__c='In Progress';
        update updateBatchStatus;
        return Database.getQueryLocator(query);            
    }
    
    global void execute(Database.BatchableContext bc, List<Sales_Transaction_Stage__c> salesTransStagRecForReconciliation){
      //  system.debug('salesTransStagRecForReconciliation:::'+salesTransStagRecForReconciliation.size());
        //System.debug('::::::::::::::: INSIDE THE EXECUTE METHOD OF SALES UPLOAD BATCH PROCESSING :::::::::::::::::::::');
        recordValidationStatus recordStatus =  new recordValidationStatus();
        recordStatus.validateStatus = true;
        recordStatus.updateCheckbox= false;
        boolean validateStatus;
        boolean updateCheckbox;
        salesTransStageForCSV = salesTransStagRecForReconciliation;
      //  salesTransStagRecForReconciliation = null;
        //System.debug('Heap Size 001  => '+Limits.getHeapSize());
        
        //System.debug('::::::::::::::: INSIDE THE EXECUTE METHOD OF SALES UPLOAD salesTransStageForCSV size'+salesTransStageForCSV.size());
        
        getSalesMasterData salesMasterData = new getSalesMasterData();
        Map<Decimal,string> missingFieldValMap = new Map<Decimal,string>();   
        Map<Decimal,Map<string,string>> inCorrectFormatMap = new Map<Decimal,Map<string,string>>();       
        //**************************Getting the Sales Data for the Reconciliation with Error Map before the Validation ******************/
        // Getting the full error data details for reconciliation from the Error Map Object
        // -----------------------------------------------------------------------------------------------------
        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = salesMasterData.getFullSalesErrorMap();
        Map<string,Map<string,string>> compositeProductMap = salesMasterData.getProductDetails();
        // Map<string,string> modelWarningMap = compositeProductMap.get('SalesModel');
        Map<string,string> modelConsolidateMap = compositeProductMap.get('SalesModel');
        // Added by Sai 10-07-2020
        Map<string,string> modelCategory = compositeProductMap.get('ModelCategory');
        Map<string,string> modelCompKeyMap = compositeProductMap.get('ModelCompositeKey');
        Map<string,Map<string,string>> compositeRetailerMap = salesMasterData.getRetailerDetails();
        Map<string,string> marketMap = compositeRetailerMap.get('MarketMap');
        Map<string,string> vendorMap = compositeRetailerMap.get('RetailerCodeMap');
        //System.debug('Heap Size 002  => '+Limits.getHeapSize());
        Map<string,string> productionCoungtryMap = compositeRetailerMap.get('GetProductionCountryMap');
        Map<string,string> getSalesDataUploadCheckMap = compositeRetailerMap.get('GetSalesDataUploadCheckMap');
        Map<string,string> getSalesDataUploadColorCheckMap = compositeRetailerMap.get('GetSalesDataUploadColorCheckMap');
        // Added by Sai 05-08-2020
        Map<string,string> autoPopulateRetailerCountryMap = compositeRetailerMap.get('AutoPopulateRetailerCountry');
        // Added by Darshan 08-05-2022
        Map<string,string> autoPopulateRetailerTypeMap = compositeRetailerMap.get('AutoPopulateRetailerType');
        // Added by Sai 21-10-2020
        Map<string,string> autoPopulateMarketSegmentMap = compositeRetailerMap.get('AutoPopulateMarketSegment');  
        //Added By Bharath 11-05-2021
        //Map<string,Map<string,string>> compositeRetailerOrderDeliveryDateMap = salesMasterData.getRetailerLob();
        Map<string,string> getSalesOderDateCheckMap = compositeRetailerMap.get('GetSalesOderDateCheckMap');
	    Map<string,string> getSalesDeliveryDateCheckMap = compositeRetailerMap.get('GetSalesDeliveryDateCheckMap');
        Map<string,string> pricebookprintCheckMap = compositeRetailerMap.get('PriceBookPrintCheckMap');
        //added 17-08map
       map<String,map<string,string>> getPartnerMap = salesMasterData.getManitteCompanyMap();
        map<string,string> getManitteCompanyMap = getPartnerMap.get('mainettiCompanyMap');

        //System.debug('Heap Size 003  => '+Limits.getHeapSize());
        String defaultOrderToCompany = getManitteCompanyMap.get(selcomp);
        wrapPriceBookProdVendorDetails wrapPriceBook = salesMasterData.getPriceSpecificationBookProductDetails(defaultOrderToCompany);
        Map<string,Map<string,string>> compositePriceSpecificationBookProductMap = wrapPriceBook.ProductDetails;
        //End added 17-08
        Map<string,string> colorMap = compositePriceSpecificationBookProductMap.get('GetPickListColorMap');
      //  Map<string,string> getModelandColorMap =  compositePriceSpecificationBookProductMap.get('GetModelandColorMap');
        Map<string,string> checkPriceBookModel = compositePriceSpecificationBookProductMap.get('CheckPriceBookModel');
        // Added by Sai 08-05-2020
        // Checking the Category,SubCategory,Family based on Model
        Map<string,string> modelwithCatSubCatFamily = compositePriceSpecificationBookProductMap.get('ModelwithCatSubCatFamily');
        // Added by Sai 02-06-2020
        // Checking the Vendor & Category from PricespecificationBook
        Map<string,Map<string,string>> compositePriceSpecificationBookMap = salesMasterData.getPriceSpecificationBookDetails();
        Map<string,string> checkVendorCategory = compositePriceSpecificationBookMap.get('CheckVendorCategory');
        //added on 17-08
        Map<string,List<string>>checkVendorModel = wrapPriceBook.VendorModelDetails;
        Map<string,List<string>>getModelandColorMap = wrapPriceBook.VendorModelColorDetails;
        Map<string,List<string>>checkVendorModelPrintedLogo = wrapPriceBook.VendorModelPrintedLogoDetails;
        Map<string,List<string>>checkVendorModelColorPrintedLogo = wrapPriceBook.VendorModelColorPrintedLogoDetails;
        //System.debug('Heap Size 004  => '+Limits.getHeapSize());
        Map<string,string> checkModel = compositePriceSpecificationBookProductMap.get('CheckModel');     
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = salesMasterData.getNewVendorDivisionBrandLabelMap();         
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap =  salesMasterData.getRetailersLabelDivisionBrandCheckMap();                
      //  map<string,string> companyOnlyMap = processSalesData.getSalesWeekCountWithPartnerCompanyNewCompanyList(selMonth,selYear,selcomp);  
         map<string,string> companyOnlyMap = new Map<string,string>();  
        Map<string,string> getModelCatFamilyMap = salesMasterData.getModelCatFamilyMap();
        Map<string,string> currencyPicklist =  salesMasterData.getPickListMap('Data_Upload_Sales__c','Transaction_Currency__c');
        Map<string,string> orderTypePicklist =  salesMasterData.getPickListMap('Data_Upload_Sales__c','Order_Type__c');
        // Added by Sai 09-07-2020
        Map<string,string> productionCountryPicklist =  salesMasterData.getPickListMap('Data_Upload_Sales__c','Production_Country__c');
        // Added by Bharath 11-01-2021
        Map<string,string> finalsalesdestinationPicklist =  salesMasterData.getPickListMap('Data_Upload_Sales__c','Final_Sales_Destination__c');
        // getting user email for notifying admin for which user the reprocessing notification to be sent 
        String userName = UserInfo.getUserName();
        User activeUser = [Select Email From User where Username = : userName limit 1];
        String userEmailNotify = activeUser.Email; 
        System.debug('userName '+userName);       
        Inventory_Transaction_Master__c  updateBatchStatus = new Inventory_Transaction_Master__c();
        List<Sales_Transaction_Stage__c> salesTransStagUpdate =  salesMasterData.preValidationSalesStageDataByPage(salesTransStagRecForReconciliation, fullSalesErrorMap,batchId, selcomp, selMonth, selYear, inCorrectFormatMap, marketMap, modelCompKeyMap, vendorMap,updateBatchStatus, recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap, modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        System.debug('salesTransStagUpdate' +salesTransStagUpdate);
        System.debug('Heap Size after clearing variables  => '+Limits.getHeapSize());
        boolean isUpdateMaster = false;
        validateStatus = (Boolean) recordStatus.validateStatus;
        updateCheckbox = (Boolean) recordStatus.updateCheckbox;
        System.debug('updateCheckbox '+updateCheckbox);
        if(updateCheckbox){              
            updateBatchStatus.Id = batchId;              
            updateBatchStatus.Reprocess_Email_Notify__c = userEmailNotify; 
            isUpdateMaster = true;
            
        }
        if(salesTransStagUpdate != null && salesTransStagUpdate.size() > 0){
            try{            
                // Getting the total record count of the salesrecord for pagination
                Integer totalRecCountForUpdate = salesTransStagUpdate.size();
                Integer maxSizeForUpdate = 9000;
                if(totalRecCountForUpdate > maxSizeForUpdate){
                    for(Integer i = 0 ; i < (totalRecCountForUpdate / maxSizeForUpdate)+1 ; i++){
                        List<Sales_Transaction_Stage__c> salesTemp = new  List<Sales_Transaction_Stage__c>();
                        for(Integer j=(i*maxSizeForUpdate);(j<(i*maxSizeForUpdate)+maxSizeForUpdate) && j<totalRecCountForUpdate ; j++){
                            salesTemp.add(salesTransStagUpdate.get(j));
                        }
                        update salesTemp;
                    }                    
                }else{
                    update salesTransStagUpdate;
                }
                if(updateBatchStatus!= null){
                    if(isUpdateMaster)
                        update updateBatchStatus;
                }
            }catch(DMLException e){    
                validateStatus= false;         
            }
        } 
        boolean recordStatuss = true;            
        try{            
            if(!validateStatus){
                updateBatchStatus.Id = batchId;
                updateBatchStatus.Batch_Status__c='3 - Error In Data Validation';   
                update updateBatchStatus;               
            }
            wrapPriceBook = null;
            boolean appendStatus = appendTheCSVFile(batchId,salesTransStageForCSV);
            boolean appendUserStatus = appendTheUserUploadedCSVFile(batchId,salesTransStageForCSV);
            salesTransStageForCSV = null;
        }catch(DMLException e){   
            recordStatuss = false;
        }
        
    }
    global void finish(Database.BatchableContext bc){ 
       // map<string,string> weekOnlyMap = processSalesData.getSalesWeekList(selMonth,selYear,selcomp);       
        //   Added by Sai 25-08-2020 Starting
        List<Sales_Transaction_Stage__c> withOutsalesAdmin = [SELECT Id  FROM Sales_Transaction_Stage__c WHERE  Upload_Batch_No__c =: batchId  and ( Model_FB__c = True OR Color_FB__c = True OR Category_FB__c = True OR Market_FB__c = True OR Vendor_FB__c = True OR Company_FB__c = True OR Material_FB__c = True OR Shipped_To_Factory_FB__c = True OR Shipped_To_Country_FB__c = True OR Division_FB__c = True OR Item_code_FB__c = True OR Mainetti_Brand_FB__c = True OR Order_Type_FB__c = True OR Customer_FB__c = True OR Transaction_Currency_FB__c = True OR ExRate_to_EUR_FB__C = True OR ExRate_to_USD_FB__C = True  OR Unit_Price_100_USD_FB__c = True    OR Unit_Price_100_EUR_FB__c = True OR Local_Net_Unit_Pirce_FB__c = True OR Net_Unit_Price_100_FB__c = True    OR Month_FB__c = True OR Source_FB__c = True OR Unit_Sold_FB__c = True    OR Week_FB__c = True OR Year_FB__c = True OR SO_Number_FB__c = True  OR LOB_FB__c = True OR Gross_Sales_USD_FB__c = True OR Freight_Charge_USD_FB__c = True OR Production_Country_FB__c = True OR   Sub_Category_FB__c = TRUE OR  Family_FB__c = true OR Label_FB__c = True OR Retailer_Brand_FB__c = True  OR Color_NF__c = True OR Market_NF__c = True    OR Company_NF__c = True OR selected_ui_values__c = True OR SO_Number_NF__c = True OR LOB_NF__c = True OR ExRate_to_USD_NF__c = True    OR ExRate_to_EUR_NF__c = True OR Calculation_Failed__c = True  OR Retailer_Brand_NF__c = True OR warning_consolidate_key__c = True OR Source_NF__c = True   OR wrong_date__c = True  OR Sub_Category_NF__c = TRUE OR Family_NF__c = true or Order_Type_NF__c = True or Production_Country_NF__c = True or Transaction_Currency_NF__c = True or STC_FB__c = True or  Sales_USD_FB__c = True or Sales_EUR_FB__c = True or  Standard_Unit_Cost_100_EUR_FB__c = True or Standard_Unit_Cost_100_EUR_NF__c = True  or Standard_Unit_Cost_100_USD_FB__c = True or Standard_Unit_Cost_100_USD_NF__c = True or Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = True or Standard_Unit_Ex_Work_Cost_100_EUR_FB__c = True or Standard_Unit_Ex_Work_Cost_100_USD_FB__c = True or Standard_Unit_Ex_Work_Cost_100_USD_NF__c = True or Standard_Unit_Industrial_Cost_100_EUR_FB__c = True or Standard_Unit_Industrial_Cost_100_EUR_NF__c = True or Standard_Unit_Industrial_Cost_100_USD_FB__c = True or Standard_Unit_Industrial_Cost_100_USD_NF__c = True or Local_Net_Unit_Pirce_NF__c = True          
                                                           or Standard_Unit_Material_Cost_100_EUR_FB__c = True or Standard_Unit_Material_Cost_100_EUR_NF__c = True or Standard_Unit_Material_Cost_100_USD_FB__c = True  or Standard_Unit_Material_Cost_100_USD_NF__c = True   or Net_Unit_Price_100_EUR_FB__c = True  or Net_Unit_Price_100_EUR_NF__c = True  or Net_Unit_Price_100_FB__c = True  or Net_Unit_Price_100_NF__c = True or Final_Sales_Destination_FB__c = True or Final_Sales_Destination_NF__c = True OR Sales_Order_Date_FB__c = True OR Sales_Order_Date_NF__c = True OR Sales_Delivery_Date_FB__c = True OR Sales_Delivery_Date_NF__c = True OR Gross_Unit_Price_100_Local_Currency_FB__c = True OR Gross_Unit_Price_100_Local_Currency_NF__c = True OR Sales_Type_FB__c = True OR Sales_Type_NF__c = True  OR Net_Weight_KG_1000_FB__c = True OR Net_Weight_KG_1000_NF__c = True)];
        if(withOutsalesAdmin.size() == 0)
        {
            List<Sales_Transaction_Stage__c> salesAdmin = [ SELECT Id  FROM Sales_Transaction_Stage__c WHERE  Upload_Batch_No__c =: batchId  
                                                           AND Model_FB__c != True AND Color_FB__c != True AND Category_FB__c != True AND Market_FB__c != True AND Vendor_FB__c != True AND Company_FB__c != True AND Material_FB__c != True AND Shipped_To_Factory_FB__c != True AND Shipped_To_Country_FB__c != True AND Division_FB__c != True AND Item_code_FB__c != True AND Mainetti_Brand_FB__c != True AND Order_Type_FB__c != True AND Customer_FB__c != True AND Transaction_Currency_FB__c != True AND ExRate_to_EUR_FB__C != True AND ExRate_to_USD_FB__C != True AND  Unit_Price_100_USD_FB__c != True    AND Unit_Price_100_EUR_FB__c != True AND Local_Net_Unit_Pirce_FB__c != True AND Net_Unit_Price_100_FB__c != True    AND Month_FB__c != True AND Source_FB__c != True AND Unit_Sold_FB__c != True    AND Week_FB__c != True AND Year_FB__c != True AND SO_Number_FB__c != True  AND LOB_FB__c != True AND Gross_Sales_USD_FB__c != True AND Freight_Charge_USD_FB__c != True AND Production_Country_FB__c != True AND Label_FB__c != True AND Retailer_Brand_FB__c != True  AND Color_NF__c != True AND Market_NF__c != True    AND Company_NF__c != True AND selected_ui_values__c != True AND SO_Number_NF__c != True AND LOB_NF__c != True AND ExRate_to_USD_NF__c != True    AND ExRate_to_EUR_NF__c != True AND Calculation_Failed__c != True AND  Retailer_Brand_NF__c != True AND warning_consolidate_key__c != True AND Source_NF__c != True   AND wrong_date__c != True  AND Sub_Category_NF__c != TRUE AND Family_NF__c != true and Order_Type_NF__c != true and Production_Country_NF__c != true and Transaction_Currency_NF__c != true    
                                                           and Standard_Unit_Cost_100_EUR_FB__c != True and Standard_Unit_Cost_100_EUR_NF__c != True  and Standard_Unit_Cost_100_USD_FB__c != True and Standard_Unit_Cost_100_USD_NF__c != True and Standard_Unit_Ex_Work_Cost_100_EUR_NF__c != True and Standard_Unit_Ex_Work_Cost_100_EUR_FB__c != True and Standard_Unit_Ex_Work_Cost_100_USD_FB__c != True and Standard_Unit_Ex_Work_Cost_100_USD_NF__c != True and Standard_Unit_Industrial_Cost_100_EUR_FB__c != True and Standard_Unit_Industrial_Cost_100_EUR_NF__c != True and Standard_Unit_Industrial_Cost_100_USD_FB__c != True and Standard_Unit_Industrial_Cost_100_USD_NF__c != True   and Standard_Unit_Material_Cost_100_EUR_FB__c != True   and Standard_Unit_Material_Cost_100_EUR_NF__c != True  and Standard_Unit_Material_Cost_100_USD_FB__c != True and Standard_Unit_Material_Cost_100_USD_NF__c != True         
                                                           and Net_Unit_Price_100_EUR_FB__c != True  and Net_Unit_Price_100_EUR_NF__c != True  and Net_Unit_Price_100_FB__c != True  and Net_Unit_Price_100_NF__c != True and Final_Sales_Destination_FB__c != True and Final_Sales_Destination_NF__c != True and Local_Net_Unit_Pirce_NF__c != true AND Sales_Order_Date_FB__c != True AND Sales_Order_Date_NF__c != True AND Sales_Delivery_Date_FB__c != True AND Sales_Delivery_Date_NF__c != True AND Gross_Unit_Price_100_Local_Currency_FB__c != True AND Gross_Unit_Price_100_Local_Currency_NF__c != True AND Sales_Type_FB__c != True AND Sales_Type_NF__c != True AND  Sub_Category_FB__c != TRUE AND  Family_FB__c != true AND Net_Weight_KG_1000_FB__c != True AND Net_Weight_KG_1000_NF__c != True 
                                                           and  (Retailer_Check__c = true or Model_Check__c = true or UnitSoldCombination__c = true or UnitSoldCombinationNotFound__c = true or unit_sold_warning__c = true )];
            
            if(salesAdmin.size() > 0){
                Inventory_Transaction_Master__c updateReprocessingStatus = new Inventory_Transaction_Master__c();
                updateReprocessingStatus.Id = batchId;
                updateReprocessingStatus.Reprocessing__c = true ;
                update updateReprocessingStatus;
            } 
        }
        boolean containsWarning = false;
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        Sales_Transaction_Stage__c market = [SELECT Market__c FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c =: batchId LIMIT 1];
        Inventory_Transaction_Master__c query = [select Batch_No__c,upload_file_name__c,Batch_Status__c from Inventory_Transaction_Master__c where Id =: batchId ];
        String recCount = getTotalSalesTransactionRecords(batchId);
        String recCount1 = getTotalSalesTransactionErrorRecords(batchId);
        
        if(market !=null ){
            updateBatchStatus.Total_Row_Count__c = Integer.valueOf(recCount) - Integer.valueOf(recCount1);
            updateBatchStatus.Sales_Market__c = market.Market__c;
        }
        if(query != null){
            String batchStaus = query.Batch_Status__c;
            if(batchStaus.endsWithIgnoreCase('3 - Error In Data Validation')){
                containsWarning = true;
            }
        } 
        if(containsWarning){
            updateBatchStatus.Id = batchId;
            updateBatchStatus.Batch_Process__c='Completed';
            update updateBatchStatus;
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {userEmail};
                mail.setToAddresses(toAddresses);
            mail.setSenderDisplayName('Batch Processing');
            mail.setSubject('Sales Batch Process Completed , Ref Batch No :'+query.Batch_No__c);
            mail.setPlainTextBody('Hello,\n\n Your Sales File Upload process has been completed,\n Please proceed to the application and go to the File Upload Screen & Check the upload Status for next steps.. \n\n Warm Regards \n Admin');
            //Put the total records etc.. in the email body.
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }else{
            updateBatchStatus.Id = batchId;
            updateBatchStatus.Batch_Status__c='4 - Data Validation Successful';  
            system.debug('Batch_Status__c:::'+updateBatchStatus.Batch_Status__c);
            update updateBatchStatus; 
            Database.executeBatch(new AzureUserSalesFileUploadBatch(batchId,'SalesUserUploadedCSVFile',userEmail),1);
            
        }        
    }
    
     public boolean appendTheCSVFile(String batchId,List<Sales_Transaction_Stage__c> salesTransStageForCSV){
        getSalesMasterData getMastData = new getSalesMasterData();
        Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Sales_Month__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c from Inventory_Transaction_Master__c where Id =: batchId ];
        String fileDelimiter = invTransMast.File_Delimiters__c;
        boolean createStatus = true;
        boolean createUserStatus = true;
        
        String csvFile;
        String csvUserFile;
        String csvColumnHeader = '';
        string csvUserColumnHeader = '';
        String contentType = 'text/plain';
        String fileName = invTransMast.Sales_Company__c+'+'+invTransMast.Sales_Month__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'.csv';
        
        List<String> csvRowValues = generateCSVRow(salesTransStageForCSV,batchId,fileDelimiter,true);
        String conVerTitle = 'SalesSuccessCSVFile';
        List<ContentVersion> conVerList =  getMastData.getContentDocumentVerIds(batchId,conVerTitle);
        if(conVerList.size() == 0){
            
           
              //csvColumnHeader = 'Company'+','+'Year'+','+'Week'+','+'Month'+','+'Item code'+','+'Material'+','+'Source'+','+'Model'+','+'Printed_Logo'+','+'Color'+','+'Customer'+','+'Customer local name'+','+'Mainetti_Brand'+','+'Category'+','+'Product Category'+','+'Sub-Category'+','+'Family'+','+'Order_Type'+','+'Units Sold'+','+'Unit Price / 100(EUR)'+','+'Unit Price / 100(USD)'+','+'Standard Unit Prime Cost / 100(EUR)'+','+'Standard Unit Prime Cost / 100(USD)'+','+'Standard Unit Industrial Cost / 100(EUR)'+','+'Standard Unit Industrial Cost / 100(USD)'+','+'Standard Unit Ex-Work Cost / 100(EUR)'+','+'Standard Unit Ex-Work Cost / 100(USD)' +','+'Net Unit Price/100(EUR)'+','+'Net Unit Price/100(USD)'+','+'Sales EUR'+','+'Sales USD'+','+'Transaction Currency'+','+'Exchange Rate to 1 EUR'+','+'Exchange Rate to 1 USD'+','+'Local Net Unit Price/100'+','+'Gross Unit Price/100 (Local Currency)'+','+'Sales (Transaction Currency)'+','+'Shipped To - Factory'+','+'Shipped To - Country'+','+'Label'+','+'End-user'+','+'Vendor'+','+'Division'+','+'Retailer_Brand'+','+'Royalty Rate'+','+'Market'+','+'Segment'+','+'Remark'+','+'LOB'+','+'SO_Number'+','+'Production Country'+','+'Gross Sales (USD)'+','+'Freight Charge (USD)'+','+'Retailer Country'+'Retailer Type'+','+','+'Batch No'+','+'salesType'+','+'Final Sales Destination'+','+'Order Date'+','+'Delivery Date'+','+'Region\n';
              csvColumnHeader = 'Company'+','+'Year'+','+'Week'+','+'Month'+','+'Local Item code'+','+'Material'+','+'Source'+','+'Model'+','+'Print'+','+'Color'+','+'Customer'+','+'Customer local name'+','+'Mainetti_Brand'+','+'Business Vertical'+','+'Product Category'+','+'Sub-Category'+','+'Family'+','+'Order_Type'+','+'Units Sold'+','+'Net Weight(KG) / 1000'+','+'Gross Unit Price / 100(EUR)'+','+'Gross Unit Price / 100(USD)'+','+'Standard Unit Prime Cost / 100(EUR)'+','+'Standard Unit Prime Cost / 100(USD)'+','+'Standard Unit Industrial Cost / 100(EUR)'+','+'Standard Unit Industrial Cost / 100(USD)'+','+'Standard Unit Ex-Work Cost / 100(EUR)'+','+'Standard Unit Ex-Work Cost / 100(USD)' +','+'Net Unit Price/100(EUR)'+','+'Net Unit Price/100(USD)'+','+'Gross Sales EUR'+','+'Gross Sales USD'+','+'Local Currency'+','+' Local Currency Exchange Rate to 1 EUR'+','+'Local Currency Exchange Rate to 1 USD'+','+'Net Unit Price/100 (Local Currency)'+','+'Gross Unit Price/100 (Local Currency)'+','+'Gross Sales Local Currency'+','+'Shipped To - Factory'+','+'Shipped To - Country'+','+'Label'+','+'End-user'+','+'Retailer'+','+'Division'+','+'Retailer_Brand'+','+'Royalty Rate'+','+'Market'+','+'Segment'+','+'Remark'+','+'LOB'+','+'SO_Number'+','+'PO_Number'+','+'Production Country'+','+'Total Selling Price (USD)'+','+'Freight and others Charge (USD)'+','+'Retailer Country'+','+'Retailer Type'+','+'Batch No'+','+'Sales_Type'+','+'Final Sales Destination'+','+'Order Date'+','+'Delivery Date'+','+'Region'+','+'Cogs Country'+','+'Company Group Name'+','+'Nomination'+','+'Standard Unit Material Cost / 100(EUR)'+','+'Standard Unit Material Cost / 100(USD)\n'; 
        }
         //System.debug('Before CSV FILE Clearing  => '+Limits.getHeapSize());
        csvFile = csvColumnHeader + String.join(csvRowValues,'\n');         
        //system.debug('csvFile:::'+csvFile +'    size ::::  '+ csvFile.length());
        boolean delStatus =  getMastData.deleteCSVFile(batchId);
        createStatus = new getSalesMasterData().createDocument(batchId,csvFile,fileName,conVerTitle);
         csvFile = null;
         salesTransStageForCSV = NULL;
        // System.debug('after CSV FILE Clearing  => '+Limits.getHeapSize());
        return  createStatus ;
    }
 
    
     global List<String>  generateCSVRow(List<Sales_Transaction_Stage__c> salesTransStageForCSV, String batchId,String fileDelimiter,boolean userfile){
        List<String> csvRowValues = new List<String>(); 
        for(Sales_Transaction_Stage__c saleTranStage : salesTransStageForCSV){
            
            String company = saleTranStage.Company__c != null ? saleTranStage.Company__c : '';
            String year = saleTranStage.Year__c != null ? saleTranStage.Year__c : '';
            String week = saleTranStage.Week__c != null ? saleTranStage.Week__c : '';
            String month = saleTranStage.Month__c != null ? saleTranStage.Month__c : '';
            String itemCode = saleTranStage.Item_code__c != null ? saleTranStage.Item_code__c : '';
            String material = saleTranStage.Material__c != null ? saleTranStage.Material__c : '';
            String source = saleTranStage.Source__c != null ? saleTranStage.Source__c : '';
            String model = saleTranStage.Model__c != null ? saleTranStage.Model__c : '';
            String printedLogo = saleTranStage.Printed_Logo__c != null ? saleTranStage.Printed_Logo__c : '';
            String color = saleTranStage.Color__c != null ? saleTranStage.Color__c : '';
            String customer = saleTranStage.Customer__c != null ? saleTranStage.Customer__c : '';
            String customerLocalName = saleTranStage.Customer_local_name__c != null ? saleTranStage.Customer_local_name__c : '';
            String mainettiBrand = saleTranStage.Mainetti_Brand__c != null ? saleTranStage.Mainetti_Brand__c : '';
            String category = saleTranStage.Category__c != null ? saleTranStage.Category__c : '';
            String subCategory = saleTranStage.Sub_Category__c != null ? saleTranStage.Sub_Category__c : '';
            //   Added by Sai 25-08-2020 Starting
            String productCategory = saleTranStage.ProductCategory__c != null ? saleTranStage.ProductCategory__c : '';
            String family = saleTranStage.Family__c != null ? saleTranStage.Family__c : '';
            String orderType = saleTranStage.Order_Type__c != null ? saleTranStage.Order_Type__c : '';
            String unitSold = saleTranStage.Unit_Sold__c != null ? saleTranStage.Unit_Sold__c : '';
            String NetWeightKG1000 = saleTranStage.Net_Weight_KG_1000__c != null ? saleTranStage.Net_Weight_KG_1000__c : '';
            String unitPrice100EUR = saleTranStage.Unit_Price_100_EUR__c != null ? saleTranStage.Unit_Price_100_EUR__c : '';
            String unitPrice100USD = saleTranStage.Unit_Price_100_USD__c != null ? saleTranStage.Unit_Price_100_USD__c : '';
            String netUnitPrice100USD = saleTranStage.Net_Unit_Price_100__c != null ? saleTranStage.Net_Unit_Price_100__c : '';
            String salesEUR = saleTranStage.Sales_EUR__c != null ? saleTranStage.Sales_EUR__c : '';
            String salesUSD = saleTranStage.Sales_USD__c != null ? saleTranStage.Sales_USD__c : '';
            String transactionCurrency = saleTranStage.Transaction_Currency__c != null ? saleTranStage.Transaction_Currency__c : '';
            String exRateToEUR = saleTranStage.ExRate_to_EUR__c != null ? saleTranStage.ExRate_to_EUR__c : '';
            String exRateToUSD = saleTranStage.ExRate_to_USD__c != null ? saleTranStage.ExRate_to_USD__c : '';
            String localNetUnitPirce100 = saleTranStage.Local_Net_Unit_Pirce_100__c != null ? saleTranStage.Local_Net_Unit_Pirce_100__c : '';
            String salesTransactionCurrency = saleTranStage.Sales_Transaction_Currency__c != null ? saleTranStage.Sales_Transaction_Currency__c : '';
            String shippedToFactory = saleTranStage.Shipped_To_Factory__c != null ? saleTranStage.Shipped_To_Factory__c : '';
            String shippedToCountry = saleTranStage.Shipped_To_Country__c != null ? saleTranStage.Shipped_To_Country__c : '';
            String label = saleTranStage.Label__c != null ? saleTranStage.Label__c : '';
            String enduse = saleTranStage.End_user__c != null ? saleTranStage.End_user__c : '';
            String vendor = saleTranStage.Vendor__c != null ? saleTranStage.Vendor__c : '';
            String division = saleTranStage.Division__c != null ? saleTranStage.Division__c : '';
            String retailerBrand = saleTranStage.Retailer_Brand__c != null ? saleTranStage.Retailer_Brand__c : '';
            String royaltyRate = saleTranStage.Royalty_Rate__c != null ? saleTranStage.Royalty_Rate__c : '0';
            String market = saleTranStage.Market__c != null ? saleTranStage.Market__c : '';
            //   Added by Sai 25-08-2020 Starting
            String segment = saleTranStage.Segments__c != null ? saleTranStage.Segments__c : '';
            String remark = saleTranStage.Remark__c != null ? saleTranStage.Remark__c : '';
            String lob = saleTranStage.LOB__c != null ? saleTranStage.LOB__c : '';
            String soNumber = saleTranStage.SO_Number__c != null ? saleTranStage.SO_Number__c : '';
            String poNumber = saleTranStage.PO_Number__c != null ? saleTranStage.PO_Number__c : '';
            //system.debug('poNumber>>>>>'+poNumber);
            String productionCountry = saleTranStage.Production_Country__c != null ? saleTranStage.Production_Country__c : '';
            String grossSalesUSD = saleTranStage.Gross_Sales_USD__c != null ? saleTranStage.Gross_Sales_USD__c : '';
            String freightChargeUSD = saleTranStage.Freight_Charge_USD__c != null ? saleTranStage.Freight_Charge_USD__c : ''; 
            //   Added by Sai 25-08-2020 Ending
            String retailerCountry = saleTranStage.Retailer_Country__c != null ? saleTranStage.Retailer_Country__c : ''; 
            //   Added by darshan 25-08-2020 Ending
            String retailerType = saleTranStage.Retailer_Type__c != null ? saleTranStage.Retailer_Type__c : ''; 
            String batchNo = saleTranStage.Batch_No__c != null ? saleTranStage.Batch_No__c : '';   
            // Added by Sai 21-09-2020
            String salesType = saleTranStage.Sales_Type__c != null ? saleTranStage.Sales_Type__c : '';
            //Added on 23-10-2020 for issue 80
            String doubleQuoteCustomer = customer.replaceAll('"','""');
            String doubleQuoteItemcode = itemCode.replaceAll('"','""');
            String doubleQuoteMaterial = material.replaceAll('"','""');
            String doubleQuotePrintedLogo = printedLogo.replaceAll('"','""');
            String doubleQuoteModel = model.replaceAll('"','""');
            String doubleQuoteColor = color.replaceAll('"','""');
            String doubleQuoteCustomerLocalName = customerLocalName.replaceAll('"','""');
            String doubleQuoteMainettiBrand = mainettiBrand.replaceAll('"','""');
            String doubleQuoteShippedToFactory = shippedToFactory.replaceAll('"','""');
            String doubleQuoteShippedToCountry = shippedToCountry.replaceAll('"','""');
            String doubleQuoteLabel = label.replaceAll('"','""');
            String doubleQuoteEnduse = enduse.replaceAll('"','""');
            String doubleQuoteDivision = division.replaceAll('"','""');
            String doubleQuoteRetailerBrand = retailerBrand.replaceAll('"','""');
            String doubleQuoteRemark = remark.replaceAll('"','""');
            String doubleQuoteLob = lob.replaceAll('"','""');
            String doubleQuoteRoyaltyRate = royaltyRate.replaceAll('"','""');
            String doubleQuoteSoNumber = soNumber.replaceAll('"','""');
             String doubleQuotePoNumber = poNumber.replaceAll('"','""');
                //system.debug('doubleQuotePoNumber>>>>>'+doubleQuotePoNumber);
            String doubleQuoteProductionCountry = productionCountry.replaceAll('"','""');
            // Added by Sai 20-11-2020
            String standardUnitCost100EUR = saleTranStage.Standard_Unit_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Cost_100_EUR__c : '';
            String standardUnitCost100USD = saleTranStage.Standard_Unit_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Cost_100_USD__c : '';
            String netUnitPrice100EUR = saleTranStage.Net_Unit_Price_100_EUR__c != null ? saleTranStage.Net_Unit_Price_100_EUR__c : '';
            String standardUnitMaterialCostEUR = saleTranStage.Standard_Unit_Material_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Material_Cost_100_EUR__c : '';
             String standardUnitMaterialCostUSD = saleTranStage.Standard_Unit_Material_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Material_Cost_100_USD__c : '';
            
            // Added by Bharath 12-01-2021
            String standardUnitIndustrialCost100EUR = saleTranStage.Standard_Unit_Industrial_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Industrial_Cost_100_EUR__c : '';
            String standardUnitIndustrialCost100USD = saleTranStage.Standard_Unit_Industrial_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Industrial_Cost_100_USD__c : '';
            String standardUnitEXWorkCost100EUR = saleTranStage.Standard_Unit_Ex_Work_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Ex_Work_Cost_100_EUR__c : '';
            String standardUnitEXWorkCost100USD = saleTranStage.Standard_Unit_Ex_Work_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Ex_Work_Cost_100_USD__c : '';
            String finalSalesDestination	 = saleTranStage.Final_Sales_Destination__c != null ? saleTranStage.Final_Sales_Destination__c : '';
            
            // Added by Bharath 12-05-2021
             String salesOrderDate = saleTranStage.Sales_Order_Date__c != null ? saleTranStage.Sales_Order_Date__c : '';
            String salesDeliveryDate = saleTranStage.Sales_Delivery_Date__c != null ? saleTranStage.Sales_Delivery_Date__c : '';
             // Added by Bharath 10-06-2021
              String grossUnitPirce100 = saleTranStage.Gross_Unit_Price_100_Local_Currency__c != null ? saleTranStage.Gross_Unit_Price_100_Local_Currency__c : '';
        //    system.debug('saleTranStage.Region__c ::'+saleTranStage.Region__c);
            String region = '';
             String CogsCountry = '';
             String CompanyGroupName = '';
             String Nomination = '';
            if(saleTranStage.Region__c != null){
          //  string Region = saleTranStage.Region__c != null ? saleTranStage.Region__c : '';
             region = saleTranStage.Region__c ;
        }
             if(saleTranStage.Cogs_Country__c != null){
           CogsCountry = saleTranStage.Cogs_Country__c ;
        }
             if(saleTranStage.Company_Group_Name__c != null){
            CompanyGroupName = saleTranStage.Company_Group_Name__c ;
        }
        if(saleTranStage.Nomination__c != null){
            Nomination = saleTranStage.Nomination__c ;
         }
        

              system.debug('Nomination ::'+Nomination);
            
           // String rowStr = '"'+ company + '","' + year + '","' + week + '","' + month + '","' + doubleQuoteItemcode + '","' + doubleQuoteMaterial + '","' + source + '","' + doubleQuoteModel + '","' + doubleQuotePrintedLogo + '","' + doubleQuoteColor + '","' +doubleQuoteCustomer + '","' + doubleQuoteCustomerLocalName + '","' + doubleQuoteMainettiBrand + '","' + category + '","'+productCategory+'","' + subCategory + '","' + family + '","' + orderType + '","' + unitSold + '","' +  unitPrice100EUR + '","' + unitPrice100USD + '","'  + standardUnitCost100EUR + '","' + standardUnitCost100USD  + '","' + standardUnitIndustrialCost100EUR  + '","' + standardUnitIndustrialCost100USD  + '","' + standardUnitEXWorkCost100EUR  + '","' + standardUnitEXWorkCost100USD + '","' + netUnitPrice100EUR + '","' + netUnitPrice100USD + '","' + salesEUR + '","' + salesUSD + '","' + transactionCurrency + '","' + exRateToEUR + '","' + exRateToUSD + '","' + localNetUnitPirce100 + '","' + salesTransactionCurrency + '","' + doubleQuoteShippedToFactory + '","' + doubleQuoteShippedToCountry + '","' + doubleQuoteLabel + '","' + doubleQuoteEnduse + '","' + vendor  + '","' +  doubleQuoteDivision + '","' + doubleQuoteRetailerBrand + '","' + doubleQuoteRoyaltyRate + '","' + market +'","'+ segment + '","' + doubleQuoteRemark + '","' + doubleQuoteLob + '","' + doubleQuoteSoNumber + '","' + doubleQuoteProductionCountry  + '","' + grossSalesUSD + '","' + freightChargeUSD + '","'+ retailerCountry + '","' + batchNo + '","' + salesType + '","' + finalSalesDestination + '","'+ salesOrderDate  + '","'+salesDeliveryDate +'"';
                 // String rowStr = '"'+ company + '","' + year + '","' + week + '","' + month + '","' + doubleQuoteItemcode + '","' + doubleQuoteMaterial + '","' + source + '","' + doubleQuoteModel + '","' + doubleQuotePrintedLogo + '","' + doubleQuoteColor + '","' +doubleQuoteCustomer + '","' + doubleQuoteCustomerLocalName + '","' + doubleQuoteMainettiBrand + '","' + category + '","'+productCategory+'","' + subCategory + '","' + family + '","' + orderType + '","' + unitSold + '","' +  unitPrice100EUR + '","' + unitPrice100USD + '","'  + standardUnitCost100EUR + '","' + standardUnitCost100USD  + '","' + standardUnitIndustrialCost100EUR  + '","' + standardUnitIndustrialCost100USD  + '","' + standardUnitEXWorkCost100EUR  + '","' + standardUnitEXWorkCost100USD + '","' + netUnitPrice100EUR + '","' + netUnitPrice100USD + '","' + salesEUR + '","' + salesUSD + '","' + transactionCurrency + '","' + exRateToEUR + '","' + exRateToUSD + '","' + localNetUnitPirce100 + '","' + grossUnitPirce100 + '","' + salesTransactionCurrency + '","' + doubleQuoteShippedToFactory + '","' + doubleQuoteShippedToCountry + '","' + doubleQuoteLabel + '","' + doubleQuoteEnduse + '","' + vendor  + '","' +  doubleQuoteDivision + '","' + doubleQuoteRetailerBrand + '","' + doubleQuoteRoyaltyRate + '","' + market +'","'+ segment + '","' + doubleQuoteRemark + '","' + doubleQuoteLob + '","' + doubleQuoteSoNumber + '","' + doubleQuoteProductionCountry  + '","' + grossSalesUSD + '","' + freightChargeUSD + '","'+ retailerCountry + '","' + batchNo + '","' + salesType + '","' + finalSalesDestination + '","'+ salesOrderDate  + '","'+salesDeliveryDate +'","'+Region +'"';
                 String rowStr = '"'+ company + '","' + year + '","' + week + '","' + month + '","' + doubleQuoteItemcode + '","' + doubleQuoteMaterial + '","' + source + '","' + doubleQuoteModel + '","' + doubleQuotePrintedLogo + '","' + doubleQuoteColor + '","' +doubleQuoteCustomer + '","' + doubleQuoteCustomerLocalName + '","' + doubleQuoteMainettiBrand + '","' + category + '","'+productCategory+'","' + subCategory + '","' + family + '","' + orderType + '","' + unitSold + '","' + NetWeightKG1000 + '","' +  unitPrice100EUR + '","' + unitPrice100USD + '","'  + standardUnitCost100EUR + '","' + standardUnitCost100USD  + '","' + standardUnitIndustrialCost100EUR  + '","' + standardUnitIndustrialCost100USD  + '","' + standardUnitEXWorkCost100EUR  + '","' + standardUnitEXWorkCost100USD + '","' + netUnitPrice100EUR + '","' + netUnitPrice100USD + '","' + salesEUR + '","' + salesUSD + '","' + transactionCurrency + '","' + exRateToEUR + '","' + exRateToUSD + '","' + localNetUnitPirce100 + '","' + grossUnitPirce100 + '","' + salesTransactionCurrency + '","' + doubleQuoteShippedToFactory + '","' + doubleQuoteShippedToCountry + '","' + doubleQuoteLabel + '","' + doubleQuoteEnduse + '","' + vendor  + '","' +  doubleQuoteDivision + '","' + doubleQuoteRetailerBrand + '","' + doubleQuoteRoyaltyRate + '","' + market +'","'+ segment + '","' + doubleQuoteRemark + '","' + doubleQuoteLob + '","' + doubleQuoteSoNumber + '","' + doubleQuotePoNumber + '","' + doubleQuoteProductionCountry  + '","' + grossSalesUSD + '","' + freightChargeUSD + '","'+ retailerCountry + '","'+ retailerType + '","' + batchNo + '","' + salesType + '","' + finalSalesDestination + '","'+ salesOrderDate  + '","'+salesDeliveryDate +'","'+Region +'","'+CogsCountry +'","'+CompanyGroupName +'","'+Nomination +'","'+standardUnitMaterialCostEUR +'","'+standardUnitMaterialCostUSD +'"';
            csvRowValues.add(rowStr); 
        }
        salesTransStageForCSV = null;
        return csvRowValues;
    } 
    
    public String getTotalSalesTransactionRecords(String batchId){
        String recCount='';    
        AggregateResult[] groupedResults = [select  Count(Id) recCount from Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=: batchId];
        for (AggregateResult ar : groupedResults)  {
            recCount = String.valueOf(ar.get('recCount'));
          //  system.debug('recCount:::'+recCount);
             //system.debug('recCount:::'+recCount);
        }      
        return recCount;
    } 
    
    public String getTotalSalesTransactionErrorRecords(string batchid){
        String recCount1='';
        AggregateResult[] groupedResults = [select  Count(Id) recCount1 from Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=: batchId and Record_Status__c = '1 - Error In Data Validation'];
        
        for (AggregateResult ar : groupedResults)  {
            recCount1 = String.valueOf(ar.get('recCount1'));
           // system.debug('recCount1:::'+recCount1);
        }      
        return recCount1;
    }
    
    // added by sai 12-07-2021
    public boolean appendTheUserUploadedCSVFile(String batchId,List<Sales_Transaction_Stage__c> salesTransStageForCSV){
        getSalesMasterData getMastData = new getSalesMasterData();
        Inventory_Transaction_Master__c invTransMast = [select Sales_Company__c, Sales_Month__c, Sales_Year__c,Batch_No__c,upload_file_name__c,Batch_Status__c,File_Delimiters__c from Inventory_Transaction_Master__c where Id =: batchId ];
        String fileDelimiter = invTransMast.File_Delimiters__c;
        boolean createStatus = true;
        
        String csvFile;
        String csvColumnHeader = '';
        String contentType = 'text/plain';
        String fileName = invTransMast.Sales_Company__c+'+'+invTransMast.Sales_Month__c+'+'+invTransMast.Sales_Year__c +'+'+invTransMast.Batch_No__c+'User.csv';
        
        List<String> csvRowValues = generateUserUploadedCSVRow(salesTransStageForCSV,batchId,fileDelimiter);
        //system.debug('csvRowValues   size ::::'+csvRowValues.size());
        String conVerTitle = 'SalesUserUploadedCSVFile';
        List<ContentVersion> conVerList =  getMastData.getContentDocumentVerIds(batchId,conVerTitle);
        if(conVerList.size() == 0){
            
           // csvColumnHeader = 'Company'+','+'Year'+','+'Week'+','+'Month'+','+'Item code'+','+'Material'+','+'Source'+','+'Model'+','+'Printed_Logo'+','+'Color'+','+'Customer'+','+'Customer local name'+','+'Mainetti_Brand'+','+'Category'+','+'Product Category'+','+'Sub-Category'+','+'Family'+','+'Order_Type'+','+'Units Sold'+','+'Unit Price / 100(EUR)'+','+'Unit Price / 100(USD)'+','+'Standard Unit Prime Cost / 100(EUR)'+','+'Standard Unit Prime Cost / 100(USD)'+','+'Standard Unit Industrial Cost / 100(EUR)'+','+'Standard Unit Industrial Cost / 100(USD)'+','+'Standard Unit Ex-Work Cost / 100(EUR)'+','+'Standard Unit Ex-Work Cost / 100(USD)' +','+'Net Unit Price/100(EUR)'+','+'Net Unit Price/100(USD)'+','+'Sales EUR'+','+'Sales USD'+','+'Transaction Currency'+','+'Exchange Rate to 1 EUR'+','+'Exchange Rate to 1 USD'+','+'Local Net Unit Price/100'+','+'Sales (Transaction Currency)'+','+'Shipped To - Factory'+','+'Shipped To - Country'+','+'Label'+','+'End-user'+','+'Vendor'+','+'Division'+','+'Retailer_Brand'+','+'Royalty Rate'+','+'Market'+','+'Segment'+','+'Remark'+','+'LOB'+','+'SO_Number'+','+'Production Country'+','+'Gross Sales (USD)'+','+'Freight Charge (USD)'+','+'Retailer Country'+','+','+'Batch No'+','+'salesType'+','+'Final Sales Destination\n';  
           csvColumnHeader = 'Company'+','+'Year'+','+'Week'+','+'Month'+','+'Local Item Code'+','+'Material'+','+'Source'+','+'Model'+','+'Print'+','+'Color'+','+'Customer'+','+'Customer local name'+','+'Mainetti_Brand'+','+'Business Vertical'+','+'Sub-Category'+','+'Family'+','+'Order_Type'+','+'Units Sold'+','+'Net Weight(KG) / 1000'+','+'Gross Unit Price / 100(EUR)'+','+'Gross Unit Price / 100(USD)'+','+'Standard Unit Prime Cost / 100(EUR)'+','+'Standard Unit Prime Cost / 100(USD)'+','+'Standard Unit Industrial Cost / 100(EUR)'+','+'Standard Unit Industrial Cost / 100(USD)'+','+'Standard Unit Ex-Work Cost / 100(EUR)'+','+'Standard Unit Ex-Work Cost / 100(USD)' +','+'Net Unit Price / 100(EUR)'+','+'Net Unit Price / 100(USD)'+','+'Gross Sales EUR'+','+'Gross Sales USD'+','+'Local Currency'+','+'Local Currency Exchange rate to 1 EUR'+','+'Local Currency Exchange Rate to 1 USD'+','+'Net Unit Price/100 (Local Currency)'+','+'Gross Unit Price/100 (Local Currency)'+','+'Gross Sales Local Currency'+','+'Shipped To - Factory'+','+'Shipped To - Country'+','+'Label'+','+'End-user'+','+'Retailer'+','+'Division'+','+'Retailer_Brand'+','+'Royalty Rate'+','+'Market'+','+'Remark'+','+'LOB'+','+'SO_Number'+','+'PO_Number'+','+'Production Country'+','+'Total Selling Price (USD)'+','+'Freight and others Charge (USD)'+','+'Sales_Type'+','+'Final Sales Destination'+','+'Order Date (DD-MMM-YYYY)'+','+'Delivery Date (DD-MMM-YYYY)'+','+'Standard Unit Material Cost / 100(EUR)'+','+'Standard Unit Material Cost / 100(USD)\n';  
          // csvColumnHeader = 'Company'+','+'Year'+','+'Week'+','+'Month'+','+'Local Item Code'+','+'Material'+','+'Source'+','+'Model'+','+'Print'+','+'Color'+','+'Customer'+','+'Customer local name'+','+'Mainetti_Brand'+','+'Business Vertical'+','+'Product Category'+','+'Sub-Category'+','+'Family'+','+'Order_Type'+','+'Units Sold'+','+'Gross Unit Price / 100(EUR)'+','+'Gross Unit Price / 100(USD)'+','+'Standard Unit Prime Cost / 100(EUR)'+','+'Standard Unit Prime Cost / 100(USD)'+','+'Standard Unit Industrial Cost / 100(EUR)'+','+'Standard Unit Industrial Cost / 100(USD)'+','+'Standard Unit Ex-Work Cost / 100(EUR)'+','+'Standard Unit Ex-Work Cost / 100(USD)' +','+'Net Unit Price/100(EUR)'+','+'Net Unit Price/100(USD)'+','+'Gross Sales EUR'+','+'Gross Sales USD'+','+'Local Currency'+','+'Local Currency Exchange rate to 1'+','+'Local Currency Exchange rate to 1'+','+'Net Unit Price/100 (Local Currency)'+','+'Gross Unit Price/100 (Local Currency)'+','+'Gross Sales Local Currency'+','+'Shipped To - Factory'+','+'Shipped To - Country'+','+'Label'+','+'End-user'+','+'Retailer'+','+'Division'+','+'Retailer_Brand'+','+'Royalty Rate'+','+'Market'+','+'Segment'+','+'Remark'+','+'LOB'+','+'SO_Number'+','+'Production Country'+','+'Total Selling Price (USD)'+','+'Freight and others Charge (USD)'+','+'Retailer Country'+','+','+'Batch No'+','+'Sales_Type'+','+'Final Sales Destination'+','+'Order Date'+','+'Delivery Date'+','+'Region\n';

        }
        // System.debug('Before USER CSV FILE Clearing  => '+Limits.getHeapSize());
        csvFile = csvColumnHeader + String.join(csvRowValues,'\n');
       // system.debug('csvFile:::'+csvFile);
        boolean delStatus =  getMastData.deleteCSVFile(batchId);
        createStatus = new getSalesMasterData().createDocument(batchId,csvFile,fileName,conVerTitle);
        csvFile = null;
        salesTransStageForCSV = NULL;
         //System.debug('After USER CSV FILE Clearing  => '+Limits.getHeapSize());
        return  createStatus ;
    } 
    
      
    global List<String>  generateUserUploadedCSVRow(List<Sales_Transaction_Stage__c> salesTransStageForCSV, String batchId,String fileDelimiter){
        List<String> csvRowValues = new List<String>();       
        for(Sales_Transaction_Stage__c saleTranStage : salesTransStageForCSV){
            
            String company = saleTranStage.Company__c != null ? saleTranStage.Company__c : '';
            String year = saleTranStage.Year__c != null ? saleTranStage.Year__c : '';
            String week = saleTranStage.Week__c != null ? saleTranStage.Week__c : '';
            String month = saleTranStage.Month__c != null ? saleTranStage.Month__c : '';
            String itemCode = saleTranStage.Item_code__c != null ? saleTranStage.Item_code__c : '';
            String material = saleTranStage.Material__c != null ? saleTranStage.Material__c : '';
            String source = saleTranStage.Source__c != null ? saleTranStage.Source__c : '';
            String model = saleTranStage.Model__c != null ? saleTranStage.Model__c : '';
            String printedLogo = saleTranStage.Printed_Logo__c != null ? saleTranStage.Printed_Logo__c : '';
            String color = saleTranStage.Color__c != null ? saleTranStage.Color__c : '';
            String customer = saleTranStage.Customer__c != null ? saleTranStage.Customer__c : '';
            String customerLocalName = saleTranStage.Customer_local_name__c != null ? saleTranStage.Customer_local_name__c : '';
            String mainettiBrand = saleTranStage.Mainetti_Brand__c != null ? saleTranStage.Mainetti_Brand__c : '';
            String category = saleTranStage.Category__c != null ? saleTranStage.Category__c : '';
            String subCategory = saleTranStage.Sub_Category__c != null ? saleTranStage.Sub_Category__c : '';
            //   Added by Sai 25-08-2020 Starting
            String productCategory = saleTranStage.ProductCategory__c != null ? saleTranStage.ProductCategory__c : '';
            String family = saleTranStage.Family__c != null ? saleTranStage.Family__c : '';
            String orderType = saleTranStage.Order_Type__c != null ? saleTranStage.Order_Type__c : '';
            String unitSold = saleTranStage.Unit_Sold__c != null ? saleTranStage.Unit_Sold__c : '';
            String NetWeightKG1000 = saleTranStage.Net_Weight_KG_1000__c != null ? saleTranStage.Net_Weight_KG_1000__c : '';
            String unitPrice100EUR = saleTranStage.Unit_Price_100_EUR__c != null ? saleTranStage.Unit_Price_100_EUR__c : '';
            String unitPrice100USD = saleTranStage.Unit_Price_100_USD__c != null ? saleTranStage.Unit_Price_100_USD__c : '';
            String netUnitPrice100USD = saleTranStage.Net_Unit_Price_100__c != null ? saleTranStage.Net_Unit_Price_100__c : '';
            String salesEUR = saleTranStage.Sales_EUR__c != null ? saleTranStage.Sales_EUR__c : '';
            String salesUSD = saleTranStage.Sales_USD__c != null ? saleTranStage.Sales_USD__c : '';
            String transactionCurrency = saleTranStage.Transaction_Currency__c != null ? saleTranStage.Transaction_Currency__c : '';
            String exRateToEUR = saleTranStage.ExRate_to_EUR__c != null ? saleTranStage.ExRate_to_EUR__c : '';
            String exRateToUSD = saleTranStage.ExRate_to_USD__c != null ? saleTranStage.ExRate_to_USD__c : '';
            String localNetUnitPirce100 = saleTranStage.Local_Net_Unit_Pirce_100__c != null ? saleTranStage.Local_Net_Unit_Pirce_100__c : '';
            String salesTransactionCurrency = saleTranStage.Sales_Transaction_Currency__c != null ? saleTranStage.Sales_Transaction_Currency__c : '';
            String shippedToFactory = saleTranStage.Shipped_To_Factory__c != null ? saleTranStage.Shipped_To_Factory__c : '';
            String shippedToCountry = saleTranStage.Shipped_To_Country__c != null ? saleTranStage.Shipped_To_Country__c : '';
            String label = saleTranStage.Label__c != null ? saleTranStage.Label__c : '';
            String enduse = saleTranStage.End_user__c != null ? saleTranStage.End_user__c : '';
            String vendor = saleTranStage.Vendor__c != null ? saleTranStage.Vendor__c : '';
            String division = saleTranStage.Division__c != null ? saleTranStage.Division__c : '';
            String retailerBrand = saleTranStage.Retailer_Brand__c != null ? saleTranStage.Retailer_Brand__c : '';
            String royaltyRate = saleTranStage.Royalty_Rate__c != null ? saleTranStage.Royalty_Rate__c : '0';
            String market = saleTranStage.Market__c != null ? saleTranStage.Market__c : '';
            //   Added by Sai 25-08-2020 Starting
            String segment = saleTranStage.Segments__c != null ? saleTranStage.Segments__c : '';
            String remark = saleTranStage.Remark__c != null ? saleTranStage.Remark__c : '';
            String lob = saleTranStage.LOB__c != null ? saleTranStage.LOB__c : '';
            String soNumber = saleTranStage.SO_Number__c != null ? saleTranStage.SO_Number__c : '';
            String poNumber = saleTranStage.PO_Number__c != null ? saleTranStage.PO_Number__c : '';
            system.debug('poNumber>>>>>'+poNumber);
            String doubleQuotePoNumber = poNumber.replaceAll('"','""');
            system.debug('doubleQuotePoNumber>>>>>'+doubleQuotePoNumber);
            String productionCountry = saleTranStage.Production_Country__c != null ? saleTranStage.Production_Country__c : '';
            String grossSalesUSD = saleTranStage.Gross_Sales_USD__c != null ? saleTranStage.Gross_Sales_USD__c : '';
            String freightChargeUSD = saleTranStage.Freight_Charge_USD__c != null ? saleTranStage.Freight_Charge_USD__c : ''; 
            //   Added by Sai 25-08-2020 Ending
            String retailerCountry = saleTranStage.Retailer_Country__c != null ? saleTranStage.Retailer_Country__c : ''; 
            String batchNo = saleTranStage.Batch_No__c != null ? saleTranStage.Batch_No__c : '';   
            // Added by Sai 21-09-2020
            String salesType = saleTranStage.Sales_Type__c != null ? saleTranStage.Sales_Type__c : '';
            //Added on 23-10-2020 for issue 80
            String doubleQuoteCustomer = customer.replaceAll('"','""');
            String doubleQuoteItemcode = itemCode.replaceAll('"','""');
            String doubleQuoteMaterial = material.replaceAll('"','""');
            String doubleQuotePrintedLogo = printedLogo.replaceAll('"','""');
            String doubleQuoteModel = model.replaceAll('"','""');
            String doubleQuoteColor = color.replaceAll('"','""');
            String doubleQuoteCustomerLocalName = customerLocalName.replaceAll('"','""');
            String doubleQuoteMainettiBrand = mainettiBrand.replaceAll('"','""');
            String doubleQuoteShippedToFactory = shippedToFactory.replaceAll('"','""');
            String doubleQuoteShippedToCountry = shippedToCountry.replaceAll('"','""');
            String doubleQuoteLabel = label.replaceAll('"','""');
            String doubleQuoteEnduse = enduse.replaceAll('"','""');
            String doubleQuoteDivision = division.replaceAll('"','""');
            String doubleQuoteRetailerBrand = retailerBrand.replaceAll('"','""');
            String doubleQuoteRemark = remark.replaceAll('"','""');
            String doubleQuoteLob = lob.replaceAll('"','""');
            String doubleQuoteRoyaltyRate = royaltyRate.replaceAll('"','""');
            String doubleQuoteSoNumber = soNumber.replaceAll('"','""');
            String doubleQuoteProductionCountry = productionCountry.replaceAll('"','""');
            // Added by Sai 20-11-2020
            String standardUnitCost100EUR = saleTranStage.Standard_Unit_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Cost_100_EUR__c : '';
            String standardUnitCost100USD = saleTranStage.Standard_Unit_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Cost_100_USD__c : '';
            String netUnitPrice100EUR = saleTranStage.Net_Unit_Price_100_EUR__c != null ? saleTranStage.Net_Unit_Price_100_EUR__c : '';
            String standardUnitMaterialCostEUR = saleTranStage.Standard_Unit_Material_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Material_Cost_100_EUR__c : '';
             String standardUnitMaterialCostUSD = saleTranStage.Standard_Unit_Material_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Material_Cost_100_USD__c : '';
            
            
            // Added by Bharath 12-01-2021
            String standardUnitIndustrialCost100EUR = saleTranStage.Standard_Unit_Industrial_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Industrial_Cost_100_EUR__c : '';
            String standardUnitIndustrialCost100USD = saleTranStage.Standard_Unit_Industrial_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Industrial_Cost_100_USD__c : '';
            String standardUnitEXWorkCost100EUR = saleTranStage.Standard_Unit_Ex_Work_Cost_100_EUR__c != null ? saleTranStage.Standard_Unit_Ex_Work_Cost_100_EUR__c : '';
            String standardUnitEXWorkCost100USD = saleTranStage.Standard_Unit_Ex_Work_Cost_100_USD__c != null ? saleTranStage.Standard_Unit_Ex_Work_Cost_100_USD__c : '';
            String finalSalesDestination	 = saleTranStage.Final_Sales_Destination__c != null ? saleTranStage.Final_Sales_Destination__c : '';
            
            // Added by Bharath 12-05-2021
             String salesOrderDate = saleTranStage.Sales_Order_Date__c != null ? saleTranStage.Sales_Order_Date__c : '';
            String salesDeliveryDate = saleTranStage.Sales_Delivery_Date__c != null ? saleTranStage.Sales_Delivery_Date__c : '';
             // Added by Bharath 10-06-2021
              String grossUnitPirce100 = saleTranStage.Gross_Unit_Price_100_Local_Currency__c != null ? saleTranStage.Gross_Unit_Price_100_Local_Currency__c : '';
        //    system.debug('saleTranStage.Region__c ::'+saleTranStage.Region__c);
            String region = '';
            if(saleTranStage.Region__c != null){
          //  string Region = saleTranStage.Region__c != null ? saleTranStage.Region__c : '';
             region = saleTranStage.Region__c ;
        }

            //  system.debug('Region ::'+Region);
            
           // String rowStr = '"'+ company + '","' + year + '","' + week + '","' + month + '","' + doubleQuoteItemcode + '","' + doubleQuoteMaterial + '","' + source + '","' + doubleQuoteModel + '","' + doubleQuotePrintedLogo + '","' + doubleQuoteColor + '","' +doubleQuoteCustomer + '","' + doubleQuoteCustomerLocalName + '","' + doubleQuoteMainettiBrand + '","' + category + '","'+productCategory+'","' + subCategory + '","' + family + '","' + orderType + '","' + unitSold + '","' +  unitPrice100EUR + '","' + unitPrice100USD + '","'  + standardUnitCost100EUR + '","' + standardUnitCost100USD  + '","' + standardUnitIndustrialCost100EUR  + '","' + standardUnitIndustrialCost100USD  + '","' + standardUnitEXWorkCost100EUR  + '","' + standardUnitEXWorkCost100USD + '","' + netUnitPrice100EUR + '","' + netUnitPrice100USD + '","' + salesEUR + '","' + salesUSD + '","' + transactionCurrency + '","' + exRateToEUR + '","' + exRateToUSD + '","' + localNetUnitPirce100 + '","' + salesTransactionCurrency + '","' + doubleQuoteShippedToFactory + '","' + doubleQuoteShippedToCountry + '","' + doubleQuoteLabel + '","' + doubleQuoteEnduse + '","' + vendor  + '","' +  doubleQuoteDivision + '","' + doubleQuoteRetailerBrand + '","' + doubleQuoteRoyaltyRate + '","' + market +'","'+ segment + '","' + doubleQuoteRemark + '","' + doubleQuoteLob + '","' + doubleQuoteSoNumber + '","' + doubleQuoteProductionCountry  + '","' + grossSalesUSD + '","' + freightChargeUSD + '","'+ retailerCountry + '","' + batchNo + '","' + salesType + '","' + finalSalesDestination + '","'+ salesOrderDate  + '","'+salesDeliveryDate +'"';
           String rowStr = '"'+ company + '","' + year + '","' + week + '","' + month + '","' + doubleQuoteItemcode + '","' + doubleQuoteMaterial + '","' + source + '","' + doubleQuoteModel + '","' + doubleQuotePrintedLogo + '","' + doubleQuoteColor + '","' +doubleQuoteCustomer + '","' + doubleQuoteCustomerLocalName + '","' + doubleQuoteMainettiBrand + '","' + category + '","' + subCategory + '","' + family + '","' + orderType + '","' + unitSold + '","' + NetWeightKG1000 + '","' +  unitPrice100EUR + '","' + unitPrice100USD + '","'  + standardUnitCost100EUR + '","' + standardUnitCost100USD  + '","' + standardUnitIndustrialCost100EUR  + '","' + standardUnitIndustrialCost100USD  + '","' + standardUnitEXWorkCost100EUR  + '","' + standardUnitEXWorkCost100USD + '","' + netUnitPrice100EUR + '","' + netUnitPrice100USD + '","' + salesEUR + '","' + salesUSD + '","' + transactionCurrency + '","' + exRateToEUR + '","' + exRateToUSD + '","' + localNetUnitPirce100 + '","' + grossUnitPirce100 + '","' + salesTransactionCurrency + '","' + doubleQuoteShippedToFactory + '","' + doubleQuoteShippedToCountry + '","' + doubleQuoteLabel + '","' + doubleQuoteEnduse + '","' + vendor  + '","' +  doubleQuoteDivision + '","' + doubleQuoteRetailerBrand + '","' + doubleQuoteRoyaltyRate + '","' + market + '","' + doubleQuoteRemark + '","' + doubleQuoteLob + '","' + doubleQuoteSoNumber + '","' + doubleQuotePoNumber + '","' + doubleQuoteProductionCountry  + '","' + grossSalesUSD + '","' + freightChargeUSD + '","' + salesType + '","' + finalSalesDestination + '","'+ salesOrderDate  + '","'+salesDeliveryDate  + '","'+standardUnitMaterialCostEUR  + '","'+standardUnitMaterialCostUSD +'"';
          // String rowStr = '';
            csvRowValues.add(rowStr); 
        }
        salesTransStageForCSV = null;
        return csvRowValues;
    }  
    
}