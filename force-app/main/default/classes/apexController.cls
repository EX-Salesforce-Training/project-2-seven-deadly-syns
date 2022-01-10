public with sharing class apexController {

    // return a list of names, product codes and image url for each product type
    
    @AuraEnabled (cacheable = true)
    public static List<Product2> getLiProducts(){
        return [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Lithium-ion Batteries'];
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

