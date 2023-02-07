public with sharing class ViewErrorSummary {
     
    @AuraEnabled
    public static ReturnWrapperObj  fetchErrorCount(String batchID) {
        ReturnWrapperObj wrapObj = new ReturnWrapperObj();  
        List<Sales_Error_Code__c> missingFieldErrorcode;
        if(
            Sales_Error_Code__c.SObjectType.getDescribe().isAccessible()
        ) {

        missingFieldErrorcode = [Select Error_Description__c ,Error_Message__c , Error_Type__c , Error_Detail_Report_Link__c from Sales_Error_Code__c where Error_Type__c = 'Missing Field' and Record_Code_Type__c = 'Sales Upload' and Active__c = true and Error_Description__c != Null];
        }

        String query = 'SELECT '; 
        List<String> stringlst = new  List<String>();
        Map<String,String> missingReportLinkMap = new  Map<String,String>();
        for( Sales_Error_Code__c salesErrorCodeList : missingFieldErrorcode){
            stringlst.add(salesErrorCodeList.Error_Description__c);
            missingReportLinkMap.put(salesErrorCodeList.Error_Message__c, salesErrorCodeList.Error_Detail_Report_Link__c);
        }
        query +=  String.join(stringlst, ',');
        query +=  ' FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchID';
        
        AggregateResult lstofErrorCOunt = Database.query(query);    
        Inventory_Transaction_Master__c invTrnasMaster;   
        if(
            Inventory_Transaction_Master__c.SObjectType.getDescribe().isAccessible()
        ) { 
            invTrnasMaster = [Select Batch_No__c ,Sales_Month__c ,Sales_Year__c ,Sales_Company__c ,Total_Row_Count__c from Inventory_Transaction_Master__c where  Id=:batchID ];       
        }
        Integer totalUploadedCount = [Select Count() FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchID];        
        Integer missingfieldCount = [SELECT Count() FROM Sales_Transaction_Stage__c WHERE  Upload_Batch_No__c =: batchId  and 
                                     ( Model_FB__c = True OR Color_FB__c = True OR Category_FB__c = True OR Market_FB__c = True
                                      OR Vendor_FB__c = True OR Company_FB__c = True OR Material_FB__c = True OR Shipped_To_Factory_FB__c = True
                                      OR Shipped_To_Country_FB__c = True OR Division_FB__c = True OR Item_code_FB__c = True OR Mainetti_Brand_FB__c = True 
                                      OR Order_Type_FB__c = True OR Customer_FB__c = True OR Transaction_Currency_FB__c = True OR ExRate_to_EUR_FB__C = True
                                      OR ExRate_to_USD_FB__C = True  OR Unit_Price_100_USD_FB__c = True    OR Unit_Price_100_EUR_FB__c = True 
                                      OR Local_Net_Unit_Pirce_FB__c = True OR Net_Unit_Price_100_FB__c = True    OR Month_FB__c = True OR 
                                      Source_FB__c = True OR Unit_Sold_FB__c = True    OR Week_FB__c = True OR Year_FB__c = True OR SO_Number_FB__c = True 
                                      OR LOB_FB__c = True OR Gross_Sales_USD_FB__c = True OR Freight_Charge_USD_FB__c = True OR Production_Country_FB__c = True
                                      OR Label_FB__c = True OR Retailer_Brand_FB__c = True or STC_FB__c = True or  Sales_USD_FB__c = True or Sales_EUR_FB__c = True 
                                      OR Error_Code__c <> NUll OR Final_Sales_Destination_FB__c = True OR Sales_Order_Date_FB__c = True OR Sales_Delivery_Date_FB__c = True OR Printed_Logo_FB__c = True OR Gross_Unit_Price_100_Local_Currency_FB__c = True OR Net_Weight_KG_1000_FB__c = True)];
        
        List< SalesErrorNameCountObjWrapper> salesErrorNameCountObjlist = new list<SalesErrorNameCountObjWrapper>();
        for( Sales_Error_Code__c lst :missingFieldErrorcode){
            SalesErrorNameCountObjWrapper salesErrorNameCountObj = new SalesErrorNameCountObjWrapper();
            salesErrorNameCountObj.name = lst.Error_Message__c;
            salesErrorNameCountObj.count = Integer.valueOf(lstofErrorCOunt.get(lst.Error_Message__c));
            salesErrorNameCountObj.reportLink = missingReportLinkMap.get(lst.Error_Message__c);
            if( salesErrorNameCountObj.Count != null && salesErrorNameCountObj.Count > 0){
                salesErrorNameCountObjlist.add(salesErrorNameCountObj);
            }
        }
        InventroyTrnasMaster invTrnMaster = new InventroyTrnasMaster();        
        invTrnMaster.batchNo = invTrnasMaster.Batch_No__c;
        invTrnMaster.company = invTrnasMaster.Sales_Company__c;
        invTrnMaster.month = invTrnasMaster.Sales_Month__c;
        invTrnMaster.year = invTrnasMaster.Sales_Year__c;
        invTrnMaster.totalRecordCount = totalUploadedCount;
        invTrnMaster.totalSuccesCount = totalUploadedCount - missingfieldCount;
        
        wrapObj.salesErrorNameCount = salesErrorNameCountObjlist;
        wrapObj.invntryTransMaster = invTrnMaster;
        return wrapObj;
    }
    
    
    public class ReturnWrapperObj {
        @AuraEnabled
        public List<SalesErrorNameCountObjWrapper> salesErrorNameCount {get;set;} 
        @AuraEnabled
        public InventroyTrnasMaster invntryTransMaster {get;set;} 
    }
    
    public class SalesErrorNameCountObjWrapper {
        
        @AuraEnabled public String  name {get;set;}
        @AuraEnabled public Integer count {get;set;}
        @AuraEnabled public String reportLink {get;set;}
    }
    
    
    public class InventroyTrnasMaster{
        
        @AuraEnabled public String  batchNo {get;set;}
        @AuraEnabled public Integer totalRecordCount {get;set;}
        @AuraEnabled public Integer totalSuccesCount {get;set;}
        @AuraEnabled public String  company {get;set;}
        @AuraEnabled public String year {get;set;}
        @AuraEnabled public String month {get;set;}
        
    }
}