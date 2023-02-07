public with sharing class productDependentPicklist {
   
     
    // Getting the Picklist Values Instead of ApiName
    public static string  getPicklistValueFromAPIName(string apiName) 
    {
        string picklistValue = '';
        Schema.DescribeFieldResult fieldResult = Product__c.Business_Vertical__c.getDescribe();         
        List<Schema.PicklistEntry> values = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry v : values) {
            if(apiName.equalsIgnoreCase(v.getValue()))
            {
                picklistValue = v.getLabel();
                break;
            } 
        }
        return picklistValue;
    }
     

    
     // Getting the Picklist Values Instead of ApiName
    public static string  getPicklistValueFromAPINameSubCategory(string apiName)
    {
        string picklistValue = '';
        Schema.DescribeFieldResult fieldResult = Product__c.Sub_category__c.getDescribe();        
        List<Schema.PicklistEntry> values = fieldResult.getPicklistValues();//To get the Picklist values.
        for( Schema.PicklistEntry v : values) {
            if(apiName.equalsIgnoreCase(v.getValue()))
            {
                picklistValue = v.getLabel();
                break;
            }
        }
        return picklistValue;
    }

    // Getting the Picklist Values Instead of ApiName
    public static string  getPicklistValueFromAPINameProductFamily(string apiName)
    {
        string picklistValue = '';
        Schema.DescribeFieldResult fieldResult = Product__c.Product_Family__c.getDescribe();        
        List<Schema.PicklistEntry> values = fieldResult.getPicklistValues();//To get the Picklist values.
        for( Schema.PicklistEntry v : values) {
            if(apiName.equalsIgnoreCase(v.getValue()))
            {
                picklistValue = v.getLabel();
                break;
            }
        }
        return picklistValue;
    }
    
     // Getting the Picklist Values Instead of ApiName
    public static string  getPicklistValueFromAPINameProductCategory(string apiName)
    {
        string picklistValue = '';
        Schema.DescribeFieldResult fieldResult = Product__c.Product_Type__c.getDescribe();        
        List<Schema.PicklistEntry> values = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry v : values) {
            if(apiName.equalsIgnoreCase(v.getValue()))
            {
                picklistValue = v.getLabel();
                break;
            }
        }
        return picklistValue;
    }
    
    
     // Getting the Picklist Values Instead of ApiName
    public static string  getPicklistValueForProduct(String ObjectName,String fieldName)
    {
     string picklistValue = '';
        Schema.SObjectType tarType = Schema.getGlobalDescribe().get(ObjectName); 
        Sobject Object_name = tarType.newSObject();                 
        Schema.sObjectType sobject_type = Object_name.getSObjectType(); 
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); 
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); 
        List<Schema.PicklistEntry> values = field_map.get(fieldName).getDescribe().getPickListValues();
       // system.debug('values::::'+values);
        for( Schema.PicklistEntry v : values) {
         //   if(apiName.equalsIgnoreCase(v.getValue()))
         //   {
                picklistValue = v.getLabel();
            break;
           // system.debug('picklistValue::::'+picklistValue);
          //  }
        }
        return picklistValue;
    }

    
    public static Map<string,string> checkCompMonthYearWeek(String selcomp)
    {
        Datetime dtTime=System.now();
        date dt= date.newinstance(dtTime.year(), dtTime.month(), dtTime.day());
        date dateAfter=dt.addMonths(-12);
        //system.debug('dateAfter>>'+dateAfter);
        string recordtype = 'sales';
        
        Map<string,string> checkCompMonthYearWeek = new Map<string,string>();
        string compweekmonthyear = 'select Sales_Data_Company__c,Month__c,Year__c,Week__c from  Data_Upload_Sales__c where Data_Row_Date__c >=: dateAfter and Record_Type__c =: recordtype and Sales_Data_Company__c =: selcomp  GROUP BY Sales_Data_Company__c,Month__c,Year__c,Week__c';
        //system.debug('compweekmonthyear>>'+compweekmonthyear);
        for (AggregateResult cwemonyear :  Database.Query(compweekmonthyear)){
         
                         
            String strText = String.valueof(cwemonyear.get('Week__c'));
           // system.debug('strText>>>'+strText);
            
            strText = strText.replaceAll('[^a-zA-Z0-9\\s+]', ''); 
            //System.debug('strText ======> '+strText); 
            if(strText.length()<4){
                //system.debug('Length is 3');
                strText = strText.substring(0, 2) + '0' + strText.substring(2, strText.length());
                //System.debug('strText ======> '+strText); 
            }
           string salescomp = String.valueof(cwemonyear.get('Sales_Data_Company__c')).touppercase();
            string salesmonth = String.valueof(cwemonyear.get('Month__c')).touppercase();
            //system.debug('salescomp  >>>>>>'+salescomp + '   salesmonth >>>>>>'+salesmonth);
           //string comyearweekmonth = cwemonyear.get('Sales_Data_Company__c') +'#'+cwemonyear.get('Year__c') +'#'+cwemonyear.get('Week__c')+'#'+cwemonyear.get('Month__c');
                string comyearweekmonth = salescomp +'#'+cwemonyear.get('Year__c') +'#'+strText+'#'+salesmonth;
                checkCompMonthYearWeek.put(comyearweekmonth, comyearweekmonth);
                        
        }
        //system.debug('checkCompMonthYearWeek>>'+checkCompMonthYearWeek);
        return checkCompMonthYearWeek;
    }
    
    public static Map<string,string> checkCompPeriodYear()
    {
        Datetime dtTime=System.now();
        date dt= date.newinstance(dtTime.year(), dtTime.month(), dtTime.day());
        date dateAfter=dt.addMonths(-12);
        string type = 'Budget';
        
        
        Map<string,string> checkCompPeriodYear = new Map<string,string>();
        string compweekmonthyear = 'select Sales_Data_Company__c,Year__c,Period__c from  Data_Upload_Sales__c where Type__c =: type GROUP BY Sales_Data_Company__c,Year__c,Period__c';
        for (AggregateResult cwemonyear :  Database.Query(compweekmonthyear)){
                string comyearweekmonth = cwemonyear.get('Sales_Data_Company__c') +'#'+cwemonyear.get('Year__c') +'#'+cwemonyear.get('Period__c');           
           // system.debug('comyearweekmonth ::'+comyearweekmonth);
                checkCompPeriodYear.put(comyearweekmonth, comyearweekmonth);
                        
        }
        return checkCompPeriodYear;
    }
    
    /* public static Map<string,string> checklatestUpdatedLocalCurrency()
    {
         Map<string,string> checklatestUpdatedLocalCurrency = new Map<string,string>();
         string latestLocalCurrency = 'select Transaction_Currency__c from  Data_Upload_Sales__c where LatestFlag__c = True GROUP BY Transaction_Currency__c';
        for (AggregateResult localCurrency :  Database.Query(latestLocalCurrency)){
                string latestLocalCurrencyStr =  String.valueOf(localCurrency.get('Transaction_Currency__c'));
             system.debug('latestLocalCurrencyStr ::'+latestLocalCurrencyStr);
                checklatestUpdatedLocalCurrency.put(latestLocalCurrencyStr, latestLocalCurrencyStr);
                        
        }
         return checklatestUpdatedLocalCurrency;
    }*/
    
     public static Map<string,string> checklatestUpdatedLocalCurrency( string company , string year)
    {
         Map<string,string> checklatestUpdatedLocalCurrency = new Map<string,string>();
        // string latestLocalCurrency = 'select Transaction_Currency__c , Sales_Data_Company__c , Year__c from  Data_Upload_Sales__c where LatestFlag__c = True AND Sales_Data_Company__c =: company AND Year__c =: year GROUP BY Transaction_Currency__c';
         string latestLocalCurrency = 'select Transaction_Currency__c  from  Data_Upload_Sales__c where LatestBudgetUploadFlag__c = True AND Sales_Data_Company__c =: company AND Year__c =: year GROUP BY Transaction_Currency__c';
        
        for (AggregateResult localCurrency :  Database.Query(latestLocalCurrency)){
                string latestLocalCurrencyStr =  String.valueOf(localCurrency.get('Transaction_Currency__c'));
           //  system.debug('latestLocalCurrencyStr ::'+latestLocalCurrencyStr);
                checklatestUpdatedLocalCurrency.put(latestLocalCurrencyStr, latestLocalCurrencyStr);
                        
        }
         return checklatestUpdatedLocalCurrency;
    }
    
    
    
}