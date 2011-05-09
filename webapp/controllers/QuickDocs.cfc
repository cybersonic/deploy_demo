component extends="Controller"{
	
	function init(){
		provides("html,json,xml");
	}
	function index(){
		founditem = {};
		if(isDefined("params.item")){
			founditem = getItemData(params.item);			
		}

	}
	function test(){
		dump("working");
		dump(params);
		abort;
	}
	//Returns a list of tags or functions
	function filterlist(){
			params.format = "json";
			var aItems = [];
			var tags = getTagList();
			var functions = getFunctionList();
			var searchItem = "";
			
			if(StructKeyExists(params, "key")){
				searchItem = params.key;
			}
			
			if(StructKeyExists(params, "term")){
				searchItem = params.term;
			}


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

		renderWith(aItems);
	}
	function getInfo(){
		params.format = "json";
		var retItem = {};
		var item = params.item;
	
		var retItem = getItemData(item);
		renderWith(retItem);
	}
		/*
	function addExample(){
		
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
			renderWith(data.item);
	}
	
	

	
	function getCategories(event){
		var retItem = [];
	//	var cat = ORMExecuteQuery("from category WHERE category LIKE '%#event.getValue("term")#%'");
		for(var c in cat){
			ArrayAppend(retItem,c.getCategory());
		}
		renderWith(retItem);
	}
	
	
	function addCategory(event){
	//	var cat = EntityLoad("Category", {category=event.getTrimValue("category")}, true);
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
	
		renderWith(item);
		
	}
	*/
	
	private function getItemData(item){
		
		oItem = model('item').findOne(item=item);
		if(!isObject(oItem)){
			oItem = model('item').new(item=item)
			oItem.save();
		}
		return oItem;
	}
}