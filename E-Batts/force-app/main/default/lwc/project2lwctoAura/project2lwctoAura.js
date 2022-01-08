import { LightningElement, wire } from 'lwc';
import getAllProducts from '@salesforce/apex/ProductController.getAllProducts';
import Id from '@salesforce/user/Id';

export default class project2lwctoAura extends LightningElement {

    @wire(getAllProducts) products;
    
    productName = "Awaiting Product Choice";
    productID;
    quantity;
    quoteDate;
    userId=Id;

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
        const dateVar=this.quoteDate;
        const qtyVar=this.quantity;
        const prodVar=this.productID;
        const userVar=this.userId;
        const pnameVar=this.productName;
        console.log(userVar);
        console.log(dateVar);
        console.log(qtyVar);
        console.log(prodVar);
        console.log(pnameVar);

        const userdata=new CustomEvent ('userdata',{
            bubbles:true,
            composed:true,
            detail:{userVar}
        });

        this.dispatchEvent(userdata);

        const datedata=new CustomEvent ('datedata',{
            bubbles:true,
            composed:true,
            detail:{dateVar}
        });

        this.dispatchEvent(datedata);

        const qtydata=new CustomEvent ('qtydata',{
            bubbles:true,
            composed:true,
            detail:{qtyVar}
        });

        this.dispatchEvent(qtydata);
        
        const proddata=new CustomEvent ('proddata',{
            bubbles:true,
            composed:true,
            detail:{prodVar}
        });

        this.dispatchEvent(proddata);

        const prodname=new CustomEvent ('prodname',{
             bubbles:true,
             composed:true,
             detail:{pnameVar}   
        });
        this.dispatchEvent(prodname);
        
        
        

        console.log("Got to the end");
    }
}