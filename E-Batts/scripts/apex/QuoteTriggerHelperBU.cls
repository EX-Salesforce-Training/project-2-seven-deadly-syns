public class QuoteTriggerHelperBU {
    public static void validQuoteUpdate(Quote[] isItSynced){
        /*In Trigger.new passed as isItSynced, before Save prevent save of all quotes with Create_Order__c checkbox checked on a non-synced quote*/
        for(Quote q:isItSynced){
            if(q.Create_Order__c==true && q.IsSyncing==false){q.addError('Cannot create order on a quote that is not Synced');}
        }
    }

}