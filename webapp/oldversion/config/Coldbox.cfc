<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "RailoQuickDocs",
		
		//Development Settings
		debugMode				= false,
		debugPassword			= "",
		reinitPassword			= "",
		handlersIndexAutoReload = false,
		configAutoReload		= false,
		
		//Implicit Events
		defaultEvent			= "quickdocs.index",
		requestStartHandler		= "",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",
		
		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",
			
		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= false
	};
	
	//Layout Settings
	layoutSettings = {
		defaultLayout = "Layout.Main.cfm"
	};
	
	//WireBox Integration
	wireBox = { 
		enabled = true, 
		singletonReload=true 
	};		
		
	//Register interceptors as an array, we need order
	interceptors = [
		 //Autowire
		 {class="coldbox.system.interceptors.Autowire"}
		 //SES		
		, {class="coldbox.system.interceptors.SES"}

		
	];	
}
	
</cfscript>
</cfcomponent>