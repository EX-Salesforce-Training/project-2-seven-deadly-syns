import { LightningElement,api,wire, track } from 'lwc';
import getOppData from '@salesforce/apex/OppController.getOppdata';

export default class Project2lwc extends LightningElement {
  
  
   acctkey;
   @track opplistshare =[];
   
showfeatures=true;

 
@wire (getOppData,{ aname:'$acctkey'})
WiredOppdata ({error, data}){
  console.log('We have called WiredAcctdata');
  if (data) {
    this.opplistshare = data;
    const Opps=this.opplistshare;
    const OppEvent= new CustomEvent('OppEvent',
    {bubbles:true,
        composed:true,
        detail:Opps
    });
    this.dispatchEvent(OppEvent);
    console.log(Opps);
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