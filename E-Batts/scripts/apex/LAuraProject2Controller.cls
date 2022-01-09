public with sharing class LAuraProject2Controller {
    @Auraenabled
    public static List<Account> getAccount(Id userId){
             
        List <User> CommUser= [SELECT AccountId FROM User WHERE Id=:userId];
        system.debug(CommUser);
        List <Account> acctlist= [SELECT Name, Id FROM Account];
        List<Account> accountDetail= new List <Account>();
        String s= '%Systems%';
        List <Account> acc= [SELECT Name, Id FROM Account WHERE Name LIKE :s];
        
        
        for (User u:CommUser){            
            for (Account a: acctlist){
                if (u.AccountId == a.Id){
                    accountDetail.add(a);
                    System.debug(a.Id);
                    System.debug(a.Name);
                    
                } else {for (Account ac:acc){system.debug(ac.Name); system.debug(ac.Id);return acc;}}
                
                
                
            }
            
        }for (Account r:accountDetail){system.debug(r.Name); system.debug(r.Id);}return accountDetail;
    
    }
    
    
     @Auraenabled
     public static void createRecord(String qty,String aname,Id prodid,Date dated,String prodname,Id acId){
     Integer Q = integer.ValueOf(qty);
     List<RFQ__c> newrec= new List<RFQ__c>();                                           
     List<RFQLine__C> newrecline = new List<RFQLine__c>();
        
        newrec.add(new RFQ__C(Name=aname + '_RFQ',Deadline__c=dated,AccountName__c=aname, AccountId__c=acId));
        try {insert newrec;}catch(DMLexception e){system.debug(e.getMessage());}finally{
        List<RFQ__c> rec= [SELECT Id, Name, Deadline__c, AccountName__c, AccountId__c FROM RFQ__c WHERE Deadline__c=:dated AND AccountId__c=:acId];
        for(RFQ__c r:rec){
            newrecline.add(new RFQLine__c(Name=aname + '_RFQLine',Product__c=prodId,ProductName__c=prodname,Qty__c=Q,RFQ__c=r.Id));
        } try{insert newrecline;}catch(DMLexception e){system.debug(e.getMessage());}
        
        }
     }
}