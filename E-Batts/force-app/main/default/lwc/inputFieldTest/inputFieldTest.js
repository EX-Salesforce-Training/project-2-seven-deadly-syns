import { LightningElement, wire } from 'lwc';
import getAllProducts from '@salesforce/apex/ProductController.getAllProducts';


export default class InputFieldTest extends LightningElement {

    @wire(getAllProducts) products;
    
    productName = "Awaiting Product Choice";
    productID;
    quantity;
    quoteDate;

    selectProduct(event)
    {
        this.productID = event.target.value;
        this.productName = event.target.label;
        //console.log(this.productID);
    }

    quantityChange(event)
    {
        if(event.target.value != 0)
        {
            this.quantity = event.target.value;
        }
        else
        {
            this.quantity = 0;
        }
        //console.log(this.quantity);
    }

    dateSet(event)
    {
        this.quoteDate = event.target.value;
        //console.log(this.quoteDate);
    }

    handleClick(event)
    {
        console.log("Click the button");
    }
}