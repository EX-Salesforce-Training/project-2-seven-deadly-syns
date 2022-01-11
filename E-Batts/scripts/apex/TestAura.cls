@istest
private class TestAura {
    @istest(SeeAllData=true) static void testgetAccount(){       
                         
     
        Account A= LAuraProject2Controller.getAccount('0055f000007W0cGAAS')[0];
        system.assertEquals('PLUTO CUSTOM VEHICLES', A.Name);
        Account B=LAuraProject2Controller.getAccount('0055f000007U0H4AAK')[0];
        system.assertEquals('Systems Admin Demo', B.Name);
        
    }
    
    @istest(SeeAllData=false) static void testcreateRecord(){
        Account t= new Account(Name = 'Now Account');
        insert t;
        Product2 pA = new Product2 ( Name='EBATT-GALAXY-HEV', IsActive=true);
        insert pA;
        Date dated=Date.newInstance(2022, 02, 02);
        String qty='3';
        Integer Q = integer.ValueOf(qty);
     List<RFQ__c> newrec= new List<RFQ__c>();                                           
     List<RFQLine__C> newrecline = new List<RFQLine__c>();
        
        newrec.add(new RFQ__C(Name=t.name + '_RFQ',Deadline__c=dated,AccountName__c=t.name, AccountId__c=t.Id));
        try {insert newrec;}catch(DMLexception e){system.debug(e.getMessage());}finally{
        List<RFQ__c> rec= [SELECT Id, Name, Deadline__c, AccountName__c, AccountId__c FROM RFQ__c WHERE Deadline__c=:dated AND AccountId__c=:t.Id LIMIT 1];
        for(RFQ__c r:rec){
            newrecline.add(new RFQLine__c(Name=t.Id + '_RFQLine',Product__c=pA.Id,ProductName__c=pA.Name,Qty__c=Q,RFQ__c=r.Id));
        } try{insert newrecline;}catch(DMLexception e){system.debug(e.getMessage());}
        

        system.assert(newrec[0] !=null);
        system.assert(newrecline[0]!=null);
                
        
        }  
        
        
        
    }

    
   
}