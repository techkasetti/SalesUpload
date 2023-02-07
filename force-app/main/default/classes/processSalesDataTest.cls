@isTest
public class processSalesDataTest {

    @isTest
    static void validateUploadRowsTest()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        insert value;
  
        string returnBatchId = '';
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
        salesTransMast.Category__c = 'TLA';
        salesTransMast.Sub_Category__c = 'HANGERS';
        salesTransMast.Family__c = 'bottom';
        salesTransMast.Order_Type__c = '3rd';
        salesTransMast.Unit_Sold__c = '12520';
        salesTransMast.Unit_Price_100_EUR__c = '110.65123';
        salesTransMast.Unit_Price_100_USD__c = '112.40602';
        salesTransMast.Net_Unit_Price_100__c = '111';
        salesTransMast.Sales_EUR__c = '1268.410993';
        salesTransMast.Sales_USD__c = '1312.631704';
        salesTransMast.Transaction_Currency__c = 'hkd';
        salesTransMast.ExRate_to_EUR__c = '19.08505';
        salesTransMast.ExRate_to_USD__c = '20.8';
        salesTransMast.Local_Net_Unit_Pirce_100__c = '1132547896145';
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
        salesTransMast.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransMast.Sales_Order_Date__c = '4-JAN-2021';
        salesTransMast.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        System.assertEquals('CHINA', salesTransMast.Production_Country__c,'putFileRequestTest');

        salesTransMast.ErrorMapData__c='Year;Week;Month;Material;Source;Category;Family;Label;Vendor;Division;Market;Remark;LOB;ItemCode;Model;PrintedLogo;Color;Customer;LocalName;MainettiBrand;SubCategory;OrderType;UnitSold;LocalCurrency;ShippedToFactory;ShippedToCountry;EndUser;RetailerBrand;RoyaltyRate;SONumber;ProductionCountry';

        //salesTransMast.ErrorMapData__c='';
        //salesTransMast.ErrorMapData__c ='ProductionCountry';
        salesTransMast.ErrorMapData__c ='Month';
        salesTransMast.ErrorMapData__c ='Material';
        salesTransMast.ErrorMapData__c ='Source';
        salesTransMast.ErrorMapData__c ='Category';
        salesTransMast.ErrorMapData__c ='Family';
        salesTransMast.ErrorMapData__c ='Label';
        salesTransMast.ErrorMapData__c ='Vendor';
        salesTransMast.ErrorMapData__c ='Division';
        insert salesTransMast;

        Sales_Transaction_Stage__c salesTransMastr = new Sales_Transaction_Stage__c();
        salesTransMastr.Upload_Batch_No__c = value.Id;
        salesTransMastr.Company__c = 'Hong Kong Packaging';
        salesTransMastr.Year__c = '2019';
        salesTransMastr.Week__c = 'wk02';
        salesTransMastr.Month__c = 'Dec';
        salesTransMastr.Item_Code__c = 'HGR-3944   BLK002-  100';
        salesTransMastr.Material__c = 'PS';
        salesTransMastr.Source__c = 'virginn';
        salesTransMastr.Model__c = '1000';
        salesTransMastr.Printed_Logo__c = 'demologo';
        salesTransMastr.Color__c = 'black';
        salesTransMastr.Customer__c = 'xxxxxx';
        salesTransMastr.Customer_Local_Name__c = 'xxxx';
        salesTransMastr.Mainetti_Brand__c = 'mainetti';
        salesTransMastr.Category__c = 'TLA';
        salesTransMastr.Sub_Category__c = 'HANGERS';
        salesTransMastr.Family__c = 'bottom';
        salesTransMastr.Order_Type__c = '3rd';
        salesTransMastr.Unit_Sold__c = '12520';
        salesTransMastr.Unit_Price_100_EUR__c = '110.65123';
        salesTransMastr.Unit_Price_100_USD__c = '112.40602';
        salesTransMastr.Net_Unit_Price_100__c = '111';
        salesTransMastr.Sales_EUR__c = '1268.410993';
        salesTransMastr.Sales_USD__c = '1312.631704';
        salesTransMastr.Transaction_Currency__c = 'hkd';
        salesTransMastr.ExRate_to_EUR__c = '19.08505';
        salesTransMastr.ExRate_to_USD__c = '20.8';
        salesTransMastr.Local_Net_Unit_Pirce_100__c = '11314563897412';
        salesTransMastr.Sales_Transaction_Currency__c = '12438.527291';
        salesTransMastr.Shipped_To_Factory__c = 'xxxxxx';
        salesTransMastr.Shipped_To_Country__c = 'xxxx';
        salesTransMastr.Label__c = 'label';
        salesTransMastr.End_User__c = 'user';
        salesTransMastr.Vendor__c = 'lululemon';
        salesTransMastr.Division__c = 'demo';
        salesTransMastr.Retailer_Brand__c = 'demo';
        salesTransMastr.Royalty_Rate__c = 'xxxx';
        salesTransMastr.Market__c = 'USA';
        salesTransMastr.Remark__c = 'xxxx';
        salesTransMastr.LOB__c = 'PRL123456789012345688';
        salesTransMastr.SO_Number__c = '183001689999898988';
        salesTransMastr.Production_Country__c = 'CHINA';
        salesTransMastr.Gross_Sales_USD__c = '12.2';
        salesTransMastr.Freight_Charge_USD__c = 'abc';
         salesTransMastr.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransMastr.Sales_Order_Date__c = '4-JAN-2021';
        salesTransMast.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';

        salesTransMastr.ErrorMapData__c='Year;Week;Month;Material;Source;Category;Family;Label;Retailer;Division;Market;Remark;LOB;ItemCode;Model;PrintedLogo;Color;Customer;LocalName;MainettiBrand;SubCategory;OrderType;UnitSold;LocalCurrency;ShippedToFactory;ShippedToCountry;EndUser;RetailerBrand;RoyaltyRate;SONumber;ProductionCountry';

        //salesTransMast.ErrorMapData__c='';

        insert salesTransMastr;

        Sales_Transaction_Stage__c salesTransInvalid = new Sales_Transaction_Stage__c();
        salesTransInvalid.Upload_Batch_No__c = value.Id;
        salesTransInvalid.Company__c = 'Hong Kong Packaging';
        salesTransInvalid.Year__c = '2019';
        salesTransInvalid.Week__c = 'wk02';
        salesTransInvalid.Month__c = 'Dec';
        salesTransInvalid.Item_Code__c = 'HGR-3944   BLK002-  101';
        salesTransInvalid.Material__c = 'SP';
        salesTransInvalid.Source__c = 'lululemon';
        salesTransInvalid.Model__c = 'CS1Q';
        salesTransInvalid.Printed_Logo__c = 'demologo';
        salesTransInvalid.Color__c = 'blackK';
        salesTransInvalid.Customer__c = 'ABCDE';
        salesTransInvalid.Customer_Local_Name__c = 'abc';
        salesTransInvalid.Mainetti_Brand__c = 'mainettii';
        salesTransInvalid.Category__c = 'TLA';
        salesTransInvalid.Sub_Category__c = '';
        salesTransInvalid.Family__c = '';
        salesTransInvalid.Order_Type__c = '';
        salesTransInvalid.Unit_Sold__c = '100';
        salesTransInvalid.Unit_Price_100_EUR__c = '';
        salesTransInvalid.Unit_Price_100_USD__c = '';
        salesTransInvalid.Net_Unit_Price_100__c = '';
        salesTransInvalid.Sales_EUR__c = '';
        salesTransInvalid.Sales_USD__c = '';
        salesTransInvalid.Transaction_Currency__c = '';
        salesTransInvalid.ExRate_to_EUR__c = '';
        salesTransInvalid.ExRate_to_USD__c = '';
        salesTransInvalid.Local_Net_Unit_Pirce_100__c = '';
        salesTransInvalid.Sales_Transaction_Currency__c = '';
        salesTransInvalid.Shipped_To_Factory__c = '';
        salesTransInvalid.Shipped_To_Country__c = '';
        salesTransInvalid.Label__c = '';
        salesTransInvalid.End_User__c = '';
        salesTransInvalid.Vendor__c = 'debenham';
        salesTransInvalid.Division__c = '';
        salesTransInvalid.Retailer_Brand__c = 'fadfa';
        salesTransInvalid.Royalty_Rate__c = 'dfdsf';
        salesTransInvalid.Market__c = 'US';
        salesTransInvalid.Remark__c = 'abcdef';
        salesTransInvalid.LOB__c = 'PRL123456789012345688';
        salesTransInvalid.SO_Number__c = '183001689999898988';
        salesTransInvalid.Production_Country__c = 'CHINAa';
        salesTransInvalid.ErrorMapData__c='Week';
        salesTransInvalid.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransInvalid.Sales_Order_Date__c = '4-JAN-2021';
        salesTransInvalid.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransInvalid;

        Sales_Transaction_Stage__c salesTransMastMissing = new Sales_Transaction_Stage__c();
        salesTransMastMissing.Upload_Batch_No__c = value.Id;
        salesTransMastMissing.Company__c = 'Hong Kong Packaging';
        salesTransMastMissing.Year__c = '';
        salesTransMastMissing.Week__c = '';
        salesTransMastMissing.Month__c = 'Dec';
        salesTransMastMissing.Item_Code__c = '';
        salesTransMastMissing.Material__c = '';
        salesTransMastMissing.Source__c = 'virgin';
        salesTransMastMissing.Model__c = '';
        salesTransMastMissing.Printed_Logo__c = '';
        salesTransMastMissing.Color__c = '';
        salesTransMastMissing.Customer__c = '';
        salesTransMastMissing.Customer_Local_Name__c = '';
        salesTransMastMissing.Mainetti_Brand__c = '';
        salesTransMastMissing.Category__c = '';
        salesTransMastMissing.Sub_Category__c = '';
        salesTransMastMissing.Family__c = '';
        salesTransMastMissing.Order_Type__c = '';
        salesTransMastMissing.Unit_Sold__c = '100';
        salesTransMastMissing.Unit_Price_100_EUR__c = '';
        salesTransMastMissing.Unit_Price_100_USD__c = '';
        salesTransMastMissing.Net_Unit_Price_100__c = '';
        salesTransMastMissing.Sales_EUR__c = '';
        salesTransMastMissing.Sales_USD__c = '';
        salesTransMastMissing.Transaction_Currency__c = '';
        salesTransMastMissing.ExRate_to_EUR__c = '';
        salesTransMastMissing.ExRate_to_USD__c = '';
        salesTransMastMissing.Local_Net_Unit_Pirce_100__c = '';
        salesTransMastMissing.Sales_Transaction_Currency__c = '';
        salesTransMastMissing.Shipped_To_Factory__c = '';
        salesTransMastMissing.Shipped_To_Country__c = '';
        salesTransMastMissing.Label__c = '';
        salesTransMastMissing.End_User__c = '';
        salesTransMastMissing.Vendor__c = 'debenham';
        salesTransMastMissing.Division__c = '';
        salesTransMastMissing.Retailer_Brand__c = '';
        salesTransMastMissing.Royalty_Rate__c = '';
        salesTransMastMissing.Market__c = '';
        salesTransMastMissing.Remark__c = '';
        salesTransMastMissing.LOB__c = '';
        salesTransMastMissing.SO_Number__c = '';
        salesTransMastMissing.Production_Country__c = '';
        salesTransMastMissing.Gross_Sales_USD__c = 'abc';
        salesTransMastMissing.Freight_Charge_USD__c = 'erf';
        salesTransMastMissing.Sales_Delivery_Date__c = '';
        salesTransMastMissing.Sales_Order_Date__c = '';
        salesTransMastMissing.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransMastMissing;

        Sales_Transaction_Stage__c salesTransMastLabel = new Sales_Transaction_Stage__c();
        salesTransMastLabel.Upload_Batch_No__c = value.Id;
        salesTransMastLabel.Company__c = 'Hong Kong Packaging';
        salesTransMastLabel.Year__c = '';
        salesTransMastLabel.Week__c = '';
        salesTransMastLabel.Month__c = 'Dec';
        salesTransMastLabel.Item_Code__c = '';
        salesTransMastLabel.Material__c = '';
        salesTransMastLabel.Source__c = 'virgin';
        salesTransMastLabel.Model__c = '';
        salesTransMastLabel.Printed_Logo__c = '';
        salesTransMastLabel.Color__c = '';
        salesTransMastLabel.Customer__c = '';
        salesTransMastLabel.Customer_Local_Name__c = '';
        salesTransMastLabel.Mainetti_Brand__c = '';
        salesTransMastLabel.Category__c = '';
        salesTransMastLabel.Sub_Category__c = '';
        salesTransMastLabel.Family__c = '';
        salesTransMastLabel.Order_Type__c = '';
        salesTransMastLabel.Unit_Sold__c = '100';
        salesTransMastLabel.Unit_Price_100_EUR__c = '';
        salesTransMastLabel.Unit_Price_100_USD__c = '';
        salesTransMastLabel.Net_Unit_Price_100__c = '';
        salesTransMastLabel.Sales_EUR__c = '';
        salesTransMastLabel.Sales_USD__c = '';
        salesTransMastLabel.Transaction_Currency__c = '';
        salesTransMastLabel.ExRate_to_EUR__c = '';
        salesTransMastLabel.ExRate_to_USD__c = '';
        salesTransMastLabel.Local_Net_Unit_Pirce_100__c = '';
        salesTransMastLabel.Sales_Transaction_Currency__c = '';
        salesTransMastLabel.Shipped_To_Factory__c = '';
        salesTransMastLabel.Shipped_To_Country__c = '';
        salesTransMastLabel.Label__c = 'NL';
        salesTransMastLabel.End_User__c = '';
        salesTransMastLabel.Vendor__c = 'MACY';
        salesTransMastLabel.Division__c = '';
        salesTransMastLabel.Retailer_Brand__c = '';
        salesTransMastLabel.Royalty_Rate__c = '';
        salesTransMastLabel.Market__c = '';
        salesTransMastLabel.Remark__c = '';
        salesTransMastLabel.LOB__c = 'LEG';
        salesTransMastLabel.SO_Number__c = '';
        salesTransMastLabel.Production_Country__c = '';
        salesTransMastLabel.Gross_Sales_USD__c = 'abc';
        salesTransMastLabel.Freight_Charge_USD__c = 'erf';
        salesTransMastLabel.ErrorMapData__c = '';
        salesTransMastLabel.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransMastLabel.Sales_Order_Date__c = '4-JAN-2021';
        salesTransMastLabel.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';

        insert salesTransMastLabel;

        Sales_Transaction_Stage__c salesTransMastLabels = new Sales_Transaction_Stage__c();
        salesTransMastLabels.Upload_Batch_No__c = value.Id;
        salesTransMastLabels.Company__c = 'Hong Kong Packaging';
        salesTransMastLabels.Year__c = '';
        salesTransMastLabels.Week__c = '';
        salesTransMastLabels.Month__c = 'Dec';
        salesTransMastLabels.Item_Code__c = '';
        salesTransMastLabels.Material__c = '';
        salesTransMastLabels.Source__c = 'virgin';
        salesTransMastLabels.Model__c = '';
        salesTransMastLabels.Printed_Logo__c = '';
        salesTransMastLabels.Color__c = '';
        salesTransMastLabels.Customer__c = '';
        salesTransMastLabels.Customer_Local_Name__c = '';
        salesTransMastLabels.Mainetti_Brand__c = '';
        salesTransMastLabels.Category__c = '';
        salesTransMastLabels.Sub_Category__c = '';
        salesTransMastLabels.Family__c = '';
        salesTransMastLabels.Order_Type__c = '';
        salesTransMastLabels.Unit_Sold__c = '100';
        salesTransMastLabels.Unit_Price_100_EUR__c = '';
        salesTransMastLabels.Unit_Price_100_USD__c = '';
        salesTransMastLabels.Net_Unit_Price_100__c = '';
        salesTransMastLabels.Sales_EUR__c = '';
        salesTransMastLabels.Sales_USD__c = '';
        salesTransMastLabels.Transaction_Currency__c = '';
        salesTransMastLabels.ExRate_to_EUR__c = '';
        salesTransMastLabels.ExRate_to_USD__c = '';
        salesTransMastLabels.Local_Net_Unit_Pirce_100__c = '';
        salesTransMastLabels.Sales_Transaction_Currency__c = '';
        salesTransMastLabels.Shipped_To_Factory__c = '';
        salesTransMastLabels.Shipped_To_Country__c = '';
        salesTransMastLabels.Label__c = 'NL';
        salesTransMastLabels.End_User__c = '';
        salesTransMastLabels.Vendor__c = 'MACY';
        salesTransMastLabels.Division__c = '';
        salesTransMastLabels.Retailer_Brand__c = '';
        salesTransMastLabels.Royalty_Rate__c = '';
        salesTransMastLabels.Market__c = '';
        salesTransMastLabels.Remark__c = '';
        salesTransMastLabels.LOB__c = 'LEG';
        salesTransMastLabels.SO_Number__c = '';
        salesTransMastLabels.Production_Country__c = '';
        salesTransMastLabels.Gross_Sales_USD__c = 'abc';
        salesTransMastLabels.Freight_Charge_USD__c = 'erf';
        salesTransMastLabels.ErrorMapData__c = '';
        salesTransMastLabels.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransMastLabels.Sales_Order_Date__c = '4-JAN-2021';
        salesTransMastLabels.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';

        insert salesTransMastLabels;

        Retailer_Code__c retailer = new Retailer_Code__c(Name = 'debenham',Production_Country__c  =true,Retailer_Type__c='Department Stores');
        insert retailer;

        String [] fieldNameS =new String[]{'Year','Week','Month','Material','Source','Category','Family','Label','Vendor','Division','Market','Remark','LOB','ItemCode','Model','PrintedLogo','Color','Customer','LocalName','MainettiBrand','SubCategory','OrderType','UnitSold','LocalCurrency','ShippedToFactory','ShippedToCountry','EndUser','RetailerBrand','RoyaltyRate','SONumber','ProductionCountry'};

