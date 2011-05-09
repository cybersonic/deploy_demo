component persistent="true" entityname="example" table="examples"{
	property name="id" column="id" generator="increment";
	property name="item" ormtype="string";
	property name="description" ormtype="text";
	property name="example" ormtype="text";	
	property name="output" ormtype="text";	
	
	
 	string function _toJson() returntype="string"{
		var stret = {};
		var MData = getMetadata(this);
		for(var p in Mdata.properties){
			stret[p.name] = Evaluate("get#p.name#()");
		}
		return SerializeJSON(stret);
	}

}