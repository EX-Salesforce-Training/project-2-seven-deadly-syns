@istest
public class QTTriggerTestBU {
@istest static void testOrderSubmitfromQuote(){
        //creating test Account
        Account t= new Account(Name = 'Now Account');
        insert t;
        //creating test opportunity
        Opportunity o = new Opportunity (
        Name= 'SELL New Account',
        AccountId= t.Id,
        Amount=150000,
        StageName='Sit Down Info Session',
        Type='New Customer',
        CloseDate= Date.newInstance(2021, 09, 25));
        insert o;
        //creating test product 1 of 2
        
        Product2 pA = new Product2 ( Name='EBATT-GALAXY-HEV', IsActive=true);
        insert pA;
    
        //creating test product 2 of 2
        Product2 pB = new Product2 (Name='EBATT-IGNITE-SUPPL', IsActive=true);
        insert pB;
    
        //creating  test contract 
        Contract c= new Contract ( Name='Now Account Contract',
                                   AccountId=t.Id,
                                   StartDate=Date.newInstance(2021, 12, 30),
                                   Status='Draft');
        insert c;
    
        //creating standard pricebook
        Pricebook2 stdpbk= new Pricebook2 (Id=Test.getStandardPricebookId(), IsActive=true);
        update stdpbk;
        //creating  standard price for product 1 of 2
        PricebookEntry stdpeA= new PricebookEntry ( Pricebook2Id=stdpbk.Id, Product2Id=pA.Id,UnitPrice=4500);
        insert stdpeA;
    
        //creating standard price for product 2 of 2
        PricebookEntry stdpeB= new PricebookEntry ( Pricebook2Id=stdpbk.Id, Product2Id=pB.Id,UnitPrice=2000);
        insert stdpeB;
    
        //creating custom pricebook
        Pricebook2 pbk= new Pricebook2 (Name= 'New Standard', IsActive=true);
        insert pbk;
        
        //creating custom pricebookentry for product 1 of 2
        PricebookEntry peA =new PriceBookEntry ( Pricebook2Id=pbk.Id,
                                                 Product2Id=pA.Id,
                                                 UnitPrice=4500,
                                                 IsActive=true
                                                 );
        insert peA;
        
        //creating custom pricebookentry for product 2 of 2
        PricebookEntry peB =new PriceBookEntry ( Pricebook2Id=pbk.Id,
                                                 Product2Id=pB.Id,
                                                 UnitPrice=2000,
                                                 IsActive=true
                                                 );
        insert peB;
        
        
        
        //creating test quote
        Quote qt = new Quote (Name='Galaxy2',
                              OpportunityId=o.Id,
                              ContractId=c.Id,
                              Pricebook2Id=pbk.Id,
                              Status='Accepted',
                              Create_Order__c=false);
        insert qt;
    
        //creating test quotelineitems for test quote 
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
        
                             // updating custom field to create order
                             qt.Create_Order__c=true;
                             
        
        
        
        Test.startTest();
        //Attempting Save without IsSyncing=true
        Database.SaveResult srqt = Database.update(qt, false);
        
        Test.stopTest();
    
       //Expecting error and comparing message
    system.assertEquals('Cannot create order on a quote that is not Synced', srqt.getErrors()[0].getmessage());
    If (srqt.getErrors().size() > 0){system.debug(srqt.getErrors()[0].getmessage());}
       
     
               
        
       
            }

}