            boolean flag = true;
        string selMonth = 'Dec';
        string selYear = '2019';
        string selcomp = 'Hong Kong Packaging';
        String generatedMapKeyString='dkdmik';
        // salesTransMastr.ErrorMapData__c='Year;Week;Month;Material;Source;Category;Family;Label;Vendor;Division;Market;Remark;LOB;ItemCode;Model;PrintedLogo;Color;Customer;LocalName;MainettiBrand;SubCategory;OrderType;UnitSold;LocalCurrency;ShippedToFactory;ShippedToCountry;EndUser;RetailerBrand;RoyaltyRate;SONumber;ProductionCountry';
        Sales_Transaction_Stage__c salesTransMst = new Sales_Transaction_Stage__c();
        salesTransMst.ErrorMapData__c='Year';
        Sales_Transaction_Stage__c salesTransMast1 = new Sales_Transaction_Stage__c();
        salesTransMast1.ErrorMapData__c='Week';
        Sales_Transaction_Stage__c salesTransMast2 = new Sales_Transaction_Stage__c();
        salesTransMast2.ErrorMapData__c='Month';
        Sales_Transaction_Stage__c salesTransMast3 = new Sales_Transaction_Stage__c();
        salesTransMast3.ErrorMapData__c='Material';
        Sales_Transaction_Stage__c salesTransMast4 = new Sales_Transaction_Stage__c();
        salesTransMast4.ErrorMapData__c='Source';
        Sales_Transaction_Stage__c salesTransMast5 = new Sales_Transaction_Stage__c();
        salesTransMast5.ErrorMapData__c='Category';
        Sales_Transaction_Stage__c salesTransMast6 = new Sales_Transaction_Stage__c();
        salesTransMast6.ErrorMapData__c='Family';
        Sales_Transaction_Stage__c salesTransMast7 = new Sales_Transaction_Stage__c();
        salesTransMast7.ErrorMapData__c='Label';
        Sales_Transaction_Stage__c salesTransMast8 = new Sales_Transaction_Stage__c();
        salesTransMast8.ErrorMapData__c='Vendor';
        Sales_Transaction_Stage__c salesTransMast9 = new Sales_Transaction_Stage__c();
        salesTransMast9.ErrorMapData__c='Division';
        Sales_Transaction_Stage__c salesTransMast01 = new Sales_Transaction_Stage__c();
        salesTransMast01.ErrorMapData__c='Market';
        Sales_Transaction_Stage__c salesTransMast02 = new Sales_Transaction_Stage__c();
        salesTransMast02.ErrorMapData__c='Remark';
        Sales_Transaction_Stage__c salesTransMast03 = new Sales_Transaction_Stage__c();
        salesTransMast03.ErrorMapData__c='LOB';
        Sales_Transaction_Stage__c salesTransMast04 = new Sales_Transaction_Stage__c();
        salesTransMast04.ErrorMapData__c='ItemCode';
        Sales_Transaction_Stage__c salesTransMast05 = new Sales_Transaction_Stage__c();
        salesTransMast05.ErrorMapData__c='PrintedLogo';
        Sales_Transaction_Stage__c salesTransMast06 = new Sales_Transaction_Stage__c();
        salesTransMast06.ErrorMapData__c='Color';
        Sales_Transaction_Stage__c salesTransMast07 = new Sales_Transaction_Stage__c();
        salesTransMast07.ErrorMapData__c='Customer';
        Sales_Transaction_Stage__c salesTransMast08 = new Sales_Transaction_Stage__c();
        salesTransMast08.ErrorMapData__c='LocalName';
        Sales_Transaction_Stage__c salesTransMast09 = new Sales_Transaction_Stage__c();
        salesTransMast09.ErrorMapData__c='MainettiBrand';
        Sales_Transaction_Stage__c salesTransMast11 = new Sales_Transaction_Stage__c();
        salesTransMast11.ErrorMapData__c='SubCategory';
        Sales_Transaction_Stage__c salesTransMast12 = new Sales_Transaction_Stage__c();
        salesTransMast12.ErrorMapData__c='OrderType';
        Sales_Transaction_Stage__c salesTransMast13 = new Sales_Transaction_Stage__c();
        salesTransMast13.ErrorMapData__c='UnitSold';
        Sales_Transaction_Stage__c salesTransMast14 = new Sales_Transaction_Stage__c();
        salesTransMast14.ErrorMapData__c='LocalCurrency';
        Sales_Transaction_Stage__c salesTransMast15 = new Sales_Transaction_Stage__c();
        salesTransMast15.ErrorMapData__c='ShippedToFactory';
        Sales_Transaction_Stage__c salesTransMast16 = new Sales_Transaction_Stage__c();
        salesTransMast16.ErrorMapData__c='ShippedToCountry';
        Sales_Transaction_Stage__c salesTransMast17 = new Sales_Transaction_Stage__c();
        salesTransMast17.ErrorMapData__c='EndUser';
        Sales_Transaction_Stage__c salesTransMast18 = new Sales_Transaction_Stage__c();
        salesTransMast18.ErrorMapData__c='RetailerBrand';
        Sales_Transaction_Stage__c salesTransMast19 = new Sales_Transaction_Stage__c();
        salesTransMast19.ErrorMapData__c='RoyaltyRate';
        Sales_Transaction_Stage__c salesTransMast21 = new Sales_Transaction_Stage__c();
        salesTransMast21.ErrorMapData__c='SONumber';
        Sales_Transaction_Stage__c salesTransMast22 = new Sales_Transaction_Stage__c();
        salesTransMast22.ErrorMapData__c='ProductionCountry';
        Sales_Transaction_Stage__c salesTransMast23 = new Sales_Transaction_Stage__c();
        salesTransMast23.ErrorMapData__c='Model';
        Sales_Transaction_Stage__c salesTransMast24 = new Sales_Transaction_Stage__c();
        salesTransMast24.ErrorMapData__c='SubCategory';

        Sales_Transaction__c salestranC = new Sales_Transaction__c();
        salestranC.Vendor__c = 'abc';
        insert salestranC;

        Test.startTest();
        for(String fldName :fieldNameS){
            String fieldName = fldName;
        }
       
        processSalesData.getSalesWeekCountWithPartnerCompanyNewCompanyList(selMonth,selYear,selcomp);
        processSalesData.getSalesWeekCountNew(selMonth,selYear);
        processSalesData.getSalesWeekList(selMonth,selYear,selcomp);
      
        Test.stopTest();
        System.assertEquals(true, flag);
    }


    @isTest
    static void testParseLongDate()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Retailer_Code__c retailer = new Retailer_Code__c(Retailer_Type__c='Department Stores',Name = 'DECATHLON',JDE_LOB__c  ='DEC');
        insert retailer;
        Sales_Transaction_Stage__c salesTransStagRec = new Sales_Transaction_Stage__c();
        salesTransStagRec.Upload_Batch_No__c = salesTransStagRec.Id;
        salesTransStagRec.Vendor__c  = 'DemoRetailer';
        salesTransStagRec.Upload_Batch_No__c = value.id;
        insert salesTransStagRec;



        String [] fieldNameS =new String[]{'Year','Week','Month','Material','Source','Category','Family','Label','Vendor','Division','Market','Remark','LOB','ItemCode','Model','PrintedLogo','Color','Customer','LocalName','MainettiBrand','SubCategory','OrderType','UnitSold','LocalCurrency','ShippedToFactory','ShippedToCountry','EndUser','RetailerBrand','RoyaltyRate','SONumber','ProductionCountry'};
            String oldValue = 'BOTTOMS';
        String newValue = 'BOTTOM';
        String batchId = salesTransStagRec.Id;
        String companyName = 'Hong Kong Packaging';
        String errMap = 'Family';
        String pickListToRemove = 'Family';
        Date d = date.today();
        boolean flag = true;
        Test.startTest();
        for(String fldName :fieldNameS){
            String fieldName = fldName;
            processSalesData processData = new processSalesData();
            //  processData.updateTransStagNInsertErrorMapValues(fieldName,oldValue,newValue,batchId,companyName,errMap,pickListToRemove);
            //processSalesData.generateMapKeyString(salesTransStagRec);
            //   processSalesData.getfieldWithObject(fieldName,newValue,salesTransStagRec);
            processData.isValueNumeric('123');
            processData.valueIsNumeric('123');
            processData.valueIsNumeric('abc');
            processData.isValueNumeric('abc');
            processSalesData.getWeekCount(d);
        }
        Test.stopTest();
        System.assertEquals(true, flag);
    }

    @isTest
    static void testParseLongDate001()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Retailer_Code__c retailer = new Retailer_Code__c(Retailer_Type__c='Department Stores',Name = 'DECATHLON',JDE_LOB__c  ='DEC');
        insert retailer;
        Sales_Transaction_Stage__c salesTransStagRec = new Sales_Transaction_Stage__c();
        salesTransStagRec.Upload_Batch_No__c = salesTransStagRec.Id;
        salesTransStagRec.Vendor__c  = 'DemoRetailer';
        salesTransStagRec.Upload_Batch_No__c = value.id;
        salesTransStagRec.Remarks__c = 'abcdse';
        insert salesTransStagRec;



        String [] fieldNameS =new String[]{'Year','Week','Month','Material','Source','Category','Family','Label','Vendor','Division','Market','Remark','LOB','ItemCode','Model','PrintedLogo','Color','Customer','LocalName','MainettiBrand','SubCategory','OrderType','UnitSold','LocalCurrency','ShippedToFactory','ShippedToCountry','EndUser','RetailerBrand','RoyaltyRate','SONumber','ProductionCountry'};
            String oldValue = 'BOTTOMS';
        String newValue = 'BOTTOM';
        String batchId = salesTransStagRec.Id;
        String companyName = 'Hong Kong Packaging';
        String errMap = 'Family';
        String pickListToRemove = 'Family';
        Date d = date.today();
        boolean flag = true;
        Test.startTest();
        for(String fldName :fieldNameS){
            String fieldName = fldName;
            processSalesData processData = new processSalesData();
            //  processData.updateTransStagNInsertErrorMapValues(fieldName,oldValue,newValue,batchId,companyName,errMap,pickListToRemove);
            //processSalesData.generateMapKeyString(salesTransStagRec);
            //   processSalesData.getfieldWithObject(fieldName,newValue,salesTransStagRec);
            processData.isValueNumeric('123');
           // processSalesData.getWeekCount(d);
        }
        Test.stopTest();
    }
    static testMethod void missingFieldValueTest(){

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        cogs.MCare_Mainetti_Brand_Check__c = true;
        cogs.MCare_Material_Check__c = true;
        insert cogs;

        Map<Decimal,Map<string,string>> inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
        Map<string,string> productionCoungtryMap = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
        Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap = new Map<string,string>();
        Map<string,string> mcaremainettibrandPicklist = new Map<String,string>();
        Map<string,string> mcarematerialPicklist = new Map<String,string>();

        Sales_Transaction_Stage__c dataRow = new Sales_Transaction_Stage__c();
        dataRow.Model__c = '';
        dataRow.Color__c = '';
        dataRow.Category__c = 'mcare';
        dataRow.Market__c = '';
        dataRow.Vendor__c = 'lululemon';
        dataRow.Company__c = 'Hong Kong Packaging';
        dataRow.Material__c = '';
        dataRow.Shipped_To_Factory__c = '';
        dataRow.Shipped_To_Country__c = '';
        dataRow.Division__c = '';
        dataRow.Item_code__c = '';
        dataRow.Mainetti_Brand__c = '';
        dataRow.Order_Type__c = '';
        dataRow.Customer__c = '';
        dataRow.Transaction_Currency__c = '';
        dataRow.ExRate_to_EUR__c = '';
        dataRow.ExRate_to_USD__c = '';
        dataRow.Sales_EUR__c = '';
        dataRow.Unit_Price_100_EUR__c = '';
        dataRow.Unit_Price_100_USD__c = '';
        dataRow.Net_Unit_Price_100__c = '';
        dataRow.Month__c = '';
        dataRow.Source__c = '';
        dataRow.Unit_Sold__c = '1';
        dataRow.Sales_USD__c = '';
        dataRow.Sales_EUR__c = '';
        dataRow.Sales_Transaction_Currency__c = '';
        dataRow.Week__c = '';
        dataRow.Year__c = '';
        dataRow.SO_Number__c = '';
        dataRow.LOB__c = '';
        dataRow.Gross_Sales_USD__c = '';
        dataRow.Freight_Charge_USD__c = '';
        dataRow.Production_Country__c = '';
        dataRow.Row_No__c = 2000;
        dataRow.Upload_Batch_No__c = value.id;
        dataRow.Sales_Delivery_Date__c = '';
        dataRow.Sales_Order_Date__c = '';
        insert dataRow;
                pricebookprintCheckMap.put(dataRow.Vendor__c,'true');
        getSalesOderDateCheckMap.put(dataRow.Vendor__c,'true');
         getSalesDeliveryDateCheckMap.put(dataRow.Vendor__c,'true');


        Sales_Transaction_Stage__c salestrans = new Sales_Transaction_Stage__c();

        salestrans.Gross_Sales_USD__c ='abc';
        //salestrans.Gross_Sales_USD__c = '0';
        salestrans.Freight_Charge_USD__c = 'bed';
        salestrans.Row_No__c =0;
        salestrans.Production_Country__c = '';
        salestrans.Upload_Batch_No__c = value.id;
         salestrans.Category__c = 'mcare';
        salestrans.Material__c = '';
        salestrans.Production_Country__c = '';
        salestrans.Sales_Delivery_Date__c = '';
        salestrans.Sales_Order_Date__c = '';
         salestrans.Unit_Sold__c = '0';
        insert salestrans;

        Sales_Transaction_Stage__c rowUpdate = new Sales_Transaction_Stage__c();
        rowUpdate.Gross_Sales_USD__c ='0';
        //salestrans.Gross_Sales_USD__c = '0';
        rowUpdate.Freight_Charge_USD__c = 'bed';
        rowUpdate.Row_No__c =0;
        rowUpdate.Production_Country__c = '';
        rowUpdate.Sales_Delivery_Date__c = '';
        rowUpdate.Sales_Order_Date__c = '';
        rowUpdate.Mainetti_Brand__c = '';
        rowUpdate.Material__c = '';
        rowUpdate.Upload_Batch_No__c = value.id;
        rowUpdate.Unit_Sold__c = '0';
        insert rowUpdate;

        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'DEBENHAMS',Retailer_Type__c='Department Stores');
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = false;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true;
        retailercode.Order_Date_Check__c = true;
        retailercode.Delivery_Date_Check__c = true;
       
        
        
        insert retailercode;

        list<Retailer_Code__c> retailerCodes = [Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c ,Country__c,Market_Segment__c from Retailer_Code__c where Name <> null];
        for (Retailer_Code__c retailer : retailerCodes){

            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                productionCoungtryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }}




        Test.startTest();
        processSalesData prosal = new processSalesData();
        prosal.missingFieldValueBulk(dataRow, inCorrectFormatMap,productionCoungtryMap,pricebookprintCheckMap,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,mcaremainettibrandPicklist,mcarematerialPicklist);
        prosal.missingFieldValueBulk(salestrans, inCorrectFormatMap,productionCoungtryMap,pricebookprintCheckMap,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,mcaremainettibrandPicklist,mcarematerialPicklist);
        prosal.missingFieldValueBulk(rowUpdate, inCorrectFormatMap,productionCoungtryMap,pricebookprintCheckMap,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,mcaremainettibrandPicklist,mcarematerialPicklist);
        Test.stopTest();
    }
    static testMethod void reconcileDataWithSalesErrorMapTest(){

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'America Mid West - Hangers Unlimited';
        salesTransStagRecForReconciliation.Year__c = 'Year';
        salesTransStagRecForReconciliation.Week__c = 'Week';
        salesTransStagRecForReconciliation.Month__c ='Month';
        salesTransStagRecForReconciliation.Item_code__c = 'ItemCode';
        salesTransStagRecForReconciliation.Material__c ='Material';
        salesTransStagRecForReconciliation.Source__c = 'Source';
        salesTransStagRecForReconciliation.Printed_Logo__c = 'PrintedLogo';
        salesTransStagRecForReconciliation.Color__c = 'Color';
        salesTransStagRecForReconciliation.Model__c = 'bottom';
        salesTransStagRecForReconciliation.Customer__c = 'Customer';
        salesTransStagRecForReconciliation.Customer_local_name__c ='LocalName';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'MainettiBrand';
        salesTransStagRecForReconciliation.Category__c = 'Category';
        salesTransStagRecForReconciliation.Sub_Category__c = 'SubCategory';
        salesTransStagRecForReconciliation.Family__c = 'Family';
        salesTransStagRecForReconciliation.Order_Type__c = 'OrderType';
        salesTransStagRecForReconciliation.Unit_Sold__c = 'UnitSold';
        salesTransStagRecForReconciliation.Local_Currency__c = 'LocalCurrency';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'ShippedToFactory';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = 'ShippedToCountry';
        salesTransStagRecForReconciliation.Label__c = 'Label';
        salesTransStagRecForReconciliation.End_user__c = 'Enduser';
        salesTransStagRecForReconciliation.Vendor__c = 'Vendor';
        salesTransStagRecForReconciliation.Division__c = 'Division';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'RetailerBrand';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'RoyaltyRate';
        salesTransStagRecForReconciliation.Market__c = 'Market';
        salesTransStagRecForReconciliation.Remarks__c = 'Remarks';
        salesTransStagRecForReconciliation.LOB__c = 'LOB';
        salesTransStagRecForReconciliation.SO_Number__c = 'SONumber';
        salesTransStagRecForReconciliation.Production_Country__c = 'bottom';
        salesTransStagRecForReconciliation.ErrorMapData__c='Year';
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.1236';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');

        Sales_Error_Mapping__c salesErrorMap = new Sales_Error_Mapping__c();
         salesErrorMap.Company__c = 'America Mid West - Hangers Unlimited';
        // salesErrorMap.Company__c = salesTrans.Id;
        salesErrorMap.Map_From_Value__c = 'BOTTOM';
        salesErrorMap.Map_To_Value__c = 'BOTTOM';
        salesErrorMap.Raw_Data_Field__c = 'Family';
        salesErrorMap.Status__c = 'Active';
        insert salesErrorMap;

        List<Sales_Transaction_Stage__c> salestransstag = new   List<Sales_Transaction_Stage__c>();
        salestransstag.add(salesTransStagRecForReconciliation);

        //Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        /*   List<Sales_Error_Mapping__c> salesErrorMapping = [Select Company__c,Raw_Data_Field__c, Map_From_Value__c, Map_To_Value__c from Sales_Error_Mapping__c order by Company__c];
