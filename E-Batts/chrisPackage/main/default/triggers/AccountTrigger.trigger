trigger AccountTrigger on Account (before delete) 
{
	for(Account acc: [SELECT id from Account WHERE id IN (SELECT AccountId FROM Opportunity) AND id IN:trigger.old])
    {
        trigger.oldMap.get(acc.id).addError('You can not remove an account with active opportunities still connected to it.');
    }
}