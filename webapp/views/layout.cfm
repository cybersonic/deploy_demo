<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to Railo Quick Docs</title>
	<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.11.custom.css" rel="stylesheet" />	
	<link type="text/css" href="css/main.css" rel="stylesheet" />	
	<link type="text/css" rel="stylesheet" href="css/shCoreDefault.css"/> 
	
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"></script>
	<script type="text/javascript" src="js/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="js/shCore.js"></script> 
	<script type="text/javascript" src="js/shBrushColdFusion.js"></script> 
	<script type="text/javascript" src="js/jquery.beautyofcode.js"></script>
	<script type="text/javascript" src="js/quickdocs.js"></script>
	
	
	<!---
	<script type="text/javascript" charset="utf-8">
		$(function(){
		<cfif StructKeyExists(rc, "item") && Len(rc.item)>
			<cfoutput>displayItemData("#rc.item#");</cfoutput>
		 </cfif>
		});
	</script>
	--->
</head>
<body>
<!--- Render The View. This is set wherever you want to render the view in your Layout. --->
<cfoutput>
<header>
<section id="header">
<img src="images/railo_logo.png" alt="Railo Quick Docs">
(Version #SERVER.railo.version#)
</section>
</header>
#includeContent()#
</cfoutput>
<footer>
<cfoutput>	&copy; Railo Technologies GmBH #DateFormat(Now(), "yyyy")#</cfoutput>
</footer>
</body>
</html>
