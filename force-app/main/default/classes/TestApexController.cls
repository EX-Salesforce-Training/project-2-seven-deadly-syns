@isTest
public class TestApexController {
    
	@isTest
    public static void apexController(){
        
        // create test data for Li Products
        Product2 liProd = new Product2();
        liProd.Name = 'Test Li';
        liProd.Family = 'Lithium-ion Batteries' ;
        insert liProd;
        
        // call the method in controller
        try {
            apexController.getLiProducts();
        }
        catch(Exception e){}
        
        //get the list of Li products
        List<Product2> prodList = [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Lithium-ion Batteries'];
        
        //loop through list to get expected products
        for (Product2 p : prodList){
            Boolean expectedListLi = p.Name.contains('Test Li');
    		system.assertEquals(expectedListLi, true);        
    }
        
		//repeat the test for Ni products
        Product2 niProd = new Product2();
        niProd.Name = 'Test Ni';
        niProd.Family = 'Nickel-Metal Hydride Batteries' ;
        insert niProd;
        
        try {
            apexController.getNiProducts();
        }
        catch(Exception e){}
        
        List<Product2> prodListNi = [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Nickel-Metal Hydride Batteries'];
        
        for (Product2 p : prodListNi){
            Boolean expectedListNi = p.Name.contains('Test Ni');
    	system.assertEquals(expectedListNi, true);        
    }
        
        //repeat the test for Pb products
        Product2 pbProd = new Product2();
        pbProd.Name = 'Test Pb';
        pbProd.Family = 'Lead-Acid Batteries' ;
        insert pbProd;
        
        try {
            apexController.getPbProducts();
        }
        catch(Exception e){}
        
        List<Product2> prodListPb = [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Lead-Acid Batteries'];
        
        for (Product2 p : prodListPb){
            Boolean expectedListPb = p.Name.contains('Test Pb');
    		system.assertEquals(expectedListPb, true);        
    }
        
        //repeat the test for Ultra products
        Product2 uProd = new Product2();
        uProd.Name = 'Test U';
        uProd.Family = 'Ultracapacitors' ;
        insert uProd;
        
        try {
            apexController.getUProducts();
        }
        catch(Exception e){}
        
        List<Product2> prodListU = [SELECT name, ProductCode, DisplayURL
        FROM Product2 WHERE Family = 'Ultracapacitors'];
        
        for (Product2 p : prodListU){
            Boolean expectedListU = p.Name.contains('Test U');
    		system.assertEquals(expectedListU, true);        
    }
}
}