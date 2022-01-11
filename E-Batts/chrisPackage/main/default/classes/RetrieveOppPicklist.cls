public with sharing class RetrieveOppPicklist 
{
   	@AuraEnabled(cacheable=true)
    public static list<string> getPicklistValues()
    {
        // grabs all possible  picklists for opportunities' stage
        Schema.DescribeFieldResult objFieldDescribe = opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> lstPickListValues = objFieldDescribe.getPickListValues();
        List<string> picklistString = new List<string>();

        // add each picklist into a list
        for (Schema.PicklistEntry objPickList : lstPickListValues) 
        {
            picklistString.add(objPicklist.getLabel());
        }
        return picklistString;
    }
    
    @AuraEnabled
	public static void updateOpportunity(string recordId, string picklistName)
    {
        // runs an update of the opportunity record to change the stage when the submit button is chosen
        Opportunity opp = [SELECT StageName FROM Opportunity WHERE Id=:recordId];
        opp.StageName = picklistName;
        update opp;
        //return opp;
	}
}