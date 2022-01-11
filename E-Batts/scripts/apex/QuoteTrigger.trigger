trigger QuoteTrigger on Quote (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    Switch on Trigger.OperationType {
        When BEFORE_INSERT{
          
        }
        When BEFORE_UPDATE{
           QuoteTriggerHelperBU.validQuoteUpdate(Trigger.New);  
        }
        When BEFORE_DELETE{
              
        }
        When AFTER_INSERT {
            
        }
        When AFTER_UPDATE {
             QuoteTriggerHelperAU.createOrder (Trigger.New);
        } 
        When AFTER_DELETE {
                 
        }
        When AFTER_UNDELETE{
            
        }
    }

}