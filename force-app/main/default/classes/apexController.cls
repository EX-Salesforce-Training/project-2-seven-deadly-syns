public with sharing class apexController {
    @AuraEnabled (cacheable = true)
    public static List<Product2> getLiProducts(){
        return [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Lithium-ion Batteries'];
      /*  return [SELECT Product2.name, Product2.ProductCode, Product2.DisplayURL, UnitPrice
        FROM PricebookEntry WHERE Product2.Family = 'Lithium-ion Batteries'];, (SELECT UnitPrice FROM PricebookEntries)*/
    }

    @AuraEnabled (cacheable = true)
    public static List<Product2> getNiProducts(){
        return [SELECT name, ProductCode, DisplayURL FROM Product2 WHERE Family = 'Nickel-Metal Hydride Batteries'];
    }

    @AuraEnabled (cacheable = true)
    public static List<Product2> getPbProducts(){
        return [SELECT name, ProductCode, DisplayURL FROM Product2 WHERE Family = 'Lead-Acid Batteries'];
    }

    @AuraEnabled (cacheable = true)
    public static List<Product2> getUProducts(){
        return [SELECT name, ProductCode, DisplayURL FROM Product2 WHERE Family = 'Ultracapacitors'];
    }

}

/*  public static List<Product2> getProducts() {
        if (Family = 'Lithium-ion Batteries'){
            return [SELECT name, ProductCode FROM Product2];
        }
        if (Family = 'Nickel-Metal Hydride Batteries'){
            return [SELECT name, ProductCode FROM Product2];
        } 
        if (Family = 'Lead-Acid Batteries'){
            return [SELECT name, ProductCode FROM Product2];
        }
        if (Family = 'Ultracapacitors'){
            return [SELECT name, ProductCode FROM Product2];
        }
    }*/
