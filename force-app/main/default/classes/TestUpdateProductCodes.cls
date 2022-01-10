@isTest
public class TestUpdateProductCodes {
    
    @isTest
    public static void updateProductCodes(){
        
        //create test data
        List<Product2> productList = new List<Product2>();
        Product2 prod1 = new Product2(Name = 'Product25', ProductCode = '025', 
                                      Family = 'Lithium-ion batteries');
        Product2 prod2 = new Product2(Name = 'Product26', ProductCode = '026',
                                     Family = 'Nickel-metal hydride batteries'); 
        Product2 prod3 = new Product2(Name = 'Product27', ProductCode = '027',
                                     Family = 'Lead-acid batteries');
        Product2 prod4 = new Product2(Name = 'Product28', ProductCode = '028',
                                     Family = 'Ultracapacitors');
        
        productList.add(prod1);
        productList.add(prod2);
        productList.add(prod3);
        productList.add(prod4);
        
        insert productList;
       /* Boolean expected = prod1.ProductCode.contains('Li- 025') ? true : false;
        system.assertEquals(expected, true);
        
        System.assertEquals(prod1.contains('Li- 025'), true);
       // system.assert(prod1.contains('Li- 025'));*/
    }

}