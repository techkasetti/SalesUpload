global class deleteTheRecordsBasedonIdForAdmin implements Database.Batchable<sObject>,Database.AllowsCallouts,Database.Stateful
{
    String query = 'SELECT unit_sold_warning__c,Gross_Sales_USD__c,Gross_Sales_USD_FB__c,Gross_Sales_USD_NF__c,Freight_Charge_USD__c,Freight_Charge_USD_FB__c,Freight_Charge_USD_NF__c,selected_ui_values__c,Row_No__c,Week_FB__c,Year_FB__c,Source_FB__c,Month_FB__c,Unit_Sold_FB__c,Local_Net_Unit_Pirce_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_USD_FB__c,ExRate_to_EUR_FB__c,Calculation_Failed__c,Remark__c,Label__c,End_user__c,Royalty_Rate__c,Printed_Logo__c,Customer_local_name__c,Net_Unit_Price_100__c,Local_Net_Unit_Pirce_100__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c, Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c, Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c, Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c, Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c, Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c, Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c, ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c, Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,  Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,  Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,wrong_date__c,  Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c,Label_FB__c,Retailer_Check__c,Model_Check__c,ProductCategory__c,Segments__c,Batch_No__c,Retailer_Country__c,Sales_Type__c,Sales_Type_NF__c,Standard_Unit_Cost_100_EUR__c,Standard_Unit_Cost_100_EUR_FB__c,Standard_Unit_Cost_100_EUR_NF__c,Standard_Unit_Cost_100_USD__c,Standard_Unit_Cost_100_USD_FB__c,Standard_Unit_Cost_100_USD_NF__c,Net_Unit_Price_100_EUR__c,Net_Unit_Price_100_EUR_FB__c,Net_Unit_Price_100_EUR_NF__c,Net_Unit_Price_100_NF__c ,Standard_Unit_Ex_Work_Cost_100_EUR__c, Standard_Unit_Ex_Work_Cost_100_EUR_NF__c ,Standard_Unit_Ex_Work_Cost_100_EUR_FB__c, Standard_Unit_Ex_Work_Cost_100_USD__c, Standard_Unit_Ex_Work_Cost_100_USD_FB__c, Standard_Unit_Ex_Work_Cost_100_USD_NF__c, Standard_Unit_Industrial_Cost_100_EUR__c, Standard_Unit_Industrial_Cost_100_EUR_FB__c, Standard_Unit_Industrial_Cost_100_EUR_NF__c , Standard_Unit_Industrial_Cost_100_USD__c , Standard_Unit_Industrial_Cost_100_USD_FB__c, Standard_Unit_Industrial_Cost_100_USD_NF__c ,Final_Sales_Destination__c, Final_Sales_Destination_FB__c, Final_Sales_Destination_NF__c,Local_Net_Unit_Pirce_NF__c,Record_Status__c,Malformed_Data__c,Net_Weight_KG_1000__c,Net_Weight_KG_1000_FB__c,Net_Weight_KG_1000_NF__c,PO_Number__c   FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchId order by Row_No__c';
    private String batchId;
    private String userEmail;
    private List<Sales_Transaction_Stage__c> salesTransStageForCSV;
    public deleteTheRecordsBasedonIdForAdmin(String batchId,String userEmail) {
        System.debug('########## START OF REUPLOAD DELETE CONSTRUCTOR BATCH ID'+batchId);
        this.batchId = batchId;
        this.userEmail = userEmail;
    }
    global Database.querylocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);        
    }    
    global void execute(Database.BatchableContext bc, List<Sales_Transaction_Stage__c> salesTransStage)
     {  
          system.debug('salesTransStage:::'+salesTransStage.size());
         try{
         salesTransStageForCSV = salesTransStage;
            delete salesTransStage; 
        }catch(DMLException ex){
            System.debug('Exception during bulk delete '+ex.getMessage());
        }
    }    
    global void finish(Database.BatchableContext bc)
    {
        Inventory_Transaction_Master__c transactions = new Inventory_Transaction_Master__c();           
        transactions.Id = batchId;       
        Inventory_Transaction_Master__c query = [SELECT Batch_No__c,Batch_Status__c FROM Inventory_Transaction_Master__c WHERE Id =: batchId ];
        try{
            if(query.Batch_Status__c == '8 - Migration Success')
            {
                Database.executeBatch(new deletetherecordbasedonidforDUS(batchId),2000);
                system.debug('Successfully Deleted  Data Upload Sales');
            }
            else{system.debug('001');
                delete transactions;
                system.debug('002');}
             /*
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {userEmail,'datasupport.hk@mainetti.com', 'portal.admin@mainetti.com'};
            mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Sales Batch Process Completed , Ref Batch No :'+query.Batch_No__c);
        mail.setPlainTextBody('Hello,\n\n Your Sales File Upload process has been Deleted Successfully. \n\n Warm Regards \n Admin');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   */
        }catch(DMLException e){             
            system.debug('Error in deleteTheRecordsBasedonId: during Delete Master Record'+e.getMessage());
        }
        system.debug('######## Complete the Deletion of Master Record');       
    }
     
    
}