for(Sales_Error_Mapping__c errorMap : salesErrorMapping){
fullSalesErrorMap.put(errorMap.Company__c,errorMap.Company__c);
} */

        Sales_Error_Mapping__c salesError = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = '484BR',Map_To_Value__c = '484', Status__c = 'Active');
        insert salesError;
        Sales_Error_Mapping__c salesError1 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesError1;
        Sales_Error_Mapping__c salesErrors = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Family',Map_From_Value__c = 'SWIMWEAR',Map_To_Value__c = 'SWIMWEARS', Status__c = 'Active');
        insert salesErrors;
        Sales_Error_Mapping__c salesError2 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Year',Map_From_Value__c = 'Year',Map_To_Value__c = 'Year', Status__c = 'Active');
        insert salesError2;

        Sales_Error_Mapping__c salesError3 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Week',Map_From_Value__c = 'Week',Map_To_Value__c = 'Week', Status__c = 'Active');
        insert salesError3;

        Sales_Error_Mapping__c salesError4 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Month',Map_From_Value__c = 'Month',Map_To_Value__c = 'Month', Status__c = 'Active');

        insert salesError4;

        Sales_Error_Mapping__c salesError5 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Category',Map_From_Value__c = 'Category',Map_To_Value__c = 'Category', Status__c = 'Active');
        insert salesError5;
        Sales_Error_Mapping__c salesErrors5 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'BOTTOM',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors5;

        Sales_Error_Mapping__c salesError6 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ItemCode',Map_From_Value__c = 'ItemCode',Map_To_Value__c = 'ItemCode', Status__c = 'Active');
        insert salesError6;
        Sales_Error_Mapping__c salesErrors6 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'BOTTOM',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM' , Status__c = 'Active');
        //insert salesErrors6;
        Sales_Error_Mapping__c salesError7 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Material',Map_From_Value__c = 'Material',Map_To_Value__c = 'Material', Status__c = 'Active');
        insert salesError7;
        Sales_Error_Mapping__c salesErrors7 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'BOTTOM',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        // insert salesErrors7;
        Sales_Error_Mapping__c salesError8 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Source',Map_From_Value__c = 'Source',Map_To_Value__c = 'Source', Status__c = 'Active');
        insert salesError8;
        Sales_Error_Mapping__c salesErrors8 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'BOTTOM',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        // insert salesErrors8;
        Sales_Error_Mapping__c salesError9 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'PrintedLogo',Map_From_Value__c = 'PrintedLogo',Map_To_Value__c = 'PrintedLogo', Status__c = 'Active');
        insert salesError9;
        Sales_Error_Mapping__c salesErrors9 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'BOTTOM',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        // insert salesErrors9;

        Sales_Error_Mapping__c salesError10 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Color',Map_From_Value__c = 'Color',Map_To_Value__c = 'Color', Status__c = 'Active');
        insert salesError10;
        Sales_Error_Mapping__c salesErrors10 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Color',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors10;
        Sales_Error_Mapping__c salesError11 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Customer',Map_From_Value__c = 'Customer',Map_To_Value__c = 'Customer', Status__c = 'Active');
        insert salesError11;
        Sales_Error_Mapping__c salesErrors11 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Customer',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors11;
        Sales_Error_Mapping__c salesError12 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalName',Map_From_Value__c = 'LocalName',Map_To_Value__c = 'LocalName', Status__c = 'Active');
        insert salesError12;
        Sales_Error_Mapping__c salesErrors12 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalName',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors12;
        Sales_Error_Mapping__c salesError13 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'MainettiBrand',Map_From_Value__c = 'MainettiBrand',Map_To_Value__c = 'MainettiBrand', Status__c = 'Active');
        insert salesError13;
        Sales_Error_Mapping__c salesErrors13 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'MainettiBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors13;

        Sales_Error_Mapping__c salesError14 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SubCategory',Map_From_Value__c = 'SubCategory',Map_To_Value__c = 'SubCategory', Status__c = 'Active');
        insert salesError14;
        Sales_Error_Mapping__c salesErrors14 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SubCategory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors14;
        Sales_Error_Mapping__c salesError15 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'OrderType',Map_From_Value__c = 'OrderType',Map_To_Value__c = 'OrderType', Status__c = 'Active');
        insert salesError15;
        Sales_Error_Mapping__c salesErrors15 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'OrderType',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM' , Status__c = 'Active');
        insert salesErrors15;
        Sales_Error_Mapping__c salesError16 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'UnitSold',Map_From_Value__c = 'UnitSold',Map_To_Value__c = 'UnitSold', Status__c = 'Active');
        insert salesError16;
        Sales_Error_Mapping__c salesErrors16 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'UnitSold',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors16;
        Sales_Error_Mapping__c salesError17 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalCurrency',Map_From_Value__c = 'LocalCurrency',Map_To_Value__c = 'LocalCurrency', Status__c = 'Active');
        insert salesError17;
        Sales_Error_Mapping__c salesErrors17 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors17;

        Sales_Error_Mapping__c salesError18 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToFactory',Map_From_Value__c = 'ShippedToFactory',Map_To_Value__c = 'ShippedToFactory', Status__c = 'Active');
        insert salesError18;
        Sales_Error_Mapping__c salesErrors18 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToFactory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors18;
        Sales_Error_Mapping__c salesError19 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToCountry',Map_From_Value__c = 'ShippedToCountry',Map_To_Value__c = 'ShippedToCountry', Status__c = 'Active');
        insert salesError19;
        Sales_Error_Mapping__c salesErrors19 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors19;
        Sales_Error_Mapping__c salesError20 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Label',Map_From_Value__c = 'Label',Map_To_Value__c = 'Label', Status__c = 'Active');
        insert salesError20;
        Sales_Error_Mapping__c salesErrors20 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Label',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors20;
        Sales_Error_Mapping__c salesError21 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'EndUser',Map_From_Value__c = 'EndUser',Map_To_Value__c = 'EndUser', Status__c = 'Active');
        insert salesError21;
        Sales_Error_Mapping__c salesErrors21 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'EndUser',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors21;

        Sales_Error_Mapping__c salesError22 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Vendor',Map_From_Value__c = 'Vendor',Map_To_Value__c = 'Vendor', Status__c = 'Active');
        insert salesError22;
        Sales_Error_Mapping__c salesErrors22 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Vendor',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors22;
        Sales_Error_Mapping__c salesError23 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Division',Map_From_Value__c = 'Division',Map_To_Value__c = 'Division', Status__c = 'Active');
        insert salesError23;
        Sales_Error_Mapping__c salesErrors23 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Division',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors23;
        Sales_Error_Mapping__c salesError24 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RetailerBrand',Map_From_Value__c = 'RetailerBrand',Map_To_Value__c = 'RetailerBrand', Status__c = 'Active');
        insert salesError24;
        Sales_Error_Mapping__c salesErrors24 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RetailerBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors24;
        Sales_Error_Mapping__c salesError25 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RoyaltyRate',Map_From_Value__c = 'RoyaltyRate',Map_To_Value__c = 'RoyaltyRate', Status__c = 'Active');
        insert salesError25;
        Sales_Error_Mapping__c salesErrors25 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RoyaltyRate',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors25;

        Sales_Error_Mapping__c salesError26 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Market',Map_From_Value__c = 'Market',Map_To_Value__c = 'Market', Status__c = 'Active');
        insert salesError26;
        Sales_Error_Mapping__c salesErrors26 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Market',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors26;

        Sales_Error_Mapping__c salesError27 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Remarks',Map_From_Value__c = 'Remarks',Map_To_Value__c = 'Remarks', Status__c = 'Active');
        insert salesError27;
        Sales_Error_Mapping__c salesErrors27 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Remarks',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors27;

        Sales_Error_Mapping__c salesError28 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LOB',Map_From_Value__c = 'LOB',Map_To_Value__c = 'LOB', Status__c = 'Active');
        insert salesError28;
        Sales_Error_Mapping__c salesErrors28 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LOB',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors28;
        Sales_Error_Mapping__c salesError29 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SONumber',Map_From_Value__c = 'SONumber',Map_To_Value__c = 'SONumber', Status__c = 'Active');
        insert salesError29;
        Sales_Error_Mapping__c salesErrors29 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SONumber',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors29;
        Sales_Error_Mapping__c salesError30 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ProductionCountry',Map_From_Value__c = 'ProductionCountry',Map_To_Value__c = 'ProductionCountry');
        insert salesError30;
        Sales_Error_Mapping__c salesErrors30 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ProductionCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors30;
        Sales_Error_Mapping__c salesError31 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'TransactionCurrency',Map_From_Value__c = 'TransactionCurrency',Map_To_Value__c = 'TransactionCurrency', Status__c = 'Active');
        insert salesError31;
        Sales_Error_Mapping__c salesErrors31 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'TransactionCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors31;

        Sales_Transaction_Stage__c salesTrans = new Sales_Transaction_Stage__c();
        salesTrans.Company__c = salesError.id;
        salesTrans.Year__c = 'Year';
        salesTrans.Week__c = 'Week';
        salesTrans.Month__c ='Month';
        salesTrans.Item_code__c = 'sfd';
        salesTrans.Material__c ='original';
        salesTrans.Source__c = 'gfd';
        salesTrans.Printed_Logo__c = 'brand';
        salesTrans.Color__c = 'gray';
        salesTrans.Customer__c = 'local';
        salesTrans.Customer_local_name__c ='sfdc';
        salesTrans.Mainetti_Brand__c = 'original';
        salesTrans.Category__c = 'asce';
        salesTrans.Sub_Category__c = 'sdc';
        salesTrans.Family__c = 'BOTTOM';
        salesTrans.Order_Type__c = 'online';
        salesTrans.Unit_Sold__c = 'soft';
        salesTrans.Local_Currency__c = 'rupee';
        salesTrans.Shipped_To_Factory__c = 'laghul';
        salesTrans.Shipped_To_Country__c = 'hongkong';
        salesTrans.Label__c = 'brand';
        salesTrans.End_user__c = 'add';
        salesTrans.Vendor__c = 'kase';
        salesTrans.Division__c = 'local';
        salesTrans.Retailer_Brand__c = 'original';
        salesTrans.Royalty_Rate__c = 'cost';
        salesTrans.Market__c = 'loacl';
        salesTrans.Remarks__c = 'noo';
        salesTrans.LOB__c = 'C';
        salesTrans.SO_Number__c = '32';
        salesTrans.Production_Country__c = 'Hk';
        salesTrans.Transaction_Currency__c = '100';
        salesTrans.Model__c = '100abc';
        salesTrans.ErrorMapData__c='Year';
        salesTrans.Upload_Batch_No__c = value.id;
         salesTrans.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTrans.Sales_Order_Date__c = '4-JAN-2021';
          salesTrans.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTrans;

        
        List<Sales_Transaction_Stage__c> salestransstage = new   List<Sales_Transaction_Stage__c>();
        salestransstage.add(salesTrans);


        System.assertEquals(salesError.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError.Raw_Data_Field__c, 'Model','putFileRequestTest');
        System.assertEquals(salesError.Map_From_Value__c, '484BR','putFileRequestTest');
        System.assertEquals(salesError.Map_To_Value__c, '484','putFileRequestTest');

        System.assertEquals(salesErrors.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors.Raw_Data_Field__c, 'Family','putFileRequestTest');
        System.assertEquals(salesErrors.Map_From_Value__c, 'SWIMWEAR','putFileRequestTest');
        System.assertEquals(salesErrors.Map_To_Value__c, 'SWIMWEARS','putFileRequestTest');

        System.assertEquals(salesError2.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError2.Raw_Data_Field__c, 'Year','putFileRequestTest');
        System.assertEquals(salesError2.Map_From_Value__c, 'Year','putFileRequestTest');
        System.assertEquals(salesError2.Map_To_Value__c, 'Year','putFileRequestTest');


        System.assertEquals(salesError3.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError3.Raw_Data_Field__c, 'Week','putFileRequestTest');
        System.assertEquals(salesError3.Map_From_Value__c, 'Week','putFileRequestTest');
        System.assertEquals(salesError3.Map_To_Value__c, 'Week','putFileRequestTest');


        System.assertEquals(salesError4.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError4.Raw_Data_Field__c, 'Month','putFileRequestTest');
        System.assertEquals(salesError4.Map_From_Value__c, 'Month','putFileRequestTest');
        System.assertEquals(salesError4.Map_To_Value__c, 'Month','putFileRequestTest');



        System.assertEquals(salesError6.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError6.Raw_Data_Field__c, 'ItemCode','putFileRequestTest');
        System.assertEquals(salesError6.Map_From_Value__c, 'ItemCode','putFileRequestTest');
        System.assertEquals(salesError6.Map_To_Value__c, 'ItemCode','putFileRequestTest');
        System.assertEquals(salesErrors6.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors6.Raw_Data_Field__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError7.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError7.Raw_Data_Field__c, 'Material','putFileRequestTest');
        System.assertEquals(salesError7.Map_From_Value__c, 'Material','putFileRequestTest');
        System.assertEquals(salesError7.Map_To_Value__c, 'Material','putFileRequestTest');
        System.assertEquals(salesErrors7.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors7.Raw_Data_Field__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError8.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError8.Raw_Data_Field__c, 'Source','putFileRequestTest');
        System.assertEquals(salesError8.Map_From_Value__c, 'Source','putFileRequestTest');
        System.assertEquals(salesError8.Map_To_Value__c, 'Source','putFileRequestTest');
        System.assertEquals(salesErrors8.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors8.Raw_Data_Field__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError9.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError9.Raw_Data_Field__c, 'PrintedLogo','putFileRequestTest');
        System.assertEquals(salesError9.Map_From_Value__c, 'PrintedLogo','putFileRequestTest');
        System.assertEquals(salesError9.Map_To_Value__c, 'PrintedLogo','putFileRequestTest');
        System.assertEquals(salesErrors9.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors9.Raw_Data_Field__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError10.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError10.Raw_Data_Field__c, 'Color','putFileRequestTest');
        System.assertEquals(salesError10.Map_From_Value__c, 'Color','putFileRequestTest');
        System.assertEquals(salesError10.Map_To_Value__c, 'Color','putFileRequestTest');
        System.assertEquals(salesErrors10.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors10.Raw_Data_Field__c, 'Color','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError11.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError11.Raw_Data_Field__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesError11.Map_From_Value__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesError11.Map_To_Value__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesErrors11.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors11.Raw_Data_Field__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError12.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError12.Raw_Data_Field__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesError12.Map_From_Value__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesError12.Map_To_Value__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesErrors12.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors12.Raw_Data_Field__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError13.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError13.Raw_Data_Field__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesError13.Map_From_Value__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesError13.Map_To_Value__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesErrors13.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors13.Raw_Data_Field__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError14.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError14.Raw_Data_Field__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesError14.Map_From_Value__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesError14.Map_To_Value__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesErrors14.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors14.Raw_Data_Field__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError15.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError15.Raw_Data_Field__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesError15.Map_From_Value__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesError15.Map_To_Value__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesErrors15.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors15.Raw_Data_Field__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError16.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError16.Raw_Data_Field__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesError16.Map_From_Value__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesError16.Map_To_Value__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesErrors16.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors16.Raw_Data_Field__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError17.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError17.Raw_Data_Field__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesError17.Map_From_Value__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesError17.Map_To_Value__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesErrors17.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors17.Raw_Data_Field__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError18.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError18.Raw_Data_Field__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesError18.Map_From_Value__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesError18.Map_To_Value__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesErrors18.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors18.Raw_Data_Field__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError19.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError19.Raw_Data_Field__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesError19.Map_From_Value__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesError19.Map_To_Value__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesErrors19.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors19.Raw_Data_Field__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesError20.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError20.Raw_Data_Field__c, 'Label','putFileRequestTest');
        System.assertEquals(salesError20.Map_From_Value__c, 'Label','putFileRequestTest');
        System.assertEquals(salesError20.Map_To_Value__c, 'Label','putFileRequestTest');
        System.assertEquals(salesErrors20.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors20.Raw_Data_Field__c, 'Label','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError21.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError21.Raw_Data_Field__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesError21.Map_From_Value__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesError21.Map_To_Value__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesErrors21.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors21.Raw_Data_Field__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError22.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError22.Raw_Data_Field__c, 'Vendor','putFileRequestTest');
        System.assertEquals(salesError22.Map_From_Value__c, 'Vendor','putFileRequestTest');
        System.assertEquals(salesError22.Map_To_Value__c, 'Vendor','putFileRequestTest');
        System.assertEquals(salesErrors22.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors22.Raw_Data_Field__c, 'Vendor','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesError23.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError23.Raw_Data_Field__c, 'Division','putFileRequestTest');
        System.assertEquals(salesError23.Map_From_Value__c, 'Division','putFileRequestTest');
        System.assertEquals(salesError23.Map_To_Value__c, 'Division','putFileRequestTest');
        System.assertEquals(salesErrors23.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors23.Raw_Data_Field__c, 'Division','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError24.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError24.Raw_Data_Field__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesError24.Map_From_Value__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesError24.Map_To_Value__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesErrors24.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors24.Raw_Data_Field__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError25.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError25.Raw_Data_Field__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesError25.Map_From_Value__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesError25.Map_To_Value__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesErrors25.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors25.Raw_Data_Field__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError26.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError26.Raw_Data_Field__c, 'Market','putFileRequestTest');
        System.assertEquals(salesError26.Map_From_Value__c, 'Market','putFileRequestTest');
        System.assertEquals(salesError26.Map_To_Value__c, 'Market','putFileRequestTest');
        System.assertEquals(salesErrors26.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors26.Raw_Data_Field__c, 'Market','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError27.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError27.Raw_Data_Field__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesError27.Map_From_Value__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesError27.Map_To_Value__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesErrors27.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors27.Raw_Data_Field__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesError28.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError28.Raw_Data_Field__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesError28.Map_From_Value__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesError28.Map_To_Value__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesErrors28.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors28.Raw_Data_Field__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError29.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError29.Raw_Data_Field__c, 'SONumber','putFileRequestTest');
        System.assertEquals(salesError29.Map_From_Value__c, 'SONumber','putFileRequestTest');
        System.assertEquals(salesError29.Map_To_Value__c, 'SONumber');
        System.assertEquals(salesErrors29.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors29.Raw_Data_Field__c, 'SONumber','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError30.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError30.Raw_Data_Field__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesError30.Map_From_Value__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesError30.Map_To_Value__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesErrors30.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors30.Raw_Data_Field__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesError31.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError31.Raw_Data_Field__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesError31.Map_From_Value__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesError31.Map_To_Value__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesErrors31.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors31.Raw_Data_Field__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertNotEquals(salesError1.Company__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Raw_Data_Field__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_From_Value__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_To_Value__c, '','putFileRequestTest');

        string selcomp = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        string selMonth = 'May';
        string selYear = '2019';
        String batchId = value.Id;
        String userName = UserInfo.getUserName();
        User activeUser = [Select Email From User where Username = : userName limit 1];
        String userEmailNotify = activeUser.Email;

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
        customData.CostToTolerance__c = '5.0';
        insert customData;

         Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'lululemon');
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

          Retailer_Code__c retailercodes = new Retailer_Code__c(Name = 'OLD ');
          retailercodes.Retailer_Type__c='Department Stores';
        retailercodes.Label_Check__c = true;
        retailercodes.Division_check__c = true;
        retailercodes.Retailer_Brand_Check__c = true;
        retailercodes.Sales_Data_Upload_Check__c = true;
        retailercodes.Sales_Data_Upload_Color__c = true;
        retailercodes.Production_Country__c = true;
        
        insert retailercodes;

        Price_Specification_Book__c psb = new Price_Specification_Book__c();
        psb.Retailer_Code__c = retailercode.Id;
        psb.Business_Vertical__c = 'TLA';
        psb.COGS_Costing_Check__c=true;
        insert psb;

        getSalesMasterData salesErrorMapp = new getSalesMasterData();
        salesErrorMapp.getFullSalesErrorMap();
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;

        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();

        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap =  salesErrorMapp.getFullSalesErrorMap();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = new  Map<string,Retailer_Code__c>();
        Map<string,List<String>> getModelandColorMap = new Map<string,List<String>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation.Vendor__c+'#'+salesTransStagRecForReconciliation.Category__c;
        checkVendorCategory.put(vendorCategory.toLowerCase(),vendorCategory.toLowerCase());
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        Map<string,List<String>> checkVendorModelPrintedLogo = new  Map<string,List<String>>();
         Map<string,List<String>> checkVendorModelColorPrintedLogo = new  Map<string,List<String>>();

        Test.startTest();
        getSalesMasterData getSalesMast = new getSalesMasterData();
        getSalesMast.preValidationSalesStageDataByPage(salesTransStagRecAfterReconciliation,fullSalesErrorMap,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        getSalesMast.getSalesStageRowsByPage(salesTransStagRecAfterReconciliation,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        processSalesData prosaldata = new processSalesData();
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstage, fullSalesErrorMap);
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstag, fullSalesErrorMap);
        //prosaldata.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        Test.stopTest();
    }

    static testMethod void reconcileDataWithSalesErrorMapTest2(){

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'America Mid West - Hangers Unlimited';
        salesTransStagRecForReconciliation.Year__c = 'Year';
        salesTransStagRecForReconciliation.Week__c = 'Week';
        salesTransStagRecForReconciliation.Month__c ='Month';
        salesTransStagRecForReconciliation.Item_code__c = 'HGR-3944   BLK002-  101';
        salesTransStagRecForReconciliation.Material__c ='SP';
        salesTransStagRecForReconciliation.Source__c = 'lululemon';
        salesTransStagRecForReconciliation.Printed_Logo__c = 'demologo';
        salesTransStagRecForReconciliation.Color__c = 'blackK';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'sfd';
        salesTransStagRecForReconciliation.Customer_local_name__c ='abc';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'mainettii';
        salesTransStagRecForReconciliation.Category__c = 'TLA';
        salesTransStagRecForReconciliation.Sub_Category__c = 'sfd';
        salesTransStagRecForReconciliation.Family__c = 'BOTTOM';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Unit_Sold__c = '125209';
        salesTransStagRecForReconciliation.Local_Currency__c = 'rupee';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'lalugh';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = 'hangkong';
        salesTransStagRecForReconciliation.Label__c = 'brand';
        salesTransStagRecForReconciliation.End_user__c = 'user';
        salesTransStagRecForReconciliation.Vendor__c = 'bottom';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'select';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = 'PRL123456789012345688';
        salesTransStagRecForReconciliation.SO_Number__c = '183001689999898988';
        salesTransStagRecForReconciliation.Production_Country__c = 'CHINAa';
        salesTransStagRecForReconciliation.ErrorMapData__c='Year';
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
         salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');




        Sales_Error_Mapping__c salesErrorMap = new Sales_Error_Mapping__c();
         salesErrorMap.Company__c = 'America Mid West - Hangers Unlimited';
        // salesErrorMap.Company__c = salesTrans.Id;
        salesErrorMap.Map_From_Value__c = 'BOTTOM';
        salesErrorMap.Map_To_Value__c = 'BOTTOM';
        salesErrorMap.Raw_Data_Field__c = 'Family';
        salesErrorMap.Status__c = 'Active';
        insert salesErrorMap;


        List<Sales_Transaction_Stage__c> salestransstag = new   List<Sales_Transaction_Stage__c>();
        salestransstag.add(salesTransStagRecForReconciliation);

        //Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        /*   List<Sales_Error_Mapping__c> salesErrorMapping = [Select Company__c,Raw_Data_Field__c, Map_From_Value__c, Map_To_Value__c from Sales_Error_Mapping__c order by Company__c];
for(Sales_Error_Mapping__c errorMap : salesErrorMapping){
fullSalesErrorMap.put(errorMap.Company__c,errorMap.Company__c);
} */

        Sales_Error_Mapping__c salesError = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = '484BR',Map_To_Value__c = '484',Status__c = 'Active');
        insert salesError;
        Sales_Error_Mapping__c salesError1 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM',Status__c = 'Active');
        insert salesError1;
        Sales_Error_Mapping__c salesErrors = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Family',Map_From_Value__c = 'OUTERWEAR',Map_To_Value__c = 'OUTERWEARS',Status__c = 'Active');
        insert salesErrors;
        Sales_Error_Mapping__c salesErrors2 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Year',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors2;
        Sales_Error_Mapping__c salesErrors3 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Week',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors3;
        Sales_Error_Mapping__c salesErrors4 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Month',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors4;
        Sales_Error_Mapping__c salesErrors5 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Category',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors5;
        Sales_Error_Mapping__c salesErrors6 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ItemCode',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors6;
        Sales_Error_Mapping__c salesErrors7 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Material',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors7;
        Sales_Error_Mapping__c salesErrors8 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Source',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors8;
        Sales_Error_Mapping__c salesErrors9 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'PrintedLogo',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors9;
        Sales_Error_Mapping__c salesErrors10 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Color',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors10;

        Sales_Error_Mapping__c salesErrors11 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Customer',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors11;

        Sales_Error_Mapping__c salesErrors12 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalName',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors12;

        Sales_Error_Mapping__c salesErrors13 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'MainettiBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors13;


        Sales_Error_Mapping__c salesErrors14 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SubCategory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors14;

        Sales_Error_Mapping__c salesErrors15 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'OrderType',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors15;

        Sales_Error_Mapping__c salesErrors16 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'UnitSold',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors16;

        Sales_Error_Mapping__c salesErrors17 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors17;


        Sales_Error_Mapping__c salesErrors18 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToFactory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors18;

        Sales_Error_Mapping__c salesErrors19 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors19;

        Sales_Error_Mapping__c salesErrors20 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Label',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors20;

        Sales_Error_Mapping__c salesErrors21 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'EndUser',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors21;


        Sales_Error_Mapping__c salesErrors22 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Retailer',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors22;

        Sales_Error_Mapping__c salesErrors23 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Division',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors23;

        Sales_Error_Mapping__c salesErrors24 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RetailerBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors24;

        Sales_Error_Mapping__c salesErrors25 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RoyaltyRate',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors25;


        Sales_Error_Mapping__c salesErrors26 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Market',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors26;


        Sales_Error_Mapping__c salesErrors27 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Remarks',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors27;


        Sales_Error_Mapping__c salesErrors28 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LOB',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors28;

        Sales_Error_Mapping__c salesErrors29 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SONumber',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors29;

        Sales_Error_Mapping__c salesErrors30 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ProductionCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors30;

        Sales_Error_Mapping__c salesErrors31 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'TransactionCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors31;

        Sales_Transaction_Stage__c salesTrans = new Sales_Transaction_Stage__c();
        salesTrans.Company__c = salesError.id;
        salesTrans.Year__c = 'Year';
        salesTrans.Week__c = 'Week';
        salesTrans.Month__c ='Month';
        salesTrans.Item_code__c = 'sfd';
        salesTrans.Material__c ='original';
        salesTrans.Source__c = 'gfd';
        salesTrans.Printed_Logo__c = 'brand';
        salesTrans.Color__c = 'gray';
        salesTrans.Customer__c = 'local';
        salesTrans.Customer_local_name__c ='sfdc';
        salesTrans.Mainetti_Brand__c = 'original';
        salesTrans.Category__c = 'asce';
        salesTrans.Sub_Category__c = 'sdc';
        salesTrans.Family__c = 'BOTTOM';
        salesTrans.Order_Type__c = 'online';
        salesTrans.Unit_Sold__c = 'soft';
        salesTrans.Local_Currency__c = 'rupee';
        salesTrans.Shipped_To_Factory__c = 'laghul';
        salesTrans.Shipped_To_Country__c = 'hongkong';
        salesTrans.Label__c = 'brand';
        salesTrans.End_user__c = 'add';
        salesTrans.Vendor__c = 'kase';
        salesTrans.Division__c = 'local';
        salesTrans.Retailer_Brand__c = 'original';
        salesTrans.Royalty_Rate__c = 'cost';
        salesTrans.Market__c = 'loacl';
        salesTrans.Remarks__c = 'noo';
        salesTrans.LOB__c = 'C';
        salesTrans.SO_Number__c = '32';
        salesTrans.Production_Country__c = 'Hk';
        salesTrans.Transaction_Currency__c = '100';
        salesTrans.Model__c = '100abc';
        salesTrans.ErrorMapData__c='Year';
        salesTrans.Upload_Batch_No__c = value.id;
         salesTrans.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTrans.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTrans;
        List<Sales_Transaction_Stage__c> salestransstage = new   List<Sales_Transaction_Stage__c>();
        salestransstage.add(salesTrans);


        System.assertEquals(salesError.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError.Raw_Data_Field__c, 'Model','putFileRequestTest');
        System.assertEquals(salesError.Map_From_Value__c, '484BR','putFileRequestTest');
        System.assertEquals(salesError.Map_To_Value__c, '484','putFileRequestTest');

        System.assertEquals(salesErrors.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors.Raw_Data_Field__c, 'Family','putFileRequestTest');
        System.assertEquals(salesErrors.Map_From_Value__c, 'OUTERWEAR','putFileRequestTest');
        System.assertEquals(salesErrors.Map_To_Value__c, 'OUTERWEARS','putFileRequestTest');


        System.assertEquals(salesErrors2.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors2.Raw_Data_Field__c, 'Year','putFileRequestTest');
        System.assertEquals(salesErrors2.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors2.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors3.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors3.Raw_Data_Field__c, 'Week','putFileRequestTest');
        System.assertEquals(salesErrors3.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors3.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors4.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors4.Raw_Data_Field__c, 'Month','putFileRequestTest');
        System.assertEquals(salesErrors4.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors4.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors5.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors5.Raw_Data_Field__c, 'Category','putFileRequestTest');
        System.assertEquals(salesErrors5.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors5.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors6.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors6.Raw_Data_Field__c, 'ItemCode','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors7.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors7.Raw_Data_Field__c, 'Material','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors8.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors8.Raw_Data_Field__c, 'Source','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors9.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors9.Raw_Data_Field__c, 'PrintedLogo','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors10.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors10.Raw_Data_Field__c, 'Color','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors11.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors11.Raw_Data_Field__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors12.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors12.Raw_Data_Field__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors13.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors13.Raw_Data_Field__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors14.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors14.Raw_Data_Field__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors15.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors15.Raw_Data_Field__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors16.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors16.Raw_Data_Field__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors17.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors17.Raw_Data_Field__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors18.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors18.Raw_Data_Field__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors19.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors19.Raw_Data_Field__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors20.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors20.Raw_Data_Field__c, 'Label','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors21.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors21.Raw_Data_Field__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors22.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors22.Raw_Data_Field__c, 'Retailer','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors23.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors23.Raw_Data_Field__c, 'Division','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors24.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors24.Raw_Data_Field__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors25.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors25.Raw_Data_Field__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors26.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors26.Raw_Data_Field__c, 'Market','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors27.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors27.Raw_Data_Field__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors28.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors28.Raw_Data_Field__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors29.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors29.Raw_Data_Field__c, 'SONumber','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors30.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors30.Raw_Data_Field__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesErrors31.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors31.Raw_Data_Field__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertNotEquals(salesError1.Company__c, 'Vietnam','putFileRequestTest');
        System.assertNotEquals(salesError1.Raw_Data_Field__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_From_Value__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_To_Value__c, '','putFileRequestTest');


        string selcomp = 'Hong Kong Packaging';
        string selMonth = 'Feb';
        string selYear = '2019';
        String batchId = '';
        String userName = UserInfo.getUserName();
        User activeUser = [Select Email From User where Username = : userName limit 1];
        String userEmailNotify = activeUser.Email;

        getSalesMasterData salesErrorMapp = new getSalesMasterData();
        salesErrorMapp.getFullSalesErrorMap();

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
        customData.CostToTolerance__c = '5.0';
        insert customData;


        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();

        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap =  salesErrorMapp.getFullSalesErrorMap();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = new  Map<string,Retailer_Code__c>();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation.Vendor__c+'#'+salesTransStagRecForReconciliation.Category__c;
        checkVendorCategory.put(vendorCategory.toLowerCase(),vendorCategory.toLowerCase());
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
         Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();

        Test.startTest();
        getSalesMasterData getSalesMast = new getSalesMasterData();
       //  getSalesMast.preValidationSalesStageDataByPage(salesTransStagRecAfterReconciliation,fullSalesErrorMap,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
       //getSalesMast.getSalesStageRowsByPage(salesTransStagRecAfterReconciliation,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        processSalesData prosaldata = new processSalesData();
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstage, fullSalesErrorMap);
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstag, fullSalesErrorMap);
        Test.stopTest();

     }
     
    static testMethod void reconcileDataWithSalesErrorMapTest1(){

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Record_Type__c = 'Sales';
        insert value;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'America Mid West - Hangers Unlimited';
        salesTransStagRecForReconciliation.Year__c = 'Year';
        salesTransStagRecForReconciliation.Week__c = 'Week';
        salesTransStagRecForReconciliation.Month__c ='Month';
        salesTransStagRecForReconciliation.Item_code__c = 'HGR-3944   BLK002-  101';
        salesTransStagRecForReconciliation.Material__c ='SP';
        salesTransStagRecForReconciliation.Source__c = 'lululemon';
        salesTransStagRecForReconciliation.Printed_Logo__c = 'demologo';
        salesTransStagRecForReconciliation.Color__c = 'blackK';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'sfd';
        salesTransStagRecForReconciliation.Customer_local_name__c ='abc';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'mainettii';
        salesTransStagRecForReconciliation.Category__c = 'TLA';
        salesTransStagRecForReconciliation.Sub_Category__c = 'sfd';
        salesTransStagRecForReconciliation.Family__c = 'BOTTOM';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Unit_Sold__c = '125209';
        salesTransStagRecForReconciliation.Local_Currency__c = 'rupee';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'lalugh';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = 'hangkong';
        salesTransStagRecForReconciliation.Label__c = 'brand';
        salesTransStagRecForReconciliation.End_user__c = 'user';
        salesTransStagRecForReconciliation.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'select';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = 'PRL123456789012345688';
        salesTransStagRecForReconciliation.SO_Number__c = '183001689999898988';
        salesTransStagRecForReconciliation.Production_Country__c = 'CHINAa';
        salesTransStagRecForReconciliation.ErrorMapData__c='Year';
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
         salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');




        Sales_Error_Mapping__c salesErrorMap = new Sales_Error_Mapping__c();
         salesErrorMap.Company__c = 'America Mid West - Hangers Unlimited';
        // salesErrorMap.Company__c = salesTrans.Id;
        salesErrorMap.Map_From_Value__c = 'BOTTOM';
        salesErrorMap.Map_To_Value__c = 'BOTTOM';
        salesErrorMap.Raw_Data_Field__c = 'Family';
        salesErrorMap.Status__c = 'Active';
        insert salesErrorMap;


        List<Sales_Transaction_Stage__c> salestransstag = new   List<Sales_Transaction_Stage__c>();
        salestransstag.add(salesTransStagRecForReconciliation);

        //Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        /*   List<Sales_Error_Mapping__c> salesErrorMapping = [Select Company__c,Raw_Data_Field__c, Map_From_Value__c, Map_To_Value__c from Sales_Error_Mapping__c order by Company__c];
for(Sales_Error_Mapping__c errorMap : salesErrorMapping){
fullSalesErrorMap.put(errorMap.Company__c,errorMap.Company__c);
} */

        Sales_Error_Mapping__c salesError = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = '484BR',Map_To_Value__c = '484',Status__c = 'Active');
        insert salesError;
        Sales_Error_Mapping__c salesError1 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM',Status__c = 'Active');
        insert salesError1;
        Sales_Error_Mapping__c salesErrors = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Family',Map_From_Value__c = 'OUTERWEAR',Map_To_Value__c = 'OUTERWEARS',Status__c = 'Active');
        insert salesErrors;
        Sales_Error_Mapping__c salesErrors2 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Year',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors2;
        Sales_Error_Mapping__c salesErrors3 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Week',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors3;
        Sales_Error_Mapping__c salesErrors4 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Month',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors4;
        Sales_Error_Mapping__c salesErrors5 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Category',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors5;
        Sales_Error_Mapping__c salesErrors6 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ItemCode',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors6;
        Sales_Error_Mapping__c salesErrors7 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Material',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors7;
        Sales_Error_Mapping__c salesErrors8 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Source',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors8;
        Sales_Error_Mapping__c salesErrors9 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'PrintedLogo',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors9;
        Sales_Error_Mapping__c salesErrors10 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Color',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors10;

        Sales_Error_Mapping__c salesErrors11 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Customer',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors11;

        Sales_Error_Mapping__c salesErrors12 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalName',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors12;

        Sales_Error_Mapping__c salesErrors13 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'MainettiBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors13;


        Sales_Error_Mapping__c salesErrors14 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SubCategory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors14;

        Sales_Error_Mapping__c salesErrors15 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'OrderType',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors15;

        Sales_Error_Mapping__c salesErrors16 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'UnitSold',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors16;

        Sales_Error_Mapping__c salesErrors17 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LocalCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors17;


        Sales_Error_Mapping__c salesErrors18 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToFactory',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors18;

        Sales_Error_Mapping__c salesErrors19 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ShippedToCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors19;

        Sales_Error_Mapping__c salesErrors20 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Label',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors20;

        Sales_Error_Mapping__c salesErrors21 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'EndUser',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors21;


        Sales_Error_Mapping__c salesErrors22 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Retailer',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors22;

        Sales_Error_Mapping__c salesErrors23 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Division',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors23;

        Sales_Error_Mapping__c salesErrors24 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RetailerBrand',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors24;

        Sales_Error_Mapping__c salesErrors25 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'RoyaltyRate',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors25;


        Sales_Error_Mapping__c salesErrors26 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Market',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors26;


        Sales_Error_Mapping__c salesErrors27 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Remarks',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors27;


        Sales_Error_Mapping__c salesErrors28 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'LOB',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors28;

        Sales_Error_Mapping__c salesErrors29 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'SONumber',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors29;

        Sales_Error_Mapping__c salesErrors30 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'ProductionCountry',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors30;

        Sales_Error_Mapping__c salesErrors31 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'TransactionCurrency',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM', Status__c = 'Active');
        insert salesErrors31;

        Sales_Transaction_Stage__c salesTrans = new Sales_Transaction_Stage__c();
        salesTrans.Company__c = salesError.id;
        salesTrans.Year__c = 'Year';
        salesTrans.Week__c = 'Week';
        salesTrans.Month__c ='Month';
        salesTrans.Item_code__c = 'sfd';
        salesTrans.Material__c ='original';
        salesTrans.Source__c = 'gfd';
        salesTrans.Printed_Logo__c = 'brand';
        salesTrans.Color__c = 'gray';
        salesTrans.Customer__c = 'local';
        salesTrans.Customer_local_name__c ='sfdc';
        salesTrans.Mainetti_Brand__c = 'original';
        salesTrans.Category__c = 'asce';
        salesTrans.Sub_Category__c = 'sdc';
        salesTrans.Family__c = 'BOTTOM';
        salesTrans.Order_Type__c = 'online';
        salesTrans.Unit_Sold__c = 'soft';
        salesTrans.Local_Currency__c = 'rupee';
        salesTrans.Shipped_To_Factory__c = 'laghul';
        salesTrans.Shipped_To_Country__c = 'hongkong';
        salesTrans.Label__c = 'brand';
        salesTrans.End_user__c = 'add';
        salesTrans.Vendor__c = 'kase';
        salesTrans.Division__c = 'local';
        salesTrans.Retailer_Brand__c = 'original';
        salesTrans.Royalty_Rate__c = 'cost';
        salesTrans.Market__c = 'loacl';
        salesTrans.Remarks__c = 'noo';
        salesTrans.LOB__c = 'C';
        salesTrans.SO_Number__c = '32';
        salesTrans.Production_Country__c = 'Hk';
        salesTrans.Transaction_Currency__c = '100';
        salesTrans.Model__c = '100abc';
        salesTrans.ErrorMapData__c='Year';
        salesTrans.Upload_Batch_No__c = value.id;
         salesTrans.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTrans.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTrans;
        List<Sales_Transaction_Stage__c> salestransstage = new   List<Sales_Transaction_Stage__c>();
        salestransstage.add(salesTrans);


        System.assertEquals(salesError.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError.Raw_Data_Field__c, 'Model','putFileRequestTest');
        System.assertEquals(salesError.Map_From_Value__c, '484BR','putFileRequestTest');
        System.assertEquals(salesError.Map_To_Value__c, '484','putFileRequestTest');

        System.assertEquals(salesErrors.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors.Raw_Data_Field__c, 'Family','putFileRequestTest');
        System.assertEquals(salesErrors.Map_From_Value__c, 'OUTERWEAR','putFileRequestTest');
        System.assertEquals(salesErrors.Map_To_Value__c, 'OUTERWEARS','putFileRequestTest');


        System.assertEquals(salesErrors2.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors2.Raw_Data_Field__c, 'Year','putFileRequestTest');
        System.assertEquals(salesErrors2.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors2.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors3.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors3.Raw_Data_Field__c, 'Week','putFileRequestTest');
        System.assertEquals(salesErrors3.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors3.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors4.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors4.Raw_Data_Field__c, 'Month','putFileRequestTest');
        System.assertEquals(salesErrors4.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors4.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors5.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors5.Raw_Data_Field__c, 'Category','putFileRequestTest');
        System.assertEquals(salesErrors5.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors5.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors6.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors6.Raw_Data_Field__c, 'ItemCode','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors6.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors7.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors7.Raw_Data_Field__c, 'Material','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors7.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors8.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors8.Raw_Data_Field__c, 'Source','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors8.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors9.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors9.Raw_Data_Field__c, 'PrintedLogo','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors9.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors10.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors10.Raw_Data_Field__c, 'Color','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors10.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors11.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors11.Raw_Data_Field__c, 'Customer','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors11.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors12.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors12.Raw_Data_Field__c, 'LocalName','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors12.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors13.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors13.Raw_Data_Field__c, 'MainettiBrand','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors13.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors14.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors14.Raw_Data_Field__c, 'SubCategory','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors14.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors15.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors15.Raw_Data_Field__c, 'OrderType','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors15.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors16.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors16.Raw_Data_Field__c, 'UnitSold','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors16.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors17.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors17.Raw_Data_Field__c, 'LocalCurrency','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors17.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors18.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors18.Raw_Data_Field__c, 'ShippedToFactory','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors18.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors19.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors19.Raw_Data_Field__c, 'ShippedToCountry','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors19.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors20.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors20.Raw_Data_Field__c, 'Label','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors20.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors21.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors21.Raw_Data_Field__c, 'EndUser','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors21.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors22.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors22.Raw_Data_Field__c, 'Retailer','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors22.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors23.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors23.Raw_Data_Field__c, 'Division','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors23.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors24.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors24.Raw_Data_Field__c, 'RetailerBrand','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors24.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors25.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors25.Raw_Data_Field__c, 'RoyaltyRate','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors25.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors26.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors26.Raw_Data_Field__c, 'Market','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors26.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors27.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors27.Raw_Data_Field__c, 'Remarks','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors27.Map_To_Value__c, 'BOTTOM','putFileRequestTest');



        System.assertEquals(salesErrors28.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors28.Raw_Data_Field__c, 'LOB','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors28.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors29.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors29.Raw_Data_Field__c, 'SONumber','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors29.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertEquals(salesErrors30.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors30.Raw_Data_Field__c, 'ProductionCountry','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors30.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertEquals(salesErrors31.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors31.Raw_Data_Field__c, 'TransactionCurrency','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors31.Map_To_Value__c, 'BOTTOM','putFileRequestTest');


        System.assertNotEquals(salesError1.Company__c, 'Vietnam','putFileRequestTest');
        System.assertNotEquals(salesError1.Raw_Data_Field__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_From_Value__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_To_Value__c, '','putFileRequestTest');


        string selcomp = 'Hong Kong Packaging';
        string selMonth = 'Feb';
        string selYear = '2019';
        String batchId = '';
        String userName = UserInfo.getUserName();
        User activeUser = [Select Email From User where Username = : userName limit 1];
        String userEmailNotify = activeUser.Email;

        getSalesMasterData salesErrorMapp = new getSalesMasterData();
        salesErrorMapp.getFullSalesErrorMap();

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
        customData.CostToTolerance__c = '5.0';
        insert customData;


        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();

        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap =  salesErrorMapp.getFullSalesErrorMap();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = new  Map<string,Retailer_Code__c>();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation.Vendor__c+'#'+salesTransStagRecForReconciliation.Category__c;
        checkVendorCategory.put(vendorCategory.toLowerCase(),vendorCategory.toLowerCase());
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
         Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();

        Test.startTest();
        getSalesMasterData getSalesMast = new getSalesMasterData();
       //  getSalesMast.preValidationSalesStageDataByPage(salesTransStagRecAfterReconciliation,fullSalesErrorMap,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
       //getSalesMast.getSalesStageRowsByPage(salesTransStagRecAfterReconciliation,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        processSalesData prosaldata = new processSalesData();
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstage, fullSalesErrorMap);
        prosaldata.reconcileDataWithSalesErrorMapBulk(salestransstag, fullSalesErrorMap);
        Test.stopTest();

     }

    /* static testMethod void getRetailerLobTest(){
Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
Sales_Transaction__c customData = new Sales_Transaction__c();
customData.Vendor__c = 'abc';
customData.name = 'abc';
insert customData;
list<Retailer_Code__c> retailer = new  list<Retailer_Code__c>();
Map<string,string> vendorListMap = new Map<string,string>();
Test.startTest();
processSalesData.getRetailerLob();
Test.stopTest();
} */
    /* static testMethod void callingCustomSettingsTest(){
Sales_Transaction__c customData = new Sales_Transaction__c();
customData.Production_Country__c = 'abc';
customData.Color__c = 'sfd';
customData.Division__c = 'dxc';
customData.Label__c = 'normal';
customData.Brand__c = 'permanent';
insert customData;
Test.startTest();
//     processSalesData.callingCustomSettings();
Test.stopTest();
}*/
    static testMethod void processSalesDataChunkTest(){

        getSalesMasterData retailerDivisionBrand = new getSalesMasterData();
        retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'lululemon');
        retailercode.Retailer_Type__c='Department Stores';
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = false;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true;
        retailercode.Price_Book_Cost_Check__c=true;
        retailercode.HG_Nomination__c = 'Sole Nomination';
        retailercode.FP_Nomination__c = 'Open';
        
        insert retailercode;
        
         Price_Specification_Book__c psb = new Price_Specification_Book__c();
        psb.Retailer_Code__c = retailercode.Id;
        psb.Business_Vertical__c = 'TLA';
        psb.COGS_Costing_Check__c=true;
        insert psb;

        Retailer_Code__c retailercode1 = new Retailer_Code__c(Name = 'OLD NAVY');
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Label_Check__c = false;
        retailercode1.Division_check__c = false;
        retailercode1.Retailer_Brand_Check__c = false;
        retailercode1.Sales_Data_Upload_Check__c = false;
        retailercode1.Sales_Data_Upload_Color__c = false;
        retailercode1.Price_Book_Cost_Check__c=true;
        retailercode1.HG_Nomination__c ='Sole Nomination';
        retailercode1.FP_Nomination__c ='Open';
        insert retailercode1;

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Sales_Month__c = 'MAR';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Sales_Year__c = '2019';
        insert value;
        
         Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        cogs.MCare_Mainetti_Brand_Check__c = true;
        cogs.MCare_Material_Check__c = true;
        insert cogs;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation.Retailer_Code__c =retailercode1.id;
        salesTransStagRecForReconciliation.Year__c = '2020';
        salesTransStagRecForReconciliation.Row_No__c = 4;
        salesTransStagRecForReconciliation.Week__c = '@';
        salesTransStagRecForReconciliation.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation.Material__c ='PS';
        salesTransStagRecForReconciliation.Source__c = 'abc';
        salesTransStagRecForReconciliation.Printed_Logo__c = '';
        salesTransStagRecForReconciliation.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation.Category__c = 'hangers & accessories';
        salesTransStagRecForReconciliation.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation.Family__c = 'TOP';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Final_Sales_Destination__c='Vietnam';
        salesTransStagRecForReconciliation.Transaction_Currency__c = 'USD';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation.Label__c = 'pl';
        salesTransStagRecForReconciliation.End_user__c = '';
        salesTransStagRecForReconciliation.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.Production_Country__c = 'China';
        salesTransStagRecForReconciliation.ExRate_to_EUR__c = '5';
        salesTransStagRecForReconciliation.ExRate_to_USD__c = '5';
        salesTransStagRecForReconciliation.Sales_Transaction_Currency__c = '5';
        salesTransStagRecForReconciliation.Sales_USD__c = '5';
        salesTransStagRecForReconciliation.Sales_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_USD__c = '5';
        salesTransStagRecForReconciliation.Unit_Sold__c = '5';
        salesTransStagRecForReconciliation.Model_NF__c = false;
        salesTransStagRecForReconciliation.Model_FB__c = false;
        salesTransStagRecForReconciliation.Color_FB__c = false;
        salesTransStagRecForReconciliation.Order_Type_FB__c = false;
        salesTransStagRecForReconciliation.Customer_FB__c = false;
        salesTransStagRecForReconciliation.Mainetti_Brand_FB__c = false;
        salesTransStagRecForReconciliation.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation.ExRate_to_USD_FB__c = false;
        salesTransStagRecForReconciliation.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation.Retailer_Country__c = 'United States';
        salesTransStagRecForReconciliation.Company_NF__c = True;
        salesTransStagRecForReconciliation.wrong_date__c = True;
        salesTransStagRecForReconciliation.Net_Unit_Price_100__c = '5';
        salesTransStagRecForReconciliation.Net_Unit_Price_100_EUR__c = '5';
        // salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_EUR__c = 0;
        // salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_USD__c = 0;
        // salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_EUR__c = 0;
        // salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_USD__c = 0;
        salesTransStagRecForReconciliation.Local_Net_Unit_Pirce_100__c = '11314563897412';
        salesTransStagRecForReconciliation.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.UnitSoldCombinationNotFound__c = true;
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');
        /////////////////////////////////////////////////////////////////////
        Sales_Transaction_Stage__c salesTransStagRecForReconciliation01 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation01.Company__c = 'Vietnamsd';
        //salesTransStagRecForReconciliation01.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation01.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation01.Year__c = '2020';
        salesTransStagRecForReconciliation01.Row_No__c = 4;
        salesTransStagRecForReconciliation01.Week__c = 'wk10';
        salesTransStagRecForReconciliation01.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation01.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation01.Material__c ='PS';
        salesTransStagRecForReconciliation01.Source__c = 'abc';
        salesTransStagRecForReconciliation01.Printed_Logo__c = '';
        salesTransStagRecForReconciliation01.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation01.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation01.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation01.Category__c = 'tla';
        salesTransStagRecForReconciliation01.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation01.Family__c = 'TOP';
        salesTransStagRecForReconciliation01.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation01.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation01.Shipped_To_Country__c = 'Vietnam';
        salesTransStagRecForReconciliation01.Label__c = 'PL';
        salesTransStagRecForReconciliation01.End_user__c = '';
        salesTransStagRecForReconciliation01.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation01.Division__c = 'demo';
        salesTransStagRecForReconciliation01.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation01.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation01.Market__c = 'US';
        salesTransStagRecForReconciliation01.Remarks__c = 'no';
        salesTransStagRecForReconciliation01.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation01.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation01.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation01.Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_EUR__c = '357.8462';
        salesTransStagRecForReconciliation01.Unit_Price_100_EUR__c = '7.10012';
        salesTransStagRecForReconciliation01.Unit_Price_100_USD__c = '8.07';
        salesTransStagRecForReconciliation01.Unit_Sold__c = '@123';
        salesTransStagRecForReconciliation01.Model__c = '467ONS';
        salesTransStagRecForReconciliation01.Model_NF__c = false;
        salesTransStagRecForReconciliation01.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation01.Gross_Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Freight_Charge_USD__c = '';
        salesTransStagRecForReconciliation01.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation01.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation01.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation01.Sales_Delivery_Date__c = '2021-4-JAN';
        salesTransStagRecForReconciliation01.Sales_Order_Date__c = '2021-4-JAN';
         salesTransStagRecForReconciliation01.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation01;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation02 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation02.Company__c = 'Vietnam';
        salesTransStagRecForReconciliation02.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation02.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation02.Year__c = '2020';
        salesTransStagRecForReconciliation02.Row_No__c = 4;
        salesTransStagRecForReconciliation02.Week__c = 'wk10';
        salesTransStagRecForReconciliation02.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation02.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation02.Material__c ='PS';
        salesTransStagRecForReconciliation02.Source__c = 'abc';
        salesTransStagRecForReconciliation02.Printed_Logo__c = '';
        salesTransStagRecForReconciliation02.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation02.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation02.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation02.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation02.Category__c = 'mcare';
        salesTransStagRecForReconciliation02.Sub_Category__c = 'xyz';
        salesTransStagRecForReconciliation02.Family__c = 'TOP';
        salesTransStagRecForReconciliation02.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation02.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation02.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation02.Label__c = 'nl';
        salesTransStagRecForReconciliation02.End_user__c = '';
        salesTransStagRecForReconciliation02.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation02.Division__c = 'demo';
        salesTransStagRecForReconciliation02.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation02.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation02.Market__c = 'US';
        salesTransStagRecForReconciliation02.Remarks__c = 'no';
        salesTransStagRecForReconciliation02.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.Production_Country__c = 'China';
        salesTransStagRecForReconciliation02.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation02.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation02.Sales_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_EUR__c = '@357.8462';
        salesTransStagRecForReconciliation02.Unit_Price_100_EUR__c = '@7.10012';
        salesTransStagRecForReconciliation02.Unit_Price_100_USD__c = '@8.07';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '5040';
        salesTransStagRecForReconciliation02.Model__c = '467ONS';
        salesTransStagRecForReconciliation02.Model_NF__c = false;
        salesTransStagRecForReconciliation02.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation02.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation02.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation02.Local_Net_Unit_Pirce_100__c = '11314563.97412';
        salesTransStagRecForReconciliation02.Net_Unit_Price_100__c = '-';
        salesTransStagRecForReconciliation02.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation02.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation02.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation02.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Gross_Unit_Price_100_Local_Currency__c = 'abcd';
        insert salesTransStagRecForReconciliation02;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation03 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation03.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation03.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation03.Source__c = '123';
        salesTransStagRecForReconciliation03.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation03;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation04 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation04.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation04.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation04.Year__c = '';
        salesTransStagRecForReconciliation04.Row_No__c = 4;
        salesTransStagRecForReconciliation04.Week__c = '';
        salesTransStagRecForReconciliation04.Month__c ='';
        salesTransStagRecForReconciliation04.Item_code__c = '';
        salesTransStagRecForReconciliation04.Material__c ='';
        salesTransStagRecForReconciliation04.Source__c = '';
        salesTransStagRecForReconciliation04.Printed_Logo__c = '';
        salesTransStagRecForReconciliation04.Color__c = '';
        salesTransStagRecForReconciliation04.Customer__c = '';
        salesTransStagRecForReconciliation04.Customer_local_name__c ='';
        salesTransStagRecForReconciliation04.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation04.Category__c = '';
        salesTransStagRecForReconciliation04.Sub_Category__c = '';
        salesTransStagRecForReconciliation04.Family__c = '';
        salesTransStagRecForReconciliation04.Order_Type__c = '';
        salesTransStagRecForReconciliation04.Unit_Sold__c = '100';
        salesTransStagRecForReconciliation04.Shipped_To_Factory__c = '';
        salesTransStagRecForReconciliation04.Shipped_To_Country__c = '';
        salesTransStagRecForReconciliation04.Label__c = '';
        salesTransStagRecForReconciliation04.End_user__c = '';
        salesTransStagRecForReconciliation04.Vendor__c = 'true';
        salesTransStagRecForReconciliation04.Division__c = '';
        salesTransStagRecForReconciliation04.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation04.Royalty_Rate__c = '';
        salesTransStagRecForReconciliation04.Market__c = '';
        salesTransStagRecForReconciliation04.Remarks__c = '';
        salesTransStagRecForReconciliation04.LOB__c = '';
        salesTransStagRecForReconciliation04.SO_Number__c = '';
        salesTransStagRecForReconciliation04.Production_Country__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_EUR__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_Transaction_Currency__c = '100';
        salesTransStagRecForReconciliation04.Sales_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_USD__c = '';
       // salesTransStagRecForReconciliation04.Unit_Sold__c = '';
        salesTransStagRecForReconciliation04.Model__c = '';
        salesTransStagRecForReconciliation04.Gross_Sales_USD__c = '@123';
        salesTransStagRecForReconciliation04.Freight_Charge_USD__c = '@!@#';
        salesTransStagRecForReconciliation04.Local_Net_Unit_Pirce_100__c = 'abc';
        salesTransStagRecForReconciliation04.Net_Unit_Price_100__c = '';
        salesTransStagRecForReconciliation04.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation04.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation04.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTransStagRecForReconciliation04;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation05 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation05.Vendor__c = 'macy';
        salesTransStagRecForReconciliation05.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation05.LOB__c = 'leg';
        salesTransStagRecForReconciliation05.Source__c = 'reuse';
        salesTransStagRecForReconciliation05.Label__c = 'abc';
        salesTransStagRecForReconciliation05.Sales_USD__c = '7.1234';
        salesTransStagRecForReconciliation05.Unit_Sold__c = '7';
        salesTransStagRecForReconciliation05.Unit_Price_100_USD__c = '1';
        salesTransStagRecForReconciliation05.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation05;

      


        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.Id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;

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
        customData.CostToTolerance__c = '5.0';
        insert customData;







        string selcomp = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        string selcomp1 = 'Hong Kong Packaging';
        string selMonth =  value.Sales_Month__c;
        string selYear = value.Sales_Year__c;

        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation.add(salesTransStagRecForReconciliation);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation01 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation01.add(salesTransStagRecForReconciliation01);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation02 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation02.add(salesTransStagRecForReconciliation02);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation03 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation03.add(salesTransStagRecForReconciliation03);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation04 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation04.add(salesTransStagRecForReconciliation04);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation05 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation05.add(salesTransStagRecForReconciliation05);


        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
       // inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = retailerDivisionBrand.getNewVendorDivisionBrandLabelMap();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        string retaileruploadcheck =  string.valueOf(retailercode.Sales_Data_Upload_Check__c);
        getSalesDataUploadCheckMap.put(retaileruploadcheck.toLowerCase(),retaileruploadcheck.toLowerCase());
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
       // getSalesDataUploadColorCheckMap.put(salesTransStagRecForReconciliation.Model__c,salesTransStagRecForReconciliation.Color__c);
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        autoPopulateRetailerCountryMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation01.Vendor__c+'#'+salesTransStagRecForReconciliation01.Category__c;
        checkVendorCategory.put(vendorCategory,vendorCategory);
        system.debug('checkVendorCategory'+checkVendorCategory);

       
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        autoPopulateMarketSegmentMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');

        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        pricebookprintCheckMap.put(salesTransStagRecForReconciliation.Vendor__c,salesTransStagRecForReconciliation.Vendor__c);
        system.debug('pricebookprintCheckMap'+pricebookprintCheckMap);
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();
          inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);

        //   map<string,string> getManittePartnerTypeMap =new map<string,string>();
        //   getManittePartnerTypeMap.put();
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;

        list<Retailer_Code__c> retailerCodes = [Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c,Market_Segment__c from Retailer_Code__c where Name <> null];
        for (Retailer_Code__c retailer : retailerCodes){


            // Checking the Vendor
            if( retailer.Name != null )
            {
                string retailerName = retailer.Name;
                vendorMap.put(retailerName.toLowerCase(),retailerName.toLowerCase());

            }

            // Checking the SalesDataUploadCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Check__c != null  )
            {
                string retailerName = retailer.Name;
                list<string> retailerstringlist = new list<string>();
                retailerstringlist.add(retailerName);
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                getSalesDataUploadCheckMap.put(retailerName.toLowerCase(),salesDataUploadCheckBox);
                checkVendorModel.put(retailerName.toLowerCase(),retailerstringlist);
            }
            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                productionCoungtryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }
            // Checking the SalesDataUploadMarket
            if(retailerCodes.size() > 0){
                if( retailer.Sales_Data_Upload_Market__c != null)
                {
                    string retailerMarket = retailer.Sales_Data_Upload_Market__c;
                    marketMap.put(retailerMarket.toLowerCase(),retailerMarket.toLowerCase());
                }
            }
            // Checking the SalesDataUploadColorCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Color__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                getSalesDataUploadColorCheckMap.put(retailerName.toLowerCase(),salesDataUploadColorCheckBox);
            }

            if( retailer.Name != null && retailer.Market_Segment__c != null  )
            {
                string retailerName = retailer.Name;
                system.debug('retailerName:::'+retailerName);
                string marketSegment = retailer.Market_Segment__c;
                system.debug('marketSegment:::'+marketSegment);
                autoPopulateMarketSegmentMap.put(retailerName.trim().toLowerCase(),marketSegment.trim());
                system.debug('autoPopulateMarketSegmentMap:::'+autoPopulateMarketSegmentMap);

            }

        }


        processSalesData processSales = new processSalesData();
       processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation01, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        // processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation02, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        // processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         //processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation04, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        // processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation05, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         
    }
    static testMethod void processSalesDataChunkTestNonNumeric(){

        getSalesMasterData retailerDivisionBrand = new getSalesMasterData();
        retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'lululemon');
        retailercode.Retailer_Type__c='Department Stores';
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = true;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true;
        retailercode.Price_book_Print_Check__c=true;
        retailercode.Price_Book_Cost_Check__c=true;
        retailercode.HG_Nomination__c = 'Sole Nomination';
        retailercode.FP_Nomination__c = 'Open';
        
        insert retailercode;
        
         Price_Specification_Book__c psb = new Price_Specification_Book__c();
        psb.Retailer_Code__c = retailercode.Id;
        psb.Business_Vertical__c = 'TLA';
        psb.COGS_Costing_Check__c=true;
        insert psb;

    
        // Retailer_Code__c retailer2 = new Retailer_Code__c(Sales_Data_Upload_Market__c = 'US',Country__c = 'United States',Market_Segment__c = 'UK' ,Retailer_Code_Check__c = true , Status__c = 'Active',Order_Date_Check__c = TRUE, Delivery_Date_Check__c = TRUE,name = 'OLD NAVY',Retailer_Type__c='Department Stores',Sales_Data_Upload_Color__c=true,Sales_Data_Upload_Check__c=true);
        // insert retailer2;
        
        Retailer_Code__c retailercode1 = new Retailer_Code__c(Name = 'OLD NAVY');
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Label_Check__c = false;
        retailercode1.Division_check__c = false;
        retailercode1.Retailer_Brand_Check__c = false;
        retailercode1.Sales_Data_Upload_Check__c = true;
        retailercode1.Sales_Data_Upload_Color__c = true;
        retailercode1.Price_book_Print_Check__c = true;
        retailercode1.Price_Book_Cost_Check__c=true;
        retailercode1.HG_Nomination__c ='Sole Nomination';
        retailercode1.FP_Nomination__c ='Open';
        retailercode1.Sales_Data_Upload_Market__c = 'US';
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Delivery_Date_Check__c= TRUE;
        retailercode1.Order_Date_Check__c = TRUE;
        retailercode1.Status__c = 'Active';
        retailercode1.Retailer_Code_Check__c = true ;
        retailercode1.Country__c = 'United States';
        retailercode1.Market_Segment__c = 'UK';

        insert retailercode1;

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Sales_Month__c = 'MAR';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Sales_Year__c = '2019';
        insert value;
        
         Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        cogs.MCare_Mainetti_Brand_Check__c = true;
        cogs.MCare_Material_Check__c = true;
        insert cogs;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation.Retailer_Code__c =retailercode1.id;
        salesTransStagRecForReconciliation.Year__c = '2020';
        salesTransStagRecForReconciliation.Row_No__c = 4;
        salesTransStagRecForReconciliation.Week__c = '@';
        salesTransStagRecForReconciliation.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation.Material__c ='PS';
        salesTransStagRecForReconciliation.Source__c = 'abc';
        salesTransStagRecForReconciliation.Printed_Logo__c = 'Color';
        salesTransStagRecForReconciliation.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation.Category__c = 'mcare';
        salesTransStagRecForReconciliation.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation.Family__c = 'TOP';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Final_Sales_Destination__c='Vietnam';
        salesTransStagRecForReconciliation.Transaction_Currency__c = 'USD';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation.Label__c = 'PL';
        salesTransStagRecForReconciliation.End_user__c = '';
        salesTransStagRecForReconciliation.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.Production_Country__c = 'China';
        salesTransStagRecForReconciliation.ExRate_to_EUR__c = 'A';
        salesTransStagRecForReconciliation.ExRate_to_USD__c = '5';
        salesTransStagRecForReconciliation.Sales_Transaction_Currency__c = 'abc';
        salesTransStagRecForReconciliation.Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Sales_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_USD__c = '20';
        salesTransStagRecForReconciliation.Unit_Sold__c = '5';
        salesTransStagRecForReconciliation.Model_NF__c = false;
        salesTransStagRecForReconciliation.Model_FB__c = false;
        salesTransStagRecForReconciliation.Color_FB__c = false;
        salesTransStagRecForReconciliation.Order_Type_FB__c = false;
        salesTransStagRecForReconciliation.Customer_FB__c = false;
        salesTransStagRecForReconciliation.Mainetti_Brand_FB__c = false;
        salesTransStagRecForReconciliation.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation.ExRate_to_USD_FB__c = false;
        salesTransStagRecForReconciliation.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation.Retailer_Country__c = 'United States';
        salesTransStagRecForReconciliation.Company_NF__c = True;
        salesTransStagRecForReconciliation.wrong_date__c = True;
        salesTransStagRecForReconciliation.Net_Weight_KG_1000__c = 'Net_Unit_Price_100__c';
        salesTransStagRecForReconciliation.Net_Unit_Price_100__c = 'Net_Unit_Price_100__c';
        salesTransStagRecForReconciliation.Net_Unit_Price_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaaa';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Local_Net_Unit_Pirce_100__c = 'A';
        salesTransStagRecForReconciliation.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.UnitSoldCombinationNotFound__c = true;
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = 'a';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');
        /////////////////////////////////////////////////////////////////////
        Sales_Transaction_Stage__c salesTransStagRecForReconciliation01 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation01.Company__c = 'Vietnamsd';
        //salesTransStagRecForReconciliation01.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation01.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation01.Year__c = '2020';
        salesTransStagRecForReconciliation01.Row_No__c = 4;
        salesTransStagRecForReconciliation01.Week__c = 'wk10';
        salesTransStagRecForReconciliation01.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation01.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation01.Material__c ='PS';
        salesTransStagRecForReconciliation01.Source__c = 'abc';
        salesTransStagRecForReconciliation01.Printed_Logo__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation01.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation01.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation01.Category__c = 'tla';
        salesTransStagRecForReconciliation01.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation01.Family__c = 'TOP';
        salesTransStagRecForReconciliation01.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation01.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation01.Shipped_To_Country__c = 'Vietnam';
        salesTransStagRecForReconciliation01.Label__c = 'PL';
        salesTransStagRecForReconciliation01.End_user__c = '';
        salesTransStagRecForReconciliation01.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation01.Division__c = 'demo';
        salesTransStagRecForReconciliation01.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation01.Royalty_Rate__c = '`yadhavpandyumeshsaravana';
        salesTransStagRecForReconciliation01.Market__c = 'US';
        salesTransStagRecForReconciliation01.Remarks__c = 'no';
        salesTransStagRecForReconciliation01.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation01.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation01.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_Transaction_Currency__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_EUR__c = '357.8462';
        salesTransStagRecForReconciliation01.Unit_Price_100_EUR__c = '7.10012';
        salesTransStagRecForReconciliation01.Unit_Price_100_USD__c = '8.07';
        salesTransStagRecForReconciliation01.Unit_Sold__c = '@123';
        salesTransStagRecForReconciliation01.Model__c = '467ons';
        salesTransStagRecForReconciliation01.Model_NF__c = false;
        salesTransStagRecForReconciliation01.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation01.Gross_Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Freight_Charge_USD__c = '';
        salesTransStagRecForReconciliation01.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation01.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation01.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation01.Sales_Delivery_Date__c = '2021-4-JAN';
        salesTransStagRecForReconciliation01.Sales_Order_Date__c = '2021-4-JAN';
         salesTransStagRecForReconciliation01.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation01;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation02 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation02.Company__c = 'Vietnam';
        salesTransStagRecForReconciliation02.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation02.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation02.Year__c = '2020';
        salesTransStagRecForReconciliation02.Row_No__c = 4;
        salesTransStagRecForReconciliation02.Week__c = 'wk10';
        salesTransStagRecForReconciliation02.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation02.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation02.Material__c ='PS';
        salesTransStagRecForReconciliation02.Source__c = 'abc';
        salesTransStagRecForReconciliation02.Printed_Logo__c = '';
        salesTransStagRecForReconciliation02.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation02.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation02.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation02.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation02.Category__c = 'TLA';
        salesTransStagRecForReconciliation02.Sub_Category__c = 'xyz';
        salesTransStagRecForReconciliation02.Family__c = 'TOP';
        salesTransStagRecForReconciliation02.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation02.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation02.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation02.Label__c = 'nl';
        salesTransStagRecForReconciliation02.End_user__c = '';
        salesTransStagRecForReconciliation02.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation02.Division__c = 'demo';
        salesTransStagRecForReconciliation02.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation02.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation02.Market__c = 'US';
        salesTransStagRecForReconciliation02.Remarks__c = 'no';
        salesTransStagRecForReconciliation02.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.Production_Country__c = 'China';
        salesTransStagRecForReconciliation02.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation02.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation02.Sales_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_EUR__c = '@357.8462';
        salesTransStagRecForReconciliation02.Unit_Price_100_EUR__c = '@7.10012';
        salesTransStagRecForReconciliation02.Unit_Price_100_USD__c = '@8.07';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '5040';
        salesTransStagRecForReconciliation02.Model__c = '467ONS';
        salesTransStagRecForReconciliation02.Model_NF__c = false;
        salesTransStagRecForReconciliation02.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation02.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation02.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation02.Local_Net_Unit_Pirce_100__c = '11314563.97412';
        salesTransStagRecForReconciliation02.Net_Unit_Price_100__c = '-';
        salesTransStagRecForReconciliation02.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation02.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation02.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation02.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Gross_Unit_Price_100_Local_Currency__c = 'abcd';
        insert salesTransStagRecForReconciliation02;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation03 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation03.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation03.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation03.Source__c = '123';
        salesTransStagRecForReconciliation03.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation03;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation04 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation04.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation04.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation04.Year__c = '';
        salesTransStagRecForReconciliation04.Row_No__c = 4;
        salesTransStagRecForReconciliation04.Week__c = '';
        salesTransStagRecForReconciliation04.Month__c ='';
        salesTransStagRecForReconciliation04.Item_code__c = '';
        salesTransStagRecForReconciliation04.Material__c ='';
        salesTransStagRecForReconciliation04.Source__c = '';
        salesTransStagRecForReconciliation04.Printed_Logo__c = '';
        salesTransStagRecForReconciliation04.Color__c = '';
        salesTransStagRecForReconciliation04.Customer__c = '';
        salesTransStagRecForReconciliation04.Customer_local_name__c ='';
        salesTransStagRecForReconciliation04.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation04.Category__c = '';
        salesTransStagRecForReconciliation04.Sub_Category__c = '';
        salesTransStagRecForReconciliation04.Family__c = '';
        salesTransStagRecForReconciliation04.Order_Type__c = '';
        salesTransStagRecForReconciliation04.Unit_Sold__c = '100';
        salesTransStagRecForReconciliation04.Shipped_To_Factory__c = '';
        salesTransStagRecForReconciliation04.Shipped_To_Country__c = '';
        salesTransStagRecForReconciliation04.Label__c = '';
        salesTransStagRecForReconciliation04.End_user__c = '';
        salesTransStagRecForReconciliation04.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation04.Division__c = '';
        salesTransStagRecForReconciliation04.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation04.Royalty_Rate__c = '';
        salesTransStagRecForReconciliation04.Market__c = '';
        salesTransStagRecForReconciliation04.Remarks__c = '';
        salesTransStagRecForReconciliation04.LOB__c = '';
        salesTransStagRecForReconciliation04.SO_Number__c = '';
        salesTransStagRecForReconciliation04.Production_Country__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_EUR__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_Transaction_Currency__c = '100';
        salesTransStagRecForReconciliation04.Sales_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_USD__c = '';
       // salesTransStagRecForReconciliation04.Unit_Sold__c = '';
        salesTransStagRecForReconciliation04.Model__c = '';
        salesTransStagRecForReconciliation04.Gross_Sales_USD__c = '@123';
        salesTransStagRecForReconciliation04.Freight_Charge_USD__c = '@!@#';
        salesTransStagRecForReconciliation04.Local_Net_Unit_Pirce_100__c = 'abc';
        salesTransStagRecForReconciliation04.Net_Unit_Price_100__c = '';
        salesTransStagRecForReconciliation04.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation04.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation04.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTransStagRecForReconciliation04;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation05 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation05.Vendor__c = 'macy';
        salesTransStagRecForReconciliation05.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation05.LOB__c = 'leg';
        salesTransStagRecForReconciliation05.Source__c = 'reuse';
        salesTransStagRecForReconciliation05.Label__c = 'abc';
        salesTransStagRecForReconciliation05.Sales_USD__c = '7.1234';
        salesTransStagRecForReconciliation05.Unit_Sold__c = '7';
        salesTransStagRecForReconciliation05.Unit_Price_100_USD__c = '1';
        salesTransStagRecForReconciliation05.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation05;

      


        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.Id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;

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
        customData.CostToTolerance__c = '5.0';
        insert customData;







        string selcomp = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        string selcomp1 = 'Hong Kong Packaging';
        string selMonth =  value.Sales_Month__c;
        string selYear = value.Sales_Year__c;

        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation.add(salesTransStagRecForReconciliation);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation01 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation01.add(salesTransStagRecForReconciliation01);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation02 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation02.add(salesTransStagRecForReconciliation02);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation03 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation03.add(salesTransStagRecForReconciliation03);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation04 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation04.add(salesTransStagRecForReconciliation04);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation05 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation05.add(salesTransStagRecForReconciliation05);


        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
       // inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = retailerDivisionBrand.getNewVendorDivisionBrandLabelMap();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        

        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        string retaileruploadcheck =  string.valueOf(retailercode.Sales_Data_Upload_Check__c);
        getSalesDataUploadCheckMap.put(retaileruploadcheck.toLowerCase(),retaileruploadcheck.toLowerCase());
        System.debug('getSalesDataUploadCheckMap'+getSalesDataUploadCheckMap);
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
       // getSalesDataUploadColorCheckMap.put(salesTransStagRecForReconciliation.Model__c,salesTransStagRecForReconciliation.Color__c);
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        autoPopulateRetailerCountryMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation01.Vendor__c+'#'+salesTransStagRecForReconciliation01.Category__c;
        checkVendorCategory.put(vendorCategory,vendorCategory);
        system.debug('checkVendorCategory'+checkVendorCategory);

       
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        autoPopulateMarketSegmentMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');

        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        pricebookprintCheckMap.put(salesTransStagRecForReconciliation.Vendor__c,salesTransStagRecForReconciliation.Vendor__c);
        system.debug('pricebookprintCheckMap'+pricebookprintCheckMap);
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();
          inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);

        //   map<string,string> getManittePartnerTypeMap =new map<string,string>();
        //   getManittePartnerTypeMap.put();
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;

        list<Retailer_Code__c> retailerCodes = [Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c,Market_Segment__c from Retailer_Code__c where Name <> null];
        for (Retailer_Code__c retailer : retailerCodes){


            // Checking the Vendor
            if( retailer.Name != null )
            {
                string retailerName = retailer.Name;
                vendorMap.put(retailerName.toLowerCase(),retailerName.toLowerCase());

            }

            // Checking the SalesDataUploadCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Check__c != null  )
            {
                string retailerName = retailer.Name;
                list<string> retailerstringlist = new list<string>();
                retailerstringlist.add(retailerName);
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                getSalesDataUploadCheckMap.put(retailerName.toLowerCase(),salesDataUploadCheckBox);
                checkVendorModel.put(retailerName.toLowerCase(),retailerstringlist);
            }
            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                productionCoungtryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }
            // Checking the SalesDataUploadMarket
            if(retailerCodes.size() > 0){
                if( retailer.Sales_Data_Upload_Market__c != null)
                {
                    string retailerMarket = retailer.Sales_Data_Upload_Market__c;
                    marketMap.put(retailerMarket.toLowerCase(),retailerMarket.toLowerCase());
                }
            }
            // Checking the SalesDataUploadColorCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Color__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                getSalesDataUploadColorCheckMap.put(retailerName.toLowerCase(),salesDataUploadColorCheckBox);
            }

            if( retailer.Name != null && retailer.Market_Segment__c != null  )
            {
                string retailerName = retailer.Name;
                system.debug('retailerName:::'+retailerName);
                string marketSegment = retailer.Market_Segment__c;
                system.debug('marketSegment:::'+marketSegment);
                autoPopulateMarketSegmentMap.put(retailerName.trim().toLowerCase(),marketSegment.trim());
                system.debug('autoPopulateMarketSegmentMap:::'+autoPopulateMarketSegmentMap);

            }

        }


        processSalesData processSales = new processSalesData();
       processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation01, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        
    }
    static testMethod void processSalesDataChunkTestNonNumeric2(){

        getSalesMasterData retailerDivisionBrand = new getSalesMasterData();
        retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'lululemon');
        retailercode.Retailer_Type__c='Department Stores';
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = true;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true;
        retailercode.Price_Book_Cost_Check__c=true;
        retailercode.HG_Nomination__c = 'Sole Nomination';
        retailercode.FP_Nomination__c = 'Open';
        
        insert retailercode;
        
         Price_Specification_Book__c psb = new Price_Specification_Book__c();
        psb.Retailer_Code__c = retailercode.Id;
        psb.Business_Vertical__c = 'TLA';
        psb.COGS_Costing_Check__c=true;
        insert psb;

    
        // Retailer_Code__c retailer2 = new Retailer_Code__c(Sales_Data_Upload_Market__c = 'US',Country__c = 'United States',Market_Segment__c = 'UK' ,Retailer_Code_Check__c = true , Status__c = 'Active',Order_Date_Check__c = TRUE, Delivery_Date_Check__c = TRUE,name = 'OLD NAVY',Retailer_Type__c='Department Stores',Sales_Data_Upload_Color__c=true,Sales_Data_Upload_Check__c=true);
        // insert retailer2;
        
        Retailer_Code__c retailercode1 = new Retailer_Code__c(Name = 'OLD NAVY');
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Label_Check__c = false;
        retailercode1.Division_check__c = false;
        retailercode1.Retailer_Brand_Check__c = false;
        retailercode1.Sales_Data_Upload_Check__c = true;
        retailercode1.Sales_Data_Upload_Color__c = true;
        retailercode1.Price_book_Print_Check__c = true;
        retailercode1.Price_Book_Cost_Check__c=true;
        retailercode1.HG_Nomination__c ='Sole Nomination';
        retailercode1.FP_Nomination__c ='Open';
        retailercode1.Sales_Data_Upload_Market__c = 'US';
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Delivery_Date_Check__c= TRUE;
        retailercode1.Order_Date_Check__c = TRUE;
        retailercode1.Status__c = 'Active';
        retailercode1.Retailer_Code_Check__c = true ;
        retailercode1.Country__c = 'United States';
        retailercode1.Market_Segment__c = 'UK';

        insert retailercode1;

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Sales_Month__c = 'MAR';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Sales_Year__c = '2019';
        insert value;
        
         Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        cogs.MCare_Mainetti_Brand_Check__c = true;
        cogs.MCare_Material_Check__c = true;
        insert cogs;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation.Retailer_Code__c =retailercode1.id;
        salesTransStagRecForReconciliation.Year__c = '2020';
        salesTransStagRecForReconciliation.Row_No__c = 4;
        salesTransStagRecForReconciliation.Week__c = '@';
        salesTransStagRecForReconciliation.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation.Material__c ='PS';
        salesTransStagRecForReconciliation.Source__c = 'abc';
        salesTransStagRecForReconciliation.Printed_Logo__c = 'Color';
        salesTransStagRecForReconciliation.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation.Category__c = 'mcare';
        salesTransStagRecForReconciliation.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation.Family__c = 'TOP';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Final_Sales_Destination__c='Vietnam';
        salesTransStagRecForReconciliation.Transaction_Currency__c = 'USD';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation.Label__c = 'PL';
        salesTransStagRecForReconciliation.End_user__c = '';
        salesTransStagRecForReconciliation.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.Production_Country__c = 'China';
        salesTransStagRecForReconciliation.ExRate_to_EUR__c = 'A';
        salesTransStagRecForReconciliation.ExRate_to_USD__c = '5';
        salesTransStagRecForReconciliation.Sales_Transaction_Currency__c = '5';
        salesTransStagRecForReconciliation.Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Sales_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_USD__c = '20';
        salesTransStagRecForReconciliation.Unit_Sold__c = '5';
        salesTransStagRecForReconciliation.Model_NF__c = false;
        salesTransStagRecForReconciliation.Model_FB__c = false;
        salesTransStagRecForReconciliation.Color_FB__c = false;
        salesTransStagRecForReconciliation.Order_Type_FB__c = false;
        salesTransStagRecForReconciliation.Customer_FB__c = false;
        salesTransStagRecForReconciliation.Mainetti_Brand_FB__c = false;
        salesTransStagRecForReconciliation.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation.ExRate_to_USD_FB__c = false;
        salesTransStagRecForReconciliation.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation.Retailer_Country__c = 'United States';
        salesTransStagRecForReconciliation.Company_NF__c = True;
        salesTransStagRecForReconciliation.wrong_date__c = True;
        salesTransStagRecForReconciliation.Net_Weight_KG_1000__c = 'Net_Unit_Price_100__c';
        salesTransStagRecForReconciliation.Net_Unit_Price_100__c = 'Net_Unit_Price_100__c';
        salesTransStagRecForReconciliation.Net_Unit_Price_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaaa';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_USD__c = 'manikantaAbhinavAkashBasappaa';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_EUR__c = 'manikantaAbhinavAkashBasappaa';
        salesTransStagRecForReconciliation.Local_Net_Unit_Pirce_100__c = 'A';
        salesTransStagRecForReconciliation.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.UnitSoldCombinationNotFound__c = true;
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = 'a';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');
        /////////////////////////////////////////////////////////////////////
        Sales_Transaction_Stage__c salesTransStagRecForReconciliation01 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation01.Company__c = 'Vietnamsd';
        //salesTransStagRecForReconciliation01.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation01.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation01.Year__c = '2020';
        salesTransStagRecForReconciliation01.Row_No__c = 4;
        salesTransStagRecForReconciliation01.Week__c = 'wk10';
        salesTransStagRecForReconciliation01.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation01.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation01.Material__c ='PS';
        salesTransStagRecForReconciliation01.Source__c = 'abc';
        salesTransStagRecForReconciliation01.Printed_Logo__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation01.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation01.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation01.Category__c = 'tla';
        salesTransStagRecForReconciliation01.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation01.Family__c = 'TOP';
        salesTransStagRecForReconciliation01.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation01.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation01.Shipped_To_Country__c = 'Vietnam';
        salesTransStagRecForReconciliation01.Label__c = 'PL';
        salesTransStagRecForReconciliation01.End_user__c = '';
        salesTransStagRecForReconciliation01.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation01.Division__c = 'demo';
        salesTransStagRecForReconciliation01.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation01.Royalty_Rate__c = 'yadhavpandyumeshsaravana';
        salesTransStagRecForReconciliation01.Market__c = 'US';
        salesTransStagRecForReconciliation01.Remarks__c = 'no';
        salesTransStagRecForReconciliation01.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation01.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation01.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_Transaction_Currency__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_EUR__c = '357.8462';
        salesTransStagRecForReconciliation01.Unit_Price_100_EUR__c = '7.10012';
        salesTransStagRecForReconciliation01.Unit_Price_100_USD__c = '8.07';
        salesTransStagRecForReconciliation01.Unit_Sold__c = '@123';
        salesTransStagRecForReconciliation01.Model__c = 'lululemon';
        salesTransStagRecForReconciliation01.Model_NF__c = false;
        salesTransStagRecForReconciliation01.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation01.Gross_Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Freight_Charge_USD__c = '';
        salesTransStagRecForReconciliation01.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation01.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation01.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation01.Sales_Delivery_Date__c = '2021-4-JAN';
        salesTransStagRecForReconciliation01.Sales_Order_Date__c = '2021-4-JAN';
         salesTransStagRecForReconciliation01.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation01;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation02 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation02.Company__c = 'Vietnam';
        salesTransStagRecForReconciliation02.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation02.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation02.Year__c = '2020';
        salesTransStagRecForReconciliation02.Row_No__c = 4;
        salesTransStagRecForReconciliation02.Week__c = 'wk10';
        salesTransStagRecForReconciliation02.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation02.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation02.Material__c ='PS';
        salesTransStagRecForReconciliation02.Source__c = 'abc';
        salesTransStagRecForReconciliation02.Printed_Logo__c = '';
        salesTransStagRecForReconciliation02.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation02.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation02.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation02.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation02.Category__c = 'TLA';
        salesTransStagRecForReconciliation02.Sub_Category__c = 'xyz';
        salesTransStagRecForReconciliation02.Family__c = 'TOP';
        salesTransStagRecForReconciliation02.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation02.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation02.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation02.Label__c = 'nl';
        salesTransStagRecForReconciliation02.End_user__c = '';
        salesTransStagRecForReconciliation02.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation02.Division__c = 'demo';
        salesTransStagRecForReconciliation02.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation02.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation02.Market__c = 'US';
        salesTransStagRecForReconciliation02.Remarks__c = 'no';
        salesTransStagRecForReconciliation02.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.Production_Country__c = 'China';
        salesTransStagRecForReconciliation02.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation02.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation02.Sales_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_EUR__c = '@357.8462';
        salesTransStagRecForReconciliation02.Unit_Price_100_EUR__c = '@7.10012';
        salesTransStagRecForReconciliation02.Unit_Price_100_USD__c = '@8.07';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '5040';
        salesTransStagRecForReconciliation02.Model__c = '467ONS';
        salesTransStagRecForReconciliation02.Model_NF__c = false;
        salesTransStagRecForReconciliation02.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation02.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation02.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation02.Local_Net_Unit_Pirce_100__c = '11314563.97412';
        salesTransStagRecForReconciliation02.Net_Unit_Price_100__c = '-';
        salesTransStagRecForReconciliation02.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation02.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation02.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation02.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Gross_Unit_Price_100_Local_Currency__c = 'abcd';
        insert salesTransStagRecForReconciliation02;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation03 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation03.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation03.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation03.Source__c = '123';
        salesTransStagRecForReconciliation03.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation03;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation04 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation04.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation04.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation04.Year__c = '';
        salesTransStagRecForReconciliation04.Row_No__c = 4;
        salesTransStagRecForReconciliation04.Week__c = '';
        salesTransStagRecForReconciliation04.Month__c ='';
        salesTransStagRecForReconciliation04.Item_code__c = '';
        salesTransStagRecForReconciliation04.Material__c ='';
        salesTransStagRecForReconciliation04.Source__c = '';
        salesTransStagRecForReconciliation04.Printed_Logo__c = '';
        salesTransStagRecForReconciliation04.Color__c = '';
        salesTransStagRecForReconciliation04.Customer__c = '';
        salesTransStagRecForReconciliation04.Customer_local_name__c ='';
        salesTransStagRecForReconciliation04.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation04.Category__c = '';
        salesTransStagRecForReconciliation04.Sub_Category__c = '';
        salesTransStagRecForReconciliation04.Family__c = '';
        salesTransStagRecForReconciliation04.Order_Type__c = '';
        salesTransStagRecForReconciliation04.Unit_Sold__c = '100';
        salesTransStagRecForReconciliation04.Shipped_To_Factory__c = '';
        salesTransStagRecForReconciliation04.Shipped_To_Country__c = '';
        salesTransStagRecForReconciliation04.Label__c = '';
        salesTransStagRecForReconciliation04.End_user__c = '';
        salesTransStagRecForReconciliation04.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation04.Division__c = '';
        salesTransStagRecForReconciliation04.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation04.Royalty_Rate__c = '';
        salesTransStagRecForReconciliation04.Market__c = '';
        salesTransStagRecForReconciliation04.Remarks__c = '';
        salesTransStagRecForReconciliation04.LOB__c = '';
        salesTransStagRecForReconciliation04.SO_Number__c = '';
        salesTransStagRecForReconciliation04.Production_Country__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_EUR__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_Transaction_Currency__c = '100';
        salesTransStagRecForReconciliation04.Sales_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_USD__c = '';
       // salesTransStagRecForReconciliation04.Unit_Sold__c = '';
        salesTransStagRecForReconciliation04.Model__c = '';
        salesTransStagRecForReconciliation04.Gross_Sales_USD__c = '@123';
        salesTransStagRecForReconciliation04.Freight_Charge_USD__c = '@!@#';
        salesTransStagRecForReconciliation04.Local_Net_Unit_Pirce_100__c = 'abc';
        salesTransStagRecForReconciliation04.Net_Unit_Price_100__c = '';
        salesTransStagRecForReconciliation04.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation04.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation04.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTransStagRecForReconciliation04;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation05 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation05.Vendor__c = 'macy';
        salesTransStagRecForReconciliation05.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation05.LOB__c = 'leg';
        salesTransStagRecForReconciliation05.Source__c = 'reuse';
        salesTransStagRecForReconciliation05.Label__c = 'abc';
        salesTransStagRecForReconciliation05.Sales_USD__c = '7.1234';
        salesTransStagRecForReconciliation05.Unit_Sold__c = '7';
        salesTransStagRecForReconciliation05.Unit_Price_100_USD__c = '1';
        salesTransStagRecForReconciliation05.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation05;

      


        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.Id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;

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
        customData.CostToTolerance__c = '5.0';
        insert customData;







        string selcomp = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        string selcomp1 = 'Hong Kong Packaging';
        string selMonth =  value.Sales_Month__c;
        string selYear = value.Sales_Year__c;

        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation.add(salesTransStagRecForReconciliation);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation01 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation01.add(salesTransStagRecForReconciliation01);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation02 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation02.add(salesTransStagRecForReconciliation02);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation03 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation03.add(salesTransStagRecForReconciliation03);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation04 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation04.add(salesTransStagRecForReconciliation04);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation05 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation05.add(salesTransStagRecForReconciliation05);


        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
       // inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = retailerDivisionBrand.getNewVendorDivisionBrandLabelMap();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        

        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        string retaileruploadcheck =  string.valueOf(retailercode.Sales_Data_Upload_Check__c);
        getSalesDataUploadCheckMap.put(retaileruploadcheck.toLowerCase(),retaileruploadcheck.toLowerCase());
        System.debug('getSalesDataUploadCheckMap'+getSalesDataUploadCheckMap);
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
       // getSalesDataUploadColorCheckMap.put(salesTransStagRecForReconciliation.Model__c,salesTransStagRecForReconciliation.Color__c);
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        autoPopulateRetailerCountryMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation01.Vendor__c+'#'+salesTransStagRecForReconciliation01.Category__c;
        checkVendorCategory.put(vendorCategory,vendorCategory);
        system.debug('checkVendorCategory'+checkVendorCategory);

       
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        autoPopulateMarketSegmentMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');

        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        pricebookprintCheckMap.put(salesTransStagRecForReconciliation.Vendor__c,salesTransStagRecForReconciliation.Vendor__c);
        system.debug('pricebookprintCheckMap'+pricebookprintCheckMap);
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();
          inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);

        //   map<string,string> getManittePartnerTypeMap =new map<string,string>();
        //   getManittePartnerTypeMap.put();
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;

        list<Retailer_Code__c> retailerCodes = [Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c,Market_Segment__c from Retailer_Code__c where Name <> null];
        for (Retailer_Code__c retailer : retailerCodes){


            // Checking the Vendor
            if( retailer.Name != null )
            {
                string retailerName = retailer.Name;
                vendorMap.put(retailerName.toLowerCase(),retailerName.toLowerCase());

            }

            // Checking the SalesDataUploadCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Check__c != null  )
            {
                string retailerName = retailer.Name;
                list<string> retailerstringlist = new list<string>();
                retailerstringlist.add(retailerName);
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                getSalesDataUploadCheckMap.put(retailerName.toLowerCase(),salesDataUploadCheckBox);
                checkVendorModel.put(retailerName.toLowerCase(),retailerstringlist);
            }
            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                productionCoungtryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }
            // Checking the SalesDataUploadMarket
            if(retailerCodes.size() > 0){
                if( retailer.Sales_Data_Upload_Market__c != null)
                {
                    string retailerMarket = retailer.Sales_Data_Upload_Market__c;
                    marketMap.put(retailerMarket.toLowerCase(),retailerMarket.toLowerCase());
                }
            }
            // Checking the SalesDataUploadColorCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Color__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                getSalesDataUploadColorCheckMap.put(retailerName.toLowerCase(),salesDataUploadColorCheckBox);
            }

            if( retailer.Name != null && retailer.Market_Segment__c != null  )
            {
                string retailerName = retailer.Name;
                system.debug('retailerName:::'+retailerName);
                string marketSegment = retailer.Market_Segment__c;
                system.debug('marketSegment:::'+marketSegment);
                autoPopulateMarketSegmentMap.put(retailerName.trim().toLowerCase(),marketSegment.trim());
                system.debug('autoPopulateMarketSegmentMap:::'+autoPopulateMarketSegmentMap);

            }

        }


        processSalesData processSales = new processSalesData();
       processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation01, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        
    }

    static testMethod void processSalesDataChunkTest2ndNumeric(){

        getSalesMasterData retailerDivisionBrand = new getSalesMasterData();
        retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'lululemon');
        retailercode.Retailer_Type__c='Department Stores';
        retailercode.Label_Check__c = true;
        retailercode.Division_check__c = true;
        retailercode.Retailer_Brand_Check__c = true;
        retailercode.Sales_Data_Upload_Check__c = false;
        retailercode.Sales_Data_Upload_Color__c = true;
        retailercode.Production_Country__c = true;
        retailercode.Price_Book_Cost_Check__c=true;
        retailercode.HG_Nomination__c = 'Sole Nomination';
        retailercode.FP_Nomination__c = 'Open';
        
        insert retailercode;
        
         Price_Specification_Book__c psb = new Price_Specification_Book__c();
        psb.Retailer_Code__c = retailercode.Id;
        psb.Business_Vertical__c = 'TLA';
        psb.COGS_Costing_Check__c=true;
        insert psb;

        Retailer_Code__c retailercode1 = new Retailer_Code__c(Name = 'OLD NAVY');
        retailercode1.Retailer_Type__c='Department Stores';
        retailercode1.Label_Check__c = false;
        retailercode1.Division_check__c = false;
        retailercode1.Retailer_Brand_Check__c = false;
        retailercode1.Sales_Data_Upload_Check__c = false;
        retailercode1.Sales_Data_Upload_Color__c = false;
        retailercode1.Price_Book_Cost_Check__c=true;
        retailercode1.HG_Nomination__c ='Sole Nomination';
        retailercode1.FP_Nomination__c ='Open';
        insert retailercode1;

        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        value.Sales_Month__c = 'MAR';
        value.Sales_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        value.Sales_Year__c = '2019';
        insert value;
        
         Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        cogs.MCare_Mainetti_Brand_Check__c = true;
        cogs.MCare_Material_Check__c = true;
        insert cogs;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation.Retailer_Code__c =retailercode1.id;
        salesTransStagRecForReconciliation.Year__c = '2020';
        salesTransStagRecForReconciliation.Row_No__c = 4;
        salesTransStagRecForReconciliation.Week__c = '@';
        salesTransStagRecForReconciliation.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation.Material__c ='PS';
        salesTransStagRecForReconciliation.Source__c = 'abc';
        salesTransStagRecForReconciliation.Printed_Logo__c = '';
        salesTransStagRecForReconciliation.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation.Model__c = 'Color';
        salesTransStagRecForReconciliation.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation.Category__c = 'tla';
        salesTransStagRecForReconciliation.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation.Family__c = 'TOP';
        salesTransStagRecForReconciliation.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation.Final_Sales_Destination__c='Vietnam';
        salesTransStagRecForReconciliation.Transaction_Currency__c = 'USD';
        salesTransStagRecForReconciliation.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation.Label__c = 'PL';
        salesTransStagRecForReconciliation.End_user__c = '';
        salesTransStagRecForReconciliation.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation.Division__c = 'demo';
        salesTransStagRecForReconciliation.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation.Market__c = 'US';
        salesTransStagRecForReconciliation.Remarks__c = 'no';
        salesTransStagRecForReconciliation.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation.ExRate_to_EUR__c = 'A';
        salesTransStagRecForReconciliation.ExRate_to_USD__c = '5';
        salesTransStagRecForReconciliation.Sales_Transaction_Currency__c = '5';
        salesTransStagRecForReconciliation.Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Sales_EUR__c = '5';
        salesTransStagRecForReconciliation.Unit_Price_100_EUR__c = '23';
        salesTransStagRecForReconciliation.Unit_Price_100_USD__c = 'A';
        salesTransStagRecForReconciliation.Unit_Sold__c = '5';
        salesTransStagRecForReconciliation.Model_NF__c = false;
        salesTransStagRecForReconciliation.Model_FB__c = false;
        salesTransStagRecForReconciliation.Color_FB__c = false;
        salesTransStagRecForReconciliation.Order_Type_FB__c = false;
        salesTransStagRecForReconciliation.Customer_FB__c = false;
        salesTransStagRecForReconciliation.Mainetti_Brand_FB__c = false;
        salesTransStagRecForReconciliation.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation.ExRate_to_USD_FB__c = false;
        salesTransStagRecForReconciliation.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation.Retailer_Country__c = 'United States';
        salesTransStagRecForReconciliation.Company_NF__c = True;
        salesTransStagRecForReconciliation.wrong_date__c = True;
        salesTransStagRecForReconciliation.Net_Weight_KG_1000__c = '12345.1234567890';
        salesTransStagRecForReconciliation.Net_Unit_Price_100__c = '12345.1234567890';
        salesTransStagRecForReconciliation.Net_Unit_Price_100_EUR__c = '12345.1234567890';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_USD__c = '12345.1234567890';
        salesTransStagRecForReconciliation.Standard_Unit_Cost_100_EUR__c = '12345.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_EUR__c = '1234567890.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Ex_Work_Cost_100_USD__c = '1234567890.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_EUR__c = '1234567890.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Industrial_Cost_100_USD__c = '1234567890.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_USD__c = '123451234567890666.1234567890';
         salesTransStagRecForReconciliation.Standard_Unit_Material_Cost_100_EUR__c = '1234567890.1234567890';
        salesTransStagRecForReconciliation.Local_Net_Unit_Pirce_100__c = '1234567890.1234567890';
        salesTransStagRecForReconciliation.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation.UnitSoldCombinationNotFound__c = true;
         salesTransStagRecForReconciliation.Gross_Unit_Price_100_Local_Currency__c = '123';
        insert salesTransStagRecForReconciliation;
        System.assertEquals('4-JAN-2021', salesTransStagRecForReconciliation.Sales_Order_Date__c,'putFileRequestTest');
        /////////////////////////////////////////////////////////////////////
        Sales_Transaction_Stage__c salesTransStagRecForReconciliation01 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation01.Company__c = 'Vietnamsd';
        //salesTransStagRecForReconciliation01.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation01.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation01.Year__c = '2020';
        salesTransStagRecForReconciliation01.Row_No__c = 4;
        salesTransStagRecForReconciliation01.Week__c = 'wk10';
        salesTransStagRecForReconciliation01.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation01.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation01.Material__c ='PS';
        salesTransStagRecForReconciliation01.Source__c = 'abc';
        salesTransStagRecForReconciliation01.Printed_Logo__c = '';
        salesTransStagRecForReconciliation01.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation01.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation01.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation01.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation01.Category__c = 'tla';
        salesTransStagRecForReconciliation01.Sub_Category__c = 'HANGERS';
        salesTransStagRecForReconciliation01.Family__c = 'TOP';
        salesTransStagRecForReconciliation01.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation01.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation01.Shipped_To_Country__c = 'Vietnam';
        salesTransStagRecForReconciliation01.Label__c = ' ';
        salesTransStagRecForReconciliation01.End_user__c = '';
        salesTransStagRecForReconciliation01.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation01.Division__c = ' ';
        salesTransStagRecForReconciliation01.Retailer_Brand__c = ' ';
        salesTransStagRecForReconciliation01.Royalty_Rate__c = '12345.1234567890';
        salesTransStagRecForReconciliation01.Market__c = 'US';
        salesTransStagRecForReconciliation01.Remarks__c = 'no';
        salesTransStagRecForReconciliation01.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation01.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation01.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation01.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation01.Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Sales_EUR__c = '357.8462';
        salesTransStagRecForReconciliation01.Unit_Price_100_EUR__c = '7.10012';
        salesTransStagRecForReconciliation01.Unit_Price_100_USD__c = '8.07';
        salesTransStagRecForReconciliation01.Unit_Sold__c = '@123';
        salesTransStagRecForReconciliation01.Model__c = '467ONS';
        salesTransStagRecForReconciliation01.Model_NF__c = false;
        salesTransStagRecForReconciliation01.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation01.Gross_Sales_USD__c = '';
        salesTransStagRecForReconciliation01.Freight_Charge_USD__c = '';
        salesTransStagRecForReconciliation01.Transaction_Currency_FB__c = false;
        salesTransStagRecForReconciliation01.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation01.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation01.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation01.Sales_Delivery_Date__c = '2021-4-JAN';
        salesTransStagRecForReconciliation01.Sales_Order_Date__c = '2021-4-JAN';
         salesTransStagRecForReconciliation01.Gross_Unit_Price_100_Local_Currency__c = '12389654123548794460.123656';
        insert salesTransStagRecForReconciliation01;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation02 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation02.Company__c = 'Vietnam';
        salesTransStagRecForReconciliation02.Retailer_Code__c = retailercode.Id;
        // salesTransStagRecForReconciliation02.Retailer_Code__c ='OLD NAVY';
        salesTransStagRecForReconciliation02.Year__c = '2020';
        salesTransStagRecForReconciliation02.Row_No__c = 4;
        salesTransStagRecForReconciliation02.Week__c = 'wk10';
        salesTransStagRecForReconciliation02.Month__c = value.Sales_Month__c;
        salesTransStagRecForReconciliation02.Item_code__c = '467ONS-PP-NTL00';
        salesTransStagRecForReconciliation02.Material__c ='PS';
        salesTransStagRecForReconciliation02.Source__c = 'abc';
        salesTransStagRecForReconciliation02.Printed_Logo__c = '';
        salesTransStagRecForReconciliation02.Color__c = 'NATURAL';
        salesTransStagRecForReconciliation02.Customer__c = 'NOBLAND INTERNATIONAL INC';
        salesTransStagRecForReconciliation02.Customer_local_name__c ='NOBLAND INTERNATIONAL INC ';
        salesTransStagRecForReconciliation02.Mainetti_Brand__c = 'Mainetti';
        salesTransStagRecForReconciliation02.Category__c = 'hangers & accessories';
        salesTransStagRecForReconciliation02.Sub_Category__c = 'xyz';
        salesTransStagRecForReconciliation02.Family__c = 'TOP';
        salesTransStagRecForReconciliation02.Order_Type__c = '3rd';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation02.Shipped_To_Factory__c = 'CONG TY TNHH PUKU VIET NAM ';
        salesTransStagRecForReconciliation02.Shipped_To_Country__c = ' Vietnam';
        salesTransStagRecForReconciliation02.Label__c = 'nl';
        salesTransStagRecForReconciliation02.End_user__c = '';
        salesTransStagRecForReconciliation02.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation02.Division__c = 'demo';
        salesTransStagRecForReconciliation02.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation02.Royalty_Rate__c = 'fixed';
        salesTransStagRecForReconciliation02.Market__c = 'US';
        salesTransStagRecForReconciliation02.Remarks__c = 'no';
        salesTransStagRecForReconciliation02.LOB__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.SO_Number__c = '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        salesTransStagRecForReconciliation02.Production_Country__c = 'CHINA';
        salesTransStagRecForReconciliation02.ExRate_to_EUR__c = '1';
        salesTransStagRecForReconciliation02.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation02.Sales_Transaction_Currency__c = '406.728';
        salesTransStagRecForReconciliation02.Sales_USD__c = '2';
        salesTransStagRecForReconciliation02.Sales_EUR__c = '357.8462';
        salesTransStagRecForReconciliation02.Unit_Price_100_EUR__c = '@7.10012';
        salesTransStagRecForReconciliation02.Unit_Price_100_USD__c = '@8.07';
        salesTransStagRecForReconciliation02.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation02.Model__c = '467ONS';
        salesTransStagRecForReconciliation02.Model_NF__c = false;
        salesTransStagRecForReconciliation02.ExRate_to_EUR_FB__C = false;
        salesTransStagRecForReconciliation02.Gross_Sales_USD__c = '10';
        salesTransStagRecForReconciliation02.Freight_Charge_USD__c = '10';
        salesTransStagRecForReconciliation02.Local_Net_Unit_Pirce_100__c = '11314563.97412';
        salesTransStagRecForReconciliation02.Net_Unit_Price_100__c = '-';
        salesTransStagRecForReconciliation02.Sales_Type__c = 'abc';
        salesTransStagRecForReconciliation02.Sales_Type_NF__c = true;
        salesTransStagRecForReconciliation02.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation02.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Sales_Order_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation02.Gross_Unit_Price_100_Local_Currency__c = 'abcd';
        insert salesTransStagRecForReconciliation02;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation03 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation03.Vendor__c = 'debenham';
        salesTransStagRecForReconciliation03.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation03.Source__c = '123';
        salesTransStagRecForReconciliation03.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation03;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation04 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation04.Company__c = 'Vietnam';
        //salesTransStagRecForReconciliation04.Retailer_Code__c = retailercode.Id;
        salesTransStagRecForReconciliation04.Year__c = '';
        salesTransStagRecForReconciliation04.Row_No__c = 4;
        salesTransStagRecForReconciliation04.Week__c = '';
        salesTransStagRecForReconciliation04.Month__c ='';
        salesTransStagRecForReconciliation04.Item_code__c = '';
        salesTransStagRecForReconciliation04.Material__c ='';
        salesTransStagRecForReconciliation04.Source__c = '';
        salesTransStagRecForReconciliation04.Printed_Logo__c = '';
        salesTransStagRecForReconciliation04.Color__c = '';
        salesTransStagRecForReconciliation04.Customer__c = '';
        salesTransStagRecForReconciliation04.Customer_local_name__c ='';
        salesTransStagRecForReconciliation04.Mainetti_Brand__c = '';
        salesTransStagRecForReconciliation04.Category__c = 'hangers & accessories';
        salesTransStagRecForReconciliation04.Sub_Category__c = '';
        salesTransStagRecForReconciliation04.Family__c = '';
        salesTransStagRecForReconciliation04.Order_Type__c = '';
        salesTransStagRecForReconciliation04.Unit_Sold__c = '100';
        salesTransStagRecForReconciliation04.Shipped_To_Factory__c = '';
        salesTransStagRecForReconciliation04.Shipped_To_Country__c = '';
        salesTransStagRecForReconciliation04.Label__c = '';
        salesTransStagRecForReconciliation04.End_user__c = '';
        salesTransStagRecForReconciliation04.Vendor__c = 'lululemon';
        salesTransStagRecForReconciliation04.Division__c = '';
        salesTransStagRecForReconciliation04.Retailer_Brand__c = '';
        salesTransStagRecForReconciliation04.Royalty_Rate__c = '';
        salesTransStagRecForReconciliation04.Market__c = '';
        salesTransStagRecForReconciliation04.Remarks__c = '';
        salesTransStagRecForReconciliation04.LOB__c = '';
        salesTransStagRecForReconciliation04.SO_Number__c = '';
        salesTransStagRecForReconciliation04.Production_Country__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_EUR__c = '';
        salesTransStagRecForReconciliation04.ExRate_to_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_Transaction_Currency__c = '100';
        salesTransStagRecForReconciliation04.Sales_USD__c = '';
        salesTransStagRecForReconciliation04.Sales_EUR__c = '2';
        salesTransStagRecForReconciliation04.Unit_Price_100_EUR__c = '';
        salesTransStagRecForReconciliation04.Unit_Price_100_USD__c = '';
       // salesTransStagRecForReconciliation04.Unit_Sold__c = '';
        salesTransStagRecForReconciliation04.Model__c = '';
        salesTransStagRecForReconciliation04.Gross_Sales_USD__c = '@123';
        salesTransStagRecForReconciliation04.Freight_Charge_USD__c = '@!@#';
        salesTransStagRecForReconciliation04.Local_Net_Unit_Pirce_100__c = 'abc';
        salesTransStagRecForReconciliation04.Net_Unit_Price_100__c = '';
        salesTransStagRecForReconciliation04.Upload_Batch_No__c = value.id;
        salesTransStagRecForReconciliation04.Sales_Delivery_Date__c = '4-JAN-2021';
        salesTransStagRecForReconciliation04.Sales_Order_Date__c = '4-JAN-2021';
        insert salesTransStagRecForReconciliation04;

        Sales_Transaction_Stage__c salesTransStagRecForReconciliation05 = new Sales_Transaction_Stage__c();
        salesTransStagRecForReconciliation05.Vendor__c = 'macy';
        salesTransStagRecForReconciliation05.Retailer_Brand__c = 'abc';
        salesTransStagRecForReconciliation05.LOB__c = 'leg';
        salesTransStagRecForReconciliation05.Source__c = 'reuse';
        salesTransStagRecForReconciliation05.Label__c = 'abc';
        salesTransStagRecForReconciliation05.Sales_USD__c = '7.1234';
        salesTransStagRecForReconciliation05.Unit_Sold__c = '0';
        salesTransStagRecForReconciliation05.Unit_Price_100_USD__c = '1';
        salesTransStagRecForReconciliation05.Upload_Batch_No__c = value.id;
        insert salesTransStagRecForReconciliation05;

      


        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.Id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;

        Sales_Transaction__c customData = new Sales_Transaction__c();
        customData.Production_Country__c = 'CHINA';
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
        customData.CostToTolerance__c = '5.0';
        insert customData;







        string selcomp = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd';
        string selcomp1 = 'Hong Kong Packaging';
        string selMonth =  value.Sales_Month__c;
        string selYear = value.Sales_Year__c;

        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation.add(salesTransStagRecForReconciliation);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation01 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation01.add(salesTransStagRecForReconciliation01);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation02 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation02.add(salesTransStagRecForReconciliation02);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation03 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation03.add(salesTransStagRecForReconciliation03);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation04 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation04.add(salesTransStagRecForReconciliation04);
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation05 = new List<Sales_Transaction_Stage__c> ();
        salesTransStagRecAfterReconciliation05.add(salesTransStagRecForReconciliation05);


        Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
        Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
       // inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);
        Map<string,string>colorMap = new Map<string,string>();
        Map<string,string> marketMap = new Map<string,string>();
        Map<string,string>lululemonModelMap = new Map<string,string>();
        Map<string,string>debenhanModelMap = new Map<string,string>();
        Map<string,string>debenhanModelBrandKeyMap = new Map<string,string>();
        Map<string,string>debenhanBrandMap = new Map<string,string>();
        Map<string,string>vendorDivisionBrandLabelMap = new Map<string,string>();
        Map<string,string>productionCoungtryMap = new Map<string,string>();
        Map<string,string>modelWarningMap = new Map<string,string>();
        Map<string,string>modelCompKeyMap = new Map<string,string>();
        Map<string,string>dateMap = new Map<string,string>();
        Map<string,string>companyOnlyMap = new Map<string,string>();
        Map<string,string>vendorMap = new Map<string,string>();
        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
        validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
        Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = retailerDivisionBrand.getNewVendorDivisionBrandLabelMap();
        Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        Map<String,List<String>> getModelandColorMap = new Map<String,List<String>>();
        Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
        string retaileruploadcheck =  string.valueOf(retailercode.Sales_Data_Upload_Check__c);
        getSalesDataUploadCheckMap.put(retaileruploadcheck.toLowerCase(),retaileruploadcheck.toLowerCase());
        Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
       // getSalesDataUploadColorCheckMap.put(salesTransStagRecForReconciliation.Model__c,salesTransStagRecForReconciliation.Color__c);
        Map<string,string> checkColorwithModel = new Map<string,string>();
        Map<string,string> getModelCatFamilyMap = new Map<string,string>();
        Map<string,string> categoryMap = new Map<string,string>();
        Map<string,string> subcategoryMap = new Map<string,string>();
        Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        autoPopulateRetailerCountryMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> checkVendorCategory  = new Map<string,string>();
        string vendorCategory =  salesTransStagRecForReconciliation01.Vendor__c+'#'+salesTransStagRecForReconciliation01.Category__c;
        checkVendorCategory.put(vendorCategory,vendorCategory);
        system.debug('checkVendorCategory'+checkVendorCategory);

       
        Map<string,List<string>>checkVendorModel = new  Map<string,List<string>>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> modelCategory  =  new Map<string,string>();
        Map<string,string> orderTypePicklist  = new Map<string,string>();
        Map<string,string> productionCountryPicklist  = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        autoPopulateMarketSegmentMap.put(salesTransStagRecForReconciliation.Vendor__c,'salesTransStagRecForReconciliation');

        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
        Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
        pricebookprintCheckMap.put(salesTransStagRecForReconciliation.Vendor__c,salesTransStagRecForReconciliation.Vendor__c);
        system.debug('pricebookprintCheckMap'+pricebookprintCheckMap);
        Map<String,List<String>> checkVendorModelPrintedLogo = new Map<String,List<String>>();
        Map<String,List<String>> checkVendorModelColorPrintedLogo= new Map<String,List<String>>();
          inCorrectFormatMap.put(salesTransStagRecForReconciliation.Row_No__c,colorMap);

        //   map<string,string> getManittePartnerTypeMap =new map<string,string>();
        //   getManittePartnerTypeMap.put();
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;

        list<Retailer_Code__c> retailerCodes = [Select Name,Sales_Data_Upload_Check__c,Sales_Data_Upload_Color__c,Production_Country__c,Sales_Data_Upload_Market__c,Market_Segment__c from Retailer_Code__c where Name <> null];
        for (Retailer_Code__c retailer : retailerCodes){


            // Checking the Vendor
            if( retailer.Name != null )
            {
                string retailerName = retailer.Name;
                vendorMap.put(retailerName.toLowerCase(),retailerName.toLowerCase());

            }

            // Checking the SalesDataUploadCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Check__c != null  )
            {
                string retailerName = retailer.Name;
                list<string> retailerstringlist = new list<string>();
                retailerstringlist.add(retailerName);
                string salesDataUploadCheckBox = String.valueOf(retailer.Sales_Data_Upload_Check__c);
                getSalesDataUploadCheckMap.put(retailerName.toLowerCase(),salesDataUploadCheckBox);
                checkVendorModel.put(retailerName.toLowerCase(),retailerstringlist);
            }
            // Checking the Production Country
            if( retailer.Name != null && retailer.Production_Country__c != null  )
            {
                string retailerName = retailer.Name;
                string productionCountryCheckBox = String.valueOf(retailer.Production_Country__c);
                productionCoungtryMap.put(retailerName.toLowerCase(),productionCountryCheckBox);
            }
            // Checking the SalesDataUploadMarket
            if(retailerCodes.size() > 0){
                if( retailer.Sales_Data_Upload_Market__c != null)
                {
                    string retailerMarket = retailer.Sales_Data_Upload_Market__c;
                    marketMap.put(retailerMarket.toLowerCase(),retailerMarket.toLowerCase());
                }
            }
            // Checking the SalesDataUploadColorCheckBox
            if( retailer.Name != null && retailer.Sales_Data_Upload_Color__c != null  )
            {
                string retailerName = retailer.Name;
                string salesDataUploadColorCheckBox = String.valueOf(retailer.Sales_Data_Upload_Color__c);
                getSalesDataUploadColorCheckMap.put(retailerName.toLowerCase(),salesDataUploadColorCheckBox);
            }

            if( retailer.Name != null && retailer.Market_Segment__c != null  )
            {
                string retailerName = retailer.Name;
                system.debug('retailerName:::'+retailerName);
                string marketSegment = retailer.Market_Segment__c;
                system.debug('marketSegment:::'+marketSegment);
                autoPopulateMarketSegmentMap.put(retailerName.trim().toLowerCase(),marketSegment.trim());
                system.debug('autoPopulateMarketSegmentMap:::'+autoPopulateMarketSegmentMap);

            }

        }


        processSalesData processSales = new processSalesData();
       processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
         processSales.processSalesDataChunk(salesTransStagRecAfterReconciliation01, selcomp, selMonth, selYear,inCorrectFormatMap,  marketMap, modelCompKeyMap,vendorMap,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        
    }     
    
}