$(function(){
	$( "#search" ).autocomplete({
				source: "index.cfm/quickdocs/filterlist?format=json",
				minLength: 2,
				select: function( event, ui ) {
					displayItemData(ui.item.value);

				}
			});
			
	
			
	$("#btnAddExample").live("click", function(){
		$("#addExample").show();
	});
	
	$("#btnSubmitExample").live("click", function(){
		
		$.ajax({
		  type: 'POST',
		  url: "index.cfm/QuickDocs/addExample/?format=json",
		  data: $("#frmAddExample").serialize(),
		  success: function(result){
				//Close the box and stuff
			
				$("TEXTAREA").each(function(){
					$(this).val("");
				});
			
				$( "#infoView" ).empty();
				$( "#tmplInfoView" ).tmpl( result ).appendTo( "#infoView" );
				
				
			
		},
		  dataType: "json"
		});
		
		
	});
	
	$("#search").focus();
	
	//Setup the globals of syntax highlighting
	    $.beautyOfCode.init('clipboard.swf');
	    $.beautyOfCode.beautifyAll();
	
	
	
 	//Setup the autocomplete

});


function addCategoryAutoComplete(){
	
}

function displayItemData(itemName){
		 $.ajax({
				url: 'index.cfm/quickdocs/getInfo/?format=json',
				data: {item:itemName},
				dataType: "json",
				success: function(returnItem){
					showItem(returnItem);
				}
			});
}

function showItem(itemData){
	$( "#infoView" ).empty();
	$( "#tmplInfoView" ).tmpl( itemData ).appendTo( "#infoView" );
	
	
	$(".e_example").beautifyCode('cf');
	
	$("#selCategory").autocomplete({
			source: "index.cfm/quickdocs/getCategories/?format=json", 
			minLength:2
	});
	
	$("#btnAddCategory").live("click", function(){
		addCategory($("#itemName").text(), $("#selCategory").val());
	});
}


function addCategory(itemName, category){
	$.ajax({
		url: 'index.cfm/quickdocs/addCategory/?format=json',
		data: {item:itemName, category:category},
		dataType: 'json',
		success: function(){
			displayItemData(itemName);
		}
	});
}