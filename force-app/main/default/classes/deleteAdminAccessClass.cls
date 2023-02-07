public with sharing class deleteAdminAccessClass {


    
     @AuraEnabled
    public static List<Inventory_Transaction_Master__c> getDeleteData(string batchid){
        List<Inventory_Transaction_Master__c>  unitsold;
        if(
            Inventory_Transaction_Master__c.SObjectType.getDescribe().isAccessible()
        ) {
         unitsold =[Select Batch_No__c,Sales_Company__c,Sales_Year__c,Sales_Month__c,Total_Row_Count__c,Void_Reason__c from Inventory_Transaction_Master__c where id=:batchid ];
        }
        List<Inventory_Transaction_Master__c> fetchdata = new List<Inventory_Transaction_Master__c>();
        
        for(Inventory_Transaction_Master__c vend:unitsold){
            Inventory_Transaction_Master__c transStage = new Inventory_Transaction_Master__c();
            transStage.uploadedBatchNo__c = vend.Batch_No__c;
            transStage.Sales_Company__c = vend.Sales_Company__c;
            transStage.Sales_Year__c = vend.Sales_Year__c;
            transStage.Sales_Month__c = vend.Sales_Month__c;
            transStage.Total_Row_Count__c = vend.Total_Row_Count__c;
            transStage.Void_Reason__c = vend.Void_Reason__c;
            fetchdata.add(transStage);
            system.debug(fetchdata); 
        }
        return fetchdata;
    }
    
    @AuraEnabled
    public static boolean deleteRecordForInventory(string batchid){
        boolean status = true;
        //  string userEmail = UserInfo.getUserEmail();
        User query;
        if(User.SObjectType.getDescribe().isAccessible()) {
         query = [SELECT Email FROM User WHERE User.Id in (SELECT OwnerId FROM Inventory_Transaction_Master__c WHERE Id=:batchid )];
        }
        //system.debug('query::'+query);
        
            if( query.Email != null )
            {  
                string userEmail = query.Email;
                //system.debug('userEmail:::'+userEmail);
                
                //Desc: Update the status to Delete Request In Progress to show that delete is in progress and batch is running 
                //If the deletion process fail the status will be updated back to Delete Request Submitted and deletion fail mail will be sent
                Inventory_Transaction_Master__c updateVoidStatus = [SELECT Void__c FROM Inventory_Transaction_Master__c WHERE Id=:batchid LIMIT 1];
               	updateVoidStatus.Void__c= 'Delete Request In Progress';
                update updateVoidStatus;
                deleteTheRecordsBasedonIdForAdmin validateBulk = new deleteTheRecordsBasedonIdForAdmin(batchId,userEmail);
                Database.executeBatch(validateBulk,2000);
            }
            
        return status;        
    } 
    
    


}