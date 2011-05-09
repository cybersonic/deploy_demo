component persistent="true" entityname="category" table="categories"{
	property name="id" column="id" ormtype="id" generator="native";
	property name="category" ormtype="string";
	property name="items" fieldtype="many-to-many" cfc="Item" linktable="Item_Categories" FKColumn="category" inverseJoinColumn="itemName" lazy="false";
	
	
 	string function _toJson() returntype="string"{
		var stret = {
				'id' = getId(),
				'category' = getCategory()
				};
		
		
		return SerializeJSON(stret);
	}
}