@isTest
public class QTTriggerTestAU {
 
    @istest static void testQuoteOrder(){
        //creating Test Account
        Account t= new Account(Name = 'Now Account');
        insert t;
        //creating Test Opportunity
        Opportunity o = new Opportunity (
        Name= 'SELL New Account',
        AccountId= t.Id,
        Amount=150000,
        StageName='Sit Down Info Session',
        Type='New Customer',
        CloseDate= Date.newInstance(2021, 09, 25));
        insert o;
        
        //Creating Test Product 1 of 2
        Product2 pA = new Product2 ( Name='EBATT-GALAXY-HEV', IsActive=true);
        insert pA;
        
        //Creating Test Product 2 of 2
        Product2 pB = new Product2 (Name='EBATT-IGNITE-SUPPL', IsActive=true);
        insert pB;
        
        //Creating Test Contract
        Contract c= new Contract ( Name='Now Account Contract',
                                   AccountId=t.Id,
                                   StartDate=Date.newInstance(2021, 12, 30),
                                   Status='Draft');
        insert c;
        
        //Creating Test Standard Pricebook
        Pricebook2 stdpbk= new Pricebook2 (Id=Test.getStandardPricebookId(), IsActive=true);
        update stdpbk;
        
        //Creating Test Std Price for the 2 products
        PricebookEntry stdpeA= new PricebookEntry ( Pricebook2Id=stdpbk.Id, Product2Id=pA.Id,UnitPrice=4500);
        insert stdpeA;
        PricebookEntry stdpeB= new PricebookEntry ( Pricebook2Id=stdpbk.Id, Product2Id=pB.Id,UnitPrice=2000);
        insert stdpeB;
        
        //Creating Test Custom Pricebook
        Pricebook2 pbk= new Pricebook2 (Name= 'New Test Pricebook', IsActive=true);
        insert pbk;
        
        //Creating Test Custom Pricebook entries from Std for the 2 Test Products
        PricebookEntry peA =new PriceBookEntry ( Pricebook2Id=pbk.Id,
                                                 Product2Id=pA.Id,
                                                 UnitPrice=4500,
                                                 IsActive=true
                                                 );
        insert peA;
        
        PricebookEntry peB =new PriceBookEntry ( Pricebook2Id=pbk.Id,
                                                 Product2Id=pB.Id,
                                                 UnitPrice=2000,
                                                 IsActive=true
                                                 );
        insert peB;
        
        
        
        //Creating Test Quote
        Quote qt = new Quote (Name='Galaxy2',
                              OpportunityId=o.Id,
                              ContractId=c.Id,
                              Pricebook2Id=pbk.Id,
                              Status='Accepted',
                              Create_Order__c=false);
        insert qt;
        
        //Creating 2 QuotelineItems for the Test Quote 1 of each Product
        QuoteLineItem qlA = new QuoteLineItem(
                               PricebookEntryId=peA.Id,
                               QuoteId=qt.id,
                               Product2Id=pA.Id,
                               Discount=20,
                               Quantity=10,
                               UnitPrice=peA.UnitPrice);
        insert qlA;
       
        QuoteLineItem qlB = new QuoteLineItem(
                               PricebookEntryId=peB.Id,
                               QuoteId=qt.id,
                               Product2Id=pB.Id,
                               Discount=10,
                               Quantity=10,
                               UnitPrice=peB.UnitPrice);
        insert qlB;
        
        //creating order by checking the Create Order checkbox 
                              qt.Create_Order__c=true;
       //setting read only IsSyncing to true by setting Opp field SyncedQuoteId to QuoteId
                               o.SyncedQuoteId=qt.Id;
        
                               update o;
        
        
        
        Test.startTest();
        
        //Save after checking checkbox for Create Order
        
        Database.SaveResult srqt = Database.update(qt, false);
        
        Test.stopTest();
        
        //Checking if related order has been created by soQL generated Test Order and OrderItem
        Order ord = [SELECT Id, Quote__c, TotalAmount FROM  Order WHERE Quote__c = :qt.Id LIMIT 1];
        OrderItem ori = [SELECT Id, OrderId, UnitPrice FROM OrderItem WHERE OrderId=:ord.Id LIMIT 1];
        
        //Check if test objects created are null
        system.assert(ord != null);
        system.assert(ori != null);
        
        //Check if total amount of the order is as expected based on price and discount on the 2 QuoteLineItems
        system.assertequals(54000,ord.TotalAmount);
        
        //check if there are no errors
        system.assert(srqt.getErrors().size()==0); 
        
        
               
        
       
            }
}