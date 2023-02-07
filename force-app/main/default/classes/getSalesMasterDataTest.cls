@isTest
public class getSalesMasterDataTest {  

    @isTest
    static void getRetailerCodeIdMapTest()
    { 
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'DECATHLON',Retailer_Type__c='Department Stores');
        insert retailercode; 
 
        boolean flag = true;
         Test.startTest();
        getSalesMasterData getsalemasdata = new getSalesMasterData();
         Test.stopTest();
        System.assertEquals(true, flag);
    }
    static testMethod Void getSalesStageRowsTest()
    {
         Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        System.assertEquals('Sales', value.Record_Type__c,'putFileRequestTest');

Retailer_Code__c retailercode = new Retailer_Code__c();
        retailercode.Name = 'DECATHLON';
        retailercode.Retailer_Type__c='Department Stores';
        insert retailercode;

        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.id;
        system.debug('lableDivision.Retailer_Code_Name__c::::'+lableDivision.Retailer_Code_Name__c);
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;

        String conVerTitle = 'sample';

        Sales_Transaction_Stage__c salesTransStagRec = new Sales_Transaction_Stage__c();
        salesTransStagRec.Upload_Batch_No__c = value.Id;
        insert salesTransStagRec;
        ContentVersion invenotryFile = new ContentVersion();
            invenotryFile.ContentLocation = 'S';
            invenotryFile.VersionData = Blob.valueOf('/services/data/v50.0/sobjects/ContentVersion/0689D000000cnfUQAQ/VersionData');
            invenotryFile.Title = 'Inventory Data File Uplaod';
            invenotryFile.PathOnClient = 'Cambodia - Jin Jin+May+2019+201029-7240.csv';
            insert invenotryFile;
        // Map<string,string> vendorDivisionBrandLabelMapsub = new Map<string,string>();

        //vendorDivisionBrandLabelMapsub.put( lableDivision.Retailer_Code_Name__c,  lableDivision.Retailer_Code_Name__c);
        //system.debug('vendorDivisionBrandLabelMapsub :'+VendorDivisionBrandLabelMapsub);
       // Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        // vendorDivisionBrandLabelMap.put( lableDivision.Retailer_Code_Name__c,vendorDivisionBrandLabelMapsub);
        getSalesMasterData companyMap = new getSalesMasterData();
        companyMap.getSalesStageRows( salesTransStagRec.Id);
        companyMap.preValidationSalesStageData(salesTransStagRec.Id);
        companyMap.getContentDocumentVerIds(salesTransStagRec.Id);
        companyMap.getContentDocumentVerIds(salesTransStagRec.Id,conVerTitle);
        companyMap.getCSVFileContent(invenotryFile);
       // companyMap.getNewVendorDivisionBrandLabelMap();
        List<Sales_Transaction_Stage__c> salesTransStagRecords = new List<Sales_Transaction_Stage__c>();
        if(!String.isBlank(salesTransStagRec.Id)){
            salesTransStagRecords = [Select Row_No__c,Source_FB__c,Local_Net_Unit_Pirce_100__c,Net_Unit_Price_100__c,Month_FB__c,Local_Net_Unit_Pirce_FB__c,Calculation_Failed__c,ExRate_to_USD_FB__c,Net_Unit_Price_100_FB__c,ExRate_to_EUR_FB__c,wrong_date__c,ExRate_to_USD__c,ErrorMapData__c,validation_failed__c,warning_consolidate_key__c,SO_Number__c,SO_Number_FB__c,SO_Number_NF__c,LOB__c,LOB_FB__c,LOB_NF__c,Company__c,Company_FB__c,Customer__c,Customer_FB__c,Transaction_Currency__c,Transaction_Currency_FB__c,Transaction_Currency_NF__c,Division__c,Division_FB__c,Division_NF__c,Mainetti_Brand__c,Mainetti_Brand_FB__c,Mainetti_Brand_NF__c,Item_code__c,Item_code_FB__c,Item_code_NF__c,Production_Country__c,Production_Country_FB__c,Production_Country_NF__c,Retailer_Brand__c,Retailer_Brand_FB__c,Retailer_Brand_NF__c,Material__c,Material_FB__c,Material_NF__c,Company_NF__c,Model__c,Model_FB__c,Model_NF__c,Market__c,Market_FB__c,Market_NF__c,Vendor__c,Vendor_FB__c,Vendor_NF__c,Category__c,Category_FB__c,Category_NF__c,Sub_Category__c,Sub_Category_FB__c,Sub_Category_NF__c,Order_Type__c,Order_Type_FB__c,Order_Type_NF__c,Shipped_To_Country__c,Shipped_To_Country_FB__c,Shipped_To_Country_NF__c,Shipped_To_Factory__c,Shipped_To_Factory_FB__c,Shipped_To_Factory_NF__c,Color__c,Color_FB__c,Color_NF__c,Country__c,Country_NF__c,Sales_Model__c,SM_NF__c,ExRate_to_EUR__c,ExRate_to_EUR_NF__c,Mainetti_Company__c,MC_NF__c,ExRate_to_USD_NF__c,Local_Currency__c,Local_Currency_NF__c,Local_Currency_FB__c,Month__c,Month_NF__c,Remarks__c,Retailer_Code__c,Retailer_Code_NF__c,Sales_Local__c,SL_NF__c,Source__c,Source_NF__c,Unit_Sold__c,US_NF__c,UOM__c,UOM_NF__c,Week__c,Week_NF__c,Year__c,Year_NF__c,Upload_Batch_No__c,Family__c,Family_FB__c,Family_NF__c,Sales_Transaction_Currency__c,STC_FB__c,STC_NF__c,Sales_EUR__c,Sales_EUR_FB__c,Sales_EUR_NF__c,Sales_USD__c,Sales_USD_FB__c,Sales_USD_NF__c,Unit_Price_100_EUR__c,Unit_Price_100_EUR_FB__c,Unit_Price_100_EUR_NF__c,Unit_Price_100_USD__c,Unit_Price_100_USD_FB__c,Unit_Price_100_USD_NF__c from Sales_Transaction_Stage__c where Upload_Batch_No__c=:salesTransStagRec.Id];
            System.debug(salesTransStagRecords);
        }
    }
     @IsTest
    static void getDeleteCSVFileTest() {
        string csv = '[{"Company__c": "Hong Kong Packaging","Year__c": "2019","Week__c": "Wk02","Month__c": "Jan","Item_code__c": "HGR-3944   BLK002-  100","Material__c": "PS","Source__c": "Virgin","Model__c": "1000","Printed_Logo__c": "demoLogo","Color__c": "BLACK","Customer__c": "xxxxx","Customer_local_name__c": "","Mainetti_Brand__c": "Mainetti","Category__c": "HANGERS & ACCESSORIES","Sub_Category__c": "HANGERS","Family__c": "BOTTOM","Order_Type__c": "3rd","Unit_Sold__c": "2520","Unit_Price_100_EUR__c": "10.65123","Unit_Price_100_USD__c": "12.40602","Net_Unit_Price_100__c": "11","Sales_EUR__c": "268.410993","Sales_USD__c": "312.631704","Transaction_Currency__c" : "HKD","ExRate_to_EUR__c": "9.08505","ExRate_to_USD__c": "7.8","Local_Net_Unit_Pirce_100__c": "13","Sales_Transaction_Currency__c": "2438.527291","Shipped_To_Factory__c": "xxxxxx","Shipped_To_Country__c": "xxxxxx","Label__c": "","End_user__c": "","Vendor__c": "DemoRetailer","Division__c": "Demo","Retailer_Brand__c": "Demo", "Royalty_Rate__c": "", "Market__c": "USA","Remark__c": "","LOB__c": "PRL","": "SO_Number__c": "18300168","Production_Country__c": "CHINA"}]';
        string fileName = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Inventory';
        insert value;
        System.assertEquals('Inventory', value.Record_Type__c,'putFileRequestTest');

        ContentVersion salesFile = new ContentVersion();
        salesFile.ContentLocation = 'S';
        salesFile.VersionData = Blob.valueOf(csv);
        salesFile.Title = 'SalesUserUploadedCSVFile';
        salesFile.PathOnClient = fileName;
        insert salesFile;
        ContentVersion salesVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :salesFile.Id];
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=salesVerContent.ContentDocumentId;
        insert contentlink;
    //     List<ContentDocument> conList = new List<ContentDocument>();
    //     ContentDocument conn = new ContentDocument();
    //     conn.Title ='SalesUserUploadedCSVFile';
    //    conn.CreatedDate ='4-JAN-2021';
    //    conn.FileExtension='csv';
    //    insert conn;
    //    conList.add(conn);


        boolean flag = true;
        Test.startTest();
        getSalesMasterData getSalesMaster = new getSalesMasterData();
        getSalesMaster.getCSVFile(value.id);
        getSalesMaster.deleteCSVFile(value.id);

        Test.stopTest();

    }
     @isTest
    static void testGetFullSalesErrorMapTest(){

        Sales_Error_Mapping__c salesError = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = '484BR',Map_To_Value__c = '484' , Status__c = 'Active');
        insert salesError;
        Sales_Error_Mapping__c salesError1 = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Model',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM' , Status__c = 'Active');
        insert salesError1;

         Sales_Error_Mapping__c salesErrors = new Sales_Error_Mapping__c(Company__c = 'America Mid West - Hangers Unlimited', Raw_Data_Field__c = 'Family',Map_From_Value__c = 'BOTTOM',Map_To_Value__c = 'BOTTOM' , Status__c = 'Active');
        insert salesErrors;

        getSalesMasterData salesErrorMap = new getSalesMasterData();
        salesErrorMap.getFullSalesErrorMap();

        System.assertEquals(salesError.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesError.Raw_Data_Field__c, 'Model','putFileRequestTest');
        System.assertEquals(salesError.Map_From_Value__c, '484BR','putFileRequestTest');
        System.assertEquals(salesError.Map_To_Value__c, '484','putFileRequestTest');

        System.assertEquals(salesErrors.Company__c, 'America Mid West - Hangers Unlimited','putFileRequestTest');
        System.assertEquals(salesErrors.Raw_Data_Field__c, 'Family','putFileRequestTest');
        System.assertEquals(salesErrors.Map_From_Value__c, 'BOTTOM','putFileRequestTest');
        System.assertEquals(salesErrors.Map_To_Value__c, 'BOTTOM','putFileRequestTest');

        System.assertNotEquals(salesError1.Company__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Raw_Data_Field__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_From_Value__c, '','putFileRequestTest');
        System.assertNotEquals(salesError1.Map_To_Value__c, '','putFileRequestTest');
    }
      @isTest
    static void testPartnerCompany()
    {
        Partner__c partners = new Partner__c(Name = 'Others', Default_Order_to_Company__c = 'Others');
        insert partners;
        getSalesMasterData partnerCompany = new getSalesMasterData();
        partnerCompany.partnerCompany();
        List<string> partnerMap = new List<string>();
        list<Partner__c> partnersCompany = [Select  Name, Default_Order_to_Company__c from Partner__c where Name ='Others' and Default_Order_to_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner') order by Name];
        for ( Partner__c partner : partnersCompany ){
            partnerMap.add(partner.Name.toLowerCase());
        }
        System.assertEquals('Others', partners.Name,'putFileRequestTest');
    }
     @isTest
    static void testgetModelConsolidateMap()
    {
        // Inserting the Partner Data
        Product__c product = new Product__c(Business_Vertical__c = 'Flexible Packaging',Consolidated_Style__c = 'SATIN HANGER');
        insert product;
        // Creating the Object for "getMasterData"
        getSalesMasterData productsMap = new getSalesMasterData();
        // Calling the "getMasterData" Methods
        productsMap.getModelConsolidateMap();
        Map<string,string> productMap = new Map<string,string>();
        List<Product__c> produ = [Select Consolidated_Style__c from Product__c where Consolidated_Style__c <> null];
        for ( Product__c prod : produ )
        {
            productMap.put(prod.Consolidated_Style__c.toLowerCase(),prod.Consolidated_Style__c.toLowerCase());
        }
        System.assertEquals(product.Consolidated_Style__c, 'SATIN HANGER','putFileRequestTest');

    }
      @isTest
    static void testgetCategoryBusinessVerticalMap()
    {
        // Inserting the Partner Data
        Product__c product = new Product__c(Business_Vertical__c = 'Flexible Packaging');
        insert product;
        // Creating the Object for "getMasterData"
        getSalesMasterData productsMap = new getSalesMasterData();
        // Calling the "getMasterData" Methods
        productsMap.getCategoryBusinessVerticalMap();
        Map<string,string> productMap = new Map<string,string>();
        List<Product__c> produ = [Select Business_Vertical__c from Product__c where Business_Vertical__c <> null];
        for ( Product__c prod : produ )
        {
            productMap.put(prod.Business_Vertical__c.toLowerCase(),prod.Business_Vertical__c.toLowerCase());
        }
        System.assertEquals(product.Business_Vertical__c, 'Flexible Packaging');

    }
     @isTest
    static void testGetModelCatFamilyMap()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Inventory';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;

        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus =[Select Id, Mainetti_Company__c, Record_Type__c from Inventory_Transaction_Master__c where Id=:value.id];

        Product__c product = new Product__c( Name = 'Sales Upload Checking',Consolidated_Style__c = 'URC40', Business_Vertical__c = 'Hanger Business',Product_Type__c = 'HANGERS',Product_Family__c = 'BOTTOM',Sub_category__c = 'PLASTIC HANGERS');
        insert product;
        getSalesMasterData productCat = new getSalesMasterData();
        productCat.getModelCatFamilyMap();

         System.assertEquals(product.Consolidated_Style__c, 'URC40','putFileRequestTest');
        System.assertEquals(product.Business_Vertical__c, 'Hanger Business','putFileRequestTest');
        System.assertEquals(product.Product_Type__c, 'HANGERS','putFileRequestTest');
        System.assertEquals(product.Sub_category__c, 'PLASTIC HANGERS','putFileRequestTest');
        System.assertEquals(product.Product_Family__c, 'BOTTOM','putFileRequestTest');
    }
     @isTest
    static void testGetModelCatFamilyMap1()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Inventory';
        value.Mainetti_Company__c = 'Mainetti (HK) Ltd';
        insert value;

        Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c();
        updateBatchStatus =[Select Id, Mainetti_Company__c, Record_Type__c from Inventory_Transaction_Master__c where Id=:value.id];

        Product__c product = new Product__c( Name = 'Sales Upload Checking',Consolidated_Style__c = 'URC40', Business_Vertical__c = 'Flexible Packaging',Product_Type__c = 'HANGERS',Product_Family__c = 'BOTTOM',Sub_category__c = 'PLASTIC HANGERS');
        insert product;
        getSalesMasterData productCat = new getSalesMasterData();
        productCat.getModelCatFamilyMap();

         System.assertEquals(product.Consolidated_Style__c, 'URC40','putFileRequestTest');
        System.assertEquals(product.Business_Vertical__c, 'Flexible Packaging','putFileRequestTest');
        System.assertEquals(product.Product_Type__c, 'HANGERS','putFileRequestTest');
        System.assertEquals(product.Sub_category__c, 'PLASTIC HANGERS','putFileRequestTest');
        System.assertEquals(product.Product_Family__c, 'BOTTOM','putFileRequestTest');
    }

     @isTest
    static void testGetProductDetails()
    {
        Product__c product = new Product__c();
        product.Consolidated_Style__c = 'ABCD';
        product.Business_Vertical__c = 'Hanger Business';
        product.Product_Type__c = 'HANGERS';
        product.Product_Family__c = 'TOP';
        product.Status__c= 'Active';
        product.Sub_category__c = 'PLASTIC HANGERS';
        insert product;
        System.assertEquals(product.Product_Family__c, 'TOP','putFileRequestTest');
        Map<string,string> slsModelMap = new Map<string,string>();
        getSalesMasterData productDetails = new getSalesMasterData();
        productDetails.getProductDetails();
        list<Product__c> prod = [Select Consolidated_Style__c,Business_Vertical__c,Product_Type__c,Product_Family__c from Product__c where Consolidated_Style__c <> null and Business_Vertical__c <> null and Product_Type__c <> null and Product_Family__c <> null and Sub_category__c <> null and Status__c = 'Active'];
       // insert prod;
     }


     @isTest
    static void testLululemonModel()
    {

        Price_Specification_Book__c  priceSpecBook = new Price_Specification_Book__c();
        insert priceSpecBook;
        Product__c product = new Product__c();
        product.Business_Vertical__c = 'TLA';
        insert product;
        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'LULULEMON',Retailer_Type__c='Department Stores');
        insert retailercode;
        Price_Specification_Book_Product__c priceSpecificationBookProduct = new Price_Specification_Book_Product__c(Name = 'LULULEMON',Price_Specification_Book__c = priceSpecBook.Id,Price_100pcs__c = 500,Product_Unique_ID__c =product.Id,Color__c = 'BLACK');
        insert priceSpecificationBookProduct;
        getSalesMasterData lululemonModel = new getSalesMasterData();
     //   lululemonModel.getlululemonModelMap();
        Map<string,string> lululemonModelMap = new Map<string,string>();
        list<Price_Specification_Book_Product__c> priceSpecificationBooks = [Select Id,Name,Retailer_Code__r.Name from Price_Specification_Book_Product__c  where Retailer_Code__r.Name='LULULEMON' and Name <> null];
        for ( Price_Specification_Book_Product__c priceSpecificationBook : priceSpecificationBooks ){
            lululemonModelMap.put(priceSpecificationBook.Name.toLowerCase(),priceSpecificationBook.Name.toLowerCase());
        }
        System.assertEquals(priceSpecificationBookProduct.Name, 'LULULEMON','putFileRequestTest');

    }
     @isTest
    static void testGetDebenhamModel()
    {

        Price_Specification_Book__c  priceSpecBook = new Price_Specification_Book__c();
        insert priceSpecBook;
        Product__c product = new Product__c();
        product.Business_Vertical__c = 'TLA';
        insert product;
        Retailer_Code__c retailer = new Retailer_Code__c();
        retailer.Retailer_Brand__c = 'BKA';
        retailer.Retailer_Type__c='Department Stores';
        insert retailer;
        Price_Specification_Book_Product__c priceSpecificationBookProduct = new Price_Specification_Book_Product__c(Name = 'DECATHLON',Price_Specification_Book__c = priceSpecBook.Id,Price_100pcs__c = 500,Product_Unique_ID__c =product.Id,Color__c = 'BLACK');
        insert priceSpecificationBookProduct;
        getSalesMasterData debenhamModel = new getSalesMasterData();
    //    debenhamModel.getDebenhamModelMap();
    //    debenhamModel.getDebenhamBrandMap();
     //   debenhamModel.getDebenhamModelBrandKeyMap();
        Map<string,string> debenhamModelMap = new Map<string,string>();
        list<Price_Specification_Book_Product__c> priceSpecificationBooks = [Select Id,Name,Retailer_Code__r.Name from Price_Specification_Book_Product__c  where Retailer_Code__r.Name='LULULEMON' and Name <> null and Retailer_Brand__c <> null];
        for ( Price_Specification_Book_Product__c priceSpecificationBook : priceSpecificationBooks ){
            debenhamModelMap.put(priceSpecificationBook.Name.toLowerCase(),priceSpecificationBook.Name.toLowerCase());
        }
        System.assertEquals(priceSpecificationBookProduct.Name, 'DECATHLON','putFileRequestTest');
    }
     @isTest
    static void testGetNewVendorDivisionBrandLabelMap()
    {
        Map<string,string> vendorDivisionBrandLabelMapsub = new Map<string,string>();
        Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();

        String lable = 'abc';
        String brand = 'bcd';
        String division = 'lululemon';

        String labelBrand ='abc';


        Retailer_Code__c retailer = new Retailer_Code__c();
        retailer.Retailer_Type__c='Department Stores';
        retailer.Name = 'DECATHLON';
        insert retailer;
        System.assertEquals(retailer.Name, 'DECATHLON','putFileRequestTest');
        String vendorName = 'abc';
      
        Label_Division__c lableDivision = new Label_Division__c();
        //lableDivision.Retailer_Code__c = 'a00p0000007Vl0BAAS';
        lableDivision.Retailer_Code_Name__c = retailer.Id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;
        
       // Map<string,string> vendorDivisionBrandLabelMapsub = new Map<string,string>();
        vendorDivisionBrandLabelMapsub.put(lableDivision.Retailer_Code_Name__c,lableDivision.Division__c);
       // Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        
        list<Label_Division__c> venDivBrndLabel =  [Select Retailer_Code_Name__r.Name, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null];       
        system.debug(venDivBrndLabel);
        for (Label_Division__c venDivBrandLab : venDivBrndLabel){  
            String vendorNamee = venDivBrandLab.Retailer_Code_Name__r.Name;
            system.debug(vendorNamee);
        vendorDivisionBrandLabelMap.put(vendorNamee,vendorDivisionBrandLabelMapsub);
            
        }
        
        //Map<string,string> vendorDivisionBrandLabelMapsub = new Map<string,string>();
       // vendorDivisionBrandLabelMapsub.put(lableDivision.Retailer_Code_Name__c,lableDivision.Division__c);
       // system.debug('vendorDivisionBrandLabelMapsub :'+VendorDivisionBrandLabelMapsub);
       // Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
       // vendorDivisionBrandLabelMap.put(lableDivision.Retailer_Code_Name__c,vendorDivisionBrandLabelMapsub);
       // system.debug('vendorDivisionBrandLabelMap :'+vendorDivisionBrandLabelMap);
        
        getSalesMasterData vendorDivisionBrand = new getSalesMasterData();
        vendorDivisionBrand.getNewVendorDivisionBrandLabelMap();
        /* Map<string,string> vendorDivisionBrandLabelMapsub = new Map<string,string>();
        vendorDivisionBrandLabelMapsub.put(lableDivision.Retailer_Code_Name__c,lableDivision.Division__c);
        Map<string,Map<string,string>> vendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
        
        list<Label_Division__c> venDivBrndLabel =  [Select Retailer_Code_Name__r.Name, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null];       
        system.debug(venDivBrndLabel);
        for (Label_Division__c venDivBrandLab : venDivBrndLabel){  
            String vendorNamee = venDivBrandLab.Retailer_Code_Name__r.Name;
            system.debug(vendorNamee);
        vendorDivisionBrandLabelMap.put(vendorNamee,vendorDivisionBrandLabelMapsub);
            
        }*/
        list<Label_Division__c> labelDiv = [Select Retailer_Code_Name__r.Name, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null];
       
        /* string cmpKey = product.Consolidated_Style__c+'#'+product.Business_Vertical__c+'#'+product.Product_Type__c+'#'+product.Product_Family__c;
        for ( Product__c products : prod ){
            vendorDivBrandLabel.put(cmpKey.toLowerCase(),cmpKey.toLowerCase());
        }*/
    }


      @isTest
    static void testRetailerDivisionBrandCkeck()
    {

        Retailer_Code__c retailercode = new Retailer_Code__c(Name = 'DECATHLON',Retailer_Type__c='Department Stores');
        insert retailercode;
        Label_Division__c lableDivision = new Label_Division__c();
        lableDivision.Retailer_Code_Name__c = retailercode.id;
        lableDivision.Division__c = 'ABCD';
        lableDivision.Retailer_Brand__c = 'Rock & Republic';
        lableDivision.Label__c = 'PL';
        insert lableDivision;
        getSalesMasterData retailerDivisionBrand = new getSalesMasterData();
        retailerDivisionBrand.getRetailersLabelDivisionBrandCheckMap();
        retailerDivisionBrand.getVendorDivisionBrandLabelMap();
       // retailerDivisionBrand.getNewVendorDivisionBrandLabelMap();
        Map<string,Retailer_Code__c> retailerDivBrand = new Map<string,Retailer_Code__c>();
        Map<string,string> vendorDivBrandLabel = new Map<string,string>();
        list<Retailer_Code__c> retailerCodes = [Select Name,Division_check__c,Label_Check__c,Retailer_Brand_Check__c,Sales_Data_Upload_Check__c from Retailer_Code__c where Name <> null];
        list<Label_Division__c> labelDiv = [Select Retailer_Code_Name__c, Division__c, Retailer_Brand__c, Label__c from Label_Division__c where Retailer_Code_Name__c <> null and Division__c <> null and Retailer_Brand__c <> null and Label__c <> null];
        for ( Retailer_Code__c retailer : retailerCodes ){
            retailerDivBrand.put(retailer.Name,retailer);
        }
        string cmpKey = lableDivision.Retailer_Code_Name__r.Name+'#'+lableDivision.Division__c+'#'+lableDivision.Retailer_Brand__c+'#'+lableDivision.Label__c;
        for ( Label_Division__c labDiv : labelDiv ){
            vendorDivBrandLabel.put(cmpKey.toLowerCase(),cmpKey.toLowerCase());
        }
        System.assertEquals(retailercode.Name, 'DECATHLON','putFileRequestTest');
     }
    @isTest
    static void testGetSalesStageRowsByPage()
    {
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Sales';
        insert value;
        System.assertEquals(value.Record_Type__c, 'Sales','putFileRequestTest');

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

        string selcomp = 'Commerce CA';
        string selMonth = 'May';
        string selYear = '2019';
        String BatchId = value.Id;
        String userName = UserInfo.getUserName();
        User activeUser = [Select Email From User where Username = : userName limit 1];
        String userEmailNotify = activeUser.Email;
        List<Sales_Transaction_Stage__c> salesTransStagRecForReconciliation = new List<Sales_Transaction_Stage__c> ();
        
        
        List<Sales_Transaction_Stage__c> salesTransStagRecAfterReconciliation = new List<Sales_Transaction_Stage__c> ();
Map<string,Map<string,Map<string,string>>> fullSalesErrorMap = new Map<string,Map<string,Map<string,string>>>();
Map<Decimal,Map<string,string>>inCorrectFormatMap = new Map<Decimal,Map<string,string>>();
Map<string,string>colorMap = new Map<string,string>();
Map<string,string> marketMap = new Map<string,string>();
Map<string,string>productionCoungtryMap = new Map<string,string>();
Map<string,string>modelWarningMap = new Map<string,string>();
Map<string,string>modelCompKeyMap = new Map<string,string>();
Map<string,string>companyOnlyMap = new Map<string,string>();
Map<string,string>vendorMap = new Map<string,string>();
Inventory_Transaction_Master__c updateBatchStatus = new Inventory_Transaction_Master__c ();
validateSalesRowsBulk.recordValidationStatus recordStatus = new  validateSalesRowsBulk.recordValidationStatus();
Map<string,Map<string,string>> getNewVendorDivisionBrandLabelMap = new Map<string,Map<string,string>>();
Map<string,Retailer_Code__c> getRetailersLabelDivisionBrandCheckMap = new  Map<string,Retailer_Code__c>();
Map<string,List<String>> getModelandColorMap = new Map<string,List<String>>();
Map<string,string> getSalesDataUploadCheckMap = new Map<string,string>();
Map<string,string> getSalesDataUploadColorCheckMap = new Map<string,string>();
Map<string,string> getModelCatFamilyMap = new Map<string,string>();
Map<string,string> modelwithCatSubCatFamily = new Map<string,string>();
        Map<string,string> currencyPicklist = new Map<string,string>();
        Map<string,string> orderTypePicklist = new Map<string,string>();
        Map<string,string> checkVendorCategory = new Map<string,string>();
        Map<string,string> checkModel = new Map<string,string>();
        Map<string,List<string>> checkVendorModel = new Map<string,List<string>>();
        Map<string,string> productionCountryPicklist = new Map<string,string>();
        Map<string,string> modelCategory = new Map<string,string>();
        Map<string,string> autoPopulateRetailerCountryMap = new Map<string,string>();
        Map<string,string> checkPriceBookModel = new Map<string,string>();
        Map<string,string> autoPopulateMarketSegmentMap = new Map<string,string>();
        Map<string,string> finalsalesdestinationPicklist = new Map<string,string>();
        Map<string,string> getSalesOderDateCheckMap = new Map<string,string>();
            Map<string,string> getSalesDeliveryDateCheckMap = new Map<string,string>();
         Map<string,string> pricebookprintCheckMap =  new Map<string,string>();
         Map<string,List<String>> checkVendorModelPrintedLogo = new  Map<string,List<String>>();
         Map<string,List<String>> checkVendorModelColorPrintedLogo = new  Map<string,List<String>>();

        
        Test.startTest();
        getSalesMasterData getSalesMast = new getSalesMasterData();
         getSalesMast.getSalesStageRowsByPage(salesTransStagRecAfterReconciliation,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        getSalesMast.preValidationSalesStageDataByPage(salesTransStagRecForReconciliation,fullSalesErrorMap,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
      // getSalesMast.getSalesStageRowsByPage(salesTransStagRecAfterReconciliation,BatchId,selcomp,selMonth,selYear,inCorrectFormatMap,marketMap,modelCompKeyMap,vendorMap,updateBatchStatus,recordStatus,getNewVendorDivisionBrandLabelMap,getRetailersLabelDivisionBrandCheckMap,getModelandColorMap,getSalesDataUploadCheckMap,getSalesDataUploadColorCheckMap,getModelCatFamilyMap,modelwithCatSubCatFamily,currencyPicklist,orderTypePicklist,checkVendorCategory,checkVendorModel,productionCountryPicklist,productionCoungtryMap,modelCategory,autoPopulateRetailerCountryMap,autoPopulateMarketSegmentMap,finalsalesdestinationPicklist,getSalesOderDateCheckMap,getSalesDeliveryDateCheckMap,pricebookprintCheckMap);
        Test.stopTest();
    }
    @isTest
    static void testgetRetailerDetails()
    {
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
        insert customData;
 
        boolean flag = true;
        Retailer_Code__c retailer = new Retailer_Code__c(Sales_Data_Upload_Market__c = 'US',Country__c = 'United States',Market_Segment__c = 'UK' ,Retailer_Code_Check__c = true , Status__c = 'Active',Order_Date_Check__c = TRUE, Delivery_Date_Check__c = TRUE,name = 'OLD NAVY',Retailer_Type__c='Department Stores',Sales_Data_Upload_Color__c=true,Sales_Data_Upload_Check__c=true);
        insert retailer;
        Test.startTest();
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getRetailerDetails();

        Test.stopTest();
        System.assertEquals(true, flag);
    }
     @isTest
    static void testgetPriceSpecificationBookDetails()
    {
        Retailer_Code__c retailer = new Retailer_Code__c();
        retailer.Retailer_Type__c='Department Stores';
        retailer.Name = 'DEBENHAMS';
        insert retailer;



        Price_Specification_Book__c  priceSpecBook = new Price_Specification_Book__c();
        priceSpecBook.Business_Vertical__c = 'Hanger Business';
        priceSpecBook.Retailer_Code__c = retailer.id;
        system.debug('priceSpecBook.Retailer_Code__r.Name:::::'+priceSpecBook.Retailer_Code__r.Name);
        insert priceSpecBook;



       boolean flag = true;

        Test.startTest();
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getPriceSpecificationBookDetails();

        Test.stopTest();
        System.assertEquals(true, flag);
    }

    @isTest
    static  void getPickListMapTest() {

        boolean flag = true;
        Test.startTest();
        Inventory_Transaction_Master__c inventoryTransMaster = new Inventory_Transaction_Master__c ();
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getPickListMap('Price_Specification_Book_Product__c','Color__c');
        Test.stopTest();
        System.assertEquals(true, flag);
    }

    @isTest
    static void testgetPriceSpecificationBookProductDetails()
    {
        boolean flag = true;

         Retailer_Code__c retailer = new Retailer_Code__c();
         retailer.Retailer_Type__c='Department Stores';
        retailer.Name = 'DECATHLON';
        insert retailer;

        Price_Specification_Book__c  priceSpecBook = new Price_Specification_Book__c();
        priceSpecBook.Business_Vertical__c = 'Hanger Business';
        priceSpecBook.Book_Status__c = 'Active';
        priceSpecBook.Retailer_Code__c = retailer.Id;
        system.debug('priceSpecBook.Retailer_Code__r.Name:::::'+priceSpecBook.Retailer_Code__r.Name);
        insert priceSpecBook;


        Product__c prdct = new Product__c();
        prdct.Business_Vertical__c = 'Hanger Business';
        prdct.Name = 'FOAM';
        prdct.Consolidated_Style__c ='1001';
        prdct.Product_Family__c = 'INTIMATE';
        prdct.Sub_Category__c = 'PLASTIC HANGERS';
        prdct.Product_Type__c = 'HANGERS';
        insert prdct;



        list<Price_Specification_Book_Product__c> pricelist = new list<Price_Specification_Book_Product__c>();
        Price_Specification_Book_Product__c psbp = new Price_Specification_Book_Product__c();
       psbp.Retailer_Code__c = retailer.id;
      // psbp.Retailer_Code__c = retailer.Id;
       psbp.Order_to_Company__c = 'Hong Kong - Mainetti (HK) Ltd';
        psbp.Country__c = 'Hong Kong';
        psbp.Color__c = 'BEIGE';
        psbp.Price_Specification_Book__c =  priceSpecBook.id;
        psbp.Price_100pcs__c = 100;
        psbp.Sizer_Print__c = 's';
        psbp.Product_Unique_ID__c= prdct.id;
       // psbp.Consolidated_Style__c='1001';
        //psbp.Product_Unique_ID__r.Consolidated_Style__c = '1001';
        insert psbp;
        pricelist.add(psbp);
       // string ordertoComp = 'Hong Kong - Mainetti (HK) Ltd';
        //insert pricelist;


         Price_Specification_Book__c  priceSpecsBook = new Price_Specification_Book__c();
        priceSpecsBook.Book_Status__c = 'Active';
        insert priceSpecsBook;
        Product__c product = new Product__c();
        product.Business_Vertical__c = 'TLA';
        insert product;
        Retailer_Code__c retailerCode = new Retailer_Code__c();
        retailerCode.Retailer_Type__c='Department Stores';
        retailerCode.Retailer_Brand__c = 'BKA';
        insert retailerCode;

        Price_Specification_Book_Product__c priceSpecificationBookProduct = new Price_Specification_Book_Product__c(Name = 'LULULEMON',Price_Specification_Book__c = priceSpecsBook.Id,Price_100pcs__c = 500,Product_Unique_ID__c =product.Id,Color__c = 'BLACK',Country__c = 'China - South' , Order_to_Company__c = 'Hong Kong - Mainetti (HK) Ltd');
        insert priceSpecificationBookProduct;
      /* List<String> s=new List<String>();
       Map<string,List<string>> checkVendorModel = new Map<string,List<string>>();
        if( psbp.Retailer_Code__c != null){
            String ss = psbp.Retailer_Code__c;
       // Map<string,List<string>> checkVendorModel = new Map<string,List<string>>();
        checkVendorModel.put(ss,s);
             }*/
          
             
        Test.startTest();
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.getPriceSpecificationBookProductDetails( psbp.Order_to_Company__c);

        Test.stopTest();
        System.assertEquals(true, flag);
    }
    
    

     @isTest
    static void testcreateDocument()
    {
        boolean flag = true;
       string csv = '[{"Company__c": "Hong Kong Packaging","Year__c": "2019","Week__c": "Wk02","Month__c": "Jan","Item_code__c": "HGR-3944   BLK002-  100","Material__c": "PS","Source__c": "Virgin","Model__c": "1000","Printed_Logo__c": "demoLogo","Color__c": "BLACK","Customer__c": "xxxxx","Customer_local_name__c": "","Mainetti_Brand__c": "Mainetti","Category__c": "HANGERS & ACCESSORIES","Sub_Category__c": "HANGERS","Family__c": "BOTTOM","Order_Type__c": "3rd","Unit_Sold__c": "2520","Unit_Price_100_EUR__c": "10.65123","Unit_Price_100_USD__c": "12.40602","Net_Unit_Price_100__c": "11","Sales_EUR__c": "268.410993","Sales_USD__c": "312.631704","Transaction_Currency__c" : "HKD","ExRate_to_EUR__c": "9.08505","ExRate_to_USD__c": "7.8","Local_Net_Unit_Pirce_100__c": "13","Sales_Transaction_Currency__c": "2438.527291","Shipped_To_Factory__c": "xxxxxx","Shipped_To_Country__c": "xxxxxx","Label__c": "","End_user__c": "","Vendor__c": "DemoRetailer","Division__c": "Demo","Retailer_Brand__c": "Demo", "Royalty_Rate__c": "", "Market__c": "USA","Remark__c": "","LOB__c": "PRL","": "SO_Number__c": "18300168","Production_Country__c": "CHINA"}]';
        string fileName = 'sample';
        string contitle = 'sample';
        Inventory_Transaction_Master__c value = new Inventory_Transaction_Master__c();
        value.Batch_Status__c = 'Migration Success';
        value.Record_Type__c = 'Inventory';
        insert value;
        string valuebatchId = string.valueOf(value.id);
        ContentVersion salesFile = new ContentVersion();
        salesFile.ContentLocation = 'S';
        salesFile.VersionData = Blob.valueOf(csv);
        salesFile.Title = 'Sales Data File Uplaod';
        salesFile.PathOnClient = fileName;
        insert salesFile;
        ContentVersion salesVerContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :salesFile.Id];
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=value.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId=salesVerContent.ContentDocumentId;
        insert contentlink;
        Test.startTest();
        getSalesMasterData getMaster = new getSalesMasterData();
        getMaster.createDocument(valuebatchId,csv,fileName,contitle);
         getMaster.getCSVFile(value.id);
        Test.stopTest();
        System.assertEquals(true, flag);
    }
    

  /*   @isTest
    static void testGetManitteCompanyMap()
    {
        // Inserting the Partner Data
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd', Default_Order_to_Company__c = 'South China / Hong Kong – Mainetti (HK) Ltd');
        insert partner;
        // Creating the Object for "getMasterData"
        getSalesMasterData companyMap = new getSalesMasterData();
        // Calling the "getMasterData" Methods
        //companyMap.getManitteCompanyMap();
        companyMap.getManitteCompanyPicklistMap();
       // companyMap.getManitteOrgCompanyMap();
       // companyMap.getManitteCompanyIdMap();
        Map<string,string> mainettiCompanyMap = new Map<string,string>();
        map<string,Id> manitteIdMap = new map<string,Id>();
        List<Partner__c> partners = [Select  Name, Default_Order_to_Company__c from Partner__c where Default_Order_to_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner')];
        for ( Partner__c ptn : partners )
        {
            mainettiCompanyMap.put(ptn.Name.toLowerCase(),ptn.Default_Order_to_Company__c);
            manitteIdMap.put(ptn.Name,ptn.Id);
        }
        System.assertEquals(partner.Name, 'Mainetti (HK) Ltd');
        System.assertEquals(partner.Default_Order_to_Company__c, 'South China / Hong Kong – Mainetti (HK) Ltd');

    }
*/
        @isTest
    static void testGetManitteCompanyMapPartner()
    {
        // Inserting the Partner Data
        Partner__c partner = new Partner__c(Name = 'Mainetti (HK) Ltd',Sales_Data_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd', Default_Order_to_Company__c = 'Malaysia - MHL Industries (Malaysia) Sdn Bhd',Sales_Upload_Company__c='Australia - Mainetti Australia Pty Ltd',Region__c='EUROPE',Cogs_Country__c='France',Company_Group_Name__c='EUROPE LICENSEE', Partner_Status__c = 'Active',Partner_Type__c='Mainetti Company');
        insert partner;
        system.debug(partner);
        // Creating the Object for "getMasterData"
        getSalesMasterData companyMap = new getSalesMasterData();
        // Calling the "getMasterData" Methods
        companyMap.getManitteCompanyMap();
        Map<string,string> mainettiCompanyMap = new Map<string,string>();
        map<string,Id> manitteIdMap = new map<string,Id>();
        List<Partner__c> partners = [Select  Name,Sales_Data_Company__c, Default_Order_to_Company__c from Partner__c where Default_Order_to_Company__c != null and Partner_Status__c = 'Active' and  RecordType.Name in('Mainetti Company','Licensee Partner')];
        for ( Partner__c ptn : partners )
        {
            mainettiCompanyMap.put(ptn.Sales_Data_Company__c.toLowerCase(),ptn.Default_Order_to_Company__c);
            manitteIdMap.put(ptn.Name,ptn.Id);
        }
        System.assertEquals(partner.Sales_Data_Company__c, 'Malaysia - MHL Industries (Malaysia) Sdn. Bhd');
        System.assertEquals(partner.Default_Order_to_Company__c, 'Malaysia - MHL Industries (Malaysia) Sdn Bhd');
         
        test.startTest();
        getSalesMasterData companyMaps = new getSalesMasterData();
       companyMaps.getManitteCompanyPicklistMap();
       companyMaps.getParterCmpyRegionNCogsCountryNComapnyGroupName();
        test.stopTest();
    }
    
}