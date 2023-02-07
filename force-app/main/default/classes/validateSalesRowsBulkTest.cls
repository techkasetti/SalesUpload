@isTest
public class validateSalesRowsBulkTest {
    static testMethod void test1(){
        
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c(); 
        value.Batch_Status__c = '8 - Migration Success';
        value.Reprocess_Email_Notify__c='crm.support@mainetti.com.magnets1';
        value.Record_Type__c = 'Sales';   
        insert value;       
        
        
        string batchId = value.Id;
        string selMonth = 'Dec';
        string selYear = '2019';
        string selcomp = 'Hong Kong Packaging';
        String userEmail = UserInfo.getUserEmail();

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
        salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Net_Weight_KG_1000__c = '12670.63';
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
        salesTransMast.Vendor__c = 'OLD NAVY';
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
        salesTransMast.Net_Unit_Price_100_EUR_FB__c = false;  
        salesTransMast.Net_Unit_Price_100_EUR_NF__c = false;  
        salesTransMast.Net_Unit_Price_100_FB__c = false;  
        salesTransMast.Net_Unit_Price_100_NF__c = false; 
        salesTransMast.Final_Sales_Destination_FB__c = false; 
        salesTransMast.Final_Sales_Destination_NF__c = false;
        salesTransMast.Sales_Delivery_Date_FB__c = false;
        salesTransMast.Sales_Delivery_Date_NF__c = false;
        salesTransMast.Standard_Unit_Material_Cost_100_EUR_FB__c=false;
        salesTransMast.Standard_Unit_Industrial_Cost_100_USD_NF__c=false;
        salesTransMast.Standard_Unit_Material_Cost_100_USD_FB__c=false;
        salesTransMast.Standard_Unit_Material_Cost_100_USD_NF__c=false;
        insert salesTransMast;
        
        
        
        List<Sales_Transaction_Stage__c> insertRecord  = new List<Sales_Transaction_Stage__c>();
        for(Integer i=0; i<=9901; i++){
            Sales_Transaction_Stage__c datauploadtrans = new Sales_Transaction_Stage__c();
            insertRecord.add(datauploadtrans);
            
        }
      
        
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
        String productionCountry = salesTransMast.Production_Country__c;
        String grossSalesUSD = salesTransMast.Gross_Sales_USD__c ;
        String freightChargeUSD = salesTransMast.Freight_Charge_USD__c ;
                
        Sales_Transaction__c customData = new Sales_Transaction__c();
        customData.Production_Country__c = 'abc';
        customData.Color__c = 'sfd';
        customData.Division__c = 'dxc';
        customData.Label__c = 'normal';
        customData.Brand__c = 'permanent';
        customData.Tolerance__c = '0.03';
        customData.SetScale__c = '5';
        customData.SalesUSDTolerance__c = '5'; 
        customData.SalesEURTolerance__c = '5';
        customData.UnitPrice100USD__c = '5';
        customData.UnitPrice100EUR__c = '5'; 
        customData.Vendor__c = 'OLD NAVY';
        customData.Profile__c='nor';
        customData.CostToTolerance__c='5';
        insert customData;
        
                
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Hong Kong Packaging', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;
        
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'OLD NAVY');
        retailercode.Retailer_Type__c='Department Stores';
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = false;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true; 
        retailercode.HG_Nomination__c ='Sole Nomination';
        retailercode.FP_Nomination__c ='open';
        retailercode.Price_Book_Cost_Check__c=true;
        insert retailercode;
        
        Test.startTest();        
        validateSalesRowsBulk obj = new validateSalesRowsBulk(batchId,selMonth,selYear,selcomp,userEmail);
        List<Sales_Transaction_Stage__c> salesTransStage = new  List<Sales_Transaction_Stage__c>();
        Database.BatchableContext bc1;
        obj.start(bc1);
        obj.execute(bc1, salesTransStage);
        DataBase.executeBatch(obj);
        
        Test.stopTest();
        system.debug('customData.Vendor__c::'+customData.Vendor__c);
        System.assertEquals('OLD NAVY', customData.Vendor__c,'putFileRequestTest');
   
        
    }
    
}