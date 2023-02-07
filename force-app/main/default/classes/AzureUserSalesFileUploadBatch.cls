global class AzureUserSalesFileUploadBatch implements Database.Batchable<sObject> ,Database.AllowsCallouts, Database.Stateful {  
    
    global String batchId;
    global String conVerTitle;
    global boolean uploadSalesSuccessFile;
    global String fileName;
    global String encodedfileName ;
    global  Integer startRange = 0;
    global String userEmail;
     global boolean uploadStatus;
    private List<ContentVersion> contentCSVData;
    
    
    
    String fetchSuccessdata = 'SELECT Batch_No__c FROM Inventory_Transaction_Master__c WHERE Id =: batchId';
    public AzureUserSalesFileUploadBatch( String batchId,String conVerTitle,String userEmail) {
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
        system.debug('salescontversion :::'+salescontversion.size());
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
        
        return Database.getQueryLocator(contVer);    */
        
    /*   String fileName;
         String fileContent;
        Blob myBlob;
        String encodedfileName;
        getSalesBudgetMasterData getMastData = new getSalesBudgetMasterData();
        List<ContentVersion> conVerList =  getMastData.getContentDocumentVerIds(batchId,conVerTitle);
         system.debug('conVerList:::'+conVerList);
        Integer totalFileLength = 0;
        
        if(conVerList.size() > 0){          
                for(integer i=0; i<conVerList.size(); i++){
                    ContentVersion contentCSVData = getMastData.getCSVFileContent(conVerList[i]);
                    fileContent = EncodingUtil.base64Encode(contentCSVData.VersionData);        
                    fileName = contentCSVData.PathOnClient;
                    myBlob = EncodingUtil.base64Decode(fileContent);
                    fileContent = null;
                    
                    String fileValue = myBlob.toString();
                    myBlob = null;
                    Blob blobValue =Blob.valueOf(fileValue);
                    fileValue = null;
                    
                    totalFileLength = totalFileLength + blobValue.size();
                    if(i < (conVerList.size() - 1)){
                        totalFileLength = totalFileLength + 1; //Adding additional 1 bytes since we are including '\n' while pushing to azure.
                    }
                }
            encodedfileName = EncodingUtil.urlEncode(conVerList[0].PathOnClient, 'UTF-8');
            String fileLength = String.valueOf(totalFileLength);
            Boolean createStatus = AzureFileStorageService.createFileRequest(storageName,storageKey, containerName, encodedfileName, fileLength);
            system.debug('##################### createStatus :::'+createStatus + 'fileLength :::'+fileLength);
    }
        
        
       Set<Id> ids = new Set<Id>();
        
        for (ContentVersion conVer : conVerList) 
        {
            ids.add(conVer.Id);
        }
        
        string contVer = 'SELECT Title, VersionData, PathOnClient, FileType FROM ContentVersion WHERE IsLatest = true AND id IN: ids order by createdDate asc';
        
        return Database.getQueryLocator(contVer);  */
    }
    
    global void execute(Database.BatchableContext bc, List<Inventory_Transaction_Master__c> transferRecords){
        
      /*  for(ContentVersion contentCSVData : content)
        {
             blob filebody = contentCSVData.VersionData;
               system.debug('filebody:::'+filebody.toString());
            system.debug('filebody:::'+filebody.size());
           String  fileContent = EncodingUtil.base64Encode(contentCSVData.VersionData);   
            system.debug(LoggingLevel.WARN,'##################### fileContent :::'+fileContent);
           string   fileName = contentCSVData.PathOnClient;
            system.debug(LoggingLevel.WARN,'##################### fileName :::'+fileName);
           Blob   myBlob = EncodingUtil.base64Decode(fileContent);
            system.debug(LoggingLevel.WARN,'##################### startRange :::'+startRange);
            Integer returnEndRange = AzureFileStorageService.putFileRequest(storageName, storageKey,sourcedownloadpath,encodedfileName,myBlob,startRange);
            startRange = returnEndRange + 1; 
        } */
        /*  blob filebody = contentCSVData.VersionData;
system.debug('filebody:::'+filebody.toString());
arrayString.add(filebody.toString());
filebody = null;
//  system.debug(LoggingLevel.WARN,'##################### fileContent :::'+filebody);              
fileName = contentCSVData.PathOnClient;
// system.debug(LoggingLevel.WARN,'##################### fileName :::'+fileName);

}
System.debug('Before joinfilebody :::: '+Limits.getHeapSize());
string joinfilebody = String.join(arrayString,'\n');
system.debug('joinfilebody::::'+joinfilebody);
blob  joinblobvalue = blob.valueOf(joinfilebody);
joinfilebody = null;
System.debug('after joinfilebody ::: '+Limits.getHeapSize());
string  joinblobvaluefileContent = EncodingUtil.base64Encode(joinblobvalue);
joinblobvalue = null;
System.debug('after joinblobvalue ::::'+Limits.getHeapSize());            
myBlob = EncodingUtil.base64Decode(joinblobvaluefileContent);
joinblobvaluefileContent = null;
system.debug('myBlob::::'+myBlob);
System.debug('after joinblobvaluefileContent:::  '+Limits.getHeapSize());            
Integer returnEndRange = AzureFileStorageService.putFileRequest(storageName, storageKey,sourcedownloadpath,encodedfileName,myBlob,startRange);
myBlob = null;
startRange = returnEndRange + 1; */
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
     /*   encodedfileName = EncodingUtil.urlDecode(encodedfileName, 'UTF-8');
        system.debug('encodedfileName:::'+encodedfileName);
        Inventory_Transaction_Master__c transMast = new Inventory_Transaction_Master__c();
        String  inventoryFileLink = '/apex/salesFileDownload?Id='+batchId;
        system.debug('inventoryFileLink ::'+inventoryFileLink);
        String  convertedFileLink = '/apex/budgetConvertedFileDownload?Id='+batchId; 
        system.debug('convertedFileLink ::'+convertedFileLink);
        transMast.Id = batchId;
        // transMast.upload_file_name__c = fileName;
        transMast.Upload_Converted_File_Name__c = encodedfileName;
        // transMast.Azure_File_Link__c = inventoryFileLink;
        transMast.Sales_Budget_Converted_File_Link__c = convertedFileLink;
        try{
            update transMast;
            Database.executeBatch(new AzureSalesSuccessFileUploadBatch(batchId,'SalesSuccessCSVFile',userEmail),1); 
        }catch(DMLException ex){
            System.debug('DML Exception during the 6 - Azure File Upload Successful'+ex.getMessage());
        }   */
        system.debug('finish :::');  
        
        if(uploadStatus) {
            Database.executeBatch(new AzureSalesSuccessFileUploadBatch(batchId,'SalesSuccessCSVFile',userEmail),1);
        }
    }  
    
    
     global  boolean createCSVFileAndUploadToAzure(String batchId){
        system.debug(' createCSVFileAndUploadToAzure  ::: batchId ::'+batchId);
        //string fileContent;
        String fileName;
        string userfileName;
        //String contentType;
        boolean fileCreationNUploadToAzure = true;
        getSalesMasterData getMastData = new getSalesMasterData();
        boolean fileUploadStatus= true;    
      //  String conVerUserTitle = 'SalesUserUploadedCSVFile';
      //  String conVerTitle = 'SalesSuccessCSVFile';
        
      //  fileName = new AzureFileStorageService().mainAzureUpload(batchId,conVerTitle); 
      //  system.debug(' createCSVFileAndUploadToAzure  ::: fileName ::'+fileName);
             userfileName = new AzureFileStorageService().mainAzureUserUpload(batchId,conVerTitle); 
             system.debug(' createCSVFileAndUploadToAzure  ::: userfileName ::'+userfileName);
       // userfileName = new AzureFileStorageService().mainAzureUserUpload(batchId,conVerUserTitle); 
       // system.debug('fileName::::'+fileName+'userfileName::::'+userfileName);
         
        /************************************update the Azure URL **************************************/
      // if(fileName <> null && userfileName <> null){
            if(userfileName <> null ){
            Inventory_Transaction_Master__c transMast = new Inventory_Transaction_Master__c();
          //  String  inventoryFileLink = '/apex/salesFileDownload?Id='+batchId;
           String  convertedFileLink = '/apex/budgetConvertedFileDownload?Id='+batchId; 
            transMast.Id = batchId;
          //  transMast.upload_file_name__c = fileName;
            transMast.Upload_Converted_File_Name__c = userfileName;
         //   transMast.Azure_File_Link__c = inventoryFileLink;
           transMast.Sales_Budget_Converted_File_Link__c = convertedFileLink;
          //  transMast.Batch_Status__c = '6 - Azure File Upload Successful';
            try{
                update transMast;
              //  Database.executeBatch(new AzureSalesSuccessFileUploadBatch(batchId,'SalesSuccessCSVFile',userEmail),1);
             //   boolean delStatus =  getMastData.deleteCSVFile(batchId);
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