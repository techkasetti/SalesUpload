global class processSalesData {
    //CHECKINGGGGGGGG
    global class  recordValidationStatus{
        public Boolean validateStatus { get; set; }
        public Boolean updateCheckbox { get; set; }        
    }     
    
    //------------------------------------------------------------
    public boolean missingFieldValueBulk(Sales_Transaction_Stage__c dataRow, Map<Decimal,Map<string,string>> inCorrectFormatMap,Map<string,string> productionCoungtryMap,Map<string,string> pricebookprintCheckMap,Map<string,string> getSalesOderDateCheckMap,Map<string,string> getSalesDeliveryDateCheckMap,Map<string,string> mcaremainettibrandPicklist,Map<string,string> mcarematerialPicklist){
        
        boolean missingField = true;
        // added by sai 12-07-2021 starting
        Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        string mcareMainettiBrandCheckBox = String.valueOf(cogs.MCare_Mainetti_Brand_Check__c);
        string mcareMaterialCheckBox = String.valueOf(cogs.MCare_Material_Check__c);
        // added by sai 12-07-2021 Ending
       // System.debug('missing field method'+ dataRow);
        if(dataRow != null){
            if(String.isBlank(dataRow.Model__c)){
                dataRow.Model_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Market__c)){
                dataRow.Market_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Vendor__c)){
                dataRow.Vendor_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Company__c)){
                dataRow.Company_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Shipped_To_Factory__c)){
                dataRow.Shipped_To_Factory_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Shipped_To_Country__c)){
                dataRow.Shipped_To_Country_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Item_code__c)){
                dataRow.Item_code_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Order_Type__c)){
                dataRow.Order_Type_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Customer__c)){
                dataRow.Customer_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Transaction_Currency__c)){
                dataRow.Transaction_Currency_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.ExRate_to_EUR__C)){
                dataRow.ExRate_to_EUR_FB__C = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.ExRate_to_USD__C)){
                dataRow.ExRate_to_USD_FB__C = True;
                missingField = false;
            }            
            if(String.isBlank(dataRow.Sales_Transaction_Currency__c)){
                dataRow.STC_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Sales_USD__c)){
                dataRow.Sales_USD_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Sales_EUR__c)){
                dataRow.Sales_EUR_FB__c = True;
                missingField = false;
            }           
            // Added by Sai 26-08-2020  Starting
            if(dataRow.Unit_Sold__c.trim() > '0' &&(String.isBlank(dataRow.Sales_USD__c) && String.isBlank(dataRow.Sales_EUR__c) && String.isBlank(dataRow.Sales_Transaction_Currency__c))){
                dataRow.Sales_USD_FB__c = False;
                dataRow.Sales_EUR_FB__c = False;
                dataRow.STC_FB__c = False;
                dataRow.UnitSoldCombination__c = true;
                missingField = false; 
            }
            // Added by Sai 26-08-2020  Ending
            if(String.isBlank(dataRow.Unit_Price_100_USD__c)){
                dataRow.Unit_Price_100_USD_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Unit_Price_100_EUR__c)){
                dataRow.Unit_Price_100_EUR_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Month__c)){
                dataRow.Month_FB__c = True;
                missingField = false;
            }         
            if(String.isBlank(dataRow.Source__c)){
                dataRow.Source_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Unit_Sold__c)){
                dataRow.Unit_Sold_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Gross_Sales_USD__c)){
                dataRow.Gross_Sales_USD__c = '0';
            }
            if(String.isBlank(dataRow.Freight_Charge_USD__c)){
                dataRow.Freight_Charge_USD__c = '0';
            }
            if(String.isBlank(dataRow.Local_Net_Unit_Pirce_100__c) || dataRow.Local_Net_Unit_Pirce_100__c.trim() == '-' ){
                //dataRow.Local_Net_Unit_Pirce_100__c = '0';
                //Added By SUSHIL 13-09-22 
                dataRow.Local_Net_Unit_Pirce_FB__c = True;
                missingField = false;
            } 
            if(String.isBlank(dataRow.Gross_Unit_Price_100_Local_Currency__c) || dataRow.Gross_Unit_Price_100_Local_Currency__c.trim() == '-' ){
                // dataRow.Gross_Unit_Price_100_Local_Currency__c = '0';
                dataRow.Gross_Unit_Price_100_Local_Currency_FB__c = True;
                missingField = false;
            } 
            
            if(String.isBlank(dataRow.Net_Unit_Price_100__c) || dataRow.Net_Unit_Price_100__c.trim() == '-' ){
                //dataRow.Net_Unit_Price_100__c = '0';
                //Added By SUSHIL 13-09-22 
                dataRow.Net_Unit_Price_100_FB__c = True;
                missingField = false;
                
            }     
            
            if(String.isBlank(dataRow.Net_Weight_KG_1000__c) || dataRow.Net_Weight_KG_1000__c.trim() == '-' ){
                dataRow.Net_Weight_KG_1000__c = '0';    
            } 
            /*
if(String.isBlank(dataRow.PO_Number__c)){
dataRow.PO_Number_FB__c = True;
missingField = false;
}
*/
            //Added By Bharath on 18/01/21 ---- Starts
            if(String.isBlank(dataRow.Net_Unit_Price_100_EUR__c) || dataRow.Net_Unit_Price_100_EUR__c.trim() == '-' ){
                //dataRow.Net_Unit_Price_100_EUR__c = '0';  
                //Added by SUSHIL 13-09-22
                dataRow.Net_Unit_Price_100_EUR_FB__c = True;
                missingField = false;   
            }  
            if(String.isBlank(dataRow.Standard_Unit_Cost_100_EUR__c) || dataRow.Standard_Unit_Cost_100_EUR__c.trim() == '-' ){
                dataRow.Standard_Unit_Cost_100_EUR__c = '0';    
            }  
            if(String.isBlank(dataRow.Standard_Unit_Cost_100_USD__c) || dataRow.Standard_Unit_Cost_100_USD__c.trim() == '-' ){
                dataRow.Standard_Unit_Cost_100_USD__c = '0';    
            }  
            if(String.isBlank(dataRow.Standard_Unit_Industrial_Cost_100_EUR__c) || dataRow.Standard_Unit_Industrial_Cost_100_EUR__c.trim() == '-' ){
                dataRow.Standard_Unit_Industrial_Cost_100_EUR__c = '0';    
            }  
            if(String.isBlank(dataRow.Standard_Unit_Industrial_Cost_100_USD__c) || dataRow.Standard_Unit_Industrial_Cost_100_USD__c.trim() == '-' ){
                dataRow.Standard_Unit_Industrial_Cost_100_USD__c = '0';    
            }  
            if(String.isBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c) || dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c.trim() == '-' ){
                dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c = '0';    
            } 
            if(String.isBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c) || dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c.trim() == '-' ){
                dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c = '0';    
            }  
            if(String.isBlank(dataRow.Standard_Unit_Material_Cost_100_EUR__c) || dataRow.Standard_Unit_Material_Cost_100_EUR__c.trim() == '-' ){
                dataRow.Standard_Unit_Material_Cost_100_EUR__c = '0';    
            }
            if(String.isBlank(dataRow.Standard_Unit_Material_Cost_100_USD__c) || dataRow.Standard_Unit_Material_Cost_100_USD__c.trim() == '-' ){
                dataRow.Standard_Unit_Material_Cost_100_USD__c = '0';    
            }
            
            //Added By Bharath on 18/01/21 ---- Ends
            
            if(String.isBlank(dataRow.Week__c)){
                dataRow.Week_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Final_Sales_Destination__c)){
                dataRow.Final_Sales_Destination_FB__c = True;
                missingField = false;
            }
            if(String.isBlank(dataRow.Year__c)){
                dataRow.Year_FB__c = True;
                missingField = false;
            }       
            // Production Country
            if(String.isNotBlank(dataRow.Vendor__c))
            {
                string productionCountryCheckMap = productionCoungtryMap.get(dataRow.Vendor__c.toLowerCase());
               // system.debug(productionCountryCheckMap);
                if(String.isNotBlank(productionCountryCheckMap)){
                    if(productionCountryCheckMap.equalsIgnoreCase('true')){    
                        //system.debug('dataRow.Production_Country__c>>'+dataRow.Production_Country__c);
                        if(String.isBlank(dataRow.Production_Country__c)){
                            dataRow.Production_Country_FB__c = True;
                            missingField = false;
                        }
                    }
                }                
                string salesOrderDateChecked = getSalesOderDateCheckMap.get(dataRow.Vendor__c.toLowerCase());
              //  system.debug('salesOrderDateChecked'+salesOrderDateChecked);
                if(String.isNotBlank(salesOrderDateChecked)){
                    if(salesOrderDateChecked.equalsIgnoreCase('true')){                         
                        if(String.isBlank(dataRow.Sales_Order_Date__c)){
                            dataRow.Sales_Order_Date_FB__c = True;
                            missingField = false;
                        }
                    }
                }   
                /*if(String.isBlank(dataRow.Sales_Order_Date__c)){
dataRow.Sales_Order_Date_FB__c = True;
missingField = false;
}*/
                string salesDeliveryDateChecked = getSalesDeliveryDateCheckMap.get(dataRow.Vendor__c.toLowerCase());
                if(String.isNotBlank(salesDeliveryDateChecked)){
                    if(salesDeliveryDateChecked.equalsIgnoreCase('true')){                         
                        if(String.isBlank(dataRow.Sales_Delivery_Date__c)){
                            dataRow.Sales_Delivery_Date_FB__c = True;
                            missingField = false;
                        }
                    }
                }
                
                /* if(String.isBlank(dataRow.Sales_Delivery_Date__c)){
dataRow.Sales_Delivery_Date_FB__c = True;
missingField = false;
}*/
                
                string pricebookprintCheckBoxMap = pricebookprintCheckMap.get(dataRow.Vendor__c.toLowerCase());
                // system.debug('pricebookprintCheckBoxMap:::'+pricebookprintCheckBoxMap);
                if(String.isNotBlank(pricebookprintCheckBoxMap)){
                    if(pricebookprintCheckBoxMap.equalsIgnoreCase('true')){               
                        if(String.isBlank(dataRow.Printed_Logo__c)){
                            dataRow.Printed_Logo_FB__c = True;
                            missingField = false;
                        }                           
                    }
                }
                
                
                // added by sai 12-07-2021 Starting
                if(String.isNotBlank(dataRow.Category__c)){
                    if(mcareMainettiBrandCheckBox.equalsIgnoreCase('true') && dataRow.Category__c.equalsIgnoreCase('mcare'))
                    {
                        if(String.isBlank(dataRow.Mainetti_Brand__c))
                        {
                            dataRow.Mainetti_Brand_FB__c = True;
                            missingField = false;
                        }
                        
                    }
                }
                if(String.isNotBlank(dataRow.Category__c)){
                    if(mcareMaterialCheckBox.equalsIgnoreCase('true') && dataRow.Category__c.equalsIgnoreCase('mcare'))
                    {
                        if(String.isBlank(dataRow.Material__c))
                        {
                            dataRow.Material_FB__c = True;
                            missingField = false;
                        }
                        
                    }
                }
                // added by sai 12-07-2021 Ending
            }  
            
        }
        return missingField;
    }
    
    
    public decimal isValueNumeric(String valuePassed){
        decimal isStock = null;
        try{
            isStock = decimal.valueOf(valuePassed);           
        }catch(Exception e){}
        return isStock;
    }
    
    public class applicationException extends Exception {}
    
    public static map<string,string> getSalesWeekCountNew(string selMonth, string selYear) {
        Map <String, Integer> monthNumber = new Map <String, Integer> {'jan'=>1, 'feb'=>2
            , 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9
            , 'oct'=>10, 'nov'=>11, 'dec'=>12};
                Map <String, String> monthString = new Map <String, String> {'1'=>'jan', '2'=>'feb'
                    , '3'=>'mar', '4'=>'apr', '5'=>'may', '6'=>'jun', '7'=>'jul', '8'=>'aug', '9'=>'sep'
                    , '10'=>'oct', '11'=>'nov', '12'=>'dec'};      
                        
                        Integer dayStart = Integer.valueOf('01');
        Integer monthStart = monthNumber.get(selMonth.toLowerCase());
        Integer yearStart = Integer.valueOf(selYear);    
        Date parsedDateStart = Date.newInstance(yearStart,monthStart,dayStart); 
        
        Integer dayEnd = Integer.valueOf('01');
        Integer monthEnd = parsedDateStart.month();
        Integer yearEnd = parsedDateStart.year();
        Integer nextYear= parsedDateStart.year();
        boolean checkNxtYear = false;
        if(monthEnd == 12){
            monthEnd = 01;
            nextYear ++;
            checkNxtYear = true;
        }else{
            monthEnd++;
        }
        
        Date parsedDateEnd = Date.newInstance(nextYear,monthEnd,dayStart);        
        
        Integer startWeek = processSalesData.weeknumber(parsedDateStart);
        Integer endWeek = processSalesData.weeknumber(parsedDateEnd);
        if(checkNxtYear){
            if(endWeek == 1){
                endWeek=52;
            }
        }
        Integer difference = (endWeek - startWeek) ;
        
        Integer countOfWeeks = startWeek;
        Map<string,string> yearWeekMonth = new Map<string,string>();
        
        for (Integer k = 0; k <= difference; k++) { 
            yearWeekMonth.put(yearStart+'#'+'wk'+getTwoDigit(countOfWeeks)+'#'+monthString.get(String.valueOf(monthStart)), yearStart+'#'+'wk'+getTwoDigit(countOfWeeks)+'#'+monthString.get(String.valueOf(monthStart)));                    
            countOfWeeks++;
        }
        //  system.debug('latest deployment');
        return yearWeekMonth;
    } 
    //***************************************************************//
    //This method returns the start of the week number for a given date ie for a month
    public static Integer weeknumber(Date startdate){
        
        Date todaydateinstance = date.newinstance(startdate.year(), startdate.month(), startdate.day());
        Integer currentyear = startdate.year();
        
        Date yearstartdate = date.newinstance(currentyear, 01, 01);
        Date year2ndweek = yearstartdate.adddays(7).tostartofweek();
        
        if(startdate<year2ndweek)
            return 1;
        integer numberDaysDue = year2ndweek.daysBetween(todaydateinstance);        
        Integer numberOfWeek;
        if(math.mod(numberDaysDue,7)==0)
            numberOfWeek = math.MOD(Integer.valueof(math.FLOOR( ( numberDaysDue )/7)),52)+1;
        else
            numberOfWeek = math.MOD(Integer.valueof(math.FLOOR( ( numberDaysDue )/7)),52)+2;
        return numberOfWeek;
        
    } 
    
    public static integer getWeekCount(Date d) {
        Integer days = Date.daysInMonth(d.year(), d.month()); 
        decimal dec = decimal.valueOf(days);
        decimal weekCount =(dec/7).setScale(4);
        integer weeksCounts = integer.valueOf(Math.ceil(weekCount));
        return weeksCounts;
    } 
    public static string getTwoDigit(integer intMonth) {
        string weekCount = String.valueOf(intMonth);
        string formatWeekCount;
        if(weekCount.length() == 1){            
            formatWeekCount = '0'+weekCount;
        }else{
            formatWeekCount = weekCount;
        }
        return formatWeekCount;
    } 
    public static map<string,string> getSalesWeekList(string selMonth, string selYear, String selcomp) {
        Map <String, Integer> monthNumber = new Map <String, Integer> {'jan'=>1, 'feb'=>2
            , 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9
            , 'oct'=>10, 'nov'=>11, 'dec'=>12};
                Map <String, String> monthString = new Map <String, String> {'1'=>'jan', '2'=>'feb'
                    , '3'=>'mar', '4'=>'apr', '5'=>'may', '6'=>'jun', '7'=>'jul', '8'=>'aug', '9'=>'sep'
                    , '10'=>'oct', '11'=>'nov', '12'=>'dec'};       
                        
                        Integer dayStart = Integer.valueOf('01');
        Integer monthStart = monthNumber.get(selMonth.toLowerCase());
        Integer yearStart = Integer.valueOf(selYear);    
        Date parsedDateStart = Date.newInstance(yearStart,monthStart,dayStart);
        
        Integer dayEnd = Integer.valueOf('01');
        Integer monthEnd = parsedDateStart.month();
        Integer yearEnd = parsedDateStart.year();
        Integer nextYear= parsedDateStart.year();
        boolean checkNxtYear = false;
        if(monthEnd == 12){
            monthEnd = 01;
            nextYear ++;
            checkNxtYear = true;
        }else{
            monthEnd++;
        }
        
        Date parsedDateEnd = Date.newInstance(nextYear,monthEnd,dayStart);   
        Integer startWeek = processSalesData.weeknumber(parsedDateStart);
        Integer endWeek = processSalesData.weeknumber(parsedDateEnd);
        if(checkNxtYear){
            if(endWeek == 1){
                endWeek=52;
            }
        }
        Integer difference = (endWeek - startWeek);        
        Integer countOfWeeks = startWeek;
        Map<string,string> yearWeekMonth = new Map<string,string>();              
        for (Integer k = 0; k <= difference; k++) {
            string partnerCmpName = selcomp;
            yearWeekMonth.put('wk'+getTwoDigit(countOfWeeks),'wk'+getTwoDigit(countOfWeeks));  
            countOfWeeks++;         
        }       
        return yearWeekMonth;
    } 
    
    public static map<string,string> getSalesWeekCountWithPartnerCompanyNewCompanyList(string selMonth, string selYear, String selcomp) {
        Map <String, Integer> monthNumber = new Map <String, Integer> {'jan'=>1, 'feb'=>2
            , 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9
            , 'oct'=>10, 'nov'=>11, 'dec'=>12};
                Map <String, String> monthString = new Map <String, String> {'1'=>'jan', '2'=>'feb'
                    , '3'=>'mar', '4'=>'apr', '5'=>'may', '6'=>'jun', '7'=>'jul', '8'=>'aug', '9'=>'sep'
                    , '10'=>'oct', '11'=>'nov', '12'=>'dec'};       
                        
                        Integer dayStart = Integer.valueOf('01');
        Integer monthStart = monthNumber.get(selMonth.toLowerCase());
        Integer yearStart = Integer.valueOf(selYear);    
        Date parsedDateStart = Date.newInstance(yearStart,monthStart,dayStart);
        
        Integer dayEnd = Integer.valueOf('01');
        Integer monthEnd = parsedDateStart.month();
        Integer yearEnd = parsedDateStart.year();
        Integer nextYear= parsedDateStart.year();
        boolean checkNxtYear = false;
        if(monthEnd == 12){
            monthEnd = 01;
            nextYear ++;
            checkNxtYear = true;
        }else{
            monthEnd++;
        }
        
        Date parsedDateEnd = Date.newInstance(nextYear,monthEnd,dayStart);       
        
        Integer startWeek = processSalesData.weeknumber(parsedDateStart);
        Integer endWeek = processSalesData.weeknumber(parsedDateEnd);
        if(checkNxtYear){
            if(endWeek == 1){
                endWeek=52;
            }
        }
        Integer difference = (endWeek - startWeek) ;
        
        Integer countOfWeeks = startWeek;
        Map<string,string> yearWeekMonth = new Map<string,string>();
        for (Integer k = 0; k <= difference; k++) {
            string partnerCmpName = selcomp;
            yearWeekMonth.put(yearStart+'#'+'wk'+getTwoDigit(countOfWeeks)+'#'+monthString.get(String.valueOf(monthStart))+'#'+partnerCmpName.toLowerCase(), partnerCmpName.toLowerCase()+'::'+'wk'+getTwoDigit(countOfWeeks));                    
            countOfWeeks++;         
        }       
        return yearWeekMonth;
    }
    
    public boolean valueIsNumeric(string numberValue)
    {        
        Boolean isNumber = true;
        try
        {
            String str = numberValue;
            Decimal strToDec = decimal.valueOf(str.replaceAll(',',''));
        }
        catch (exception e)
        {
            isNumber  = false;
        }
        
        return isNumber;
        
    }
    
    public List<Sales_Transaction_Stage__c> processSalesDataChunk(List<Sales_Transaction_Stage__c> salesTransStagRec,string selcomp,string selMonth,string selYear,Map<Decimal,Map<string,string>>inCorrectFormatMap,Map<string,string> marketMap,Map<string,string>modelCompKeyMap,Map<string,string>vendorMap,validateSalesRowsBulk.recordValidationStatus recordStatus ,Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap,Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap, Map<string,List<string>> getModelandColorMap,Map<string,string> getSalesDataUploadCheckMap,Map<string,string> getSalesDataUploadColorCheckMap,Map<string,string> getModelCatFamilyMap ,Map<string,string> modelwithCatSubCatFamily, Map<string,string> currencyPicklist,Map<string,string> orderTypePicklist,Map<string,string> checkVendorCategory,Map<string,List<string>> checkVendorModel,Map<string,string> productionCountryPicklist,Map<string,string> productionCoungtryMap,Map<string,string> modelCategory,Map<string,string> autoPopulateRetailerCountryMap,Map<string,string> autoPopulateMarketSegmentMap,Map<string,string> finalsalesdestinationPicklist, Map<string,string> getSalesOderDateCheckMap,Map<string,string> getSalesDeliveryDateCheckMap,Map<string,string> pricebookprintCheckMap){
        List<Sales_Transaction_Stage__c> salesTransStagUpdate = new List<Sales_Transaction_Stage__c>();
        Map<string,string> compyearweeMon = productDependentPicklistForSales.checkCompMonthYearWeek(selcomp);
        // Added by Sai 18-05-2021 Starting
        System.debug('company for partner Type'+ selcomp);
        getSalesMasterData salesMasterData = new getSalesMasterData();
        
        map<String,map<string,string>> getPartnerMap = salesMasterData.getManitteCompanyMap();
        map<string,string> getManitteCompanyMap = getPartnerMap.get('mainettiCompanyMap');
        map<string,string> getManittePartnerTypeMap = getPartnerMap.get('mainettiPartnerType');
        System.debug('getManittePartnerTypeMap'+getManittePartnerTypeMap);
        System.debug('getPartnerMap'+getPartnerMap);
       

        //Added by SUSHIL 16-09-22
        Map<String,Map<String,String>> getPriceBook = salesMasterData.getPriceSpecificationBookDetails();
        Map<string,string> checkRetailerCodeMap = getPriceBook.get('checkRetailerCodeMap');
        Map<string,string> checkRetailerBussinessCheckMap = getPriceBook.get('checkRetailerBussinessCheckMap');
       System.debug('checkRetailerCodeMap'+checkRetailerCodeMap);
        //SUSHIL ends
        // Starting
        Map<string,Map<string,string>> getpartnerCompanyRegionNCogsCountryNCompanyGroupMap = salesMasterData.getParterCmpyRegionNCogsCountryNComapnyGroupName();
        map<string,string> getpartnerCompanyRegionMap = getpartnerCompanyRegionNCogsCountryNCompanyGroupMap.get('salesCompanyRegionMap');
        map<string,string> getpartnerCompanyCogsCountry = getpartnerCompanyRegionNCogsCountryNCompanyGroupMap.get('salesCogsCountryMap');
        map<string,string> getpartnerCompanyGroupName = getpartnerCompanyRegionNCogsCountryNCompanyGroupMap.get('salesCompanyGroupNameMap');
        // Ending
        Map<string,string> mcaremainettibrandPicklist =  salesMasterData.getPickListMap('Sales_Transaction_Stage__c','MCare_Mainetti_Brand__c');
        Map<string,string> mcarematerialPicklist =  salesMasterData.getPickListMap('Sales_Transaction_Stage__c','MCare_Material__c');
        // system.debug('getpartnerCompanyRegionMap ::'+getpartnerCompanyRegionMap);
        String defaultOrderToCompany = getManitteCompanyMap.get(selcomp);
        System.debug('defaultOrderToCompany'+ defaultOrderToCompany);
        wrapPriceBookProdVendorDetails wrapPriceBook = salesMasterData.getPriceSpecificationBookProductDetails(defaultOrderToCompany);
        Map<string,Map<string,string>> compositePriceSpecificationBookProduct = wrapPriceBook.ProductDetails;  
        Map<string,List<string>>checkVendorModelPrintedLogo = wrapPriceBook.VendorModelPrintedLogoDetails;
        Map<string,List<string>>checkVendorModelColorPrintedLogo = wrapPriceBook.VendorModelColorPrintedLogoDetails;
        Map<string,string> getModelandprintedLogoMap = compositePriceSpecificationBookProduct.get('CheckModelPrintedLOGOPSBP');
        //  system.debug('getModelandprintedLogoMap::::'+getModelandprintedLogoMap);
        Map<string,string> getModelColorprintedLogoMap = compositePriceSpecificationBookProduct.get('CheckModelColorPrintedLOGOPSBP');
        // system.debug('getModelColorprintedLogoMap::::'+getModelColorprintedLogoMap);
        Map<string,Map<string,string>> compositeRetailerMap = salesMasterData.getRetailerDetails();
        Map<string,string> pricebookprintModelColorCheckMap = compositeRetailerMap.get('PriceBookPrintCheckModelColorMap');
        // Added by Sai 18-05-2021 Ending
        Sales_Transaction__c customData = Sales_Transaction__c.getInstance();
        decimal tolerance = decimal.valueOf(customData.Tolerance__c);
        integer setScales = integer.valueOf(customData.SetScale__c);
        decimal salesUSDTolerance = decimal.valueOf(customData.SalesUSDTolerance__c);
        decimal salesEURTolerance = decimal.valueOf(customData.SalesEURTolerance__c);
        decimal UnitPrice100USDTolerance = decimal.valueOf(customData.UnitPrice100USD__c);
        decimal UnitPrice100EURTolerance = decimal.valueOf(customData.UnitPrice100EUR__c);
        //Added by SUSHIL 16-09-22
        decimal costToTolerance = decimal.valueOf(customData.CostToTolerance__c);
       // system.debug('>>'+costToTolerance);
        // added by sai 12-07-2021 starting
        Cogs_Sales_Upload__c cogs = Cogs_Sales_Upload__c.getInstance();
        string mcareMainettiBrandCheckBox = String.valueOf(cogs.MCare_Mainetti_Brand_Check__c);
        string mcareMaterialCheckBox = String.valueOf(cogs.MCare_Material_Check__c);
        // added by sai 12-07-2021 Ending
        
        //added by darshan 9/5/2022
        Map<string,string> autoPopulateRetailerTypeMap = compositeRetailerMap.get('AutoPopulateRetailerType');
       // system.debug(salesTransStagRec);
        for (Sales_Transaction_Stage__c dataRow : salesTransStagRec) {           
            Boolean isDataValid = true;   
            Boolean checkbox = false;   
            String remarks = '';
            String errorCode = '';
            string totalerrorcode = '';
            STRING errorcode1  = '';
            boolean missingField =  missingFieldValueBulk(dataRow,inCorrectFormatMap,productionCoungtryMap,pricebookprintCheckMap,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,mcaremainettibrandPicklist,mcarematerialPicklist); 
           // system.debug(inCorrectFormatMap);
            if(!missingField)
            {
                isDataValid = false;
            }            
            if(inCorrectFormatMap.containsKey(dataRow.Row_No__c)){
                Map<string,string> valuesReturned = inCorrectFormatMap.get(dataRow.Row_No__c);
                
                if(!String.isBlank(valuesReturned.get('Gross'))){
                    remarks = valuesReturned.get('Gross')+ '\r\n' ;
                }
                if(!String.isBlank(valuesReturned.get('Freight'))){
                    remarks += valuesReturned.get('Freight');
                }
                isDataValid = false;
            }
            // checking for market exits ?
            if(String.isNotBlank(dataRow.Market__c)){
                if(!marketMap.containsKey(dataRow.Market__c.toLowerCase())){
                    dataRow.Market_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Market not found';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0022,';
                }

                
                
            }
            
            // checking for vendor exits ?
            if(String.isNotBlank(dataRow.Vendor__c)){
                Boolean getManittePartnerTypeMapCheck ; 
                System.debug('company for partner Type'+ selcomp);
                String getManittePartnerTypeMaPValue;
                System.debug('company for partner Type '+ getManittePartnerTypeMap);
                if(getManittePartnerTypeMap.containsKey(selcomp)){
                    getManittePartnerTypeMaPValue = getManittePartnerTypeMap.get(selcomp);
                System.debug('partner Type from Map'+ getManittePartnerTypeMaPValue);
                    if(String.valueOf(getManittePartnerTypeMaPValue) == 'Mainetti Company'){
                    getManittePartnerTypeMapCheck = true;
                    }
                    else{
                    getManittePartnerTypeMapCheck = false;

                    }
                }
                //system.debug('vendor:::'+dataRow.Vendor__c);
                //Update Sushil
                //Added on 14-09-2022 vendor validation UAT
                // CSV Retailer Code = Pricebook.Retailer Code and CSV Business vertical = Pricebook.Business_vertical and Pricebook.COGS Costing Check is TRUE 
                //Checking Retailer Code
                
               // if(checkRetailerCodeMap.containsKey(dataRow.Vendor__c.toLowerCase())){
                    //getting value of PriceBookCostCheck
               system.debug(checkRetailerCodeMap);
                system.debug(dataRow.Vendor__c);
                if(getManittePartnerTypeMapCheck){
                Boolean priceBookCostCheck;
                // Boolean priceBookCostCheck = Boolean.valueOf(checkRetailerCodeMap.get(dataRow.Vendor__c.toLowerCase()));
                String priceBookCostCheckValue = checkRetailerCodeMap.get(dataRow.Vendor__c.toLowerCase());
               // system.debug('priceBookCostCheckValue >>>'+priceBookCostCheckValue);
                if(String.isBlank(priceBookCostCheckValue)){
                    priceBookCostCheck = false;
                }
                else{
                    priceBookCostCheck = Boolean.valueOf(checkRetailerCodeMap.get(dataRow.Vendor__c.toLowerCase()));
                }
                    //Do non negative Valiation only if PriceBookCostCheck is true
                   // system.debug(priceBookCostCheck);
                    if(priceBookCostCheck){
                        //Business Vertical Compare
                        system.debug('checkVendorCategory::'+checkVendorCategory);
                        system.debug('dataRow.Vendor__c:::'+dataRow.Vendor__c+'#dataRow.Category__c:::'+dataRow.Category__c);
                        if((checkVendorCategory.containsKey((dataRow.Vendor__c).toLowerCase()+'#'+(dataRow.Category__c).toLowerCase()))){
                            //Checking COGS costing checkbox
                            System.debug('checkRetailerBussinessCheckMap:::'+checkRetailerBussinessCheckMap);
                            system.debug('dataRow.Vendor__c:::'+dataRow.Vendor__c+'#dataRow.Category__c:::'+dataRow.Category__c);
                            Boolean checktrue = Boolean.valueOf(checkRetailerBussinessCheckMap.get((dataRow.Vendor__c).toLowerCase()+'#'+(dataRow.Category__c).toLowerCase()));
                            system.debug('checktrue>>'+checktrue);
                            if (checktrue) {
                                //Check non- negative values of 6 fields
                                System.debug(dataRow.Standard_Unit_Cost_100_EUR__c);
                                if(String.isNotBlank(dataRow.Standard_Unit_Cost_100_EUR__c)){
                                    String standardunitcost100eur = dataRow.Standard_Unit_Cost_100_EUR__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitcost100eur)){
                                        decimal decimalstandardunitcost100eur = decimal.valueOf(standardunitcost100eur);
                                        
                                        if(decimalstandardunitcost100eur <= 0)
                                        {
                                            dataRow.Standard_Unit_Cost_100_EUR_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative Or Zero';
                                            //Added on 19-11-2020 for  Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                            
                                        }}
                                    
                                }System.debug(dataRow.Standard_Unit_Cost_100_USD__c);
                                if(String.isNotBlank(dataRow.Standard_Unit_Cost_100_USD__c)){
                                    String standardunitcost100usd = dataRow.Standard_Unit_Cost_100_USD__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitcost100usd)){
                                        decimal decimalstandardunitcost100usd = decimal.valueOf(standardunitcost100usd);
                                        
                                        if(decimalstandardunitcost100usd <= 0)
                                        {
                                            dataRow.Standard_Unit_Cost_100_USD_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 19-11-2020 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                    
                                }
                                System.debug(dataRow.Standard_Unit_Industrial_Cost_100_EUR__c);
                                if(String.isNotBlank(dataRow.Standard_Unit_Industrial_Cost_100_EUR__c)){
                                    String standardunitindustrialcost100eur = dataRow.Standard_Unit_Industrial_Cost_100_EUR__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitindustrialcost100eur)){
                                        decimal decimalstandardunitindustrialcost100eur = decimal.valueOf(standardunitindustrialcost100eur);
                                        
                                        if(decimalstandardunitindustrialcost100eur <= 0 )
                                        {
                                            dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                            //system.debug('decimalstandardunitindustrialcost100eur:::Inside If'+decimalstandardunitindustrialcost100eur);
                                        }}
                                }
                                if(String.isNotBlank(dataRow.Standard_Unit_Industrial_Cost_100_USD__c)){
                                    String standardunitindustrialcost100usd = dataRow.Standard_Unit_Industrial_Cost_100_USD__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitindustrialcost100usd)){
                                        decimal decimalstandardunitindustrialcost100usd = decimal.valueOf(standardunitindustrialcost100usd);
                                        
                                        if(decimalstandardunitindustrialcost100usd <= 0)
                                        {
                                            dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                }
                                
                                if(String.isNotBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c)){
                                    String standardunitexworkcost100eur = dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c.replaceAll(',','');
                                    
                                    if(valueIsNumeric(standardunitexworkcost100eur)){
                                        decimal decimalstandardunitexworkcost100eur = decimal.valueOf(standardunitexworkcost100eur);
                                        
                                        if(decimalstandardunitexworkcost100eur <= 0)
                                        {
                                            dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                    
                                    
                                }
                                
                                if(String.isNotBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c)){
                                    String standardunitexworkcost100usd = dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitexworkcost100usd)){
                                        decimal decimalstandardunitexworkcost100usd = decimal.valueOf(standardunitexworkcost100usd);
                                        
                                        if(decimalstandardunitexworkcost100usd <= 0)
                                        {
                                            dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                    
                                }
                                if(String.isNotBlank(dataRow.Standard_Unit_Material_Cost_100_USD__c)){
                                    String standardunitmaterialcost100usd = dataRow.Standard_Unit_Material_Cost_100_USD__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitmaterialcost100usd)){
                                        decimal decimalstandardunitmaterialcost100usd = decimal.valueOf(standardunitmaterialcost100usd);
                                        
                                        if(decimalstandardunitmaterialcost100usd <= 0)
                                        {
                                            dataRow.Standard_Unit_Material_Cost_100_USD_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                    
                                }if(String.isNotBlank(dataRow.Standard_Unit_Material_Cost_100_EUR__c)){
                                    String standardunitmaterial1cost100usd = dataRow.Standard_Unit_Material_Cost_100_EUR__c.replaceAll(',','');
                                    if(valueIsNumeric(standardunitmaterial1cost100usd)){
                                        decimal decimalstandardunitmaterial1cost100usd = decimal.valueOf(standardunitmaterial1cost100usd);
                                        
                                        if(decimalstandardunitmaterial1cost100usd <= 0)
                                        {
                                            dataRow.Standard_Unit_Material_Cost_100_EUR_NF__c = True;
                                            isDataValid = false;
                                            remarks += '\r\n Costing Field cannot be negative or Zero';
                                            //Added on 11-01-2021 for Error Code Mapping
                                            errorCode += 'ERR-0115,';
                                        }}
                                    
                                }
                            
                        }
                    //}Tony edited 20221026 start
                    /*
                        else {
                            //business vertical not matched
                            dataRow.Category_NF__c = True;
                            isDataValid = false;
                            remarks += '\r\n The pricebook.business vertical did not match';
                            //Added on 11-01-2021 for Error Code Mapping
                            errorCode += 'ERR-0113,';
                            
                        }
                        */ // Tony end edited 20221026
                        } 
                    }
            }
               /* }else {
                    //retailer code not found
                    dataRow.Vendor_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Retailer Code not found';
                    
                    errorCode += 'ERR-0112,';
                }*/
                
                //Update Sushil end
                System.debug('vendorMap'+vendorMap);
                System.debug('dataRow.Vendor__c'+dataRow.Vendor__c);

                if(!vendorMap.containsKey(dataRow.Vendor__c.toLowerCase())){
                    dataRow.Vendor_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Vendor not found';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0023,';
                }else {
                    if(getRetailersLabelDivisionBrandCheckMap.containsKey(dataRow.Vendor__c)){
                        Retailer_Code__c retailerCode = getRetailersLabelDivisionBrandCheckMap.get(dataRow.Vendor__c);
                        String getmainettiHGNomination = retailerCode.HG_Nomination__c;
                        String getmainettiFPNomination = retailerCode.FP_Nomination__c;
                        System.debug('getmainettiHGNomination '+getmainettiHGNomination);

                        
                        System.debug('getmainettiFPNomination '+getmainettiFPNomination);
                        if(dataRow.Category__c=='Hangers & Accessories'){
                            System.debug('dataRow.HG_Nomination__c  ');
                            if(String.isNotBlank(getmainettiHGNomination))
                            {
                                dataRow.Nomination__c =getmainettiHGNomination;
                            }
                            
                        }else if(dataRow.Category__c=='Flexible Packaging'){
                          System.debug('dataRow.FP_Nomination__c  ');

                            if(String.isNotBlank(getmainettiFPNomination)){
                                dataRow.Nomination__c = getmainettiFPNomination;
                                    System.debug('dataRow.FP_Nomination__c  ');
                            }
                        }
                        
                        
                       /* if(String.isBlank(getmainettiHGNomination))
                        {
                            if(dataRow.Category__c=='Hangers & Accessories'){
                                System.debug('dataRow.HG_Nomination__c  ');
                                
                                dataRow.HG_Nomination__c =getmainettiHGNomination;
                                
                                
                                
                            }
                            
                            
                            else if(String.isBlank(getmainettiFPNomination)){
                                if(dataRow.Category__c=='Flexible Packaging'){
                                    dataRow.FP_Nomination__c = getmainettiFPNomination.get(datarow.Vendor__c);
                                    System.debug('dataRow.fp_Nomination__c  ');
                                }
                                
                            }
                        }*/
                    }
                   


                    
                }
                
                string valueReturned = autoPopulateRetailerCountryMap.get(dataRow.Vendor__c.toLowerCase());  
                if(String.isNotBlank(valueReturned)){
                    List<String> result = valueReturned.split('#');                    
                    dataRow.Retailer_Country__c = result[0];  
                }
                string valueTypeReturned = autoPopulateRetailerTypeMap.get(dataRow.Vendor__c.toLowerCase());  
                if(String.isNotBlank(valueTypeReturned)){
                    //List<String> result = valueTypeReturned.split('#');                    
                    dataRow.Retailer_Type__c = valueTypeReturned;  
                }
                string valueMarketReturned = autoPopulateMarketSegmentMap.get(dataRow.Vendor__c.toLowerCase());  
                if(String.isNotBlank(valueMarketReturned)){
                    dataRow.Segments__c = valueMarketReturned;                    
                }
            }
            if(String.isNotBlank(dataRow.Company__c)){
                dataRow.Region__c = getpartnerCompanyRegionMap.get(selcomp);
                dataRow.Cogs_Country__c = getpartnerCompanyCogsCountry.get(selcomp);
                dataRow.Company_Group_Name__c = getpartnerCompanyGroupName.get(selcomp);
                if(dataRow.Company__c != selcomp){
                    dataRow.Company_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Company not found';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0021,';
                }
            } 
            // checking the combination from data upload sales
            if(String.isNotBlank(dataRow.Company__c) && String.isNotBlank(dataRow.Year__c) && String.isNotBlank(dataRow.Week__c) && String.isNotBlank(dataRow.Month__c)){
                
                //CHECK OUT THE WEEK FORMAT STARTS
                String dateRegEx = '[a-zA-Z]{2}[0-9]{1,2}';
                Pattern myPattern = Pattern.compile(dateRegEx); 
                Matcher myMatcher = myPattern.matcher(dataRow.Week__c);
                //system.debug('myMatcher   >>>'+myMatcher);
                if(!myMatcher.matches())
                {
                    //system.debug('NOT IN FORMAT');
                    dataRow.wrong_date__c = True;
                    isDataValid = false;
                    remarks += '\r\n "Week" should be in Correct Format.';
                    //Added on 17-06-2022 for Error Code Mapping
                    errorCode += 'ERR-0111,';
                }
                //CHECK OUT THE WEEK FORMAT ENDS
                
                else{
                    
                    String strText = dataRow.Week__c;
                    // system.debug('strText>>>'+strText);
                    strText = strText.replaceAll('[^a-zA-Z0-9\\s+]', ''); 
                    //System.debug('strText ======> '+strText); 
                    if(strText.length()<4){
                        //system.debug('Length is 3');
                        strText = strText.substring(0, 2) + '0' + strText.substring(2, strText.length());
                       // System.debug('strText ======> '+strText); 
                    }
                    string cywm = dataRow.Company__c.touppercase()+'#'+dataRow.Year__c+'#'+strText+'#'+dataRow.Month__c.touppercase();
                    system.debug('cywm>>>'+cywm);
                    system.debug('compyearweeMon>>>'+compyearweeMon);
                    if(compyearweeMon.containsKey(cywm)){
                        dataRow.Company_NF__c = True;
                        dataRow.wrong_date__c = True;
                        isDataValid = false;
                        remarks += '\r\n Combination of Comp,year,week,mon already present in data upload sales';
                        //Added on 22-10-2020 for Error Code Mapping
                        errorCode += 'ERR-0020,';
                        
                    }
                } 
            }
            
            // checking for selected month and year.
            string cmpMonYeaValue = '';
            string cmpMonYeaSel = '';
            cmpMonYeaValue =  dataRow.Month__c+'#'+dataRow.Year__c;
            cmpMonYeaSel = selMonth+'#'+selYear;
            if(String.isNotBlank(dataRow.Month__c) && String.isNotBlank(dataRow.Year__c)){
                if(cmpMonYeaValue.toLowerCase() != cmpMonYeaSel.toLowerCase()){
                    dataRow.selected_ui_values__c = True;
                    isDataValid = false;
                    remarks += '\r\n Mismatch with Selected month or year';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0028,';
                }
            }
            // checking for SO number ?            
            if(String.isNotBlank(dataRow.SO_Number__c)){
                if(dataRow.SO_Number__c.length()>100){
                    dataRow.SO_Number_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n SO Number should not be more than 100 characters';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0029,';
                }
            }
            // checking for LOB ?            
            if(String.isNotBlank(dataRow.LOB__c)){
                if(dataRow.LOB__c.length()>100){
                    dataRow.LOB_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n LOB should not be more than 100 characters';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0030,';
                }
            }
            //validating calculation
            if(String.isNotBlank(dataRow.Unit_Sold__c)){
                
                try{
                    String unitSold =   dataRow.Unit_Sold__c;
                    Integer.valueOf(unitSold.replaceAll(',',''));
                }
                catch(TypeException e){
                    isDataValid = false; 
                    dataRow.Calculation_Failed__c = True;
                    remarks += '\r\n Unit sold Should be Integer \r\n';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0024,';
                }
                
                if(valueIsNumeric(dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.Unit_Sold__c) && valueIsNumeric( dataRow.Sales_USD__c) && valueIsNumeric( dataRow.Sales_EUR__c)){
                    decimal salestranscurrencyAdmin = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                    decimal unitsoldAdmin = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                    decimal salesusddecimalAdmin = decimal.valueOf(dataRow.Sales_USD__c.replaceAll(',',''));
                    decimal saleseurdecimalAdmin = decimal.valueOf(dataRow.Sales_EUR__c.replaceAll(',',''));
                    System.debug(unitsoldAdmin+'  '+salesusddecimalAdmin+'  '+saleseurdecimalAdmin+'  '+salestranscurrencyAdmin);
                    if(unitsoldAdmin == 0 && (salesusddecimalAdmin != 0 && saleseurdecimalAdmin != 0 && salestranscurrencyAdmin != 0)){
                        dataRow.unit_sold_warning__c = True;
                        isDataValid = false; 
                        //Added on 18-01-2021 by Bharath for Error Code Mapping
                        errorCode += 'ERR-0089,';
                    }
                }else{
                    dataRow.Calculation_Failed__c = True; 
                    isDataValid = false;  
                    remarks += '\r\n Invalid Data Either in Sales USD,Sales Transaction Currency,ExRate to USD\r\n';
                    errorCode += 'ERR-0062,';
                }
            } 
            
            // Added by Sai 22-08-2020  Starting
            if(valueIsNumeric(dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.Unit_Sold__c) && valueIsNumeric( dataRow.Sales_USD__c) && valueIsNumeric( dataRow.Sales_EUR__c)){
                decimal salestranscurrencyAdmin = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                decimal unitsoldAdmin = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                decimal salesusddecimalAdmin = decimal.valueOf(dataRow.Sales_USD__c.replaceAll(',',''));
                decimal saleseurdecimalAdmin = decimal.valueOf(dataRow.Sales_EUR__c.replaceAll(',',''));
                if(unitsoldAdmin > 0 && (salesusddecimalAdmin == 0 && saleseurdecimalAdmin == 0 && salestranscurrencyAdmin == 0)){
                    dataRow.UnitSoldCombinationNotFound__c = true;
                    isDataValid = false; 
                }
                else{
                    //system.debug('UnitSoldCombinationNotFound__c:::Else');
                    dataRow.UnitSoldCombinationNotFound__c = false; 
                    //system.debug('UnitSoldCombinationNotFound__c:::Else001');
                } 
            }else{
                dataRow.Calculation_Failed__c = True; 
                isDataValid = false;  
                remarks += '\r\n Invalid Data Either in Sales USD,Sales Transaction Currency,ExRate to USD\r\n';
                errorCode += 'ERR-0062,';
            }
            /*  if((dataRow.Unit_Sold__c > '0' && (dataRow.Sales_USD__c == '0' && dataRow.Sales_EUR__c == '0' && dataRow.Sales_Transaction_Currency__c == '0')) || (dataRow.Unit_Sold__c > '0' && (dataRow.Sales_USD__c == '0.00' && dataRow.Sales_EUR__c == '0.00' && dataRow.Sales_Transaction_Currency__c == '0.00'))){
dataRow.UnitSoldCombinationNotFound__c = true;
isDataValid = false; 
}
else{
system.debug('UnitSoldCombinationNotFound__c:::Else');
dataRow.UnitSoldCombinationNotFound__c = false; 
system.debug('UnitSoldCombinationNotFound__c:::Else001');
}  */
            // Added by Sai 22-08-2020  Ending 
            // Added by Sai 21-09-2020 Starting
            if(String.isNotBlank(dataRow.Sales_Type__c)){
                if(!dataRow.Sales_Type__c.equalsIgnoreCase('E-Commerce'))
                {
                    dataRow.Sales_Type_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Sales Type should be either E-Commerce or Null';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0031,';
                }
            }
            // Added by Sai 21-09-2020 Ending
            
            //validating Gross Sales
            if(String.isNotBlank(dataRow.Gross_Sales_USD__c)){
                
                try{
                    String grossSales =   dataRow.Gross_Sales_USD__c;
                    decimal.valueOf(grossSales.replaceAll(',',''));
                }
                catch(TypeException e){
                    isDataValid = false; 
                    remarks += '\r\n Gross Sales Should be Integer \r\n';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0032,';
                }
            } 
            //validating Freight Charge USD
            if(String.isNotBlank(dataRow.Freight_Charge_USD__c)){
                
                try{
                    String freightChargeUSD =   dataRow.Freight_Charge_USD__c;
                    decimal.valueOf(freightChargeUSD.replaceAll(',',''));
                }
                catch(TypeException e){
                    isDataValid = false; 
                    remarks += '\r\n Freight Charge USD Should be Integer \r\n';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0033,';
                }
            } 
            // Added by Sai 01-06-2020
            // checking the picklist values from data upload sales
            if(String.isNotBlank(dataRow.Transaction_Currency__c)){
                string currencypicklists = dataRow.Transaction_Currency__c.touppercase();
                if(!currencyPicklist.containsKey(currencypicklists)){
                    dataRow.Transaction_Currency_NF__c = True;
                    isDataValid = false;
                    errorCode += 'ERR-0060,';
                }
            } 
            // checking the picklist values from data upload sales
            if(String.isNotBlank(dataRow.Order_Type__c)){
                string orderTypee =  dataRow.Order_Type__c.touppercase();
                if(!orderTypePicklist.containsKey(orderTypee)){
                    dataRow.Order_Type_NF__c = True;
                    isDataValid = false;
                    errorCode += 'ERR-0061,';
                }
                else{
                    dataRow.Order_Type__c = orderTypee;
                } 
            } 
            
            // checking the picklist values from data upload sales
            if(String.isNotBlank(dataRow.Final_Sales_Destination__c)){
                //system.debug('dataRow.Final_Sales_Destination__c:::'+dataRow.Final_Sales_Destination__c);
                if(!finalsalesdestinationPicklist.containsKey(dataRow.Final_Sales_Destination__c.touppercase())){
                    dataRow.Final_Sales_Destination_NF__c = True;
                    isDataValid = false;
                    errorCode += 'ERR-0088,';
                }else {
                    //system.debug('dataRow.Final_Sales_Destination__c:::else'+dataRow.Final_Sales_Destination__c);
                    dataRow.Final_Sales_Destination__c = dataRow.Final_Sales_Destination__c.touppercase();
                }
            }
            if(String.isNotBlank(dataRow.Item_code__c))
            {
                dataRow.Item_code__c = dataRow.Item_code__c.replaceAll(';','');
            }
            // Added by Sai 09-07-2020
            // checking the picklist values from data upload sales
            if(String.isNotBlank(dataRow.Vendor__c) && String.isNotBlank(dataRow.Production_Country__c))
            {
                string productionCountryCheckMap = productionCoungtryMap.get(dataRow.Vendor__c.toLowerCase());
                if(String.isNotBlank(productionCountryCheckMap)){
                    if(productionCountryCheckMap.equalsIgnoreCase('true')){ 
                        if(!productionCountryPicklist.containsKey(dataRow.Production_Country__c.toUppercase())){
                            dataRow.Production_Country_NF__c = True;
                            isDataValid = false;
                            //Added on 22-10-2020 for Error Code Mapping
                            errorCode += 'ERR-0036,';
                        } 
                    }
                }                           
            }            
            // Validating the ExRate to USD should not be more than ExRate to EUR
            if(String.isNotBlank(dataRow.ExRate_to_USD__c) && String.isNotBlank(dataRow.ExRate_to_EUR__c)){
                string exRatetoUSD = dataRow.ExRate_to_USD__c;
                string exRatetoEUR = dataRow.ExRate_to_EUR__c;
                if(valueIsNumeric(exRatetoUSD) && valueIsNumeric(exRatetoEUR))
                {
                    decimal valueOfUsd = decimal.valueOf(exRatetoUSD.replaceAll(',',''));
                    //system.debug('valueOfUsd::::'+valueOfUsd);
                    decimal valueOfEur = decimal.valueOf(exRatetoEUR.replaceAll(',',''));
                    // system.debug('valueOfEur::::'+valueOfEur);
                    //edited by Tony 20220829, >= to ==
                    if(valueOfUsd!= 0 || valueOfEur!=0){
                        if(valueOfUsd == valueOfEur){
                            dataRow.ExRate_to_USD_NF__c = True;
                            dataRow.ExRate_to_EUR_NF__c = True;
                            isDataValid = false;
                            remarks += '\r\n ExRate to USD should not be more than ExRate to EUR\r\n';
                            //Added on 22-10-2020 for Error Code Mapping
                            errorCode += 'ERR-0019,';
                        }
                    }
                }
                else
                {
                    // system.debug('elsevalueOfUsd::::'+exRatetoUSD+'elsevalueOfEur::::'+exRatetoEUR);
                    dataRow.ExRate_to_USD_NF__c = True;
                    dataRow.ExRate_to_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n ExRate to USD should not be more than ExRate to EUR\r\n';
                    //Added on 22-10-2020 for Error Code Mapping
                    errorCode += 'ERR-0019,';
                }
            }
            // Calculating the Sales USD
            if(String.isNotBlank(dataRow.Sales_USD__c) && String.isNotBlank(dataRow.Sales_Transaction_Currency__c) && String.isNotBlank(dataRow.ExRate_to_USD__c)){                
                if(valueIsNumeric(dataRow.Sales_USD__c) && valueIsNumeric( dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.ExRate_to_USD__c)  )
                {
                    
                    decimal salestranscurrency = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                    decimal exrateusd = decimal.valueOf(dataRow.ExRate_to_USD__c.replaceAll(',',''));
                    decimal salesusddecimal = decimal.valueOf(dataRow.Sales_USD__c.replaceAll(',',''));
                    // system.debug('salestranscurrency::::'+salestranscurrency+'exrateusd::::'+exrateusd+'salesusddecimal::::'+salesusddecimal);
                    if(salestranscurrency != 0 && exrateusd != 0 && salesusddecimal != 0 ){
                        // string salesTransactionCurrency = dataRow.Sales_Transaction_Currency__c;
                        //  system.debug('salesTransactionCurrency:::'+salesTransactionCurrency);
                        //  string exRatetoUSD = dataRow.ExRate_to_USD__c;       
                        //   system.debug('exRatetoUSD:::'+exRatetoUSD);
                        decimal slUsd = (salestranscurrency / exrateusd).setScale(setScales);
                        // system.debug('slUsd:::'+slUsd);
                        //////////Start modify by alvin 13-08-2020
                        string salesUSD = dataRow.Sales_USD__c;
                        // system.debug('salesUSD:::'+salesUSD);
                        decimal resultslUsd = (salesusddecimal.setScale(setScales)/slUsd)-1;
                        // system.debug('resultslUsd:::'+resultslUsd);
                        //////////End modify by alvin 13-08-2020
                        dataRow.Sales_USD__c = string.valueOf(decimal.valueOf(salesUSD.replaceAll(',','')).setScale(setScales));
                        decimal usdSales = (decimal.valueOf(salesUSD.replaceAll(',','')).setScale(setScales));
                        System.debug('usdSales'+usdSales);
                        System.debug('salesUSDTolerance'+salesUSDTolerance);
                        if(usdSales <= salesUSDTolerance && usdSales >=-salesUSDTolerance)
                        {
                        } 
                        else
                        {
                            if(resultslUsd >= tolerance || resultslUsd <=-tolerance){
                                
                                dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                isDataValid = false;
                                // add by alvinWong
                                dataRow.Sales_USD_NF__c = True;
                                remarks += '\r\n Calculating the Sales USD\r\n';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0018,';
                                
                                
                                // End
                            }
                        }
                        
                    }
                }
                else
                {
                    dataRow.Calculation_Failed__c = True; 
                    isDataValid = false;  
                    remarks += '\r\n Invalid Data Either in Sales USD,Sales Transaction Currency,ExRate to USD\r\n';
                    errorCode += 'ERR-0062,';
                }
            }
            // Calculating the Sales EUR
            if(String.isNotBlank(dataRow.Sales_Transaction_Currency__c) && String.isNotBlank(dataRow.ExRate_to_EUR__c)){
                if(String.isNotBlank(dataRow.Sales_EUR__c)){
                    if(valueIsNumeric(dataRow.Sales_EUR__c) && valueIsNumeric( dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.ExRate_to_EUR__c)  )
                    {
                        decimal salestranscurrency = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                        decimal exrateeur = decimal.valueOf(dataRow.ExRate_to_EUR__c.replaceAll(',',''));
                        decimal saleseurdecimal = decimal.valueOf(dataRow.Sales_EUR__c.replaceAll(',',''));
                        //system.debug('salestranscurrency::::'+salestranscurrency+'exrateeur::::'+exrateeur+'saleseurdecimal::::'+saleseurdecimal);
                        if(salestranscurrency != 0 && exrateeur != 0  && saleseurdecimal != 0){
                            // string salesTransactionCurrency = dataRow.Sales_Transaction_Currency__c;
                            // string exRatetoEUR = dataRow.ExRate_to_EUR__c;
                            decimal slEur = ( salestranscurrency / exrateeur ).setScale(setScales);
                            //////////Start modify by alvin 13-08-2020
                            string salesEUR = dataRow.Sales_EUR__c;
                            decimal resultslEur = (saleseurdecimal.setScale(setScales)/slEur)-1;
                            //////////End modify by alvin 13-08-2020
                            dataRow.Sales_EUR__c = string.valueOf(decimal.valueOf(salesEUR.replaceAll(',','')).setScale(setScales));
                            decimal eurSales = (decimal.valueOf(salesEUR.replaceAll(',','')).setScale(setScales));
                            if(eurSales <= salesEURTolerance && eurSales >=-salesEURTolerance)
                            {
                            } 
                            else
                            {
                                if(resultslEur >= tolerance || resultslEur <=-tolerance){                                
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    isDataValid = false;
                                    // add by alvinWong
                                    dataRow.Sales_EUR_NF__c = True;
                                    // End
                                    remarks += '\r\n Calculating the Sales EUR\r\n';
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0017,';
                                    
                                }
                            }
                        }
                    }
                    else
                    {
                        dataRow.Calculation_Failed__c = True; 
                        isDataValid = false;
                        remarks += '\r\n Invalid Data Either in Sales EUR,Sales Transaction Currency,ExRate to EUR \r\n';
                        errorCode += 'ERR-0062,';
                    }
                }
            }
            // Calculating the Unit Price /100 USD
            if(String.isNotBlank(dataRow.Sales_USD__c) && String.isNotBlank(dataRow.Unit_Sold__c)){
                if(String.isNotBlank(dataRow.Unit_Price_100_USD__c)){
                    System.debug('dataRow.Unit_Price_100_USD__c'+dataRow.Unit_Price_100_USD__c);

                    if(valueIsNumeric(dataRow.Unit_Price_100_USD__c) && valueIsNumeric( dataRow.Sales_USD__c) && valueIsNumeric( dataRow.Unit_Sold__c)  )
                    {
                        decimal unitpriceusd = decimal.valueOf(dataRow.Unit_Price_100_USD__c.replaceAll(',',''));
                        decimal unitsold = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                        decimal salesusddecimal = decimal.valueOf(dataRow.Sales_USD__c.replaceAll(',',''));
                       // system.debug('unitpriceusd::::'+unitpriceusd+'unitsold::::'+unitsold+'salesusddecimal::::'+salesusddecimal);
                        if(salesusddecimal != 0 && unitsold != 0  && unitpriceusd != 0){
                            // string salesUSD = dataRow.Sales_USD__c;
                            // string unitSold = dataRow.Unit_Sold__c;
                            decimal upUsd = (( salesusddecimal / unitsold )*100).setScale(setScales);
                           // system.debug('upUsd::::'+upUsd);
                            //////////Start modify by alvin 13-08-2020
                            string unitPrice100USD = dataRow.Unit_Price_100_USD__c;
                            decimal resultupUsd = (unitpriceusd.setScale(setScales)/upUsd)-1;
                           // system.debug('resultupUsd::::'+resultupUsd);
                           // system.debug('tolerance::::'+tolerance);
                            //////////End modify by alvin 13-08-2020
                            dataRow.Unit_Price_100_USD__c = string.valueOf(decimal.valueOf(unitPrice100USD.replaceAll(',','')).setScale(setScales));                            
                            decimal usd100unitPrice =(decimal.valueOf(unitPrice100USD.replaceAll(',','')).setScale(setScales));
                            System.debug('usd100unitPrice'+usd100unitPrice);
                            if(usd100unitPrice <= UnitPrice100USDTolerance && usd100unitPrice >=-UnitPrice100USDTolerance)
                            {
                            } 
                            else
                            {
                                if(resultupUsd >= tolerance || resultupUsd <=-tolerance )
                                {
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    isDataValid = false;
                                    // add by alvinWong
                                    dataRow.Unit_Price_100_USD_NF__c = True;
                                    // End
                                    remarks += '\r\n Calculating the Unit Price /100 USD\r\n';
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0016,';
                                    
                                }
                            }
                        }
                    }
                    else
                    {
                        dataRow.Calculation_Failed__c = True;
                        isDataValid = false;
                        dataRow.Unit_Price_100_USD_NF__c = True;
                        remarks += '\r\n Invalid Data Either in Unit Price 100 USD,Sales USD,Unit Sold\r\n';
                        errorCode += 'ERR-0062,';
                    }
                }
            }
            //ADDED BY SUSHIL 16-09-22
            //UAT setup tolerance for Gross unit price and Net unit price/100 USD 
            // Calculating the Gross Unit Price /100 USD
            if(String.isNotBlank(dataRow.Unit_Price_100_USD__c) && String.isNotBlank(dataRow.Unit_Sold__c)){
                if(String.isNotBlank(dataRow.Net_Unit_Price_100__c)){
                    if(valueIsNumeric(dataRow.Unit_Price_100_USD__c) && valueIsNumeric( dataRow.Net_Unit_Price_100__c) && valueIsNumeric( dataRow.Unit_Sold__c)  )
                    {
                        decimal unitpriceusd = decimal.valueOf(dataRow.Unit_Price_100_USD__c.replaceAll(',',''));
                        decimal unitsold = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                        decimal netusddecimal = decimal.valueOf(dataRow.Net_Unit_Price_100__c.replaceAll(',',''));
                         //system.debug('unitpriceusd::::'+unitpriceusd+'unitsold::::'+unitsold+'salesusddecimal::::'+netusddecimal);
                        if(netusddecimal != 0 && unitsold != 0  && unitpriceusd != 0){
                            // string salesUSD = dataRow.Sales_USD__c;
                            // string unitSold = dataRow.Unit_Sold__c;
                            //// start modify by tony c 22-09-2022
                            ////decimal upUsd = (( unitpriceusd / unitsold )*100).setScale(setScales);
                            //////////Start modify by alvin 13-08-2020
                            string unitPrice100USD = dataRow.Unit_Price_100_USD__c;
                            ////decimal resultupUsd = (netusddecimal.setScale(setScales)/upUsd)-1; 
                            decimal resultupUsd = (netusddecimal.setScale(setScales)/unitpriceusd)-1; 
                            //////////End modify by alvin 13-08-2020
                            dataRow.Unit_Price_100_USD__c = string.valueOf(decimal.valueOf(unitPrice100USD.replaceAll(',','')).setScale(setScales));                            
                            decimal usd100unitPrice =(decimal.valueOf(unitPrice100USD.replaceAll(',','')).setScale(setScales));
                            System.debug('usd100unitPrice'+usd100unitPrice);
                            System.debug('UnitPrice100USDTolerance'+UnitPrice100USDTolerance);
                            if(usd100unitPrice <= UnitPrice100USDTolerance && usd100unitPrice >=-UnitPrice100USDTolerance)
                            {
                            } 
                            else
                            {
                                if(resultupUsd >= costToTolerance || resultupUsd <=-costToTolerance )
                                {
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    isDataValid = false;
                                    // add by alvinWong
                                    dataRow.Net_Unit_Price_100_NF__c = True;
                                    // End
                                    ////remarks += '\r\n Calculating the Net Unit Price /100 USD\r\n';
                                    remarks += '\r\nNet Unit Price /100 USD out of tolerance\r\n';
                                    //// End tony c 22-09-2022
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0116,';
                                    
                                }
                            }
                        }
                    }
                    else
                    {
                        dataRow.Calculation_Failed__c = True;
                        isDataValid = false;
                        dataRow.Net_Unit_Price_100_NF__c = True;
                        remarks += '\r\n Invalid Data Either in Unit Price 100 USD,Net Unit Price USD,Unit Sold\r\n';
                        errorCode += 'ERR-0118,';
                    }
                }
            }
            //SUSHIL ENDS
            // Calculating the Unit Price /100 EUR
            if(String.isNotBlank(dataRow.Sales_EUR__c) && String.isNotBlank(dataRow.Unit_Sold__c)){
                if(String.isNotBlank(dataRow.Unit_Price_100_EUR__c)){
                    //  System.debug('dataRow.Unit_Price_100_EUR__c ::'+dataRow.Unit_Price_100_EUR__c);
                    //  System.debug('dataRow.Sales_EUR__c ::'+dataRow.Sales_EUR__c);
                    // System.debug('dataRow.Unit_Sold__c ::'+dataRow.Unit_Sold__c);
                    if(valueIsNumeric(dataRow.Unit_Price_100_EUR__c) && valueIsNumeric( dataRow.Sales_EUR__c) && valueIsNumeric( dataRow.Unit_Sold__c)  )
                    {
                        decimal unitpriceeur = decimal.valueOf(dataRow.Unit_Price_100_EUR__c.replaceAll(',',''));
                        decimal unitsold = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                        decimal saleseurdecimal = decimal.valueOf(dataRow.Sales_EUR__c.replaceAll(',',''));
                        //system.debug('unitpriceeur::::'+unitpriceeur+'unitsold::::'+unitsold+'saleseurdecimal::::'+saleseurdecimal);
                        if(saleseurdecimal != 0 && unitsold != 0 && unitpriceeur != 0){
                            //  string salesEUR = dataRow.Sales_EUR__c;
                            // string unitSold = dataRow.Unit_Sold__c;
                            decimal upEur = ((saleseurdecimal / unitsold)*100).setScale(setScales);
                            //////////Start modify by alvin 13-08-2020
                            string unitPrice100EUR = dataRow.Unit_Price_100_EUR__c;
                            decimal resultupEur = (unitpriceeur.setScale(setScales)/upEur)-1;
                            dataRow.Unit_Price_100_EUR__c = string.valueOf(decimal.valueOf(unitPrice100EUR.replaceAll(',','')).setScale(setScales));
                            decimal eur100unitPrice =(decimal.valueOf(unitPrice100EUR.replaceAll(',','')).setScale(setScales));
                            if(eur100unitPrice <= UnitPrice100EURTolerance && eur100unitPrice >=-UnitPrice100EURTolerance)
                            {
                            } 
                            else
                            {
                                if(resultupEur >= tolerance || resultupEur <=-tolerance){                               
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    isDataValid = false;
                                    // add by alvinWong
                                    dataRow.Unit_Price_100_EUR_NF__c = True;
                                    // End
                                    remarks += '\r\n Calculating the Unit Price /100 EUR\r\n';
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0015,';
                                    
                                }
                            }
                        }
                    }
                    else
                    {
                        dataRow.Calculation_Failed__c = True;
                        isDataValid = false;
                        dataRow.Unit_Price_100_EUR_NF__c = True;
                        remarks += '\r\n Invalid Data Either in Unit Price 100 EUR,Sales EUR,Unit Sold\r\n';
                        errorCode += 'ERR-0062,';                        
                    }
                }
            }
            
            //ADDED BY SUSHIL 16-09-22
            //UAT setup tolerance for Gross unit price and Net unit price/100 EUR 
            if(String.isNotBlank(dataRow.Unit_Price_100_EUR__c) && String.isNotBlank(dataRow.Unit_Sold__c)){
                if(String.isNotBlank(dataRow.Net_Unit_Price_100_EUR__c)){
                     System.debug('dataRow.Unit_Price_100_EUR__c ::'+dataRow.Unit_Price_100_EUR__c);
                     System.debug('dataRow.Sales_EUR__c ::'+dataRow.Sales_EUR__c);
                     System.debug('dataRow.Unit_Sold__c ::'+dataRow.Unit_Sold__c);
                     System.debug('dataRow.Net_Unit_Price_100_EUR__c ::'+dataRow.Net_Unit_Price_100_EUR__c);
                    if(valueIsNumeric(dataRow.Unit_Price_100_EUR__c) && valueIsNumeric( dataRow.Net_Unit_Price_100_EUR__c) && valueIsNumeric( dataRow.Unit_Sold__c)  )
                    {
                        decimal unitpriceeur = decimal.valueOf(dataRow.Unit_Price_100_EUR__c.replaceAll(',',''));
                        decimal unitsold = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                        decimal neteurdecimal = decimal.valueOf(dataRow.Net_Unit_Price_100_EUR__c.replaceAll(',',''));
                        //system.debug('unitpriceeur::::'+unitpriceeur+'unitsold::::'+unitsold+'saleseurdecimal::::'+saleseurdecimal);
                        if(neteurdecimal != 0 && unitsold != 0 && unitpriceeur != 0){
                            //  string salesEUR = dataRow.Sales_EUR__c;
                            // string unitSold = dataRow.Unit_Sold__c;
                            
                            //// start modify by tony c 22-09-2022
                            ////decimal upEur = ((unitpriceeur / unitsold)*100).setScale(setScales);
                            
                            //////////Start modify by alvin 13-08-2020
                            string unitPrice100EUR = dataRow.Unit_Price_100_EUR__c;
                            ////decimal resultupEur = (neteurdecimal.setScale(setScales)/upEur)-1; 
                            decimal resultupEur = (neteurdecimal.setScale(setScales)/unitpriceeur)-1;
                            dataRow.Unit_Price_100_EUR__c = string.valueOf(decimal.valueOf(unitPrice100EUR.replaceAll(',','')).setScale(setScales));
                            decimal eur100unitPrice =(decimal.valueOf(unitPrice100EUR.replaceAll(',','')).setScale(setScales));
                            System.debug('eur100unitPrice ::'+eur100unitPrice);
                            System.debug('UnitPrice100EURTolerance ::'+UnitPrice100EURTolerance);
                            if(eur100unitPrice <= UnitPrice100EURTolerance && eur100unitPrice >=-UnitPrice100EURTolerance)
                            {
                            } 
                            else
                            {
                                if(resultupEur >= costToTolerance || resultupEur <=-costToTolerance){                               
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    isDataValid = false;
                                    // add by alvinWong
                                    dataRow.Net_Unit_Price_100_EUR_NF__c = True;
                                    // End
                                    ////remarks += '\r\n Calculating the Net Unit Price /100 EUR\r\n';
                                    remarks += '\r\n Net Unit Price /100 EUR out of tolerance\r\n';
                                    //// End tony c 22-09-2022
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0117,';
                                    
                                }
                            }
                        }
                    }
                    else
                    {
                        dataRow.Calculation_Failed__c = True;
                        isDataValid = false;
                        dataRow.Net_Unit_Price_100_EUR_NF__c = True;
                        remarks += '\r\n Invalid Data Either in Unit Price 100 EUR,Net Unit Price EUR,Unit Sold\r\n';
                        errorCode += 'ERR-0118,';                        
                    }
                }
            }
            //SUSHIL ENDS
            
            // Added by Bharath 09-06-2021 Starting
            if(String.isNotBlank(dataRow.Gross_Unit_Price_100_Local_Currency__c)){
               // system.debug('dataRow.Gross_Unit_Price_100_Local_Currency__c:::'+dataRow.Gross_Unit_Price_100_Local_Currency__c);
                String grossunitprice = dataRow.Gross_Unit_Price_100_Local_Currency__c.replaceAll(',','');
               // system.debug('grossunitprice:::'+grossunitprice);
               // system.debug('grossunitprice:::'+grossunitprice.length());
                if(grossunitprice.length() >= 19)
                {
                    dataRow.Gross_Unit_Price_100_Local_Currency_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Gross Unit Price/100 (Local Currency) should be total 18 digits and max 4 decimal point';
                    errorCode += 'ERR-0101,';
                    //system.debug('grossunitprice:::'+grossunitprice.length());
                }
                if(valueIsNumeric(grossunitprice)){
                    decimal decimalgrossunitprice100 = decimal.valueOf(grossunitprice);
                    if(decimalgrossunitprice100.scale()>4)
                    {
                        dataRow.Gross_Unit_Price_100_Local_Currency_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Gross Unit Price/100 (Local Currency) should be total 18 digits and max 4 decimal point';
                        errorCode += 'ERR-0101,';
                    }}
                else
                {
                    dataRow.Gross_Unit_Price_100_Local_Currency_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Gross Unit Price/100 (Local Currency) should be total 18 digits and max 4 decimal point';
                    errorCode += 'ERR-0101,';
                    //system.debug('else::::Gross Unit Price / 100');
                }
                
            } 
            // Added by Bharath 09-06-2021 Ending
            
            // Calculating the Gross Unit Price/100 (Local Currency)
            
            if(String.isNotBlank(dataRow.Unit_Sold__c) && String.isNotBlank(dataRow.Sales_Transaction_Currency__c) && String.isNotBlank(dataRow.Gross_Unit_Price_100_Local_Currency__c)){
                
                //System.debug('dataRow.Gross_Unit_Price_100_Local_Currency__c ::'+dataRow.Gross_Unit_Price_100_Local_Currency__c);
                //System.debug('dataRow.Sales_Transaction_Currency__c ::'+dataRow.Sales_Transaction_Currency__c);
                //System.debug('dataRow.Unit_Sold__c ::'+dataRow.Unit_Sold__c);
                if(valueIsNumeric(dataRow.Gross_Unit_Price_100_Local_Currency__c) && valueIsNumeric( dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.Unit_Sold__c)  )
                {
                    decimal grossunitprice = decimal.valueOf(dataRow.Gross_Unit_Price_100_Local_Currency__c.replaceAll(',',''));
                    decimal unitsold = decimal.valueOf(dataRow.Unit_Sold__c.replaceAll(',',''));
                    decimal salesTransCurrecydecimal = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                   // system.debug('grossunitprice::::'+grossunitprice+'unitsold::::'+unitsold+'salesTransCurrecydecimal::::'+salesTransCurrecydecimal);
                    if(salesTransCurrecydecimal != 0 && unitsold != 0 && grossunitprice != 0){
                        
                        decimal grossSalesper100 = ((salesTransCurrecydecimal / unitsold)*100).setScale(setScales);
                        //decimal resultGrossSalesLocal = (grossunitprice / grossSalesper100 )-1;
                        string grossPrice100EUR = dataRow.Gross_Unit_Price_100_Local_Currency__c;
                        string unitPrice100EUR = dataRow.Unit_Price_100_EUR__c;
                        decimal resultupEur = (grossunitprice.setScale(setScales)/grossSalesper100)-1;
                        dataRow.Gross_Unit_Price_100_Local_Currency__c = string.valueOf(decimal.valueOf(grossPrice100EUR.replaceAll(',','')).setScale(setScales));
                        // decimal eur100grossunitPrice =(decimal.valueOf(grossPrice100EUR.replaceAll(',','')).setScale(setScales));
                        decimal eur100grossunitPrice    =(decimal.valueOf(unitPrice100EUR.replaceAll(',','')).setScale(setScales));
                        System.debug('compyearweeMon'+compyearweeMon);
                        System.debug('UnitPrice100EURTolerance'+UnitPrice100EURTolerance);
                        System.debug('eur100grossunitPrice'+eur100grossunitPrice);
                        if(eur100grossunitPrice <= UnitPrice100EURTolerance && eur100grossunitPrice >=-UnitPrice100EURTolerance)
                        {
                        } 
                        else
                        {
                            if(resultupEur >= tolerance || resultupEur <=-tolerance){                               
                                dataRow.Calculation_Failed__c = True; 
                                isDataValid = false;
                                dataRow.Gross_Unit_Price_100_Local_Currency_NF__c = True;
                                remarks += '\r\n Gross Unit Price/100 (Local Currency)   is out of tolerance \r\n';
                                errorCode += 'ERR-0102,';
                                
                            }
                        }
                    }
                }
                else
                { 
                    dataRow.Calculation_Failed__c = True;
                    isDataValid = false;
                    dataRow.Gross_Unit_Price_100_Local_Currency_NF__c = True;
                    remarks += '\r\n Invalid Data Either in Unit Sold , Gross Sales Local Currency ,  Gross Unit Price/100 (Local Currency)  \r\n';
                    errorCode += 'ERR-0104,';                        
                }
                
            } 
            
            
            //[Sales USD]*[Exchange Rate_USD]=[Sales (Transaction Currency)]
            // Calculating the Sales Transaction Currency when Transaction Currency is USD
            //  System.debug(' dataRow.Sales_USD__c :: dataRow.ExRate_to_USD__c::'+dataRow.Sales_USD__c   + dataRow.ExRate_to_USD__c);
            if(String.isNotBlank(dataRow.Sales_USD__c) && String.isNotBlank(dataRow.ExRate_to_USD__c)){                
                if(String.isNotBlank(dataRow.Sales_Transaction_Currency__c)){
                    System.debug('Sales_Transaction_Currency__c'+dataRow.Sales_Transaction_Currency__c);
                    if(valueIsNumeric(dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.Sales_USD__c) && valueIsNumeric( dataRow.ExRate_to_USD__c)  )
                    {
                        decimal salestranscurrency = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                        decimal exrateusd = decimal.valueOf(dataRow.ExRate_to_USD__c.replaceAll(',',''));
                        decimal salesusddecimal = decimal.valueOf(dataRow.Sales_USD__c.replaceAll(',',''));
                        //system.debug('salestranscurrency::::'+salestranscurrency+'exrateusd::::'+exrateusd+'salesusddecimal::::'+salesusddecimal);
                        if((salestranscurrency != 0  && exrateusd != 0 && salesusddecimal != 0 && dataRow.Transaction_Currency__c == 'USD' ) ){
                            String salesUsd =   dataRow.Sales_USD__c;
                            String exRatetoUSD =   dataRow.ExRate_to_USD__c;
                            decimal slTransCurrency = ( salesusddecimal * exrateusd ).setScale(setScales); 
                            String salesTransactionCurrency =   dataRow.Sales_Transaction_Currency__c;
                            salesTransactionCurrency =   salesTransactionCurrency.replaceAll(',','');
                            decimal datarowSalesTransCurUSD = decimal.valueOf(salesTransactionCurrency);
                            // add by alvin
                            decimal resultUSDTran = (salestranscurrency.setScale(setScales)/slTransCurrency)-1;  
                            dataRow.Sales_Transaction_Currency__c = string.valueOf(datarowSalesTransCurUSD.setScale(setScales));
                            if(resultUSDTran >= tolerance || resultUSDTran <=-tolerance)                             
                            {
                                remarks += '\r\n SalesTrnsCurrncy = SalesUsd * ExcRateUsd (USD)\r\n ';
                                // add by alvinWong
                                dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                // End
                                isDataValid = false;
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0013,';
                            }
                        }
                    }
                    else
                    {
                        remarks += '\r\n Invalid Data Either in Sales Transaction Currency,Sales USD,ExRate to USD\r\n ';
                        errorCode += 'ERR-0062,';
                        dataRow.Calculation_Failed__c = True;
                        isDataValid = false;
                    }
                }
            }
            else
            {  
                if(String.isNotBlank(dataRow.Sales_EUR__c) && String.isNotBlank(dataRow.ExRate_to_EUR__C)){                
                    if(String.isNotBlank(dataRow.Sales_Transaction_Currency__c)){
                        if(valueIsNumeric(dataRow.Sales_Transaction_Currency__c) && valueIsNumeric( dataRow.Sales_EUR__c) && valueIsNumeric( dataRow.ExRate_to_EUR__C)  )
                        {
                            decimal salestranscurrency = decimal.valueOf(dataRow.Sales_Transaction_Currency__c.replaceAll(',',''));
                            decimal exrateeur = decimal.valueOf(dataRow.ExRate_to_EUR__C.replaceAll(',',''));
                            decimal saleseurdecimal = decimal.valueOf(dataRow.Sales_EUR__c.replaceAll(',',''));
                            //system.debug('salestranscurrency::::'+salestranscurrency+'exrateeur::::'+exrateeur+'saleseurdecimal::::'+saleseurdecimal);
                            if(salestranscurrency != 0 && exrateeur != 0 && saleseurdecimal != 0){
                                String salesEUR =   dataRow.Sales_EUR__c;
                                String exRatetoEUR =   dataRow.ExRate_to_EUR__c;
                                decimal slTransCurrency = (saleseurdecimal * exrateeur).setScale(setScales); 
                                
                                String salesTransactionCurrency =   dataRow.Sales_Transaction_Currency__c;
                                salesTransactionCurrency =   salesTransactionCurrency.replaceAll(',','');
                                decimal datarowSalesTransCur = decimal.valueOf(salesTransactionCurrency);
                                // add by alvin
                                decimal resultEURTran = (salestranscurrency.setScale(setScales)/slTransCurrency)-1;                             
                                dataRow.Sales_Transaction_Currency__c = string.valueOf(datarowSalesTransCur.setScale(setScales));
                                if(resultEURTran >= tolerance || resultEURTran <=-tolerance){
                                    remarks += '\r\n SalesTrnsCurrncy = SalesEur * ExcRateEur(EUR)\r\n';
                                    // add by alvinWong
                                    dataRow.Calculation_Failed__c = True; // Comm by alvinWong
                                    // End
                                    isDataValid = false;
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0014,';
                                }
                            }
                        }
                        else
                        {
                            remarks += '\r\n Invalid Data Either in Sales Transaction Currency,Sales EUR,ExRate to EUR\r\n';
                            errorCode += 'ERR-0062,';
                            dataRow.Calculation_Failed__c = True;
                            isDataValid = false;
                        }
                    }
                }
            } 
            
            if(String.isNotBlank(dataRow.Royalty_Rate__c)){
                String royaltyRate = dataRow.Royalty_Rate__c.replaceAll(',','');
                if(royaltyRate.length() >= 19)
                {
                    dataRow.Royalty_Rate_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Royalty Rate Should be total 18 digits and max 4 decimal point';
                    //Added on 17-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0070,';
                    //system.debug('royaltyRate.length():::'+royaltyRate.length());
                }
                if(valueIsNumeric(royaltyRate)){
                    decimal decimalroyaltyRate = decimal.valueOf(royaltyRate);
                    system.debug(decimalroyaltyRate);
                    system.debug(decimalroyaltyRate.scale());
                    if(decimalroyaltyRate.scale()>4)
                    {
                        dataRow.Royalty_Rate_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Royalty Rate Should be total 18 digits and max 4 decimal point';
                        //Added on 17-11-2020 for Error Code Mapping
                        errorCode += 'ERR-0070,';
                        //system.debug('decimalroyaltyRate.scale():::'+decimalroyaltyRate.scale());
                    }}
                ELSE
                {
                    dataRow.Royalty_Rate_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Royalty Rate Should be total 18 digits and max 4 decimal point';
                    //Added on 27-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0070,';
                    //system.debug('else::::Royalty Rate');
                }
                
            }
            
            if(String.isNotBlank(dataRow.Standard_Unit_Cost_100_EUR__c)){
                String standardunitcost100eur = dataRow.Standard_Unit_Cost_100_EUR__c.replaceAll(',','');
                // system.debug('standardunitcost100eur:::'+standardunitcost100eur);
                //system.debug('standardunitcost100eur:::'+standardunitcost100eur.length());
                if(standardunitcost100eur.length() >= 19)
                {
                    dataRow.Standard_Unit_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 19-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0071,';
                    // system.debug('standardunitcost100eur.length():::'+standardunitcost100eur.length());
                }
                if(valueIsNumeric(standardunitcost100eur)){
                    decimal decimalstandardunitcost100eur = decimal.valueOf(standardunitcost100eur);
                    if(decimalstandardunitcost100eur.scale()>4)
                    {
                        dataRow.Standard_Unit_Cost_100_EUR_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                        //Added on 19-11-2020 for Error Code Mapping
                        errorCode += 'ERR-0071,';
                        
                    }}
                else
                {
                    dataRow.Standard_Unit_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 27-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0071,'; 
                }
                
            }
            
            if(String.isNotBlank(dataRow.Standard_Unit_Cost_100_USD__c)){
                String standardunitcost100usd = dataRow.Standard_Unit_Cost_100_USD__c.replaceAll(',','');
                //system.debug('standardunitcost100usd:::'+standardunitcost100usd);
                //system.debug('standardunitcost100usd:::'+standardunitcost100usd.length());
                if(standardunitcost100usd.length() >= 19)
                {
                    dataRow.Standard_Unit_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 19-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0072,';
                    // system.debug('standardunitcost100usd:::'+standardunitcost100usd.length());
                }
                if(valueIsNumeric(standardunitcost100usd)){
                    decimal decimalstandardunitcost100usd = decimal.valueOf(standardunitcost100usd);
                    if(decimalstandardunitcost100usd.scale()>4)
                    {
                        dataRow.Standard_Unit_Cost_100_USD_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                        //Added on 19-11-2020 for Error Code Mapping
                        errorCode += 'ERR-0072,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 27-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0072,';
                    //system.debug('else::::Standard Unit Cost / 100(USD)');
                }
                
            }
            
            // Added by Sai 11-02-2021 Starting
            if(String.isNotBlank(dataRow.Local_Net_Unit_Pirce_100__c)){
                String localnetunitprice = dataRow.Local_Net_Unit_Pirce_100__c.replaceAll(',','');
                //system.debug('localnetunitprice:::'+localnetunitprice);
                //system.debug('localnetunitprice:::'+localnetunitprice.length());
                if(localnetunitprice.length() >= 13)
                {
                    dataRow.Local_Net_Unit_Pirce_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Local Net Unit Price / 100 Should be total 12 digits and max 4 decimal point';
                    //Added on 11-02-2021 for Error Code Mapping
                    errorCode += 'ERR-0091,';
                    // system.debug('localnetunitprice:::'+localnetunitprice.length());
                }
                if(valueIsNumeric(localnetunitprice)){
                    decimal decimallocalnetunitprice100 = decimal.valueOf(localnetunitprice);
                    if(decimallocalnetunitprice100.scale()>4)
                    {
                        dataRow.Local_Net_Unit_Pirce_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Local Net Unit Price / 100 Should be total 12 digits and max 4 decimal point';
                        //Added on 11-02-2021 for Error Code Mapping
                        errorCode += 'ERR-0091,';
                    }}
                else
                {
                    dataRow.Local_Net_Unit_Pirce_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Local Net Unit Price / 100 Should be total 12 digits and max 4 decimal point';
                    //Added on 11-02-2021 for Error Code Mapping
                    errorCode += 'ERR-0091,';
                    // system.debug('else::::Local Net Unit Price / 100');
                }
                
            }
            // Added by Sai 11-02-2021 Ending
            
            
            
            
            // Added by Sai 11-01-2021 Starting
            if(String.isNotBlank(dataRow.Standard_Unit_Industrial_Cost_100_EUR__c)){
                String standardunitindustrialcost100eur = dataRow.Standard_Unit_Industrial_Cost_100_EUR__c.replaceAll(',','');
                system.debug(standardunitindustrialcost100eur);
                if(standardunitindustrialcost100eur.length() >= 19)
                {
                    dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Industrial Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    // system.debug('remarks:::Inside If'+remarks);
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0083,';
                    
                }
                system.debug('standardunitindustrialcost100eur:::Inside If'+standardunitindustrialcost100eur);
                if(valueIsNumeric(standardunitindustrialcost100eur)){
                    decimal decimalstandardunitindustrialcost100eur = decimal.valueOf(standardunitindustrialcost100eur);
                    system.debug(decimalstandardunitindustrialcost100eur);
                    if(decimalstandardunitindustrialcost100eur.scale()>4)
                    {
                        dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Industrial Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0083,';
                        //system.debug('decimalstandardunitindustrialcost100eur:::Inside If'+decimalstandardunitindustrialcost100eur);
                    }}
                else
                {
                    dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Industrial Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0083,';
                    //system.debug('else::::Standard Unit Industrial Cost / 100(EUR)');
                }
                
            }
            
            if(String.isNotBlank(dataRow.Standard_Unit_Industrial_Cost_100_USD__c)){
                String standardunitindustrialcost100usd = dataRow.Standard_Unit_Industrial_Cost_100_USD__c.replaceAll(',','');
                if(standardunitindustrialcost100usd.length() >= 19)
                {
                    dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Industrial Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0084,';
                }
                if(valueIsNumeric(standardunitindustrialcost100usd)){
                    decimal decimalstandardunitindustrialcost100usd = decimal.valueOf(standardunitindustrialcost100usd);
                    if(decimalstandardunitindustrialcost100usd.scale()>4)
                    {
                        dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Industrial Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0084,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Industrial Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0084,';
                    //system.debug('else::::Standard Unit Industrial Cost / 100(USD)');
                }
                
            }
            
            if(String.isNotBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c)){
                String standardunitexworkcost100eur = dataRow.Standard_Unit_Ex_Work_Cost_100_EUR__c.replaceAll(',','');
                if(standardunitexworkcost100eur.length() >= 19)
                {
                    dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Ex-Work Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0085,';
                }
                // system.debug('standardunitexworkcost100eur :::'+standardunitexworkcost100eur);
                if(valueIsNumeric(standardunitexworkcost100eur)){
                    decimal decimalstandardunitexworkcost100eur = decimal.valueOf(standardunitexworkcost100eur);
                    if(decimalstandardunitexworkcost100eur.scale()>4)
                    {
                        dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Ex-Work Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0085,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Ex-Work Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0085,';
                    // system.debug('else::::Standard Unit Ex-Work Cost / 100(EUR)');
                }
                
            }
            
            if(String.isNotBlank(dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c)){
                String standardunitexworkcost100usd = dataRow.Standard_Unit_Ex_Work_Cost_100_USD__c.replaceAll(',','');
                if(standardunitexworkcost100usd.length() >= 19)
                {
                    dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Ex-Work Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                }
                //system.debug('standardunitexworkcost100usd :::'+standardunitexworkcost100usd);
                if(valueIsNumeric(standardunitexworkcost100usd)){
                    decimal decimalstandardunitexworkcost100usd = decimal.valueOf(standardunitexworkcost100usd);
                    if(decimalstandardunitexworkcost100usd.scale()>4)
                    {
                        dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Ex-Work Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0086,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Ex-Work Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                    // system.debug('else::::Standard Unit Ex-Work Cost / 100(USD)');
                }
                
            }
            // Added by  11-01-2021 Ending
            system.debug('dataRow.Standard_Unit_Material_Cost_100_EUR__c'+dataRow.Standard_Unit_Material_Cost_100_EUR__c);
             if(String.isNotBlank(dataRow.Standard_Unit_Material_Cost_100_EUR__c)){
                String standardunitmaterialcost100usd = dataRow.Standard_Unit_Material_Cost_100_EUR__c.replaceAll(',','');
                if(standardunitmaterialcost100usd.length() >= 19)
                {
                    dataRow.Standard_Unit_Material_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Material Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                }
                //system.debug('standardunitexworkcost100usd :::'+standardunitexworkcost100usd);
                if(valueIsNumeric(standardunitmaterialcost100usd)){
                    decimal decimalstandardunitmaterialcost100usd = decimal.valueOf(standardunitmaterialcost100usd);
                    if(decimalstandardunitmaterialcost100usd.scale()>4)
                    {
                        dataRow.Standard_Unit_Material_Cost_100_EUR_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Material Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0086,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Material_Cost_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Material Cost / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                    // system.debug('else::::Standard Unit Material Cost / 100(EUR)');
                }
                
            }
            system.debug('dataRow.Standard_Unit_Material_Cost_100_USD__c'+dataRow.Standard_Unit_Material_Cost_100_USD__c);
            if(String.isNotBlank(dataRow.Standard_Unit_Material_Cost_100_USD__c)){
                String standardunitmaterialcost100usd = dataRow.Standard_Unit_Material_Cost_100_USD__c.replaceAll(',','');
                if(standardunitmaterialcost100usd.length() >= 19)
                {
                    dataRow.Standard_Unit_Material_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Material Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                }
                //system.debug('standardunitexworkcost100usd :::'+standardunitexworkcost100usd);
                if(valueIsNumeric(standardunitmaterialcost100usd)){
                    decimal decimalstandardunitmaterialcost100usd = decimal.valueOf(standardunitmaterialcost100usd);
                    if(decimalstandardunitmaterialcost100usd.scale()>4)
                    {
                        dataRow.Standard_Unit_Material_Cost_100_USD_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Standard Unit Material Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                        //Added on 11-01-2021 for Error Code Mapping
                        errorCode += 'ERR-0086,';
                    }}
                else
                {
                    dataRow.Standard_Unit_Material_Cost_100_USD_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Standard Unit Material Cost / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 11-01-2021 for Error Code Mapping
                    errorCode += 'ERR-0086,';
                    // system.debug('else::::Standard Unit Material Cost / 100(USD)');
                }
                
            }
            
            if(String.isNotBlank(dataRow.Net_Unit_Price_100_EUR__c)){
                String netunitprice100eur = dataRow.Net_Unit_Price_100_EUR__c.replaceAll(',','');
                if(netunitprice100eur.length() >= 19)
                {
                    dataRow.Net_Unit_Price_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Unit Price / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 19-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0073,';
                }
                //system.debug('netunitprice100eur :::'+netunitprice100eur);
                if(valueIsNumeric(netunitprice100eur)){
                    decimal decimalnetunitprice100eur = decimal.valueOf(netunitprice100eur);
                    if(decimalnetunitprice100eur.scale()>4)
                    {
                        dataRow.Net_Unit_Price_100_EUR_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Net Unit Price / 100(EUR) Should be total 18 digits and max 4 decimal point';
                        //Added on 19-11-2020 for Error Code Mapping
                        errorCode += 'ERR-0073,';
                    }}
                else
                {
                    dataRow.Net_Unit_Price_100_EUR_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Unit Price / 100(EUR) Should be total 18 digits and max 4 decimal point';
                    //Added on 27-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0073,'; 
                }
                
            }
            
            if(String.isNotBlank(dataRow.Net_Unit_Price_100__c)){
                String netunitprice100usd = dataRow.Net_Unit_Price_100__c.replaceAll(',','');
                if(netunitprice100usd.length() >= 19)
                {
                    dataRow.Net_Unit_Price_100_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Unit Price / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 19-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0074,';
                }
                // system.debug('netunitprice100usd :::'+netunitprice100usd);
                if(valueIsNumeric(netunitprice100usd)){
                    decimal decimalnetunitprice100usd = decimal.valueOf(netunitprice100usd);
                    if(decimalnetunitprice100usd.scale()>4)
                    {
                        dataRow.Net_Unit_Price_100_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Net Unit Price / 100(USD) Should be total 18 digits and max 4 decimal point';
                        //Added on 19-11-2020 for Error Code Mapping
                        errorCode += 'ERR-0074,';
                    }}
                else
                {
                    dataRow.Net_Unit_Price_100_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Unit Price / 100(USD) Should be total 18 digits and max 4 decimal point';
                    //Added on 27-11-2020 for Error Code Mapping
                    errorCode += 'ERR-0074,';
                }
                
            }
            
            // Added by DHARSHAN 06-01-2022 Starting
            if(String.isNotBlank(dataRow.Net_Weight_KG_1000__c)){
                String netWeightKG100 = dataRow.Net_Weight_KG_1000__c.replaceAll(',','');
                if(netWeightKG100.length() >= 19)
                {
                    dataRow.Net_Weight_KG_1000_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Weight(KG) / 1000 " should be total 18 digits and max 4 decimal point and should be positive';
                    errorCode += 'ERR-0110,';
                }
                //  system.debug('netWeightKG100 :::'+netWeightKG100);
                
                if(valueIsNumeric(netWeightKG100)){
                    decimal decimalnetWeightKG100 = decimal.valueOf(netWeightKG100);
                    if(decimalnetWeightKG100.scale()>4)
                    {
                        dataRow.Net_Weight_KG_1000_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Net Weight(KG) / 1000 " should be total 18 digits and max 4 decimal point and should be positive';
                        errorCode += 'ERR-0110,';
                    }
                }
                else
                {
                    dataRow.Net_Weight_KG_1000_NF__c = True;
                    isDataValid = false;
                    remarks += '\r\n Net Weight(KG) / 1000 " should be total 18 digits and max 4 decimal point and should be positive';
                    errorCode += 'ERR-0110,';
                }
                
            }
            // Added by DHARSHAN 06-01-2022 Ending
            
            
            // Model validation.
            if(String.isNotBlank(dataRow.Model__c) && String.isNotBlank(dataRow.Vendor__c)){
                boolean modelMatch = true;
                string salesDataUploadChecked = getSalesDataUploadCheckMap.get(dataRow.Vendor__c.toLowerCase());
                if(!modelMatch){
                    dataRow.warning_consolidate_key__c = True;
                    isDataValid = false;  
                }
            }
            if(getRetailersLabelDivisionBrandCheckMap.containsKey(dataRow.Vendor__c)){
            Retailer_Code__c labelDivisionBrandCheck = getRetailersLabelDivisionBrandCheckMap.get(dataRow.Vendor__c);
            System.debug('labelDivisionBrandCheck '+labelDivisionBrandCheck);
            String getmainettiHGNomination = getRetailersLabelDivisionBrandCheckMap.get(dataRow.Vendor__c).HG_Nomination__c;
System.debug('getmainettiHGNomination '+getmainettiHGNomination);
             String getmainettiFPNomination = getRetailersLabelDivisionBrandCheckMap.get(dataRow.Vendor__c).FP_Nomination__c;
System.debug('getmainettiFPNomination '+getmainettiFPNomination);
         
            if(labelDivisionBrandCheck != null)
            {
                map<String,String> labelDivisionBrand =  getNewVendorDivisionBrandLabelMap.get(dataRow.Vendor__c);
                //system.debug('dataRow.Vendor__c :::'+dataRow.Vendor__c);
                // system.debug('labelDivisionBrand :::'+labelDivisionBrand);
                if(labelDivisionBrand != null)
                {
                    if(labelDivisionBrandCheck.Label_Check__c == True && labelDivisionBrandCheck.Division_check__c == True){
                        
                        string label = dataRow.Label__c;
                        string divsion = dataRow.Division__c;
                        string labelDivsionKey = label+'#'+divsion; 
                        if(String.isNotBlank(label) && String.isNotBlank(divsion)){
                            if(!labelDivisionBrand.containsKey(labelDivsionKey.toUpperCase())){
                                isDataValid = false;
                                //Add by Alvin Start
                                dataRow.Label_NF__c = True;
                                dataRow.Division_NF__c = True;
                                //End
                                remarks += '\r\n Combination of Label and Division not found';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0009,';
                            }  
                        }
                        
                        System.debug('dataRow'+dataRow);

                        if(dataRow != null){
                            if(String.isBlank(label) && !labelDivisionBrand.containsKey(divsion)){
                                isDataValid = false;
                                dataRow.Label_FB__c = True;
                                remarks += '\r\n Missing Label Value';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0012,';
                            }
                        }
                        
                        if(dataRow != null){
                            if(String.isBlank(divsion) && !labelDivisionBrand.containsKey(label)){
                                isDataValid = false;
                                dataRow.Division_FB__c = True;
                                remarks += '\r\n Missing Division Value';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0011,';
                            }
                        }
                    }
                    if(labelDivisionBrandCheck.Label_Check__c == True && labelDivisionBrandCheck.Retailer_Brand_Check__c== True){
                        
                        string label = dataRow.Label__c;
                        string retailerBrands = dataRow.Retailer_Brand__c;  
                        string labelBrandKey = label+'#'+retailerBrands;
                        if(String.isNotBlank(label) && String.isNotBlank(retailerBrands)){
                            if(!labelDivisionBrand.containsKey(labelBrandKey.toUpperCase())){
                                isDataValid = false;
                                //Add by Alvin Start
                                dataRow.Label_NF__c = True;
                                dataRow.Retailer_Brand_NF__c = True;
                                //End
                                remarks += '\r\n Combination of Label and Brand not found';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0008,';
                            }
                        }
                        
                        if(dataRow != null){
                            if(String.isBlank(label) && !labelDivisionBrand.containsKey(retailerBrands)){
                                isDataValid = false;
                                dataRow.Label_FB__c = True;
                                remarks += '\r\n Missing Label Value';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0012,';
                            }
                        }
                        
                        if(dataRow != null){
                            if(String.isBlank(retailerBrands) && !labelDivisionBrand.containsKey(label)){
                                isDataValid = false;
                                dataRow.Retailer_Brand_FB__c = True;
                                remarks += '\r\n Missing Retailer Brand Value';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0010,';
                                
                            }
                        }
                    }
                    if(labelDivisionBrandCheck.Division_check__c == True && labelDivisionBrandCheck.Retailer_Brand_Check__c== True){
                        
                        string division = dataRow.Division__c;
                        string retailerBrand = dataRow.Retailer_Brand__c;
                        if(String.isNotBlank(division) && String.isNotBlank(retailerBrand)){
                            string divsionBrandKey = division+'#'+retailerBrand; 
                            if(!labelDivisionBrand.containsKey(divsionBrandKey.toUpperCase())){
                                isDataValid = false;
                                //Add by Alvin Start
                                dataRow.Division_NF__c = True;
                                dataRow.Retailer_Brand_NF__c = True;
                                //End
                                remarks += '\r\n Combination of Division and Brand not found';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0007,';
                            }
                        }
                        
                        if(dataRow != null){
                            if(String.isBlank(division) && !labelDivisionBrand.containsKey(retailerBrand)){
                                isDataValid = false;
                                dataRow.Division_FB__c = True;
                                remarks += '\r\n Missing Division Value';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0011,';
                            }
                        }
                        
                        if(dataRow != null){
                            if(String.isBlank(retailerBrand) && !labelDivisionBrand.containsKey(division)){
                                isDataValid = false;
                                dataRow.Retailer_Brand_FB__c = True; 
                                remarks += '\r\n Missing Retailer Brand Value';
                                errorCode += 'ERR-0010,';
                            }
                        }
                        //  }
                    }
                    // Single Check Box Validation for Label
                    if(labelDivisionBrandCheck.Label_Check__c == True ){
                        string labelKey = dataRow.Label__c;
                        if(String.isNotBlank(labelKey)){
                            if(!labelDivisionBrand.containsKey(labelKey)){
                                isDataValid = false;
                                //Add by Alvin Start
                                dataRow.Label_NF__c = True;
                                ////End
                                remarks += '\r\n Label not found in Label Division';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0006,';
                            }
                        }
                        else
                        {
                            if(dataRow != null){
                                if(String.isBlank(labelKey)){
                                    dataRow.Label_FB__c = True;
                                    isDataValid = false;
                                    errorCode += 'ERR-0012,';
                                }
                            }
                        }
                    }
                    // Single Check Box Validation for Division
                    if(labelDivisionBrandCheck.Division_check__c == True ){
                        string divisionKey = dataRow.Division__c;
                        if(String.isNotBlank(divisionKey)){
                            if(!labelDivisionBrand.containsKey(divisionKey.toUpperCase())){
                                //  dataRow.warning_consolidate_key__c = True;
                                isDataValid = false;
                                //Add by Alvin Start                           
                                dataRow.Division_NF__c = True;
                                ////End
                                remarks += '\r\n Division not found in Label Division';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0005,';
                            }
                        }
                        else
                        {
                            if(dataRow != null){
                                if(String.isBlank(divisionKey)){
                                    dataRow.Division_FB__c = True;
                                    isDataValid = false; 
                                    errorCode += 'ERR-0011,';
                                }
                            }
                        }
                    }
                    // Single Check Box Validation for Brand
                    if(labelDivisionBrandCheck.Retailer_Brand_Check__c == True ){
                        string retailerBrandKey = dataRow.Retailer_Brand__c;
                        if(String.isNotBlank(retailerBrandKey)){
                            if(!labelDivisionBrand.containsKey(retailerBrandKey.toUpperCase())){
                                isDataValid = false;
                                //Add by Alvin Start                           
                                dataRow.Retailer_Brand_NF__c = True;
                                //End
                                remarks += '\r\n Retailer Brand not found in Label Division';
                                //Added on 22-10-2020 for Error Code Mapping
                                errorCode += 'ERR-0004,';
                            }
                        }
                        else
                        {
                            if(dataRow != null){
                                if(String.isBlank(retailerBrandKey)){
                                    dataRow.Retailer_Brand_FB__c = True;
                                    isDataValid = false;
                                    errorCode += 'ERR-0010,';
                                }
                            }
                        }
                    }
                }
            }
            }
            ///////////////////////////////////START OF MODEL VALIDATION/////////////////////////
            System.debug('dataRow.Vendor__c'+dataRow.Vendor__c);
            System.debug('dataRow.Category__c'+dataRow.Category__c);



            if(String.isNotBlank(dataRow.Vendor__c) && String.isNotBlank(dataRow.Category__c))
            {
                string compositeVendorCategory = dataRow.Vendor__c+'#'+dataRow.Category__c;
                //    system.debug('compositeVendorCategory :::'+compositeVendorCategory);
                //   system.debug('checkVendorCategory :::'+checkVendorCategory);
                // System.debug('checkVendorCategory:'+checkVendorCategory.get('CheckVendorCategory'));
                if(checkVendorCategory.containsKey(compositeVendorCategory.toLowerCase()))
                {
                    string model = dataRow.Model__c;
                    string vendorname = dataRow.Vendor__c;
                    //    system.debug('vendorname::::'+vendorname);
                    string salesDataUploadColorCheckMap = getSalesDataUploadColorCheckMap.get(dataRow.Vendor__c.toLowerCase());
                   // system.debug(salesDataUploadColorCheckMap);
                    /*     if(String.isNotBlank(salesDataUploadColorCheckMap)){
if(salesDataUploadColorCheckMap.equalsIgnoreCase('true')){               
string compositeKeyModelColor = dataRow.Model__c+'#'+dataRow.Color__c;
if(!getModelandColorMap.containsKey(compositeKeyModelColor.toLowerCase())){
dataRow.Color_NF__c = True;
isDataValid = false;
remarks += '\r\n Combination of Model and Color is not found in Price Specification Book Product';
//Added on 22-10-2020 for Error Code Mapping
errorCode += 'ERR-0001,';
}
}
}  */
                      system.debug('salesDataUploadColorCheckMap::::'+salesDataUploadColorCheckMap);
                    if(String.isNotBlank(salesDataUploadColorCheckMap)){
                        if(salesDataUploadColorCheckMap.equalsIgnoreCase('true')){
                            string vendor = dataRow.Vendor__c.toLowerCase();
                               system.debug('vendor:::'+vendor);
                               system.debug('getModelandColorMap:::'+getModelandColorMap);

                            if(String.isNotBlank(dataRow.Model__c) && String.isNotBlank(dataRow.Color__c))
                            {  
                                if(getModelandColorMap.containsKey(vendor)){
                                    List<string> vendorModelColorList= getModelandColorMap.get(vendor);
                                    //   system.debug('vendorModelColorList--Size:::'+vendorModelColorList.size());
                                    Set<String> vendorModelColorListSet = new Set<string>();
                                    //system.debug('vendorModelColorListSet--Size:::'+vendorModelColorListSet.size());
                                    boolean modelColorExits = false;
                                    string compositeKeyModelColor = dataRow.Model__c.toLowerCase()+'#'+dataRow.Color__c.toLowerCase();
                                    //   system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
                                    
                                    for(String vendorModelColor : vendorModelColorList){
                                        //  system.debug('vendorModelColor:::'+vendorModelColor);
                                        vendorModelColorListSet.add(vendorModelColor);
                                        
                                    }
                                    
                                    //  system.debug('vendorModelColorListSet:::'+vendorModelColorListSet);
                                    // system.debug('vendorModelColorListSet--Size:::'+vendorModelColorListSet.size());
                                    /* for(String vendorModelColorSetVal : vendorModelColorListSet){

system.debug('vendorModelColorSetVal:::'+vendorModelColorSetVal);
system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
if(!vendorModelColorSetVal.equals(compositeKeyModelColor) ){
system.debug('vendorModelColorSetVal:::'+vendorModelColorSetVal);
system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
modelColorExits = true;
}                        
}*/
                                    
                                    //   system.debug('vendorModelColorListSet:::'+vendorModelColorListSet);
                                    //  system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
                                    if(!vendorModelColorListSet.contains(compositeKeyModelColor)){
                                        //  system.debug('vendorModelColorListSet:::'+vendorModelColorListSet);
                                        //  system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
                                        dataRow.Color_NF__c = True;
                                        isDataValid = false;                                        
                                        remarks += '\r\n Combination of Model and Color is not found in Price Specification Book Product';
                                        //   system.debug('dataRow.Color_NF__c:::'+dataRow.Color_NF__c+'isDataValid::::'+isDataValid+'remarks::::'+remarks);
                                        //Added on 22-10-2020 for Error Code Mapping
                                        errorCode += 'ERR-0001,';
                                        //  system.debug('modelcolor');
                                    }
                                    
                                    
                                    /*  system.debug('modelColorExits:::'+modelColorExits);
If(modelColorExits == true){
dataRow.Color_NF__c = True;
isDataValid = false;                                        
remarks += '\r\n Combination of Model and Color is not found in Price Specification Book Product';
system.debug('dataRow.Color_NF__c:::'+dataRow.Color_NF__c+'isDataValid::::'+isDataValid+'remarks::::'+remarks);
//Added on 22-10-2020 for Error Code Mapping
errorCode += 'ERR-0001,';
system.debug('modelcolor');
}*/
                                } 
                            }
                        }
                    }  
                    
                    // Added by sai 18-05-2021 Starting
                    string pricebookprintCheckBoxMap = pricebookprintCheckMap.get(dataRow.Vendor__c.toLowerCase());
                       system.debug('pricebookprintCheckMap:::'+pricebookprintCheckMap);
                   system.debug('pricebookprintCheckBoxMap:::'+pricebookprintCheckBoxMap);
                   system.debug('dataRow.Vendor__c:::'+dataRow.Vendor__c);
                    if(String.isNotBlank(pricebookprintCheckBoxMap)){
                        string vendor = dataRow.Vendor__c.toLowerCase();
                        // system.debug(vendor);
                           // system.debug(dataRow.Model__c);
                        system.debug(dataRow.Printed_Logo__c);
                            system.debug(dataRow.Model__c);
                        if(String.isNotBlank(dataRow.Model__c) && String.isNotBlank(dataRow.Printed_Logo__c))
                        { 
                           system.debug(dataRow.Printed_Logo__c);
                            system.debug(dataRow.Model__c);
                            system.debug('pricebookprintCheckBoxMap'+pricebookprintCheckBoxMap);

                            if(pricebookprintCheckBoxMap.equalsIgnoreCase('true')){               
                                string compositeKeyModelPrinted = dataRow.Model__c.toLowerCase()+'#'+dataRow.Printed_Logo__c.toLowerCase();
                                //  system.debug('compositeKeyModelPrinted::::'+compositeKeyModelPrinted);
                                 // system.debug('checkVendorModelPrintedLogo::::'+checkVendorModelPrintedLogo);
                                if(checkVendorModelPrintedLogo.containsKey(vendor)){
                                    List<string> vendorModelPrintedLogoList = checkVendorModelPrintedLogo.get(vendor);
                                    //  system.debug('vendorModelPrintedLogoList--Size:::'+vendorModelPrintedLogoList.size());
                                    Set<String> vendorModelPrintedLogoListSet = new Set<string>();
                                    //system.debug('vendorModelPrintedLogoListSet--Size:::'+vendorModelPrintedLogoListSet.size());
                                    boolean modelPrintedLogoExits = false;
                                    //string compositeKeyModelColor = dataRow.Model__c+'#'+dataRow.Color__c;
                                    //system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
                                    for(String vendorModelPrintedLogo : vendorModelPrintedLogoList){
                                        // system.debug('vendorModelPrintedLogo:::'+vendorModelPrintedLogo);
                                        vendorModelPrintedLogoListSet.add(vendorModelPrintedLogo);
                                        
                                    }
                                    
                                    // system.debug('vendorModelPrintedLogoListSet:::'+vendorModelPrintedLogoListSet);
                                    //  system.debug('vendorModelPrintedLogoListSet--Size:::'+vendorModelPrintedLogoListSet.size());
                                    /*for(String vendorModelPrintedLogoSetVal : vendorModelPrintedLogoListSet){
if(vendorModelPrintedLogoSetVal != compositeKeyModelPrinted ){
system.debug('vendorModelPrintedLogoSetVal:::'+vendorModelPrintedLogoSetVal);
system.debug('compositeKeyModelPrinted:::'+compositeKeyModelPrinted);
modelPrintedLogoExits = true;
}                         
}*/
                                    //  system.debug('vendorModelPrintedLogoListSet:::'+vendorModelPrintedLogoListSet);
                                    // system.debug('compositeKeyModelPrinted:::'+compositeKeyModelPrinted);
                                    if(!vendorModelPrintedLogoListSet.contains(compositeKeyModelPrinted)){
                                        //  system.debug('vendorModelPrintedLogoListSet:::'+vendorModelPrintedLogoListSet);
                                        // system.debug('compositeKeyModelPrinted:::'+compositeKeyModelPrinted);
                                        dataRow.Printed_Logo_NF__c = True;
                                        isDataValid = false;                                        
                                        remarks += '\r\n Combination of Model and Pinted Logo is not found in Price Specification Book Product';
                                        //  system.debug('dataRow.Printed_Logo_NF__c:::'+dataRow.Printed_Logo_NF__c+'isDataValid::::'+isDataValid+'remarks::::'+remarks);
                                        //Added on 22-10-2020 for Error Code Mapping
                                        errorCode += 'ERR-0098,';
                                        //  system.debug('modelcolor');
                                    }
                                    
                                    /*  system.debug('modelPrintedLogoExits:::'+modelPrintedLogoExits);
If(modelPrintedLogoExits){
dataRow.Printed_Logo_NF__c = True;
isDataValid = false;                                        
remarks += '\r\n Combination of Model and Pinted Logo is not found in Price Specification Book Product';
system.debug('dataRow.Printed_Logo_NF__c:::'+dataRow.Printed_Logo_NF__c+'isDataValid::::'+isDataValid+'remarks::::'+remarks);
//Added on 22-10-2020 for Error Code Mapping
errorCode += 'ERR-0098,';
system.debug('modelcolor');
}*/
                                }
                            }
                        }
                    }                    
                    // Combination of Model,color,printedlogo Validation
                    system.debug('dataRow.Vendor__c:::'+dataRow.Vendor__c);
                    system.debug('pricebookprintModelColorCheckMap:::'+pricebookprintModelColorCheckMap);

                    string pricebookprintmodelcolorCheckBoxMap = pricebookprintModelColorCheckMap.get(dataRow.Vendor__c.toLowerCase());
                     system.debug('pricebookprintmodelcolorCheckBoxMap:::'+pricebookprintmodelcolorCheckBoxMap);
                    if(String.isNotBlank(pricebookprintmodelcolorCheckBoxMap)){
                        List<String> result = pricebookprintmodelcolorCheckBoxMap.split('#');                        
                        string modelCB = result[0];
                        string colorCB = result[1];
                        string sizeprintCB = result[2];
                        //  system.debug('modelCB:::'+modelCB+'colorCB::::'+colorCB+'sizeprintCB::::'+sizeprintCB);
                        if(modelCB.equalsIgnoreCase('true') && colorCB.equalsIgnoreCase('true') && sizeprintCB.equalsIgnoreCase('true')  ){               
                            //  system.debug('true');
                            if(String.isNotBlank(dataRow.Model__c) && String.isNotBlank(dataRow.Printed_Logo__c)  && String.isNotBlank(dataRow.Color__c))
                            { 
                                string compositeKeyModelColorPrinted = dataRow.Model__c.toLowerCase()+'#'+dataRow.Printed_Logo__c.toLowerCase()+'#'+dataRow.Color__c.toLowerCase();
                                //  system.debug('compositeKeyModelColorPrinted::::'+compositeKeyModelColorPrinted);
                                string vendor = dataRow.Vendor__c.toLowerCase();
                                if(checkVendorModelColorPrintedLogo.containsKey(vendor)){
                                    List<string> vendorModelColorPrintedLogoList = checkVendorModelColorPrintedLogo.get(vendor);
                                    //system.debug('vendorModelColorPrintedLogoList--Size:::'+vendorModelColorPrintedLogoList.size());
                                    Set<String> vendorModelColorPrintedLogoListSet = new Set<string>();
                                    //system.debug('vendorModelColorPrintedLogoListSet--Size:::'+vendorModelColorPrintedLogoListSet.size());
                                    boolean modelColorPrintedLogoExits = false;
                                    //string compositeKeyModelColor = dataRow.Model__c+'#'+dataRow.Color__c;
                                    //system.debug('compositeKeyModelColor:::'+compositeKeyModelColor);
                                    for(String vendorModelColorPrintedLogo : vendorModelColorPrintedLogoList){
                                        //system.debug('vendorModelColorPrintedLogo:::'+vendorModelColorPrintedLogo);
                                        vendorModelColorPrintedLogoListSet.add(vendorModelColorPrintedLogo);
                                        
                                    }
                                    
                                    // system.debug('vendorModelColorPrintedLogoListSet:::'+vendorModelColorPrintedLogoListSet);
                                    // system.debug('vendorModelColorPrintedLogoListSet--Size:::'+vendorModelColorPrintedLogoListSet.size());
                                    /* for(String vendorModelColorPrintedLogoSetVal : vendorModelColorPrintedLogoListSet){
if(vendorModelColorPrintedLogoSetVal != compositeKeyModelColorPrinted ){
system.debug('vendorModelColorPrintedLogoSetVal:::'+vendorModelColorPrintedLogoSetVal);
system.debug('compositeKeyModelColorPrinted:::'+compositeKeyModelColorPrinted);
modelColorPrintedLogoExits = true;
}                         
}*/
                                    
                                    //system.debug('vendorModelColorPrintedLogoListSet:::'+vendorModelColorPrintedLogoListSet);
                                    // system.debug('compositeKeyModelColorPrinted:::'+compositeKeyModelColorPrinted);
                                    if(!vendorModelColorPrintedLogoListSet.contains(compositeKeyModelColorPrinted)){
                                        //system.debug('vendorModelColorPrintedLogoListSet:::'+vendorModelColorPrintedLogoListSet);
                                        // system.debug('compositeKeyModelColorPrinted:::'+compositeKeyModelColorPrinted);
                                        dataRow.modelcolorPrintLogoCombination__c = true;
                                        isDataValid = false;
                                        remarks += '\r\n Combination of Model and Color and Printed Logo is not found in Price Specification Book Product';
                                        errorCode += 'ERR-0099,';
                                        //system.debug('modelcolor');
                                    }
                                    
                                    /* system.debug('modelColorPrintedLogoExits:::'+modelColorPrintedLogoExits);
If(modelColorPrintedLogoExits){
system.debug('compositeKeyModelColorPrinted::::1628'+compositeKeyModelColorPrinted);
dataRow.modelcolorPrintLogoCombination__c = true;
isDataValid = false;
remarks += '\r\n Combination of Model and Color and Printed Logo is not found in Price Specification Book Product';
errorCode += 'ERR-0099,';
system.debug('modelcolor');
}*/
                                }
                            }
                        }
                    } 
                    // Added by sai 18-05-2021 Ending
                    
                    string salesDataUploadChecked = getSalesDataUploadCheckMap.get(dataRow.Vendor__c.toLowerCase());
                    system.debug('salesDataUploadChecked:::'+salesDataUploadChecked);
                    if(String.isNotBlank(salesDataUploadChecked)){
                        if(salesDataUploadChecked.equalsIgnoreCase('true')){
                            if(String.isNotBlank(dataRow.Vendor__c) && String.isNotBlank(dataRow.Model__c)){
                                //Add by alvin 10-11-2020, auto populate if combination found
                                string currentcombination = dataRow.Category__c+'#'+dataRow.Sub_Category__c+'#'+dataRow.Family__c;
                                // checking the Model when the SalesDataUploadCheck Box Checked & Vendor
                                string vendor = dataRow.Vendor__c.toLowerCase();
                                System.debug('checkVendorModel'+checkVendorModel);
                                System.debug('vendor'+vendor);
                                if(checkVendorModel.containsKey(vendor)){
                                    List<string> vendorModelList= checkVendorModel.get(vendor);
                                    boolean modelExits = false;
                                    string ModelKey = dataRow.Model__c.toLowerCase();
                                    System.debug('vendorModel'+vendorModelList);
                                    System.debug('ModelKey'+ModelKey);

                                    for(String vendorModel : vendorModelList){
                                        if(vendorModel.equalsIgnoreCase(ModelKey)){
                                            modelExits = true;
                                            break;
                                        }
                                    }
                                    //Model Exits for the Vendor
                                    if(modelExits){
                                        //Auto population of Category/Sub-Category/Family                                         
                                        string valueReturned = modelwithCatSubCatFamily.get(dataRow.Model__c.toLowerCase());   
                                        System.debug('valueReturned'+valueReturned);                
                                        if(String.isNotBlank(valueReturned)){
                                            List<String> result = valueReturned.split('#');
                                            
                                            dataRow.Category__c = result[0];
                                            dataRow.ProductCategory__c = result[1];
                                            dataRow.Sub_Category__c = result[2];
                                            dataRow.Family__c = result[3];
                                        }                                    
                                    }else{
                                        //Model Does not exists for the Vendor
                                        dataRow.Model_NF__c = True;
                                        isDataValid = false;
                                        remarks += '\r\n Model is  not found in Price Specification Book Product1';
                                        errorCode += 'ERR-0002,';
                                        //Add by alvin 10-11-2020, auto populate if combination found
                                        
                                        if(getModelCatFamilyMap.containsKey(currentcombination.trim().toLowerCase())){
                                            List<String> fullcombination = getModelCatFamilyMap.get(currentcombination.trim().toLowerCase()).split('#');
                                            dataRow.Category__c =  fullcombination[0];
                                            dataRow.ProductCategory__c = fullcombination[1];
                                            dataRow.Sub_Category__c = fullcombination[2];
                                            dataRow.Family__c = fullcombination[3];
                                        }else{
                                            remarks += '\r\n Model is not found in Price Specification Book Product & Category combination is not in Allowance';   
                                            errorCode += 'ERR-0075,';
                                        }
                                        
                                        // Added by Sai 12-08-2020 Starting
                                        if(String.isBlank(dataRow.Category__c)){
                                            dataRow.Category_FB__c = true;
                                            isDataValid = false;
                                        }
                                        
                                        if(String.isBlank(dataRow.Sub_Category__c)){
                                            dataRow.Sub_Category_FB__c = true;
                                            isDataValid = false;
                                        } 
                                        
                                        if(String.isBlank(dataRow.Family__c)){
                                            dataRow.Family_FB__c = true;
                                            isDataValid = false;
                                        }
                                        // Added by Sai 12-08-2020 Ending
                                    }
                                }
                                else{
                                    //Add by Alvin 29-9-2020
                                    dataRow.Model_NF__c = True;
                                    isDataValid = false;
                                    remarks += '\r\n Model is not found in pricebook product with correct company';
                                    //Added on 22-10-2020 for Error Code Mapping
                                    errorCode += 'ERR-0068,';
                                    //Add by alvin 10-11-2020, auto populate if combination found
                                    if(getModelCatFamilyMap.containsKey(currentcombination.trim().toLowerCase())){
                                        List<String> fullcombination = getModelCatFamilyMap.get(currentcombination.trim().toLowerCase()).split('#');
                                        dataRow.Category__c =  fullcombination[0];
                                        dataRow.ProductCategory__c = fullcombination[1];
                                        dataRow.Sub_Category__c = fullcombination[2];
                                        dataRow.Family__c = fullcombination[3];
                                    }else{
                                        remarks += '\r\n Model is not found in Price Specification Book Product & Category combination is not in Allowance';   
                                        errorCode += 'ERR-0075,';
                                    }           
                                    
                                    if(String.isBlank(dataRow.Category__c)){
                                        dataRow.Category_FB__c = true;
                                        isDataValid = false;
                                    }
                                    
                                    if(String.isBlank(dataRow.Sub_Category__c)){
                                        dataRow.Sub_Category_FB__c = true;
                                        isDataValid = false;
                                    } 
                                    
                                    if(String.isBlank(dataRow.Family__c)){
                                        dataRow.Family_FB__c = true;
                                        isDataValid = false;
                                    }
                                    
                                }//End by Alvin 29-9-2020
                            }
                        }
                        
                        else
                        {
                            ///When the check is not checked we will validate the Model from the Product Object.
                            if(String.isNotBlank(dataRow.Category__c) && String.isNotBlank(dataRow.Model__c)){
                                string currentcombination = dataRow.Category__c+'#'+dataRow.Sub_Category__c+'#'+dataRow.Family__c;
                                string compositeModelCategory = dataRow.Model__c+'#'+dataRow.Category__c;
                                System.debug('currentcombination'+currentcombination);
                                System.debug('compositeModelCategory'+compositeModelCategory);


                                if(modelCategory.containsKey(compositeModelCategory.toLowerCase())){
                                    string valueReturned = modelCompKeyMap.get(dataRow.Model__c.trim().toLowerCase());
                                    if(String.isNotBlank(valueReturned)){
                                        
                                        List<String> result = valueReturned.split('#');
                                        
                                        dataRow.Category__c =  result[0];                                  
                                        dataRow.ProductCategory__c = result[1];
                                        dataRow.Sub_Category__c = result[2];
                                        dataRow.Family__c = result[3]; 
                                        
                                    }
                                }else{
                                    /*
dataRow.Model_NF__c = True;
isDataValid = false;
remarks += '\r\n Combination of Model & Category is  not found in Products Master2';
*/
                                    
                                    
                                    
                                    
                                    //  add by alvin 29-10-2020 start  
                                    System.debug('getModelCatFamilyMap'+getModelCatFamilyMap);                          
                                    if(!getModelCatFamilyMap.containsKey(currentcombination.trim().toLowerCase())){
                                        dataRow.Family_NF__c = True;
                                        dataRow.Category_NF__c = True;
                                        dataRow.Sub_Category_NF__c = True;
                                        isDataValid = false;
                                        System.debug('dataRow.Category__c'+dataRow.Category__c);

                                        if (dataRow.Category__c.equalsIgnoreCase('hangers & accessories')){
                                            remarks += '\r\n Hanger Model & Category is not found in Products Master';   
                                            errorCode += 'ERR-0003,';
                                        }else{
                                            remarks += '\r\n Non Hanger Combination of Category is not found in Products Master';   
                                            errorCode += 'ERR-0069,';
                                        }
                                    }
                                    else 
                                    {
                                        List<String> fullcombination = getModelCatFamilyMap.get(currentcombination.trim().toLowerCase()).split('#');
                                        dataRow.Category__c =  fullcombination[0];
                                        dataRow.ProductCategory__c = fullcombination[1];
                                        dataRow.Sub_Category__c = fullcombination[2];
                                        dataRow.Family__c = fullcombination[3];  
                                    } 
                                    // add by alvin 29-10-2020 end                                 
                                    
                                    // Added by Sai 12-08-2020 Starting
                                    if(String.isBlank(dataRow.Category__c)){
                                        dataRow.Category_FB__c = true;
                                        isDataValid = false;
                                    }                             
                                    if(String.isBlank(dataRow.Sub_Category__c)){
                                        dataRow.Sub_Category_FB__c = true;
                                        isDataValid = false;
                                    }            
                                    if(String.isBlank(dataRow.Family__c)){
                                        dataRow.Family_FB__c = true;
                                        isDataValid = false;
                                    }
                                    // Added by Sai 12-08-2020 Ending
                                }
                            }
                        }
                    }
                }
                else
                {
                    
                    ///When the check is not checked we will validate the Model from the Product Object.
                    if(String.isNotBlank(dataRow.Category__c) && String.isNotBlank(dataRow.Model__c)){
                        string compositeModelCategory = dataRow.Model__c+'#'+dataRow.Category__c;
                        //  add by alvin 23-7-2020 start
                        string currentcombination = dataRow.Category__c+'#'+dataRow.Sub_Category__c+'#'+dataRow.Family__c;
                        if(modelCategory.containsKey(compositeModelCategory.toLowerCase())){
                            string valueReturned = modelCompKeyMap.get(dataRow.Model__c.trim().toLowerCase());
                            if(String.isNotBlank(valueReturned)){
                                
                                List<String> result = valueReturned.split('#');                                
                                dataRow.Category__c =  result[0];
                                dataRow.ProductCategory__c = result[1];
                                dataRow.Sub_Category__c = result[2];
                                dataRow.Family__c = result[3]; 
                                
                            }
                        }else{
                            
                            //  relpace else code by alvin 23-7-2020 start                            
                            if(!getModelCatFamilyMap.containsKey(currentcombination.trim().toLowerCase())){
                                dataRow.Family_NF__c = True;
                                dataRow.Category_NF__c = True;
                                dataRow.Sub_Category_NF__c = True;
                                isDataValid = false;
                                if (dataRow.Category__c.equalsIgnoreCase('hangers & accessories')){
                                    remarks += '\r\n Hanger Model & Category is not found in Products Master';   
                                    errorCode += 'ERR-0003,';
                                }else{
                                    remarks += '\r\n Non Hanger Combination of Category is not found in Products Master';   
                                    errorCode += 'ERR-0069,';
                                }
                                
                            }
                            else // add by alvin 21-08-2020 start, auto populate if match combination
                            {
                                List<String> fullcombination = getModelCatFamilyMap.get(currentcombination.trim().toLowerCase()).split('#');
                                dataRow.Category__c =  fullcombination[0];
                                dataRow.ProductCategory__c = fullcombination[1];
                                dataRow.Sub_Category__c = fullcombination[2];
                                dataRow.Family__c = fullcombination[3];  
                            } // add by alvin 21-08-2020 end, auto populate if match combination
                            // add by alvin 23-7-2020 end 
                            
                            // added by sai 12-08-2020 Starting
                            System.debug('dataRow.Category__c'+dataRow.Category__c);
                            if(String.isBlank(dataRow.Category__c)){
                                dataRow.Category_FB__c = true;
                                isDataValid = false;
                            }            
                            
                            if(String.isBlank(dataRow.Sub_Category__c)){
                                dataRow.Sub_Category_FB__c = true;
                                isDataValid = false;
                            }            
                            
                            if(String.isBlank(dataRow.Family__c)){
                                dataRow.Family_FB__c = true;
                                isDataValid = false;
                            }            
                            // added by sai 12-08-2020 Ending
                        }
                    }
                }
                
            } 
            else
            {
                // added by sai 12-08-2020 Starting 
                if(String.isBlank(dataRow.Category__c)){
                    dataRow.Category_FB__c = true;
                    isDataValid = false;
                }            
                
                if(String.isBlank(dataRow.Sub_Category__c)){
                    dataRow.Sub_Category_FB__c = true;
                    isDataValid = false;
                }            
                
                if(String.isBlank(dataRow.Family__c)){
                    dataRow.Family_FB__c = true;
                    isDataValid = false;
                }            
                // added by sai 12-08-2020 Ending
            }
            
            // added by sai 12-07-2021 Starting
            if(String.isNotBlank(dataRow.Category__c)){
                System.debug('mcareMainettiBrandCheckBox'+mcareMainettiBrandCheckBox);
                System.debug('dataRow.Category__c'+dataRow.Category__c);
                if(mcareMainettiBrandCheckBox.equalsIgnoreCase('true') && dataRow.Category__c.equalsIgnoreCase('mcare'))
                {
                    if(String.isNotBlank(dataRow.Mainetti_Brand__c))
                    {
                        if(!mcaremainettibrandPicklist.containsKey(dataRow.Mainetti_Brand__c.toUppercase())){
                            dataRow.Mainetti_Brand_NF__c = True;
                            isDataValid = false;
                            errorCode += 'ERR-0105,';
                        }
                    }
                    
                }
                
                if(mcareMaterialCheckBox.equalsIgnoreCase('true') && dataRow.Category__c.equalsIgnoreCase('mcare'))
                {
                    if(String.isNotBlank(dataRow.Material__c))
                    {
                        if(!mcarematerialPicklist.containsKey(dataRow.Material__c.toUppercase())){
                            dataRow.Material_NF__c = True;
                            isDataValid = false;
                            errorCode += 'ERR-0106,';
                        }
                    }
                    
                }
            }
            // added by sai 12-07-2021 Ending
            
            ////////// When Label = "PL" OR Label = "NL" /////// Starting ///
            if(String.isNotBlank(dataRow.Label__c))
            {
                System.debug('dataRow.Label__c><>'+dataRow.Label__c);
                if(!dataRow.Label__c.equalsIgnoreCase('pl')){
                    if(!dataRow.Label__c.equalsIgnoreCase('nl')){
                        dataRow.Label_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Label should be either PL or NL';
                        //Added on 22-10-2020 for Error Code Mapping
                        errorCode += 'ERR-0026,';
                    }
                }   
            } 
            ////////// When Label = "PL" OR Label = "NL" /////// Ending /// 
            
            // validating source.
            if(String.isNotBlank(dataRow.Source__c) && String.isNotBlank(dataRow.Category__c)){
                System.debug('dataRow.Category__c'+dataRow.Category__c);
                if(dataRow.Category__c.equalsIgnoreCase('hangers & accessories')){
                    if(!dataRow.Source__c.equalsIgnoreCase('virgin')){
                        if(!dataRow.Source__c.equalsIgnoreCase('reused')){
                            dataRow.Source_NF__c = True;
                            isDataValid = false;
                            remarks += '\r\n Source should be either Virgin or reused';
                            //Added on 22-10-2020 for Error Code Mapping
                            errorCode += 'ERR-0027,';
                        }
                    }                    
                }else{
                    if(!dataRow.Source__c.equalsIgnoreCase('virgin')){
                        dataRow.Source_NF__c = True;
                        isDataValid = false;
                        remarks += '\r\n Source must be Virgin';
                        //Added on 19-02-2021 for Error Code Mapping
                        errorCode += 'ERR-0092,';
                    }
                }
            }
            
            Boolean isOrderDateChecked;
            if(String.isNotBlank(dataRow.Vendor__c) && String.isNotBlank(dataRow.Sales_Order_Date__c))
            {
                // System.debug('dataRow.Vendor__c :::'+dataRow.Vendor__c);
                //System.debug('dataRow.Sales_Order_Date__c :::'+dataRow.Sales_Order_Date__c);
                // string salesOrderDateChecked = getSalesOderDateCheckMap.get(dataRow.Vendor__c.toLowerCase());
                //System.debug('salesOrderDateChecked :::'+salesOrderDateChecked);
                // if(String.isNotBlank(salesOrderDateChecked)){
                // if(salesOrderDateChecked.equalsIgnoreCase('true')){
                String orderdate = dataRow.Sales_Order_Date__c.toUppercase();
                //  String dateRegEx = '(0?[1-9]\\-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)\\-((19|20)\\d\\d)|(\\d\\d))';
                // String dateRegEx = '(0?[1-9]|1[012])-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-((19|20)\\d\\d|\\d{2})';
                String dateRegEx = '(([0-9])|([0-2][0-9])|([3][0-1]))-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-((19|20)\\d\\d|\\d{2})'; 
                Pattern myPattern = Pattern.compile(dateRegEx);
                Matcher myMatcher = myPattern.matcher(orderdate);
                
                if(!myMatcher.matches())
                {
                    //  SYSTEM.debug('NOT IN  FORMAT');
                    // checkbox = true; 
                    dataRow.Sales_Order_Date_NF__c = true;
                    isOrderDateChecked = true;
                    //  remarks += '\r\n remark missing order date';
                    //  errorCode += 'ERR-0094,';
                }
                ELSE
                {
                    // SYSTEM.debug('myMatcher'+myMatcher);
                }
                myMatcher =null;
                
                
                // }
                //  }
            }
            
            if(isOrderDateChecked == true)
            {
                //SYSTEM.debug('NOT IN  FORMAT Error Code and RemarKs');
                dataRow.Error_Code__c = 'ERR-0094,';
                dataRow.Remarks__c = 'remark missing order date';
                dataRow.Sales_Order_Date_NF__c = true;
                isDataValid = false;
            }
            
            Boolean isDeliveryDateChecked;
            if(String.isNotBlank(dataRow.Vendor__c) && String.isNotBlank(dataRow.Sales_Delivery_Date__c))
            {
                
                // string salesOrderDateChecked = getSalesDeliveryDateCheckMap.get(dataRow.Vendor__c.toLowerCase());
                // if(String.isNotBlank(salesOrderDateChecked)){
                //  if(salesOrderDateChecked.equalsIgnoreCase('true')){
                String abc = dataRow.Sales_Delivery_Date__c.toUppercase();
                //   String dateRegEx = '(0?[1-9]\\-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)\\-((19|20)\\d\\d)|(\\d\\d))';
                //String dateRegEx = '(0?[1-9]|1[012])-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-((19|20)\\d\\d|\\d{2})';
                String dateRegEx = '(([0-9])|([0-2][0-9])|([3][0-1]))-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-((19|20)\\d\\d|\\d{2})'; 
                Pattern myPattern = Pattern.compile(dateRegEx);
                Matcher myMatcher = myPattern.matcher(abc);
                
                if(!myMatcher.matches())
                {
                    // SYSTEM.debug('NOT IN  FORMAT');
                    //  isDataValid = false; 
                    dataRow.Sales_Delivery_Date_NF__c = true;
                    isDeliveryDateChecked = true;
                    //  remarks += '\r\n remark missing order date';
                    //  errorCode += 'ERR-0095,';
                }
                ELSE
                {
                    // SYSTEM.debug('myMatcher'+myMatcher);
                }
                myMatcher =null;
                
                // }
                // }
            }
            if(isDeliveryDateChecked == true)
            {
                // SYSTEM.debug('NOT IN  FORMAT Error Code and RemarKs');
                dataRow.Error_Code__c = 'ERR-0095,';
                dataRow.Remarks__c = 'remark missing delivery date';
                dataRow.Sales_Delivery_Date_NF__c = true;
                isDataValid = false;
            } 
            
            
            Map <String, String> monthString = new Map <String, String> {'1'=>'jan', '2'=>'feb'
                , '3'=>'mar', '4'=>'apr', '5'=>'may', '6'=>'jun', '7'=>'jul', '8'=>'aug', '9'=>'sep'
                , '10'=>'oct', '11'=>'nov', '12'=>'dec'}; 
                    Map <String, Integer> monthNumber = new Map <String, Integer> {'jan'=>1, 'feb'=>2
                        , 'mar'=>3, 'apr'=>4, 'may'=>5, 'jun'=>6, 'jul'=>7, 'aug'=>8, 'sep'=>9
                        , 'oct'=>10, 'nov'=>11, 'dec'=>12};
                            String currentRowMonth = dataRow.Month__c;
            String currentSelectedMonth = monthString.get(String.valueOf(monthNumber.get(selMonth.toLowerCase())));            
            boolean isDateFormatValid = true;
            /*     if(String.isNotBlank(dataRow.Company__c) && String.isNotBlank(dataRow.Year__c) && String.isNotBlank(dataRow.Week__c) && String.isNotBlank(dataRow.Month__c)){
if(isDateFormatValid){
if(dataRow.Month__c == selMonth){
string dateCompanyValue =  dataRow.Year__c+'#'+dataRow.Week__c+'#'+dataRow.Month__c+'#'+dataRow.Company__c;                                                
if(companyOnlyMap.containsKey(dateCompanyValue.trim().toLowerCase())){
companyOnlyMap.remove(dateCompanyValue.trim().toLowerCase());                    
}
}else{
dataRow.wrong_date__c = True;
}
}
}     */      
            // reprocessing for admin snippet starts here
            if(dataRow.Model_FB__c != True && dataRow.Color_FB__c != True && dataRow.Category_FB__c != True 
               && dataRow.Market_FB__c != True && dataRow.Vendor_FB__c != True && dataRow.Company_FB__c != True 
               && dataRow.Material_FB__c != True && dataRow.Shipped_To_Factory_FB__c != True && dataRow.Shipped_To_Country_FB__c != True               
               && dataRow.Division_FB__c != True && dataRow.Item_code_FB__c != True && dataRow.Mainetti_Brand_FB__c != True 
               && dataRow.Order_Type_FB__c != True && dataRow.Customer_FB__c != True && dataRow.Transaction_Currency_FB__c != True
               && dataRow.ExRate_to_EUR_FB__C != True && dataRow.ExRate_to_USD_FB__C != True && dataRow.STC_FB__c != True
               && dataRow.Sales_USD_FB__c != True && dataRow.Sales_EUR_FB__c != True && dataRow.Unit_Price_100_USD_FB__c != True
               && dataRow.Unit_Price_100_EUR_FB__c != True && dataRow.Local_Net_Unit_Pirce_FB__c != True && dataRow.Net_Unit_Price_100_FB__c != True
               && dataRow.Month_FB__c != True && dataRow.Source_FB__c != True && dataRow.Unit_Sold_FB__c != True
               && dataRow.Week_FB__c != True && dataRow.Year_FB__c != True && dataRow.SO_Number_FB__c != True 
               && dataRow.LOB_FB__c != True && dataRow.Gross_Sales_USD_FB__c != True && dataRow.Freight_Charge_USD_FB__c != True
               && dataRow.Production_Country_FB__c != True && dataRow.Label_FB__c != True && dataRow.Retailer_Brand_FB__c != True               
               && dataRow.Color_NF__c != True && dataRow.Market_NF__c != True && dataRow.Order_Type_NF__c != True && dataRow.Production_Country_NF__c != True && dataRow.Transaction_Currency_NF__c != True
               && dataRow.Company_NF__c != True && dataRow.selected_ui_values__c != True && dataRow.SO_Number_NF__c != True
               && dataRow.LOB_NF__c != True &&  dataRow.ExRate_to_USD_NF__c != True
               && dataRow.ExRate_to_EUR_NF__c != True && dataRow.Calculation_Failed__c != True && dataRow.STC_NF__c != True 
               && dataRow.Retailer_Brand_NF__c != True && dataRow.warning_consolidate_key__c != True && dataRow.Source_NF__c != True
               && dataRow.Gross_Sales_USD_NF__c != True && dataRow.Freight_Charge_USD_NF__c != True && dataRow.Sales_Type_NF__c != True && dataRow.Local_Net_Unit_Pirce_NF__c != True
               && dataRow.wrong_date__c != True && dataRow.Vendor_FB__c != True && dataRow.Company_FB__c != True && dataRow.Standard_Unit_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Cost_100_EUR_NF__c != True  && dataRow.Standard_Unit_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Cost_100_USD_NF__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c != True && dataRow.Standard_Unit_Industrial_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c != True && dataRow.Standard_Unit_Industrial_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c != True              
               && dataRow.Net_Unit_Price_100_EUR_FB__c != True  && dataRow.Net_Unit_Price_100_EUR_NF__c != True  && dataRow.Net_Unit_Price_100_FB__c != True  && dataRow.Net_Unit_Price_100_NF__c != True && dataRow.Final_Sales_Destination_FB__c != True && dataRow.Final_Sales_Destination_FB__c != True && dataRow.Sales_Delivery_Date_NF__c != true && dataRow.Sales_Order_Date_NF__c != true && dataRow.Gross_Unit_Price_100_Local_Currency_NF__c != true && dataRow.Gross_Unit_Price_100_Local_Currency_NF__c != true && dataRow.Model_NF__c == True ){
                   if(errorCode.containsIgnoreCase('ERR-0075')){
                       
                   }else{
                       dataRow.Model_Check__c = True;
                       isDataValid = false;
                   }
               } 
            if(dataRow.Model_FB__c != True && dataRow.Color_FB__c != True && dataRow.Category_FB__c != True 
               && dataRow.Market_FB__c != True && dataRow.Vendor_FB__c != True && dataRow.Company_FB__c != True 
               && dataRow.Material_FB__c != True && dataRow.Shipped_To_Factory_FB__c != True && dataRow.Shipped_To_Country_FB__c != True               
               && dataRow.Division_FB__c != True && dataRow.Item_code_FB__c != True && dataRow.Mainetti_Brand_FB__c != True 
               && dataRow.Order_Type_FB__c != True && dataRow.Customer_FB__c != True && dataRow.Transaction_Currency_FB__c != True
               && dataRow.ExRate_to_EUR_FB__C != True && dataRow.ExRate_to_USD_FB__C != True  && dataRow.Unit_Price_100_USD_FB__c != True
               && dataRow.Unit_Price_100_EUR_FB__c != True && dataRow.Local_Net_Unit_Pirce_FB__c != True && dataRow.Net_Unit_Price_100_FB__c != True
               && dataRow.Month_FB__c != True && dataRow.Source_FB__c != True && dataRow.Unit_Sold_FB__c != True
               && dataRow.Week_FB__c != True && dataRow.Year_FB__c != True && dataRow.SO_Number_FB__c != True 
               && dataRow.LOB_FB__c != True && dataRow.Gross_Sales_USD_FB__c != True && dataRow.Freight_Charge_USD_FB__c != True
               && dataRow.Production_Country_FB__c != True && dataRow.Label_FB__c != True && dataRow.Retailer_Brand_FB__c != True               
               && dataRow.Color_NF__c != True && dataRow.Market_NF__c != True && dataRow.Order_Type_NF__c != True && dataRow.Production_Country_NF__c != True && dataRow.Transaction_Currency_NF__c != True
               && dataRow.Company_NF__c != True && dataRow.selected_ui_values__c != True && dataRow.SO_Number_NF__c != True
               && dataRow.LOB_NF__c != True &&  dataRow.ExRate_to_USD_NF__c != True
               && dataRow.ExRate_to_EUR_NF__c != True && dataRow.Calculation_Failed__c != True  
               && dataRow.Retailer_Brand_NF__c != True && dataRow.warning_consolidate_key__c != True && dataRow.Source_NF__c != True 
               && dataRow.Gross_Sales_USD_NF__c != True && dataRow.Freight_Charge_USD_NF__c != True && dataRow.Sales_Type_NF__c != True && dataRow.Local_Net_Unit_Pirce_NF__c != True
               && dataRow.wrong_date__c != True && dataRow.Vendor_FB__c != True && dataRow.Company_FB__c != True && dataRow.Standard_Unit_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Cost_100_EUR_NF__c != True  && dataRow.Standard_Unit_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Cost_100_USD_NF__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_NF__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Ex_Work_Cost_100_USD_NF__c != True && dataRow.Standard_Unit_Industrial_Cost_100_EUR_FB__c != True && dataRow.Standard_Unit_Industrial_Cost_100_EUR_NF__c != True && dataRow.Standard_Unit_Industrial_Cost_100_USD_FB__c != True && dataRow.Standard_Unit_Industrial_Cost_100_USD_NF__c != True              
               && dataRow.Net_Unit_Price_100_EUR_FB__c != True  && dataRow.Net_Unit_Price_100_EUR_NF__c != True  && dataRow.Net_Unit_Price_100_FB__c != True  && dataRow.Net_Unit_Price_100_NF__c != True && dataRow.Final_Sales_Destination_FB__c != True && dataRow.Final_Sales_Destination_NF__c != True && dataRow.Sales_Delivery_Date_NF__c != true && dataRow.Sales_Order_Date_NF__c != true && dataRow.Vendor_NF__c == True){
                   if(errorCode.containsIgnoreCase('ERR-0075')){
                       
                   }else{
                       dataRow.Retailer_Check__c = True;
                       isDataValid = false;
                   }
               }
            // reprocessing for admin snippet ends here
            
            if(!isDataValid){
                dataRow.Record_Status__c = '1 - Error In Data Validation';
                // system.debug('Record_Status__c:::001'+dataRow.Record_Status__c);
                dataRow.Remarks__c =  remarks;
                // system.debug('Remarks__c:::001'+dataRow.Remarks__c);
                if(dataRow.Malformed_Data__c == true)
                {
                    dataRow.Error_Code__c = 'ERR-0093,';
                    // errorcode1 += 'ERR-0093,';
                }
                else
                {
                    if(dataRow.Sales_Order_Date_NF__c == true)
                    {
                        //  dataRow.Error_Code__c = 'ERR-0094,';
                        errorcode1 += 'ERR-0094,';
                        // SYSTEM.debug('dataRow.Error_Code__c:::::SALES ORDER'+dataRow.Error_Code__c);
                    }
                    if(dataRow.Sales_Delivery_Date_NF__c == true)
                    {
                        //   dataRow.Error_Code__c = 'ERR-0095,';
                        errorcode1 += 'ERR-0095,';
                        // SYSTEM.debug('dataRow.Error_Code__c:::::SALES DELIVERY'+dataRow.Error_Code__c);
                    }
                    //Added on 22-10-2020 for Error Code Mapping
                    totalerrorcode = errorCode + errorcode1;
                    dataRow.Error_Code__c = totalerrorcode;
                }
                recordStatus.validateStatus= false;
            }else{
                if(dataRow.Record_Status__c.equals('1 - Error In Data Validation'))
                {
                    recordStatus.validateStatus= false;
                    // system.debug('Record_Status__c:::2180'+dataRow.Record_Status__c); 
                }
                else{
                    dataRow.Record_Status__c = '2 - Data Validation Successful';
                    // system.debug('Record_Status__c:::002'+dataRow.Record_Status__c); 
                    // dataRow.Region__c = getpartnerCompanyRegionMap.get(selcomp);
                    //  system.debug('Region__c:::2408'+dataRow.Region__c); 
                }
                
            }
            salesTransStagUpdate.add(dataRow);
            
        }
        return salesTransStagUpdate;
    }
    
    public  List<Sales_Transaction_Stage__c>  reconcileDataWithSalesErrorMapBulk(List<Sales_Transaction_Stage__c> salesTransStagRecForReconciliation,Map<string,Map<string,Map<string,string>>> fullSalesErrorMap){            
        boolean reconcileComplete = true;
        List<Sales_Transaction_Stage__c> reconcileDataRowForUpdate = new List<Sales_Transaction_Stage__c>();
        System.debug('salesTransStagRecForReconciliation'+salesTransStagRecForReconciliation);
        if(salesTransStagRecForReconciliation.size()>0){
            
            for (Sales_Transaction_Stage__c dataRow : salesTransStagRecForReconciliation) {
                
                //  system.debug('fullSalesErrorMap ::'+ fullSalesErrorMap);
                if(dataRow != null){
                    boolean dataReconciled = false;  
                    boolean isErrorInRecord = false;
                    boolean isRawMapAvailable = false;
                    boolean isErrorMapHistory = false;
                    Map<string,Map<string,string>> rawDataFieldMap;
                    Map<string,string> mapFromToValueMap;
                    String pickListValues='';  
                    String errorMapHistory='{ ';
                    if(String.isNotBlank(dataRow.Company__c)){
                        rawDataFieldMap = fullSalesErrorMap.get(dataRow.Company__c);
                        //system.debug('rawDataFieldMap ::'+ rawDataFieldMap);
                        if(rawDataFieldMap != null){
                            isRawMapAvailable = true;                                                        
                        }
                    }               
                    if(String.isNotBlank(dataRow.Year__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Year');
                            //  system.debug('mapFromToValueMap ::'+ mapFromToValueMap);
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Year__c;
                                //   system.debug('mapFromValue ::'+ mapFromValue);
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    // system.debug('mapToValue ::'+ mapToValue);
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Year__c = mapToValue;
                                        // system.debug('dataRow.Year__c ::'+ dataRow.Year__c);
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        //system.debug('dataReconciled::' + dataReconciled);
                                        errorMapHistory += '\r\n"Year":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                        // system.debug('errorMapHistory::' + errorMapHistory);
                                        
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Year';
                                        // system.debug('pickListValues:::Year::001'+pickListValues);
                                    }else{
                                        pickListValues = 'Year';
                                        // system.debug('pickListValues:::Year::002'+pickListValues);
                                    }                                    
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Year';
                                // system.debug('pickListValues:::Year::003'+pickListValues);
                            }else{
                                pickListValues = 'Year';
                                // system.debug('pickListValues:::Year::004'+pickListValues);
                            }           
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }                     
                    }            
                    if(String.isNotBlank(dataRow.Week__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Week');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Week__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Week__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Week":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Week';
                                        //system.debug('pickListValues:::Week::001'+pickListValues);
                                    }else{
                                        pickListValues = 'Week';
                                        // system.debug('pickListValues:::Week::002'+pickListValues);
                                    }                               
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Week';
                                // system.debug('pickListValues:::Week::003'+pickListValues);
                            }else{
                                pickListValues = 'Week';
                                //system.debug('pickListValues:::Week::004'+pickListValues);
                            }      
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }      
                    }
                    if(String.isNotBlank(dataRow.Month__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Month');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Month__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Month__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Month":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Month';
                                        // system.debug('pickListValues:::Month::001'+pickListValues);
                                    }else{
                                        pickListValues = 'Month';
                                        // system.debug('pickListValues:::Month::002'+pickListValues);
                                    }      
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Month';
                                // system.debug('pickListValues:::Month::003'+pickListValues);
                            }else{
                                pickListValues = 'Month';
                                // system.debug('pickListValues:::Year::004'+pickListValues);
                            }      
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }     
                    }   
                    if(String.isNotBlank(dataRow.Item_code__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('ItemCode');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Item_code__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Item_code__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"ItemCode":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'ItemCode';
                                        // system.debug('pickListValues:::ItemCode::001'+pickListValues);
                                    }else{
                                        pickListValues = 'ItemCode';
                                        // system.debug('pickListValues:::ItemCode::002'+pickListValues);
                                    }      
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'ItemCode';
                                // system.debug('pickListValues:::ItemCode::003'+pickListValues);
                            }else{
                                pickListValues = 'ItemCode';
                                // system.debug('pickListValues:::ItemCode::004'+pickListValues);
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }        
                    }
                    if(String.isNotBlank(dataRow.Material__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Material');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Material__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Material__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Material":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Material';
                                    }else{
                                        pickListValues = 'Material';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                               
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Material';
                            }else{
                                pickListValues = 'Material';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    if(String.isNotBlank(dataRow.Source__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Source');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Source__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Source__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Source":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Source';
                                    }else{
                                        pickListValues = 'Source';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                         
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Source';
                            }else{
                                pickListValues = 'Source';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }      
                    }
                    
                    if(String.isNotBlank(dataRow.Printed_Logo__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('PrintedLogo');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Printed_Logo__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Printed_Logo__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"PrintedLogo":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'PrintedLogo';
                                    }else{
                                        pickListValues = 'PrintedLogo';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                              
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'PrintedLogo';
                            }else{
                                pickListValues = 'PrintedLogo';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }       
                    }            
                    if(String.isNotBlank(dataRow.Color__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Color');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Color__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){                                    
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Color__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Color":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Color';
                                    }else{
                                        pickListValues = 'Color';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                              
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Color';
                            }else{
                                pickListValues = 'Color';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }           
                    }
                    if(String.isNotBlank(dataRow.Customer__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Customer');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Customer__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Customer__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Customer":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Customer';
                                    }else{
                                        pickListValues = 'Customer';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                          
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Customer';
                            }else{
                                pickListValues = 'Customer';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }      
                    }
                    if(String.isNotBlank(dataRow.Customer_local_name__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('LocalName');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Customer_local_name__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Customer_local_name__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"LocalName":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'LocalName';
                                    }else{
                                        pickListValues = 'LocalName';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'LocalName';
                            }else{
                                pickListValues = 'LocalName';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    if(String.isNotBlank(dataRow.Mainetti_Brand__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('MainettiBrand');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Mainetti_Brand__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Mainetti_Brand__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"MainettiBrand":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'MainettiBrand';
                                    }else{
                                        pickListValues = 'MainettiBrand';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'MainettiBrand';
                            }else{
                                pickListValues = 'MainettiBrand';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    // Added by Sai 10-07-2020
                    if(String.isNotBlank(dataRow.Model__c)){                        
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Model');
                            System.debug('mapFromToValueMap'+mapFromToValueMap);                      
                            if(mapFromToValueMap != null){                                
                                String mapFromValue = dataRow.Model__c;
                                System.debug('mapFromValue'+mapFromValue);
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){                                     
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());  
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Model__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Model":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                        // system.debug('errorMapHistory::' + errorMapHistory);
                                    }
                                }else{  
                                    
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Model';
                                    }else{
                                        pickListValues = 'Model';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                               
                            }
                        }else{                            
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Model';
                            }else{
                                pickListValues = 'Model';
                                
                            }
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    
                    if(String.isNotBlank(dataRow.Category__c)){                        
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Category');                      
                            if(mapFromToValueMap != null){                                
                                String mapFromValue = dataRow.Category__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){                                    
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase()); 
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Category__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Category":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{  
                                    
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Category';
                                    }else{
                                        pickListValues = 'Category';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                               
                            }
                        }else{                            
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Category';
                            }else{
                                pickListValues = 'Category';
                                
                            }
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    
                    if(String.isNotBlank(dataRow.Sub_Category__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('SubCategory');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Sub_Category__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Sub_Category__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"SubCategory":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'SubCategory';
                                    }else{
                                        pickListValues = 'SubCategory';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'SubCategory';
                            }else{
                                pickListValues = 'SubCategory';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    if(String.isNotBlank(dataRow.Family__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Family');
                            System.debug('mapFromToValueMap'+mapFromToValueMap);
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Family__c;
                                System.debug('mapFromValue'+mapFromValue);
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Family__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Family":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Family';
                                    }else{
                                        pickListValues = 'Family';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Family';
                            }else{
                                pickListValues = 'Family';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }              
                    if(String.isNotBlank(dataRow.Order_Type__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('OrderType');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Order_Type__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Order_Type__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"OrderType":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'OrderType';
                                    }else{
                                        pickListValues = 'OrderType';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'OrderType';
                            }else{
                                pickListValues = 'OrderType';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    if(String.isNotBlank(dataRow.Unit_Sold__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('UnitSold');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Unit_Sold__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Unit_Sold__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"UnitSold":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'UnitSold';
                                    }else{
                                        pickListValues = 'UnitSold';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'UnitSold';
                            }else{
                                pickListValues = 'UnitSold';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }         
                    }
                    if(String.isNotBlank(dataRow.Local_Currency__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('LocalCurrency');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Local_Currency__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Local_Currency__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"LocalCurrency":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'LocalCurrency';
                                    }else{
                                        pickListValues = 'LocalCurrency';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'LocalCurrency';
                            }else{
                                pickListValues = 'LocalCurrency';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }          
                    }
                    if(String.isNotBlank(dataRow.Shipped_To_Factory__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('ShippedToFactory');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Shipped_To_Factory__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Shipped_To_Factory__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"ShippedToFactory":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'ShippedToFactory';
                                    }else{
                                        pickListValues = 'ShippedToFactory';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'ShippedToFactory';
                            }else{
                                pickListValues = 'ShippedToFactory';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }          
                    }
                    if(String.isNotBlank(dataRow.Shipped_To_Country__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('ShippedToCountry');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Shipped_To_Country__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Shipped_To_Country__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"ShippedToCountry":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'ShippedToCountry';
                                    }else{
                                        pickListValues = 'ShippedToCountry';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'ShippedToCountry';
                            }else{
                                pickListValues = 'ShippedToCountry';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }             
                    }
                    if(String.isNotBlank(dataRow.Label__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Label');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Label__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Label__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Label":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Label';
                                    }else{
                                        pickListValues = 'Label';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Label';
                            }else{
                                pickListValues = 'Label';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }           
                    }
                    if(String.isNotBlank(dataRow.End_user__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('EndUser');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.End_user__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.End_user__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"EndUser":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'EndUser';
                                    }else{
                                        pickListValues = 'EndUser';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'EndUser';
                            }else{
                                pickListValues = 'EndUser';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }        
                    }
                    
                    if(String.isNotBlank(dataRow.Vendor__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Retailer');
                System.debug('mapFromToValueMap'+mapFromToValueMap);
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Vendor__c;
                System.debug('mapFromValue'+mapFromValue);

                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Vendor__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Retailer":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Retailer';
                                    }else{
                                        pickListValues = 'Retailer';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Retailer';
                            }else{
                                pickListValues = 'Retailer';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }       
                    }      
                    if(String.isNotBlank(dataRow.Division__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Division');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Division__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Division__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Division":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Division';
                                    }else{
                                        pickListValues = 'Division';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Division';
                            }else{
                                pickListValues = 'Division';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }       
                    }
                    // Added by Sai
                    system.debug('Transaction_Currency__c:::Inside If'+dataRow.Transaction_Currency__c);
                    if(String.isNotBlank(dataRow.Transaction_Currency__c)){
                        system.debug('isRawMapAvailable:::Inside If'+isRawMapAvailable);
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('TransactionCurrency');
                            // system.debug('mapFromToValueMap:::'+mapFromToValueMap);
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Transaction_Currency__c;
                                //  system.debug('mapFromValue:::'+mapFromValue);
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    //  system.debug('mapToValue:::'+mapToValue);
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Transaction_Currency__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"TransactionCurrency":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'TransactionCurrency';
                                    }else{
                                        pickListValues = 'TransactionCurrency';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'TransactionCurrency';
                            }else{
                                pickListValues = 'TransactionCurrency';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }   
                    }
                    if(String.isNotBlank(dataRow.Retailer_Brand__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('RetailerBrand');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Retailer_Brand__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Retailer_Brand__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"RetailerBrand":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'RetailerBrand';
                                    }else{
                                        pickListValues = 'RetailerBrand';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'RetailerBrand';
                            }else{
                                pickListValues = 'RetailerBrand';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }    
                    }
                    if(String.isNotBlank(dataRow.Royalty_Rate__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('RoyaltyRate');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Royalty_Rate__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Royalty_Rate__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"RoyaltyRate":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'RoyaltyRate';
                                    }else{
                                        pickListValues = 'RoyaltyRate';
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'RoyaltyRate';
                            }else{
                                pickListValues = 'RoyaltyRate';
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }      
                    }
                    if(String.isNotBlank(dataRow.Market__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Market');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Market__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Market__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Market":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Market';
                                        //  system.debug('pickListValues:::Market::001'+pickListValues);
                                    }else{
                                        pickListValues = 'Market';
                                        // system.debug('pickListValues:::Market::002'+pickListValues);
                                    } 
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Market';
                                // system.debug('pickListValues:::Market::003'+pickListValues);
                            }else{
                                pickListValues = 'Market';
                                // system.debug('pickListValues:::Market::004'+pickListValues);
                            } 
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }       
                    }
                    if(String.isNotBlank(dataRow.Remarks__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('Remarks');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.Remarks__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Remarks__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"Remarks":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'Remark';
                                    }else{
                                        pickListValues = 'Remark';
                                    }                                    
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'Remark';
                            }else{
                                pickListValues = 'Remark';
                            }    
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }         
                    }
                    if(String.isNotBlank(dataRow.LOB__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('LOB');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.LOB__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.LOB__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"LOB":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'LOB';
                                    }else{
                                        pickListValues = 'LOB';
                                    }    
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'LOB';
                            }else{
                                pickListValues = 'LOB';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }          
                    }
                    if(String.isNotBlank(dataRow.SO_Number__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('SONumber');
                            if(mapFromToValueMap != null){
                                String mapFromValue = dataRow.SO_Number__c;
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.SO_Number__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"SONumber":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '},';
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'SONumber';
                                    }else{
                                        pickListValues = 'SONumber';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                 
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'SONumber';
                            }else{
                                pickListValues = 'SONumber';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }         
                    }
                    if(String.isNotBlank(dataRow.Production_Country__c)){
                        if(isRawMapAvailable){
                            mapFromToValueMap = rawDataFieldMap.get('ProductionCountry');
                            if(mapFromToValueMap != null){
                                System.debug('mapFromToValueMap'+mapFromToValueMap);
                                String mapFromValue = dataRow.Production_Country__c;
                                System.debug('mapFromValue'+mapFromValue);
                                if(mapFromToValueMap.containsKey(mapFromValue.toLowerCase())){
                                    String mapToValue = mapFromToValueMap.get(mapFromValue.toLowerCase());
                                    if(String.isNotBlank(mapToValue)){
                                        dataRow.Production_Country__c = mapToValue;                       
                                        dataReconciled = true;
                                        isErrorMapHistory = true;
                                        errorMapHistory += '\r\n"ProductionCountry":\n'+  '{' + '\n' + ' "From" :' + '"'  + mapFromValue +  '"' + ',' + '\n' +   ' "To" :' +  '"'  + mapToValue +  '"' + '\n' + '}';
                                        //  system.debug('errorMapHistory::' + errorMapHistory);
                                    }
                                }else{
                                    if(String.isNotBlank(pickListValues)){
                                        pickListValues += ';'+ 'ProductionCountry';
                                    }else{
                                        pickListValues = 'ProductionCountry';
                                    }  
                                    dataReconciled = true;
                                    isErrorInRecord = true;
                                }                                
                            }
                        }else{
                            if(String.isNotBlank(pickListValues)){
                                pickListValues += ';'+ 'ProductionCountry';
                            }else{
                                pickListValues = 'ProductionCountry';
                            }  
                            dataReconciled = true;
                            isErrorInRecord = true;
                        }          
                    }
                    if(dataReconciled){                 
                        if(isErrorInRecord){
                            
                            // system.debug('pickListValues::::'+pickListValues);
                            dataRow.ErrorMapData__c = pickListValues ;                            
                            //  dataRow.Record_Status__c = '1 - Error In Data Validation';
                            reconcileComplete = false; 
                            
                        }
                        if(isErrorMapHistory){
                            dataRow.ErrorMapHistory__c = errorMapHistory +'\n}';
                            //  system.debug('dataRow.ErrorMapHistory__c::::'+dataRow.ErrorMapHistory__c);
                        }
                        reconcileDataRowForUpdate.add(dataRow);                                        
                    }else{
                        reconcileDataRowForUpdate.add(dataRow);
                    }
                }
            }
            /// Updating the reconciled data back into the stage table
            if(reconcileDataRowForUpdate.size() > 0){
                update reconcileDataRowForUpdate;            
            }
        }
        return reconcileDataRowForUpdate;
    }   
}