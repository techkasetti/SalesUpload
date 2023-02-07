@isTest
public class productDependentPicklistTest {
 
     @isTest
    static void getPicklistValueFromAPINameTest() 
    { 
        String category = 'Hanger Business';
        String objectName = 'Product__c';
        String fieldName = 'Business_Vertical__c';
        string getPickliapxst = productDependentPicklist.getPicklistValueFromAPIName(category);
         string getsubcategoryPicklist = productDependentPicklist.getPicklistValueFromAPINameSubCategory(category);
         string getProductcategoryPicklist = productDependentPicklist.getPicklistValueFromAPINameProductCategory(category);
         string getProductFamilyPicklist = productDependentPicklist.getPicklistValueFromAPINameProductFamily(category);
         string getProductPicklist = productDependentPicklist.getPicklistValueForProduct(objectName,fieldName);
        Data_Upload_Sales__c dataUpload = new Data_Upload_Sales__c();
            dataUpload.Sales_Data_Company__c = 'Hong Kong Packaging';
            dataUpload.Month__c =  'AUG';
            dataUpload.Year__c = '2019';
            dataUpload.Week__c = 'W05';
        dataUpload.Data_Row_Date__c=date.newInstance(2021, 11, 10 );       
        dataUpload.Record_Type__c='sales';
        dataUpload.Sales_Data_Company__c='Brazil';
        dataUpload.LatestBudgetUploadFlag__c = true;
        dataUpload.Transaction_Currency__c = 'USD';
        dataUpload.Period__c = 'Budget';
        dataUpload.Type__c = 'Budget';
        dataUpload.LatestFlag__c = True;
      insert dataUpload;            
        Map<string,string> checkCompMonthYearWeek = productDependentPicklist.checkCompMonthYearWeek(dataUpload.Sales_Data_Company__c);
         Map<string,string> checklatestUpdatedLocalCurrency = productDependentPicklist.checklatestUpdatedLocalCurrency(dataUpload.Sales_Data_Company__c, dataUpload.Year__c);
         Map<string,string> checkCompPeriodYear = productDependentPicklist.checkCompPeriodYear();
         System.assertEquals('Budget', dataUpload.Period__c,'getPicklistValueFromAPINameTest');
         }
     }