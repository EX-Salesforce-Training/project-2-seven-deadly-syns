trigger updateProductCodes on Product2 (before insert) {
    // add L- before product code for Lithium-ion batteries
    // N- for Nickel-metal hydride batteries, Lead-acid batteries, etc. 
       
     for (Product2 prod : Trigger.new){
         if(prod.Family.contains('Lithium')){
            prod.ProductCode = 'Li- '+ prod.ProductCode;
        }
         if(prod.Family.contains('Nickel')){
            prod.ProductCode = 'Ni- '+ prod.ProductCode;
        }
        if(prod.Family.contains('Lead')){
            prod.ProductCode = 'Pb- '+ prod.ProductCode;
        }
        if(prod.Family.contains('Ultracapacitors')) {
             prod.ProductCode = 'U- '+ prod.ProductCode; 
            } 
         } 
   }          
    
   
        
       

       
       /*  switch on Trigger.OperationType {
        when BEFORE_INSERT{
            triggerHelper.updateCodes(Trigger.new);
        }
      }  
when BEFORE_UPDATE{
         
            for (Product2 prod : Trigger.old){
                if (prod.ProductCode.contains('Li')) {
                    prod.ProductCode.remove('Li');
                    triggerHelper.updateCodes(Trigger.new);
                }
            }
        }}

public class triggerHelper {
     public static void updateCodes(List<Product2> products){
       for (Product2 prod : products){
         if(prod.Type_of_Batteries__c.contains('Lithium')){
            prod.ProductCode = 'Li- '+ prod.ProductCode;
        }
         if(prod.Type_of_Batteries__c.contains('Nickel')){
            prod.ProductCode = 'Ni- '+ prod.ProductCode;
        }
        if(prod.Type_of_Batteries__c.contains('Lead')){
            prod.ProductCode = 'Pb- '+ prod.ProductCode;
        }
        if(prod.Type_of_Batteries__c.contains('Ultracapacitors')) {
             prod.ProductCode = 'U- '+ prod.ProductCode; 
            }
         }          	
   }          
 }    
    
 

        
    
    
  /*  List <String> preCode = new List <String> {'Li', 'Ni', 'Pb', 'U'};
    
    	Schema.DescribeFieldResult fieldResult = Product2.Type_of_Batteries__c.getdescribe();
    	List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
    for (Product2 prod : products){
    	//for (String c : preCode){
       
       //	for (Schema.PicklistEntry value : picklistValues){             
            for (integer h=0; h<=picklistValues.size(); h++){
                   // integer i = preCode.indexOf(c);
                    //i == picklistValues.indexOf(value)
                    for (integer i=0; i<preCode.size(); i++){
                   // Schema.PicklistEntry value = new Schema.PicklistEntry();
                    if (prod.Type_of_Batteries__c == picklistValues[h].getValue()){
                        try {i = h;
                             prod.ProductCode = preCode.get(i) + prod.ProductCode;}
                        catch (Exception e){system.debug(e);}
                    }  
            /*    if (prod.Type_of_Batteries__c == value.getValue()){
                        integer index = picklistValues.indexOf(value);
                        prod.ProductCode = preCode.get(index) + prod.ProductCode;
                    }  
            }
        }
    }
    }*/