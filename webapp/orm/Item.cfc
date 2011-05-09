component persistent="true" entityname="item" table="items"{
	property name="item" ormtype="string" fieldtype="id"; //primary key
	//HasManyExamples
	property name="examples" type="array" fieldtype="one-to-many" cfc="Example" fkcolumn="item";
	//HasManyTags
	property name="categories" fieldtype="many-to-many" cfc="Category" linktable="Item_Categories" FKColumn="itemName" inverseJoinColumn="category" lazy="false";
	


	string function _toJson() returntype="string"{
		var retItem = {};
		
		if(LCase(getItem()).startsWith("cf")){
						//get the tag name proper 
						var tagName = Right(item,Len(item)-2);
						var retItem = getTagData("cf", tagName)
							retItem.name = "cf" & tagName;
					}
					else{
						retItem = getFunctionData(item);
	}


				retItem['description'] = HTMLEditFormat(retItem['description']);
				//Added metadata 

				retItem['attributes'] = StructKeyExists(retItem, 'attributes') ? retItem['attributes'] : [];
				retItem['arguments'] = StructKeyExists(retItem, 'arguments') ? retItem['arguments'] : [];

				retItem['examples'] = getExamples();
				retItem['categories'] = getCategories();
		
		return SerializeJSON(retItem);
	}
	
	
}