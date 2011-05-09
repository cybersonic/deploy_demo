component {
	property name="ORMService" inject="coldbox:plugin:ORMService";
  
	function index(event){
		
		var item =  event.getValue("item", "");
		var data = {};
		if(Len(item)){
			data = getItemData(item);
		}
	
		event.setValue("data", data);
	}
	
	function filterlist(event){
		//get tags and functions
		var aItems = [];
		var tags = getTagList();
		var functions = getFunctionList();
		var searchItem = event.getValue("term");



		//Lets create a better search function

		for(t in tags.cf){		
			var tagFullName = "cf" & t;
			if(FindNoCase(searchItem, tagFullName)) {
				ArrayAppend(aItems, tagFullName);				
			}
		}
		for(var f in functions){
			if(FindNoCase(searchItem, f)) {
				ArrayAppend(aItems, f);
			}
		}
		event.renderData(type="json",data=aItems);
	}
	
	function getInfo(event){
		var retItem = {};
		var item = event.getValue("item");
	
		var retItem = getItemData(item);
		event.renderData(type="json",data=retItem);
	}
	
	function addExample(event){
		var data = {}
			data.item			= event.getTrimValue("item", "");
			data.description	= event.getTrimValue("description", "");
			data.example		= event.getTrimValue("example", "");
			data.output			= event.getTrimValue("output", "");

			if(Len(data.item) && Len(data.example)){
				var newExample = EntityNew("Example", data);
				EntitySave(newExample);
				ormFlush();
			}
			event.renderData(type="json",data=data.item);
	}
	
	
	function categories(event){
		var cat = EntityLoad("category");
		event.renderData(type="json",data=cat);
	}
	
	private function getItemData(item){
		var retItem = {};
		
			try{
				if(LCase(item).startsWith("cf")){
					//get the tag name proper 
					var tagName = Right(item,Len(item)-2);
					var retItem = getTagData("cf", tagName)
						retItem.name = "cf" & tagName;
				}
				else{
					retItem = getFunctionData(item);
				}
				
			}
			catch(Any e) {
			}
			

			retItem['description'] = HTMLEditFormat(retItem['description']);
			//Added metadata 
			
			retItem['attributes'] = StructKeyExists(retItem, 'attributes') ? retItem['attributes'] : [];
			retItem['arguments'] = StructKeyExists(retItem, 'arguments') ? retItem['arguments'] : [];
						
			retItem['examples'] = [];
			retItem['categories'] = [];
		
			//lets get the examples into a new struct;
			item = LCase(item);
			ormReload();
			ormFlush();
			var oItem = EntityLoad("Item",item, true);
			if(isNull(oItem)){
				//Create The identity
				oItem = EntityNew("Item", {item=item});
				EntitySave(oItem);
				ormFlush();
			}	
			var aExamples = !isNull(oItem.getExamples()) ? oItem.getExamples() : [];
			
			var cat = EntityLoad("category");
			
			retItem['availablecategories'] = cat;
			
			return retItem;
		
	}
	
}