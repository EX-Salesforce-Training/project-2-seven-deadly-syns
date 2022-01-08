public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static list<Product2> getAllProducts()
    {
        list<Product2> products = [SELECT Name, ProductCode FROM Product2];
        products = [SELECT Id, Name, ProductCode FROM Product2];
        return products;
    }
}