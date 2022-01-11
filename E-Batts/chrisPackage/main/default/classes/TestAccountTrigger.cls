@IsTest
private class TestAccountTrigger 
{
	@IsTest static void testDeleteAccountWithOpportunities()
    {
        Account acc = new Account(Name = 'testName');
        insert acc;
        Opportunity opp = new Opportunity(Name=acc.Name + ' oppTest', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=acc.Id);
        insert opp;
        
        Test.startTest();
        	Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();
        
        //System.assert(!result.isSuccess());
    }
}