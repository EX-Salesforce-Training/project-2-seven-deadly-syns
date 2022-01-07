public with sharing class OppController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppdata(String aname){  
        if(aname!= null){
        system.debug(aname);
        String bname='%' + aname + '%' ;  
        system.debug(bname);
        List<Account> acc = [SELECT Id FROM ACCOUNT WHERE Name LIKE :bname];
        List<Opportunity> opplistshare = [SELECT Id, Name, Stage FROM Opportunity];
        List<Opportunity> returnOpp = new List<Opportunity> ();
        for (Opportunity o:opplistshare){
            for(Account a:acc){
                if(o.AccountId==a.Id){
                    returnOpp.add(o);
                }
            }
        }
        return returnOpp;} else {return null;}
    }

    }