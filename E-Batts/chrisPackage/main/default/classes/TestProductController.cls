@IsTest
public class TestProductController 
{
	static testmethod void testGetAllProducts()
    {
        integer beginningSize = ProductController.getAllProducts().size();
        
        Product2 prod = new Product2(Name = 'testName1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'test2Name2');
        insert prod2;
        
        integer afterSize = ProductController.getAllProducts().size();
        
        //System.assert(beginningSize > afterSize);
		
    }
}