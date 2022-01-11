@istest
private class TestOppController {
    @istest static void testgetOppData(){
        Account a = new Account (Name='New Account');
        insert a;
        Account b= new Account (Name='Old Account');
        Opportunity oA = new Opportunity (
        Name= 'SELL New Account',
        AccountId= a.Id,
        Amount=150000,
        StageName='Prospecting',
        Type='New Customer',
        CloseDate= Date.newInstance(2022, 09, 25));
        insert oA;
        Opportunity oB = new Opportunity (
        Name= 'SELL Old Account',
        AccountId= b.Id,
        Amount=150000,
        StageName='Prospecting',
        Type='New Customer',
        CloseDate= Date.newInstance(2022, 09, 25));
        insert oB;
        Opportunity oC = new Opportunity (
        Name= 'BUY New Account',
        AccountId= a.Id,
        Amount=150000,
        StageName='Prospecting',
        Type='New Customer',
        CloseDate= Date.newInstance(2022, 09, 25));
        insert oC;
        
      List<Opportunity> OppA=OppController.getOppData('New Account');
      List<Opportunity> OppB=OppController.getOppData('Old Account');
        
        List<Opportunity> OppoA=[SELECT Id FROM Opportunity WHERE Id IN :OppA AND Id=:oA.Id];
        List<Opportunity> OppoB=[SELECT Id FROM Opportunity WHERE Id NOT IN :OppA AND Id=:oB.Id];
        List<Opportunity> OppoC=[SELECT Id FROM Opportunity WHERE Id IN :OppA AND Id=:oC.Id];
        
        system.assertEquals(1,OppoA.size());
        system.assertEquals(1,OppoB.size());
        system.assertEquals(1,OppoC.size());
        system.assertEquals(1,OppB.size()+1);
       
        
        
        
    }

}