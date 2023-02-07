public  class getSalesMasterData {
    
    public  Map<string,string> getPickListMap(String objectName,String fieldName){
        Map<string,string> pickListValMap = new Map<string,string>();
        Schema.SObjectType tarType = Schema.getGlobalDescribe().get(objectName); 
        Sobject objectnamee = tarType.newSObject();                 
        Schema.sObjectType sobjecttype = objectnamee.getSObjectType(); 
        Schema.DescribeSObjectResult sobjectdescribe = sobjecttype.getDescribe(); 
        Map<String, Schema.SObjectField> fieldmap = sobjectdescribe.fields.getMap();        
        List<Schema.PicklistEntry> picklistvalues = fieldmap.get(fieldName).getDescribe().getPickListValues();        
        for (Schema.PicklistEntry a : picklistvalues) { 
            String colorPicklist = a.getValue();
            pickListValMap.put(colorPicklist.toUpperCase(),colorPicklist.toUpperCase());
            // system.debug('pickListValMap::::'+pickListValMap);
        }
        return pickListValMap; 
    }
    
    public   map<string,string> getManitteCompanyPicklistMap()
    {
        list<Partner__c> partner = new list<Partner__c>();
        Map<string,string> mainettiCompanyMap = new Map<string,string>();        
        partner = [Select  Name, Default_Order_to_Company__c from Partner__c where Default_Order_to_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner') order by Name]; 
        for ( Partner__c ptn : partner ){
            mainettiCompanyMap.put(ptn.Name,ptn.Default_Order_to_Company__c);            
        }             
        return mainettiCompanyMap;
    }
    
    
    public List<Sales_Transaction_Stage__c> getSalesStageRows(String batchId){
        List<Sales_Transaction_Stage__c> salesTransStagRec = new List<Sales_Transaction_Stage__c>();
        if(!String.isBlank(batchId)){
            salesTransStagRec = [Select Record_Status__c,Label__c,Printed_Logo__c,unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Year_FB__c,Week_FB__c,Source_FB__c,Local_Net_Unit_Pirce_100__c,Net_Unit_Price_100__c,Month_FB__c,Local_Net_Unit_Pirce_FB__c,Calculation_Failed__c,ExRate_to_USD_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_EUR_FB__c,wrong_date__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c,Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c,Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c,Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c,Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c,Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c,Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,Sales_Model__c,SM_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c,ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c,Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c from Sales_Transaction_Stage__c where Upload_Batch_No__c=:batchId];
        }
        return salesTransStagRec; 
    }
    public List<Sales_Transaction_Stage__c> getSalesStageRowsByPage(List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation,String BatchId, string selcomp,string selMonth,string selYear,Map<Decimal,Map<string,string>>inCorrectFormatMap,Map<string,string> marketMap,Map<string,string>modelCompKeyMap,Map<string,string>vendorMap,Inventory_Transaction_Master__c updateBatchStatus,validateSalesRowsBulk.recordValidationStatus recordStatus,Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap,Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap, Map<string,List<string>> getModelandColorMap,Map<string,string> getSalesDataUploadCheckMap ,Map<string,string> getSalesDataUploadColorCheckMap ,Map<string,string> getModelCatFamilyMap,Map<string,string> modelwithCatSubCatFamily,Map<string,string> currencyPicklist,Map<string,string> orderTypePicklist,Map<string,string> checkVendorCategory,Map<string,List<string>> checkVendorModel,Map<string,string> productionCountryPicklist,Map<string,string> productionCoungtryMap,Map<string,string> modelCategory,Map<string,string> autoPopulateRetailerCountryMap,Map<string,string> autoPopulateMarketSegmentMap,Map<string,string> finalsalesdestinationPicklist, Map<string,String> getSalesOderDateCheckMap,Map<string,String> getSalesDeliveryDateCheckMap,Map<string,string> pricebookprintCheckMap ){
        //system.debug('reconcilseData>>'+salesTransStagRecAfterReconciliation);
        return new processSalesData().processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);          
    }  
    public List<Sales_Transaction_Stage__c> preValidationSalesStageDataByPage(List<Sales_Transaction_Stage__c> salesTransStagRecForReconciliation,Map<string,Map<string,Map<string,string>>> fullSalesErrorMap,String BatchId,string selcomp,string selMonth,string selYear,Map<Decimal,Map<string,string>>inCorrectFormatMap,Map<string,string> marketMap,Map<string,string>modelCompKeyMap,Map<string,string>vendorMap,Inventory_Transaction_Master__c updateBatchStatus,validateSalesRowsBulk.recordValidationStatus recordStatus,Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap,Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap, Map<string,List<string>> getModelandColorMap,Map<string,string> getSalesDataUploadCheckMap ,Map<string,string> getSalesDataUploadColorCheckMap,Map<string,string> getModelCatFamilyMap,Map<string,string> modelwithCatSubCatFamily,Map<string,string> currencyPicklist,Map<string,string> orderTypePicklist,Map<string,string> checkVendorCategory,Map<string,List<string>> checkVendorModel,Map<string,string> productionCountryPicklist,Map<string,string> productionCoungtryMap,Map<string,string> modelCategory,Map<string,string> autoPopulateRetailerCountryMap,Map<string,string> autoPopulateMarketSegmentMap,Map<string,string> finalsalesdestinationPicklist, Map<string,String> getSalesOderDateCheckMap,Map<string,String> getSalesDeliveryDateCheckMap,Map<string,string> pricebookprintCheckMap){
        List<Sales_Transaction_Stage__c> reconcilseData =  new processSalesData().reconcileDataWithSalesErrorMapBulk(salesTransStagRecForReconciliation,fullSalesErrorMap);
        //system.debug('reconcilseData>>'+reconcilseData);
        //system.debug('salesTransStagRecForReconciliation>>'+salesTransStagRecForReconciliation);
        List<Sales_Transaction_Stage__c> finalUpdateData= getSalesStageRowsByPage(reconcilseData, batchid,  selcomp, selMonth, selYear,inCorrectFormatMap, marketMap,modelCompKeyMap,vendorMap, updateBatchStatus, recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap, modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap, finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);  
        //system.debug('<>'+finalUpdateData);
        return finalUpdateData;
    }
    public List<Sales_Transaction_Stage__c> preValidationSalesStageData(string batchid){
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
                                                           Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c from Sales_Transaction_Stage__c where Upload_Batch_No__c=:BatchId]; 
        
        return fetchSuccessdata;
    }
    /* Reterieveing the file from  the contentverion for upload into Azure */
    public  List<ContentVersion> getContentDocumentVerIds(String batchId){
        List<ContentVersion> contVer = new List<ContentVersion>();
        ContentDocumentLink[] contentLink = [SELECT ContentDocumentId from ContentDocumentLink where LinkedEntityId=:batchId ];
        set<Id> docId = new set<Id>();
        for(ContentDocumentLink contentLin : contentLink){
            docId.add(contentLin.ContentDocumentId);
        }
        if(contentLink.size()>0){
            contVer = [SELECT Id,PathOnClient FROM ContentVersion WHERE ContentDocumentId in :docId
                       AND IsLatest = true order by createdDate asc ];            
        } 
        return contVer;        
    }
    
    public  ContentVersion getCSVFileContent(ContentVersion contentVerson){
        ContentVersion contVer = [SELECT Title, VersionData, PathOnClient, FileType FROM
                                  ContentVersion WHERE IsLatest = true AND id=:contentVerson.Id limit 1];
        return contVer;
    }
    
    public  ContentVersion getCSVFile(String batchId){
        ContentVersion contVer = new ContentVersion();
        ContentDocumentLink[] contentLink = [SELECT ContentDocumentId from ContentDocumentLink where LinkedEntityId=:batchId ];
        set<Id> docId = new set<Id>();
        for(ContentDocumentLink contentLin : contentLink){
            docId.add(contentLin.ContentDocumentId);
        }
        if(contentLink.size()>0){
            contVer = [SELECT Title, VersionData, PathOnClient, FileType FROM ContentVersion WHERE ContentDocumentId in :docId
                       AND IsLatest = true order by createdDate desc limit 1];            
        } 
        return contVer;        
    }
    
    /*Deleting the csv file from the content version once the file has been uploaded into Azure*/
    public boolean deleteCSVFile(String batchId){
        boolean delStatus = true;       
        try{
            list<ContentDocument> contentList = new list<ContentDocument>();
            ContentDocument[] content = [Select Id, Title, FileExtension, CreatedDate From ContentDocument USING SCOPE Everything where (title = 'SalesUserUploadedCSVFile' OR title = 'SalesSuccessCSVFile')  ];
            //System.debug('content'+content);
            Date Today = system.Today();
            for ( ContentDocument cont : content ){ 
                Datetime recCreateDt = cont.CreatedDate;
                Date StartDateParsed = date.newinstance(recCreateDt.year(), recCreateDt.month(), recCreateDt.day());                
                //  if(cont.Title == 'Inventory Data File Uplaod'){
                if(StartDateParsed < Today){  
                    contentList.add(cont);
                }
                // }                   
            }   
            //system.debug('contentList.size:::::'+contentList.size());
            if(contentList.size()>0){
                delete contentList;
            }
        }catch(DMLException ex){
            delStatus = false;
            //System.debug('Error during deleteCSVFile'+EX.getMessage());         
        }       
        return delStatus;        
    }    
    
    public  Map<string,Map<string,Map<string,string>>> getFullSalesErrorMap() {        
        
        Map<string,Map<string,Map<string,string>>> salesErrorMap = new Map<string,Map<string,Map<string,string>>>();        
        list<Sales_Error_Mapping__c> mapData = [Select Company__c,Raw_Data_Field__c, Map_From_Value__c, Map_To_Value__c from Sales_Error_Mapping__c Where Status__c = 'Active' order by Company__c]; 
        for ( Sales_Error_Mapping__c mapVal : mapData ){
            if(String.isNotBlank(mapVal.Company__c)){
                if(salesErrorMap.containsKey(mapVal.Company__c)){
                    Map<string,Map<string,string>> rawDataFieldMap = salesErrorMap.get(mapVal.Company__c);
                    if(rawDataFieldMap.containsKey(mapVal.Raw_Data_Field__c)){                        
                        Map<string,string> mapFromToValueMap = rawDataFieldMap.get(mapVal.Raw_Data_Field__c);
                        String mapFromValue = mapVal.Map_From_Value__c;
                        mapFromToValueMap.put(mapFromValue.toLowerCase(),mapVal.Map_To_Value__c);
                        rawDataFieldMap.put(mapVal.Raw_Data_Field__c,mapFromToValueMap);
                        salesErrorMap.put(mapVal.Company__c,rawDataFieldMap);
                    }else{                            
                        Map<string,string> mapFromToValueMap = new Map<string,string>();
                        String mapFromValue = mapVal.Map_From_Value__c;
                        mapFromToValueMap.put(mapFromValue.toLowerCase(),mapVal.Map_To_Value__c);
                        rawDataFieldMap.put(mapVal.Raw_Data_Field__c,mapFromToValueMap);
                        salesErrorMap.put(mapVal.Company__c,rawDataFieldMap);
                    }                        
                }else{ 
                    Map<string,Map<string,string>> rawDataFieldMap = new Map<string,Map<string,string>>();
                    Map<string,string> mapFromToValueMap = new Map<string,string>();  
                    String mapFromValue = mapVal.Map_From_Value__c; 
                    mapFromToValueMap.put(mapFromValue.toLowerCase(),mapVal.Map_To_Value__c);
                    rawDataFieldMap.put(mapVal.Raw_Data_Field__c,mapFromToValueMap);
                    salesErrorMap.put(mapVal.Company__c,rawDataFieldMap);
                }
            }      
        }    
        //system.debug('salesErrorMap ::'+salesErrorMap);
        //system.debug('salesErrorMap ::'+salesErrorMap);
        return salesErrorMap;
    } 
    
    
    public   List<string> partnerCompany()
    {
        list<Partner__c> partner = new list<Partner__c>();
        List<string> partnerCompanyList = new List<string>();        
        partner = [Select  Name, Default_Order_to_Company__c from Partner__c where Name ='Others' and Default_Order_to_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner') order by Name]; 
        for ( Partner__c ptn : partner ){
            partnerCompanyList.add(ptn.Name);            
        }             
        return partnerCompanyList;
    }
    
    
    public   map<string,string> getModelConsolidateMap()
    {
        list<Product__c> model = new list<Product__c>();
        Map<string,string> modelConsolidateMap = new Map<string,string>();        
        model = [Select Consolidated_Style__c from Product__c where Consolidated_Style__c <> null]; 
        for ( Product__c mod : model ){ 
            modelConsolidateMap.put(mod.Consolidated_Style__c.toLowerCase(),mod.Consolidated_Style__c.toLowerCase());            
        }             
        return modelConsolidateMap;
    }
    
    // Category
    public   map<string,string> getCategoryBusinessVerticalMap()
    {
        list<Product__c> category = new list<Product__c>();
        Map<string,string> categoryBusinessVerticalMap = new Map<string,string>();        
        category = [Select Business_Vertical__c from Product__c where Business_Vertical__c <> null]; 
        for ( Product__c cat : category ){
            categoryBusinessVerticalMap.put(cat.Business_Vertical__c.toLowerCase(),cat.Business_Vertical__c.toLowerCase());            
        }             
        return categoryBusinessVerticalMap;
    }
    // Model,category,sub-category and family composite key.
    public  Map<string,string> getModelCatFamilyMap(){
        //  add by alvin 23-7-2020 start
        Map<string,string> modelCompositeKeyMap1 = new Map<string,string>();            
        list<Product__c> prodModel = [Select Business_Vertical__c,Sub_category__c ,Product_Type__c ,Product_Family__c from Product__c where Business_Vertical__c <> null and Product_Type__c  <> null and Product_Family__c <> null and Name LIKE '%Sales Upload Checking%' ];      
        for (Product__c prdMod : prodModel){
            if (prdMod.Business_Vertical__c==('Hanger Business')){
                string productCatSubFam =  'Hangers & Accessories'+'#'+prdMod.Sub_category__c +'#'+prdMod.Product_Family__c; 
                string productFullCatSubFam =  'Hangers & Accessories'+'#'+prdMod.Product_Type__c+'#'+prdMod.Sub_category__c +'#'+prdMod.Product_Family__c;
                modelCompositeKeyMap1.put(productCatSubFam.trim().toLowerCase(),productFullCatSubFam); 
            }else{
                string productCatSubFam =  prdMod.Business_Vertical__c+'#'+prdMod.Sub_category__c +'#'+prdMod.Product_Family__c; 
                string productFullCatSubFam =  prdMod.Business_Vertical__c+'#'+prdMod.Product_Type__c+'#'+prdMod.Sub_category__c +'#'+prdMod.Product_Family__c;
                modelCompositeKeyMap1.put(productCatSubFam.trim().toLowerCase(),productFullCatSubFam); 
            }
        }
        //add by alvin 23-7-2020 End
        /*add by alvin 3-9-2020 Start 

String hangerOther = 'Hangers & Accessories'+'#'+ 'HANGERS' +'#'+'OTHERS';
String hangerOtherFull = 'Hangers & Accessories'+'#'+ 'HANGERS' +'#'+ 'PLASTIC HANGERS' +'#'+'OTHERS';
modelCompositeKeyMap1.put(hangerOther.trim().toLowerCase(),hangerOtherFull); 

String accessoriesOther = 'Hangers & Accessories'+'#'+ 'ACCESSORIES' +'#'+'OTHERS';
String accessoriesOtherFull = 'Hangers & Accessories'+'#'+ 'ACCESSORIES' +'#'+ 'ACCESSORIES' +'#'+'OTHERS';
modelCompositeKeyMap1.put(accessoriesOther.trim().toLowerCase(),accessoriesOtherFull); 

String hangerOtherOther = 'Hangers & Accessories'+'#'+ 'OTHERS' +'#'+'OTHERS';
String hangerOtherOtherFull = 'Hangers & Accessories'+'#'+ 'OTHERS' +'#'+'OTHERS'+'#'+'OTHERS';
modelCompositeKeyMap1.put(hangerOtherOther.trim().toLowerCase(),hangerOtherOtherFull);

String hangerWHangerOther = 'Hangers & Accessories'+'#'+ 'WHANGERS' +'#'+'OTHERS';
String hangerWHangerOtherFull = 'Hangers & Accessories'+'#'+ 'HANGERS' +'#'+'WOODEN HANGERS'+'#'+'OTHERS';
modelCompositeKeyMap1.put(hangerWHangerOther.trim().toLowerCase(),hangerWHangerOtherFull); 
//add by alvin 3-9-2020 End
//add by alvin 23-10-2020 Start 
String hangerMHangerOther = 'Hangers & Accessories'+'#'+ 'MHANGERS' +'#'+'OTHERS';
String hangerMHangerOtherFull = 'Hangers & Accessories'+'#'+ 'HANGERS' +'#'+'METAL HANGERS'+'#'+'OTHERS';
modelCompositeKeyMap1.put(hangerMHangerOther.trim().toLowerCase(),hangerMHangerOtherFull); 
//add by alvin 23-10-2020 End*/
        
        return modelCompositeKeyMap1;
    }    
    
    
    public Map<string,Map<string,string>> getProductDetails(){
        Map<string,Map<string,string>> compositeProductMap = new Map<string,Map<string,string>>();
        Map<string,string> slsModelMap = new Map<string,string>();    
        Map<string,string> modelCompositeKeyMap = new Map<string,string>();
        Map<string,string> modelCategory = new Map<string,string>();
        
        list<Product__c> prodModel = [Select Consolidated_Style__c,Business_Vertical__c,Product_Type__c,Product_Family__c,Sub_category__c,Status__c from Product__c where Consolidated_Style__c <> null and Business_Vertical__c <> null and Product_Type__c <> null and Product_Family__c <> null and Sub_category__c <> null and Status__c = 'Active'];        
        for (Product__c prdMod : prodModel){  
            if(prdMod.Consolidated_Style__c != null){
                slsModelMap.put(prdMod.Consolidated_Style__c.toLowerCase(),prdMod.Consolidated_Style__c.toLowerCase()); 
            }
            if(prdMod.Consolidated_Style__c != null && prdMod.Business_Vertical__c != null)
            {
                String prodBusinessVertical = prdMod.Business_Vertical__c;
                string pickListApiValue = productDependentPicklistForSales.getPicklistValueFromAPIName(prodBusinessVertical);
                string productModel = prdMod.Consolidated_Style__c;
                
                string productCatSubFam =  pickListApiValue+'#'+prdMod.Product_Type__c+'#'+prdMod.Sub_category__c+'#'+prdMod.Product_Family__c;  
                modelCompositeKeyMap.put(productModel.trim().toLowerCase(),productCatSubFam.trim());  
                
                
            }
            
            if(prdMod.Consolidated_Style__c != null && prdMod.Business_Vertical__c != null)
            {
                string model = prdMod.Consolidated_Style__c;
                string category = prdMod.Business_Vertical__c;
                string pickListApiValue = productDependentPicklistForSales.getPicklistValueFromAPIName(category);
                string modelCategories =  model+'#'+pickListApiValue;
                if(category ==('Hanger Business')){
                    modelCategory.put(modelCategories.toLowerCase(),modelCategories.toLowerCase());
                }
            }
            
        }  
        compositeProductMap.put('SalesModel', slsModelMap);
        compositeProductMap.put('ModelCompositeKey', modelCompositeKeyMap);
        compositeProductMap.put('ModelCategory', modelCategory);
        return compositeProductMap;
    }
    
    
    
    // Vendor, Division, Brand, Label CompositeKey map with Label_Division__c Object.
    public  Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap(){
        
        Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        list<Label_Division__c> venDivBrndLabel =  [Select Retailer_Code_Name__r.Name, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null];       
       //system.debug(venDivBrndLabel);
        for (Label_Division__c venDivBrandLab : venDivBrndLabel){  
            String vendorName = venDivBrandLab.Retailer_Code_Name__r.Name;
            //system.debug(vendorName);
            //system.debug(vendorDivisionBrandLabelMap);
            //system.debug(vendorDivisionBrandLabelMap.containsKey(vendorName));
            if(vendorDivisionBrandLabelMap.containsKey(vendorName)){
                Map<string,string> labelDivBrand = vendorDivisionBrandLabelMap.get(vendorName);
                
                String lable = venDivBrandLab.Label__c;
                String brand = venDivBrandLab.Retailer_Brand__c;
                String division = venDivBrandLab.Division__c;
                
                String labelBrand = lable+'#'+brand;
                String lableDivision = lable+'#'+division;
                String divisionBrand = division+'#'+brand;
                
                if(!labelDivBrand.containsKey(lableDivision)){
                    labelDivBrand.put(lableDivision, lableDivision);
                }
                if(!labelDivBrand.containsKey(labelBrand)){
                    labelDivBrand.put(labelBrand,labelBrand);
                }
                if(!labelDivBrand.containsKey(divisionBrand)){
                    labelDivBrand.put(divisionBrand,divisionBrand);
                }
                if(!labelDivBrand.containsKey(lable)){
                    labelDivBrand.put(lable,lable);
                }
                if(!labelDivBrand.containsKey(brand)){
                    labelDivBrand.put(brand,brand);
                }
                if(!labelDivBrand.containsKey(division)){
                    labelDivBrand.put(division,division);
                }
                
                vendorDivisionBrandLabelMap.put(vendorName,labelDivBrand);
            }else{
                
                Map<string,string> 	labelDivBrandMap = new Map<string,string>();         
                String lable = venDivBrandLab.Label__c;
                String brand = venDivBrandLab.Retailer_Brand__c;
                String division = venDivBrandLab.Division__c; 
                String labelBrand = lable+'#'+brand;
                String lableDivision = lable+'#'+division;
                String divisionBrand = division+'#'+brand;
                
                labelDivBrandMap.put(lableDivision, lableDivision);
                labelDivBrandMap.put(labelBrand,labelBrand);
                labelDivBrandMap.put(divisionBrand,divisionBrand);
                labelDivBrandMap.put(lable,lable);
                labelDivBrandMap.put(brand,brand);
                labelDivBrandMap.put(division,division);
                
                
                vendorDivisionBrandLabelMap.put(vendorName,labelDivBrandMap);
            }
            
        }  
        return vendorDivisionBrandLabelMap;
    } 
    
    // Vendor, Division, Brand, Label CompositeKey map with Label_Division__c Object.
    public  Map<string,string> getVendorDivisionBrandLabelMap(){
        
        Map<string,string> vendorDivisionBrandLabelMap = new Map<string,string>();
        list<Label_Division__c> venDivBrndLabel = new list<Label_Division__c>();
        venDivBrndLabel = [Select Retailer_Code_Name__c, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null and Division__c <> null and Retailer_Brand__c <> null and Label__c <> null];       
        //system.debug('venDivBrndLabel ::'+venDivBrndLabel);
        for (Label_Division__c venDiv : venDivBrndLabel){  
            string cmpKey =  venDiv.Retailer_Code_Name__c+'#'+venDiv.Division__c+'#'+venDiv.Retailer_Brand__c+'#'+venDiv.Label__c;
            // system.debug('cmpKey ::'+cmpKey);
            vendorDivisionBrandLabelMap.put(cmpKey.toLowerCase(),cmpKey.toLowerCase()); 
        }  
        return vendorDivisionBrandLabelMap;
    } 
    
    public  Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap(){
        
        Map<string,Retailer_Code__c> retailersLabelDivisionBrandCheckMap = new Map<string,Retailer_Code__c>();
        list<Retailer_Code__c> salesDataUpload = [Select Name,Division_check__c,Label_Check__c,Retailer_Brand_Check__c,Sales_Data_Upload_Color__c,Sales_Data_Upload_Check__c,HG_Nomination__c,FP_Nomination__c from Retailer_Code__c where Name <> null ];       
        for (Retailer_Code__c salesData : salesDataUpload){ 
            System.debug('salesData'+salesData.HG_Nomination__c);
            System.debug('salesData'+salesData.FP_Nomination__c);

           
            retailersLabelDivisionBrandCheckMap.put(salesData.Name,salesData);
        }  
        System.debug('retailersLabelDivisionBrandCheckMap'+retailersLabelDivisionBrandCheckMap);
        return retailersLabelDivisionBrandCheckMap;
    }
    
    
    
    
    
    public Map<string,Map<string,string>> getRetailerDetails(){
        Map<string,Map<string,string>> compositeRetailerMap = new Map<string,Map<string,string>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
        Map<string,string> retailerCodeMap = new Map<string,string>();
        Map<string,string> getProductionCountryMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountry = new Map<string,string>();
        Map<string,string> autoPopulateRetailerType = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegment = new Map<string,string>();
        Map<string,string> getOrderDateCheckMap = new Map<string,string>();
        Map<string,string> getDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintModelColorCheckMap = new Map<string,string>();
        
        
        
        String retailerStatus = 'Active';
        String retailerCode = 'Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c,Division_check__c,Label_Check__c,Retailer_Brand_Check__c,Country__c,Retailer_Type__c,Market_Segment__c,Order_Date_Check__c,Delivery_Date_Check__c,Price_book_Print_Check__c from Retailer_Code__c where Name <> null and Status__c =:retailerStatus and Retailer_Code_Check__c = true ';
        
        
        for (Retailer_Code__c retailer : Database.Query(retailerCode)){   
            
            // Checking the Vendor
            if( retailer.Name != null )
            {
                string retailerName = retailer.Name;
                retailerCodeMap.put(retailerName.toLowerCase(),retailerName.toLowerCase());
            }   
            
            // Checking the SalesDataUploadCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Check__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                getSalesDataUploadCheckMap.put(retailerName.toLowerCase(),salesDataUploadCheckBox);
            }
            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                getProductionCountryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }
            // Checking the SalesDataUploadMarket
            if( retailer.Sales_Data_Upload_Market__c != null)
            {
                string retailerMarket = retailer.Sales_Data_Upload_Market__c;                
                marketMap.put(retailerMarket.toLowerCase(),retailerMarket.toLowerCase());
            }
            // Checking the SalesDataUploadColorCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Color__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                //system.debug('salesDataUploadColorCheckBox>'+salesDataUploadColorCheckBox);
                getSalesDataUploadColorCheckMap.put(retailerName.toLowerCase(),salesDataUploadColorCheckBox);
            }
            // Auto-Populating the Retailer Country
            if( retailer.Name != null && retailer.Country__c != null  )
            {
                string retailerName = retailer.Name;
                string retailerCountry = retailer.Country__c;
                autoPopulateRetailerCountry.put(retailerName.trim().toLowerCase(),retailerCountry.trim());
                
            }
            // Auto-Populating the Retailer Type
            if( retailer.Name != null && retailer.Retailer_Type__c != null  )
            {
                string retailerName = retailer.Name;
                string retailerType = retailer.Retailer_Type__c;
                autoPopulateRetailerType.put(retailerName.trim().toLowerCase(),retailerType.trim());
                
            }
            // Auto-Populating the Retailer Market
            if( retailer.Name != null && retailer.Market_Segment__c != null  )
            {
                string retailerName = retailer.Name;
                string marketSegment = retailer.Market_Segment__c;
                autoPopulateMarketSegment.put(retailerName.trim().toLowerCase(),marketSegment.trim());
                
            }
            // Checking the salesOrderDateCheckBox
            if( retailer.Name != null && retailer.Order_Date_Check__c != null  )
            {
                string retailerName = retailer.Name;
                string salesOrderDateCheckBox = String.valueOf(retailer.Order_Date_Check__c);
                getOrderDateCheckMap.put(retailerName.toLowerCase(),salesOrderDateCheckBox);
            }
            
            // Checking the salesDeliveryDateCheckBox
            if( retailer.Name != null && retailer.Delivery_Date_Check__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDeliveryDateCheckBox = String.valueOf(retailer.Delivery_Date_Check__c);
                getDeliveryDateCheckMap.put(retailerName.toLowerCase(),salesDeliveryDateCheckBox);
            }
            
            // Checking the PriceBookPrintCheckBox
            if( retailer.Name != null && retailer.Price_book_Print_Check__c != null  )
            {
                string retailerName = retailer.Name;
                string pricebookprintCheckBox = String.valueOf(retailer.Price_book_Print_Check__c);
               // system.debug('pricebookprintCheckBox>>'+pricebookprintCheckBox);
                pricebookprintCheckMap.put(retailerName.toLowerCase(),pricebookprintCheckBox);
            }
            
            // Checking the PriceBookPrintCheckBox,SalesDataUploadColorCheckBox,SalesDataUploadCheckBox
            System.debug('1234'+retailer.Name+'   '+retailer.Price_book_Print_Check__c+'   '+retailer.Sales_Data_Upload_Color__c+'   '+retailer.Sales_Data_Upload_Check__c);
            if( retailer.Name != null && retailer.Price_book_Print_Check__c != null && retailer.Sales_Data_Upload_Color__c && retailer.Sales_Data_Upload_Check__c)
            {
                string retailerName = retailer.Name;
                string pricebookprintCheckBox = String.valueOf(retailer.Price_book_Print_Check__c);
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                string combination = salesDataUploadCheckBox +'#'+ salesDataUploadColorCheckBox +'#'+ pricebookprintCheckBox;
                pricebookprintModelColorCheckMap.put(retailerName.toLowerCase(),combination);
            }
            
            
        }
        compositeRetailerMap.put('RetailerCodeMap', retailerCodeMap);
        compositeRetailerMap.put('GetSalesDataUploadCheckMap', getSalesDataUploadCheckMap);
        compositeRetailerMap.put('GetSalesDataUploadColorCheckMap', getSalesDataUploadColorCheckMap);
        compositeRetailerMap.put('GetProductionCountryMap', getProductionCountryMap);
        compositeRetailerMap.put('MarketMap', marketMap);
        compositeRetailerMap.put('AutoPopulateRetailerCountry', autoPopulateRetailerCountry);
        compositeRetailerMap.put('AutoPopulateRetailerType', autoPopulateRetailerType);
        //System.debug('autoPopulateRetailerType>>>'+autoPopulateRetailerType);
        compositeRetailerMap.put('AutoPopulateMarketSegment', autoPopulateMarketSegment);
        compositeRetailerMap.put('GetSalesOderDateCheckMap', getOrderDateCheckMap);
        compositeRetailerMap.put('GetSalesDeliveryDateCheckMap', getDeliveryDateCheckMap);
        compositeRetailerMap.put('PriceBookPrintCheckMap', pricebookprintCheckMap);
        //System.debug('map insert'+pricebookprintModelColorCheckMap);
        compositeRetailerMap.put('PriceBookPrintCheckModelColorMap', pricebookprintModelColorCheckMap);
        return compositeRetailerMap;
    }
    
    
    
    
    
    //public Map<string,Map<string,string>> getPriceSpecificationBookProductDetails(){
    public wrapPriceBookProdVendorDetails getPriceSpecificationBookProductDetails(String ordertoComp){
        Map<string,Map<string,string>> compositePriceSpecificationBookProductMap = new Map<string,Map<string,string>>();
        Map<string,string> getPickListColorMap = new Map<string,string>();
        Map<string,string> checkModel = new Map<string,string>();
        //  Map<string,string> getModelandColorMap = new Map<string,string>();
        Map<string,List<string>> getModelandColorMap = new Map<string,List<string>>(); 
        Map<string,List<string>> checkModelPrintedlogoPSBP = new Map<string,List<string>>();
        Map<string,List<string>> checkModelColorPrintedlogoPSBP = new Map<string,List<string>>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> checkModelCategory = new Map<string,string>(); 
        //added on 17-08-2020
        Map<string,List<string>> checkVendorModel = new Map<string,List<string>>(); 
        //  Map<string,string> checkModelPrintedlogoPSBP = new Map<string,string>();
        // Map<string,string> checkModelColorPrintedlogoPSBP = new Map<string,string>();
        
        List<Price_Specification_Book_Product__c> masterList = new  List<Price_Specification_Book_Product__c> ();
        
        
        String prodStatus = 'Active';
        
        String psbp = 'Select Retailer_Code__r.Name,Consolidated_Style__c,Color__c,Product_Family__c,Product_Sub_Category__c,Business_Vertical__c,ProductCategory__c,Country__c,Price_Specification_Book__r.Book_Status__c,Sizer_Print__c from Price_Specification_Book_Product__c where Retailer_Code__r.Name <> null and Business_Vertical__c <> null and Product_Sub_Category__c <> null and Product_Family__c <> null and ProductCategory__c <> null and  Consolidated_Style__c <> null and Country__c <> null and Price_Specification_Book__r.Book_Status__c =:prodStatus and Order_to_Company__c =:ordertoComp';
       // system.debug('psbp:::'+Database.Query(psbp) );
        for (Price_Specification_Book_Product__c priceSpecificationBook : Database.Query(psbp) ){
            //system.debug(' priceSpecificationBook.Retailer_Code__r.Name ::'+ priceSpecificationBook.Retailer_Code__r.Name);
            //system.debug('priceSpecificationBook.Consolidated_Style__c ::'+ priceSpecificationBook.Consolidated_Style__c);
            //Code on 17-08
            // Checking the Vendor & Model
            if( priceSpecificationBook.Retailer_Code__r.Name != null && priceSpecificationBook.Consolidated_Style__c != null )
            {
                
                if(checkVendorModel.containsKey(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase())){
                    List<String> retailerModel =   checkVendorModel.get(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase());
                    
                    retailerModel.add(priceSpecificationBook.Consolidated_Style__c.toLowerCase());
                    checkVendorModel.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);  
                }else{
                    List<String> retailerModel = new List<String>();
                    retailerModel.add(priceSpecificationBook.Consolidated_Style__c.toLowerCase());
                    checkVendorModel.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);
                }
            }
            //End code addon 17-08
            
            
            // Checking the Color            
            if( priceSpecificationBook.Color__c != null)
            {
                string color = priceSpecificationBook.Color__c;                
                getPickListColorMap.put(color.toLowerCase(),color.toLowerCase());
            }     
            
            // Checking the Model
            if( priceSpecificationBook.Consolidated_Style__c != null  )
            {
                string model =  priceSpecificationBook.Consolidated_Style__c;
                checkModel.put(model.toLowerCase(),model.toLowerCase());                
            }  
            // Checking the Models
            if( priceSpecificationBook.Consolidated_Style__c != null  )
            {
                // string modelColor =  priceSpecificationBook.Consolidated_Style__c+'#'+priceSpecificationBook.Color__c;
                if(!checkPriceBookModel.containsKey(priceSpecificationBook.Consolidated_Style__c)){
                    checkPriceBookModel.put(priceSpecificationBook.Consolidated_Style__c,priceSpecificationBook.Consolidated_Style__c);
                }
            }          
            // Checking the Model & Color
            /*   if( priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Color__c != null )
{
string modelColor =  priceSpecificationBook.Consolidated_Style__c+'#'+priceSpecificationBook.Color__c;
getModelandColorMap.put(modelColor.toLowerCase(),modelColor.toLowerCase());

} */
            // Added by Sai 30-05-2021 Starting
            if( priceSpecificationBook.Retailer_Code__r.Name != null && priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Color__c != null )
            {
                
                if(getModelandColorMap.containsKey(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase())){
                    List<String> retailerModel =   getModelandColorMap.get(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase());
                    // system.debug('retailerModel::::584'+retailerModel);
                    string modelColor =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Color__c.toLowerCase();
                    //system.debug('modelColor::::586'+modelColor);
                    retailerModel.add(modelColor);
                    getModelandColorMap.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);  
                }else{
                    List<String> retailerModel = new List<String>();
                    string modelColor =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Color__c.toLowerCase();
                    //system.debug('modelColor::::588'+modelColor);
                    retailerModel.add(modelColor);
                    getModelandColorMap.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);
                }
            }
            
            // Added by Sai 30-05-2021 Ending
            // Checking the Model & Category
            if( priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Business_Vertical__c != null )
            {
                string modelCategory =  priceSpecificationBook.Consolidated_Style__c+'#'+priceSpecificationBook.Business_Vertical__c;
                checkModelCategory.put(modelCategory.toLowerCase(),modelCategory.toLowerCase());
                
            }
            if(priceSpecificationBook.Business_Vertical__c != null && priceSpecificationBook.Product_Sub_Category__c !=null && priceSpecificationBook.Product_Family__c != null){
                
                string productModel = priceSpecificationBook.Consolidated_Style__c;
                string category = priceSpecificationBook.Business_Vertical__c;
                
                string pickListApiValue = productDependentPicklistForSales.getPicklistValueFromAPIName(category);
                
                string productCatSubFam =  pickListApiValue+'#'+priceSpecificationBook.ProductCategory__c+'#'+priceSpecificationBook.Product_Sub_Category__c+'#'+priceSpecificationBook.Product_Family__c;  
                modelwithCatSubCatFamily.put(productModel.trim().toLowerCase(),productCatSubFam.trim());                     
            } 
            
            if( priceSpecificationBook.Retailer_Code__r.Name != null && priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Sizer_Print__c != null )
            {
                
                if(checkModelPrintedlogoPSBP.containsKey(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase())){
                    List<String> retailerModel =   checkModelPrintedlogoPSBP.get(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase());
                    string modelPrntedLogo =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Sizer_Print__c.toLowerCase();
                    // system.debug('modelPrntedLogo::::622'+modelPrntedLogo);
                    retailerModel.add(modelPrntedLogo);
                    checkModelPrintedlogoPSBP.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);  
                }else{
                    List<String> retailerModel = new List<String>();
                    string modelPrntedLogo =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Sizer_Print__c.toLowerCase();
                    // system.debug('modelPrntedLogo::::628'+modelPrntedLogo);
                    retailerModel.add(modelPrntedLogo);
                    checkModelPrintedlogoPSBP.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);
                }
            }
            
            if( priceSpecificationBook.Retailer_Code__r.Name != null && priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Sizer_Print__c != null && priceSpecificationBook.Color__c != null )
            {
                
                if(checkModelColorPrintedlogoPSBP.containsKey(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase())){
                    List<String> retailerModel =   checkModelColorPrintedlogoPSBP.get(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase());
                    string modelcolorPrntedLogo =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Sizer_Print__c.toLowerCase()+'#'+priceSpecificationBook.Color__c.toLowerCase();
                    // system.debug('modelcolorPrntedLogo::::640'+modelcolorPrntedLogo);
                    retailerModel.add(modelcolorPrntedLogo);
                    checkModelColorPrintedlogoPSBP.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);  
                }else{
                    List<String> retailerModel = new List<String>();
                    string modelcolorPrntedLogo =  priceSpecificationBook.Consolidated_Style__c.toLowerCase()+'#'+priceSpecificationBook.Sizer_Print__c.toLowerCase()+'#'+priceSpecificationBook.Color__c.toLowerCase();
                    // system.debug('modelcolorPrntedLogo::::646'+modelcolorPrntedLogo);
                    retailerModel.add(modelcolorPrntedLogo);
                    checkModelColorPrintedlogoPSBP.put(priceSpecificationBook.Retailer_Code__r.Name.toLowerCase(),retailerModel);
                }
            }
            
            
            /*if(priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Sizer_Print__c != null)
{
string productModel = priceSpecificationBook.Consolidated_Style__c;
string sizeprint = priceSpecificationBook.Sizer_Print__c;

string modelSizeprint = productModel +'#'+sizeprint;           
system.debug('modelSizeprint ::'+modelSizeprint);
checkModelPrintedlogoPSBP.put(modelSizeprint, modelSizeprint);  
} */
            
            /*  if(priceSpecificationBook.Consolidated_Style__c != null && priceSpecificationBook.Sizer_Print__c != null && priceSpecificationBook.Color__c != null)
{
string productModel = priceSpecificationBook.Consolidated_Style__c;
string sizeprint = priceSpecificationBook.Sizer_Print__c;
string color = priceSpecificationBook.Color__c;

string modelcolorSizeprint = productModel +'#'+ color +'#'+ sizeprint;           
system.debug('modelcolorSizeprint ::'+modelcolorSizeprint);
checkModelColorPrintedlogoPSBP.put(modelcolorSizeprint, modelcolorSizeprint);  
} */
        }
        
        compositePriceSpecificationBookProductMap.put('GetPickListColorMap', getPickListColorMap);
        //    compositePriceSpecificationBookProductMap.put('GetModelandColorMap', getModelandColorMap);
        compositePriceSpecificationBookProductMap.put('CheckPriceBookModel', checkPriceBookModel);
        compositePriceSpecificationBookProductMap.put('ModelwithCatSubCatFamily', modelwithCatSubCatFamily);        
        compositePriceSpecificationBookProductMap.put('CheckModel', checkModel);
        // compositePriceSpecificationBookProductMap.put('CheckModelPrintedLOGOPSBP', checkModelPrintedlogoPSBP);
        //compositePriceSpecificationBookProductMap.put('CheckModelColorPrintedLOGOPSBP', checkModelColorPrintedlogoPSBP);
        wrapPriceBookProdVendorDetails wrapPriceBook = new wrapPriceBookProdVendorDetails(compositePriceSpecificationBookProductMap,checkVendorModel,getModelandColorMap,checkModelPrintedlogoPSBP,checkModelColorPrintedlogoPSBP);
        
        return wrapPriceBook;
    }
    
    public Map<string,Map<string,string>> getPriceSpecificationBookDetails(){
        //system.debug('Inside  getPriceSpecificationBookDetails ####::checkVendorCategory');
        Map<string,Map<string,string>> compositePriceSpecificationBookMap = new Map<string,Map<string,string>>();
        Map<string,string> checkVendorCategory = new Map<string,string>();
        //Added by SUSHIL 16-09-22
        Map<string,string> checkRetailerCodeMap = new Map<string,string>();
        Map<string,string> checkRetailerBussinessCheckMap = new Map<string,string>();
        //Ends SUSHIL
        
        list<Price_Specification_Book__c> psb = [Select Retailer_Code__r.Name,Retailer_Code__r.Price_Book_Cost_Check__c,Business_Vertical__c,COGS_Costing_Check__c from Price_Specification_Book__c where Retailer_Code__r.Name <> null and Business_Vertical__c <> null];
        system.debug('psb ::'+psb);
        for(Price_Specification_Book__c priceSpecificationBook : psb)
        {
            if( priceSpecificationBook.Retailer_Code__r.Name != null && priceSpecificationBook.Business_Vertical__c != null )
            {
                string retailerCode = priceSpecificationBook.Retailer_Code__r.Name;
                string category = priceSpecificationBook.Business_Vertical__c;
                //Getting Business Vertical API Name 
                string pickListApiValue = productDependentPicklistForSales.getPicklistValueFromAPIName(category);
                //Added by SUSHIL 16-09-22
                
                String retailerBussiness = (priceSpecificationBook.Retailer_Code__r.Name).toLowerCase()+'#'+pickListApiValue.toLowerCase();
                checkRetailerBussinessCheckMap.put(retailerBussiness,String.valueOf(priceSpecificationBook.COGS_Costing_Check__c));
                
                    
                   //checkRetailerCodeMap.put((priceSpecificationBook.Retailer_Code__r.Name).toLowerCase(),(priceSpecificationBook.Retailer_Code__r.Name).toLowerCase());
                   checkRetailerCodeMap.put((priceSpecificationBook.Retailer_Code__r.Name).toLowerCase(),String.valueOf(priceSpecificationBook.Retailer_Code__r.Price_Book_Cost_Check__c));
                System.debug('checkRetailerCodeMap'+checkRetailerCodeMap);
    
                //SUSHIL ends
                string vendorCategory =  retailerCode+'#'+pickListApiValue;
                
                checkVendorCategory.put(vendorCategory.toLowerCase(),vendorCategory.toLowerCase());
               system.debug('checkVendorCategory ::'+checkVendorCategory);
                
            }
        }
        compositePriceSpecificationBookMap.put('CheckVendorCategory',checkVendorCategory);
        compositePriceSpecificationBookMap.put('checkRetailerCodeMap',checkRetailerCodeMap);
        compositePriceSpecificationBookMap.put('checkRetailerBussinessCheckMap',checkRetailerBussinessCheckMap);
        //system.debug('compositePriceSpecificationBookMap ::'+compositePriceSpecificationBookMap);
        return compositePriceSpecificationBookMap;
    }
    /*** Creating an temporary storage of the csv file before it is moved into Azure*/
    public boolean createDocument(String batchId,String csvJason,String fileName,String contVerTitle){
        
        boolean insertStatus = true;
        try{            
            ContentVersion invenotryFile = new ContentVersion();
            invenotryFile.ContentLocation = 'S';
            invenotryFile.VersionData = Blob.valueOf(csvJason);
            invenotryFile.Title = contVerTitle;
            invenotryFile.PathOnClient = fileName;            
            insert invenotryFile;
            System.debug('fileName'+fileName);
            csvJason = null;
            ContentVersion inventoryVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :invenotryFile.Id];
            system.debug('inventoryVerContent:::::'+inventoryVerContent);            
            ContentDocumentLink contentlink=new ContentDocumentLink();
            contentlink.LinkedEntityId=batchid;
            contentlink.ShareType= 'V';
            contentlink.ContentDocumentId=inventoryVerContent.ContentDocumentId;            
            insert contentlink;  
            system.debug('contentlink:::::'+contentlink);            
        }catch(DMLException ex){
            //system.debug('An Error occured ::::'+ ex.getMessage());
            insertStatus = false;
        }   
        return insertStatus;
    }
    
    public   map<String,map<string,string>> getManitteCompanyMap()
    {
        map<String,map<string,string>> getPartnerMap= new map<String,map<string,string>>();
        
       list<Partner__c> partner = new list<Partner__c>();
        Map<string,string> mainettiCompanyMap = new Map<string,string>();  
        Map<string,string> mainettiPartnerType = new Map<string,string>();  


        partner = [Select Name, Sales_Data_Company__c , Sales_Upload_Company__c,Partner_Type__c from Partner__c where Sales_Upload_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner')]; 
        for ( Partner__c ptn : partner ){

            mainettiCompanyMap.put(ptn.Sales_Data_Company__c ,ptn.Sales_Upload_Company__c);
            mainettiPartnerType.put(ptn.Sales_Data_Company__c ,ptn.Partner_Type__c);
            


        }
        System.debug('mainettiPartnerType'+mainettiPartnerType);
        getPartnerMap.put('mainettiCompanyMap',mainettiCompanyMap);
        getPartnerMap.put('mainettiPartnerType',mainettiPartnerType);
      
        System.debug('getPartnerMap'+getPartnerMap);
        return getPartnerMap;
        
    }
    
    /*   public Map<String,String> getParterCmpyRegion(){
// String recCount='';    
Map<String,String> salesCompanyRegionMap = new Map<String,String>();
List<Partner__c> groupedResults = [Select Name, Default_Order_to_Company__c,Sales_Data_Company__c,Region__c from Partner__c where  Sales_Data_Company__c <> null and Region__c <> null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner')]; 
for (Partner__c partner : groupedResults)  {
salesCompanyRegionMap.put(partner.Sales_Data_Company__c, partner.Region__c);
}      
//recCount = groupedResults.Region__c;
//system.debug('salesCompanyRegionMap ::'+salesCompanyRegionMap);
return salesCompanyRegionMap ;
}  */
    
    
    public  Map<String,Map<String,String>> getParterCmpyRegionNCogsCountryNComapnyGroupName(){
        
        Map<String,String> salesCompanyRegionMap = new Map<String,String>();
        Map<String,String> salesCogsCountryMap = new Map<String,String>();
        Map<String,String> salesCompanyGroupNameMap = new Map<String,String>();
        Map<String,Map<String,String>>  salesCogsCountryAndCountryGroupMap = new  Map<String,Map<String,String>>();
        
        
        List<Partner__c> groupedResults = [Select Name,Region__c , Cogs_Country__c , Company_Group_Name__c ,Sales_Data_Company__c from Partner__c where  Sales_Data_Company__c <> null and Region__c <> null and Cogs_Country__c <> null and Company_Group_Name__c <> null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner')]; 
        //system.debug('name'+groupedResults);
        for (Partner__c partner : groupedResults)  {
            
            salesCompanyRegionMap.put(partner.Sales_Data_Company__c, partner.Region__c);
            salesCogsCountryMap.put(partner.Sales_Data_Company__c, partner.Cogs_Country__c);
            salesCompanyGroupNameMap.put(partner.Sales_Data_Company__c, partner.Company_Group_Name__c);
        }      
       // system.debug('salesCogsCountryMap ::'+salesCogsCountryMap);
       // system.debug('salesCompanyGroupNameMap ::'+salesCompanyGroupNameMap);
        salesCogsCountryAndCountryGroupMap.put('salesCompanyRegionMap' , salesCompanyRegionMap);
        salesCogsCountryAndCountryGroupMap.put('salesCogsCountryMap' , salesCogsCountryMap);
        salesCogsCountryAndCountryGroupMap.put('salesCompanyGroupNameMap' , salesCompanyGroupNameMap);
       // system.debug('salesCogsCountryAndCountryGroupMap ::'+salesCogsCountryAndCountryGroupMap);		
        return salesCogsCountryAndCountryGroupMap ;
    } 
    
    
    /* Reterieveing the file from  the contentverion for upload into Azure */
    
    public  List<ContentVersion> getContentDocumentVerIds(String batchId,String conVerTitle){
       // system.debug('batchId ::'+batchId);
       // system.debug('conVerTitle ::'+conVerTitle);
        List<ContentVersion> contVer = new List<ContentVersion>();
        ContentDocumentLink[] contentLink = [SELECT ContentDocumentId from ContentDocumentLink where LinkedEntityId=:batchId ];
        set<Id> docId = new set<Id>();
        for(ContentDocumentLink contentLin : contentLink){
            docId.add(contentLin.ContentDocumentId);
            system.debug('docId ::'+docId);            
        }
        system.debug('docId ::'+contentLink.size()); 
        if(contentLink.size()>0){
            contVer = [SELECT Id,PathOnClient FROM ContentVersion WHERE ContentDocumentId in :docId
                       AND IsLatest = true AND Title =:conVerTitle order by createdDate asc ];            
        } 
        system.debug('contVer ::'+contVer.size());
        return contVer;        
    }
    
    
}