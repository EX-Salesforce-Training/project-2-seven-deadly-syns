({
	retrieveData : function(component, event) {
		let oppData = event.getParam('Opps');
        component.set('v.opportunityList',oppData)
		//console.log(oppData);
        //oppData.forEach(element => console.log(element.Name)); AccountId
        //oppData.forEach(element => console.log(element.StageName)); Id (opportunity Id)
	},
    initAura : function(component, event)
    {
        var action = component.get("c.getPicklistValues");
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            if (state === "SUCCESS") 
            {
            	component.set("v.stageList", response.getReturnValue());
            }
            else 
            {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    updateOppRecord : function (component, event)
    {
		//component.find(event.getSource().get("v.value"));
        //event.getSource().get("v.value") -> opp id
        //
        var oppIdValue = event.getSource().get("v.value");
        let selectList = component.find("select");
        
        for(let i = 0; i < selectList.length; i++)
		{
	        console.log(selectList[i].get("v.name"));
            
            if(selectList[i].get("v.name") == oppIdValue)
            {
                var IdField = selectList[i].get("v.name");
                var picklistField = selectList[i].get("v.value");
                
                var updateOppCall = component.get("c.updateOpportunity");
                updateOppCall.setParams(
            	{
                    recordId : IdField,
                    picklistName : picklistField
            	});
                
                updateOppCall.setCallback(this, function(response)
				{
            		var state = response.getState();
                    if (state === "SUCCESS")
                    {
             			//var result = response.getReturnValue();
                		//console.log(result);
            		}
                    else
                    {
                        console.log(response.getError());
                    }
        		});
        		$A.enqueueAction(updateOppCall);   
            }
        }
    }
})