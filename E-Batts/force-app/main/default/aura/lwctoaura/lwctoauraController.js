({
	handleQty : function(component, event, helper) {
        const qty= event.getParam('qtyVar');
        component.set('v.qtyVar1', qty);
        component.set('v.rfqLine.Qty__c', qty);
        
	},
    handleDate : function(component, event, helper) {
        const datevar = event.getParam('dateVar');
        component.set('v.dateVar1', datevar);
        component.set('v.rfq.Deadline__c',datevar);
        
	},
    handleProd : function(component, event, helper) {
        const prodvar = event.getParam('prodVar');
        component.set('v.prodVar1', prodvar);
        component.set('v.rfqLine.Product__c',prodvar);
	},
    handleProdName : function(component, event, helper) {
        const pnamevar = event.getParam('pnameVar');
        component.set('v.pnameVar1', pnamevar);
        component.set('v.rfqLine.ProductName__c',pnamevar);
	},
    handleUser : function(component, event, helper) {
       const userId=(event.getParam('userVar'));
        component.set("v.userVar1",userId);
        let action=component.get("c.getAccount");
        action.setParams({"userId":userId});
        action.setCallback(this, function(response) {
            let state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                let result= response.getReturnValue();
                let aname=result[0].Name;
                console.log(response.getReturnValue());
                console.log(result[0].Name);
                console.log(result[0].Id);
                component.set("v.acctnameVar1", result[0].Name);
                component.set("v.rfq.AccountId__c", result[0].Id);
                component.set("v.rfq.AccountName__c", aname);
                let rfqName= result[0].Name +"_RFQ";
                let rfqLineName=result[0].Name + "_RFQLine";
                component.set("v.rfq.Name",rfqName);
                component.set("v.rfqLine.Name",rfqLineName);
                
                console.log(rfqName);
                console.log(rfqLineName);
                let theDisplayItems=component.get("v.rfqLines");
                let displayItem=component.get("v.rfqLine");
                theDisplayItems.push(displayItem);
                component.set("v.rfqLines",theDisplayItems);
            }
            else {
                console.log("Failed with state: " + state);
                
            }		
	});  $A.enqueueAction(action);
        
      
	}
    
})