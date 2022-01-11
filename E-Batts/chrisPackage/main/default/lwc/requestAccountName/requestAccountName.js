import { LightningElement, api, wire, track } from 'lwc';
import getOppData from '@salesforce/apex/OppController.getOppData';

export default class RequestAccountName extends LightningElement {
  
  
    acctkey;
    @track opplistshare =[];
   
    showfeatures=true;

 
    @wire (getOppData,{ aname:'$acctkey'})
    WiredOppdata ({error, data}){
    console.log('We have called WiredAcctdata');
    if (data)
    {
        this.opplistshare = data;
        const Opps = this.opplistshare;
        const OppEvent = new CustomEvent('oppevent',
        {
            bubbles:true,
            composed:true,
            detail:{Opps}
        });
        this.dispatchEvent(OppEvent);
    } else if (error) {
            this.acctlistshare = [];
            throw new Error('Failed to retrieve data');
        }
    }

    handleinputChange(event){
        if (event.keyCode == 13){
            this.acctkey=event.target.value;
        }
    }
}