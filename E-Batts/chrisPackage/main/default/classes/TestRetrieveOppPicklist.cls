@IsTest
public class TestRetrieveOppPicklist 
{
	static testmethod void testGetPicklistValues()
    {
        
        integer picklistSize = RetrieveOppPicklist.getPicklistValues().size();

		// 10 stages in picklist
		
        System.assertEquals(picklistSize, 10);
    }
    
    
    static testmethod void testUpdateOpportunity()
    {
        
        Account acc = new Account(Name = 'John Test Doe');
        insert acc;
        Opportunity opp = new Opportunity(Name=acc.Name + ' oppTest', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=acc.Id);
        insert opp;
        Opportunity opp2 = new Opportunity(Name=acc.Name + ' opp2Test2', StageName='Prospecting', CloseDate=System.today().addMonths(1), AccountId=acc.Id);
        insert opp2;
        
        RetrieveOppPicklist.updateOpportunity(opp.Id, 'Qualification');
		
        //System.assertEquals(opp.StageName, 'Qualification');
    }
}