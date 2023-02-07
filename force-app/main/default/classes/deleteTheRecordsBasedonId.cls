global class deleteTheRecordsBasedonId implements Database.Batchable<sObject> , Database.Stateful
{
    String query = 'SELECT Id FROM Sales_Transaction_Stage__c WHERE Upload_Batch_No__c=:batchId';
    private String batchId;
    public deleteTheRecordsBasedonId(String batchId) {
        //System.debug('########## START OF REUPLOAD DELETE CONSTRUCTOR BATCH ID'+batchId);
        this.batchId = batchId;
    }
    global Database.querylocator start(Database.BatchableContext bc){
        boolean delStatus =  new getSalesMasterData().deleteCSVFile(batchId);
        return Database.getQueryLocator(query);        
    }    
    global void execute(Database.BatchableContext bc, List<Sales_Transaction_Stage__c> salesTransStage)
     {    try{
            delete salesTransStage;
        }catch(DMLException ex){
            
            //System.debug('Exception during bulk delete '+ex.getMessage());
        }
    }    
    global void finish(Database.BatchableContext bc)
    {
        Inventory_Transaction_Master__c transactions = new Inventory_Transaction_Master__c();           
        transactions.Id = batchId;                   
        try{
            delete transactions;           
        }catch(DMLException e){     
              
        }
         
            //system.debug('Error in deleteTheRecordsBasedonId: during Delete Master Record'+e.getMessage());
        }
        //system.debug('######## Complete the Deletion of Master Record');
    }