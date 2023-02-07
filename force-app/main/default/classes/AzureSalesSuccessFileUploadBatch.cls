global class AzureSalesSuccessFileUploadBatch implements Database.Batchable<sObject> ,Database.AllowsCallouts, Database.Stateful {  
    
    global String batchId;
    global String conVerTitle;
    global boolean uploadSalesSuccessFile;
    global String fileName;
    global String encodedfileName ;
    global  Integer startRange = 0;
    global String userEmail;
    global boolean uploadStatus;
    String fetchSuccessdata = 'SELECT Batch_No__c FROM Inventory_Transaction_Master__c WHERE Id =: batchId';
    private List<ContentVersion> contentCSVData;
    public AzureSalesSuccessFileUploadBatch( String batchId,String conVerTitle,String userEmail) {
        this.batchId = batchId;
        this.conVerTitle = conVerTitle; 
        this.userEmail = userEmail; 
        
        
        
    }
    
    Cogs_Sales_Upload__c detail = Cogs_Sales_Upload__c.getInstance();         
    String storageKey = detail.StorageKey__c;
    String storageName = detail.StorageName__c;
    string sourcedownloadpath  = detail.Sales_Source_File__c;
    String containerName = detail.containerName__c;
    
    
    global Database.querylocator start(Database.BatchableContext bc){
        
        this.uploadStatus =  createCSVFileAndUploadToAzure(batchId);
        return Database.getQueryLocator(fetchSuccessdata); 
        /*  List<ContentVersion> salescontversion = new getSalesBudgetMasterData().getContentDocumentVerIds(batchId,conVerTitle);
Integer  totalFileLength =  new AzureFileStorageService().splitContentVersion(salescontversion);
system.debug('totalFileLength :::'+totalFileLength);
encodedfileName = EncodingUtil.urlEncode(salescontversion[0].PathOnClient, 'UTF-8');
system.debug('encodedfileName :::'+encodedfileName);
String fileLength = String.valueOf(totalFileLength);
Boolean createStatus =  AzureFileStorageService.createFileRequest(storageName,storageKey, sourcedownloadpath, encodedfileName, fileLength);
system.debug('createStatus :::'+createStatus);

Set<Id> ids = new Set<Id>();

for (ContentVersion conVer : salescontversion) 
{
ids.add(conVer.Id);
}

string contVer = 'SELECT Title, VersionData, PathOnClient, FileType FROM ContentVersion WHERE IsLatest = true AND id IN: ids order by createdDate asc';

return Database.getQueryLocator(contVer);      */   
    }
    
    global void execute(Database.BatchableContext bc, List<Inventory_Transaction_Master__c> transferRecords){ 
        /*  for(ContentVersion contentCSVData : content)
{
string fileContent = EncodingUtil.base64Encode(contentCSVData.VersionData);   
system.debug(LoggingLevel.WARN,'##################### fileContent :::'+fileContent);
string  fileName = contentCSVData.PathOnClient;
system.debug(LoggingLevel.WARN,'##################### fileName :::'+fileName);
Blob  myBlob = EncodingUtil.base64Decode(fileContent);
system.debug(LoggingLevel.WARN,'##################### startRange :::'+startRange);
Integer returnEndRange = AzureFileStorageService.putFileRequest(storageName, storageKey,sourcedownloadpath,encodedfileName,myBlob,startRange);
startRange = returnEndRange + 1;
}
// contentCSVData = content;


/*  system.debug('execute :::');
new AzureFileStorageService().splitFileUpload(salescontversion);
system.debug('execute :::'); */
        
    }
    global void finish(Database.BatchableContext bc){
        
        /*  if(uploadSalesSuccessFile)
{
Database.executeBatch(new salesSuccessData(batchId,userEmail,fileName),2000);
} */
        /*  encodedfileName = EncodingUtil.urlDecode(encodedfileName, 'UTF-8');
system.debug('encodedfileName:::'+encodedfileName);
Inventory_Transaction_Master__c transMast = new Inventory_Transaction_Master__c();
String  inventoryFileLink = '/apex/salesFileDownload?Id='+batchId;
system.debug('inventoryFileLink ::'+inventoryFileLink);
String  convertedFileLink = '/apex/budgetConvertedFileDownload?Id='+batchId; 
system.debug('convertedFileLink ::'+convertedFileLink);
transMast.Id = batchId;
transMast.upload_file_name__c = encodedfileName;
//  transMast.Upload_Converted_File_Name__c = encodedfileName;
transMast.Azure_File_Link__c = inventoryFileLink;
// transMast.Sales_Budget_Converted_File_Link__c = convertedFileLink;
try{
update transMast;
boolean delStatus =  new getSalesMasterData().deleteCSVFile(batchId);
Database.executeBatch(new salesSuccessData(batchId,userEmail),2000);
}catch(DMLException ex){
System.debug('DML Exception during the 6 - Azure File Upload Successful'+ex.getMessage());
}   
system.debug('finish :::'); */
        
        if(uploadStatus) {
            Database.executeBatch(new salesSuccessData(batchId,userEmail),2000);
        }
        
        
        
    }    
    
    
    global  boolean createCSVFileAndUploadToAzure(String batchId){
        system.debug(' createCSVFileAndUploadToAzure  ::: batchId ::'+batchId);
        String fileName;
        string userfileName;
        boolean fileCreationNUploadToAzure = true;
        getSalesMasterData getMastData = new getSalesMasterData();
        boolean fileUploadStatus= true;    
        
        fileName = new AzureFileStorageService().mainAzureUpload(batchId,conVerTitle); 
        system.debug(' createCSVFileAndUploadToAzure  ::: fileName ::'+fileName);
        if(fileName <> null ){
            Inventory_Transaction_Master__c transMast = new Inventory_Transaction_Master__c();
            String  inventoryFileLink = '/apex/salesFileDownload?Id='+batchId;
            transMast.Id = batchId;
            transMast.upload_file_name__c = fileName;
            transMast.Azure_File_Link__c = inventoryFileLink;
            try{
                update transMast;
                boolean delStatus =  getMastData.deleteCSVFile(batchId);
            }catch(DMLException ex){
                fileCreationNUploadToAzure = false;
                System.debug('DML Exception during the 6 - Azure File Upload Successful'+ex.getMessage());
            }            
        }else{
            fileCreationNUploadToAzure = false;
        }        
        return fileCreationNUploadToAzure;
    }
    
    
}