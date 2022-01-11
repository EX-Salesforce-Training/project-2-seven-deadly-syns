({
    doInit : function(component, event, helper)
    {
		helper.initAura(component, event);
    },
	oppSearchEvent : function(component, event, helper)
	{
        helper.retrieveData(component, event);
	},
    editStageOpp : function(component, event, helper) 
    {
		helper.updateOppRecord(component, event);
    }
})