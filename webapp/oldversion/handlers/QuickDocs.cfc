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
		
		//WE should just save this to the item directly
		
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
	
	
	
	
	function getCategories(event){
		var retItem = [];
		var cat = ORMExecuteQuery("from category WHERE category LIKE '%#event.getValue("term")#%'");
		for(var c in cat){
			ArrayAppend(retItem,c.getCategory());
		}
		event.renderData(type="json",data=retItem);
	}
	
	
	function addCategory(event){
		var cat = EntityLoad("Category", {category=event.getTrimValue("category")}, true);
		if(isNull(cat)){
			cat = EntityNew("Category", {category=event.getTrimValue("category")});
			EntitySave(cat);
			ormFlush();
		}
		var item = EntityLoad("Item", {item=event.getTrimValue("item")}, true);
		if(!item.hasCategories(cat)){
			item.addCategories(cat);
		}
		EntitySave(item);
	
		event.renderData(type="json",data=item);
		
	}
	
	private function getItemData(item){
			var oItem = EntityLoad("Item",item, true);
			if(isNull(oItem)){
				//Create The identity
				oItem = EntityNew("Item", {item=item});
				EntitySave(oItem);
				ormFlush();
			}	
			return oItem;
	}
	
}