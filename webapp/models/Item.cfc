component extends="Model"{
	
	
	string function _toJson() returntype="string"{
		var retItem = {};
		
		if(LCase(THIS.ITEM).startsWith("cf")){
						//get the tag name proper 
						var tagName = Right(item,Len(item)-2);
						var retItem = getTagData("cf", tagName)
							retItem.name = "cf" & tagName;
					}
					else{
						retItem = getFunctionData(item);
	}

				retItem['id'] = THIS.id;
		
				retItem['description'] = HTMLEditFormat(retItem['description']);
				//Added metadata 

				retItem['attributes'] = StructKeyExists(retItem, 'attributes') ? retItem['attributes'] : [];
				retItem['arguments'] = StructKeyExists(retItem, 'arguments') ? retItem['arguments'] : [];

			//	retItem['examples'] = [getExamples()]];
			//	retItem['categories'] = getCategories();
				retItem['examples'] = [];
				retItem['categories'] = [];
		
		return SerializeJSON(retItem);
	}
}