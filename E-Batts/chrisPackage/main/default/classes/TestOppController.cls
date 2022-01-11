@IsTest
private class TestOppController 
{

    
	static testmethod void testGetOppData()
    {
        
        Account acc = new Account(Name = 'John Test Doe');
        insert acc;
        Opportunity opp = new Opportunity(Name=acc.Name + ' oppTest', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=acc.Id);
        insert opp;
        Opportunity opp2 = new Opportunity(Name=acc.Name + ' opp2Test2', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=acc.Id);
        insert opp2;
        
        integer oppSize = OppController.getOppData('John Test Doe').Size();
        
        
        System.assertEquals(oppSize, 2);
		
    }
    
    static testmethod void testGetOppDataNull()
    {   
        System.assertEquals(OppController.getOppData(null), null);
    }
    
}