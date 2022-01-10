import { LightningElement, wire, track } from 'lwc';

import getLiProducts from '@salesforce/apex/apexController.getLiProducts';
import getNiProducts from '@salesforce/apex/apexController.getNiProducts';
import getPbProducts from '@salesforce/apex/apexController.getPbProducts';
import getUProducts from '@salesforce/apex/apexController.getUProducts';


export default class Menu extends LightningElement {
    @wire (getLiProducts) liProducts;
    @wire (getNiProducts) niProducts;
    @wire (getPbProducts) pbProducts;
    @wire (getUProducts) uProducts;

    @track currentContent = 'Lithium-Ion Batteries';
    @track lithiumProducts = false;
    @track nickelProducts = false;
    @track leadProducts = false;
    @track ultraProducts = false;

    //display content based on the current event/which tab is being clicked on
    handleNavigation(e){
        let selected = e.detail.name;

        this.currentContent = selected;

        if(selected == 'Lithium-Ion Batteries'){
            this.lithiumProducts = true;
        } else { 
            this.lithiumProducts = false;
        }

        if(selected == 'Nickel-Metal Batteries'){
            this.nickelProducts = true;
        } else { 
            this.nickelProducts = false;
        }

        if(selected == 'Lead-Acid Batteries'){
            this.leadProducts = true;
        } else { 
            this.leadProducts = false;
        }

            if(selected == 'Ultracapacitors'){
            this.ultraProducts = true;
        } else { 
            this.ultraProducts = false;
        } 
        
    }

}