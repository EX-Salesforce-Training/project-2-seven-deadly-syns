public with sharing class LWCtoAuraController {
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

}