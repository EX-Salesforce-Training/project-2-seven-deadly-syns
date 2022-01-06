public class QuoteTriggerHelperAU {
    public static void createOrder(Quote[] orderChecked){
        
        /*Create a list of Quoteline Items that are related to Quotes in Trigger.new that is passed in as orderChecked with Create order checkbox checked*/
        QuoteLineItem[] orderCheckedItem= [SELECT Id, QuoteId, PricebookEntryId, Quantity, UnitPrice, Discount, Product2Id, ListPrice, Subtotal, TotalPrice FROM QuoteLineItem WHERE Quote.Create_Order__c=true AND QuoteId IN :orderChecked ];
        
        /*Shell lists for Order and related OrderItems that will be created*/
        List <Order> matchingOrder = new List<Order> ();
        List<OrderItem> matchingOrderItem = new List<OrderItem>();
        
         /*for each quote in after Update Trigger.new, pick out ones with Create Order checkbox checked and create matching order and then orderitems*/
        for(Quote t:orderChecked){
                 if (t.Create_Order__c==true && t.IsSyncing==true && t.AccountId <> null && t.ContractId <> null && t.OpportunityId <> null && t.Pricebook2Id <> null){
                     
                 matchingOrder.add(new Order (Name=t.Name,
                                             Pricebook2Id=t.Pricebook2Id,
                                             AccountId=t.AccountId,
                                             Quote__c=t.Id,
                                             ContractId=t.ContractId,
                                             EffectiveDate=date.today(),
                                             OpportunityId=t.OpportunityId,
                                             Status='Draft'));                                 
              
                 }}try{ insert matchingOrder;}catch(DmlException e){system.debug(e.getMessage());}finally{
          Order[] orderList=[SELECT Id, Name, AccountId, Quote__c, ContractId,EffectiveDate,OpportunityId,Status FROM Order WHERE EffectiveDate=:Date.today() AND Status='Draft'];
        
           for (QuoteLineItem i:orderCheckedItem){
            if (i.Discount==null){i.Discount=0;}
                        
            for(Order o:orderList){
                if(i.QuoteId==o.Quote__c && i.PricebookEntryId <> null && i.Product2Id <> null && i.Quantity <> null && i.Discount >=0 ){
                    
                    matchingOrderItem.add(new OrderItem(Product2Id=i.Product2Id,
                                                        OrderId= o.Id,
                                                        PricebookEntryId=i.PricebookEntryId,
                                                        Quantity=i.Quantity,
                                                        ListPrice=i.ListPrice,
                                                        UnitPrice=i.ListPrice-((i.ListPrice*i.Discount)/100)
                                                        ));    
                }
                
            }
        }try{insert matchingOrderItem;}catch(DmlException e){system.debug(e.getMessage());}
                 }          
    }
}
