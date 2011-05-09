<cfparam name="item" default="">
<cfparam name="founditem">
	
	
	<cfif isObject(foundItem)>
		<script type="text/javascript" charset="utf-8">
		$(function(){
			var foundItem = eval(<cfoutput>#SerializeJSON(founditem)#</cfoutput>);
			showItem(foundItem);
		});
			
		</script>

	</cfif>
<cfoutput>
<table cellpadding="5" width="98%" align="center">
    <tr>
        <td valign="top">
       	<h3>Function &amp; Tag search</h3>
		<form action="" method="get">
			<label for="search" class="search">Search</label><input type="text" size="40" name="item" value="#item#" class="search" id="search">
		</form>
		
		<!--- the actual rendering for the iteminfo --->
		<script id="tmplInfoView" type="text/x-jquery-tmpl">
			<h3 id="itemName">${name}</h3>
			
			<h4>Description</h4>
			<div class="description">${description}</div>
			
			<h4>Categories</h4>
			
			{{if !(categories.length)}}
				<div class="infobox">No categories have been defined</div>
			{{/if}}
		
			
					{{each(c, cat) categories}}
						<span id="cat_${cat.id}" class="category"><a href="category/${cat.category}">${cat.category}</a></span>
					{{/each}}
			<!---  		
				<p>
				<label for="add_a_category:">Add a category:</label>
				
				<input type="text" name="categoryItem" id="selCategory">
				<button id="btnAddCategory" type="button">Add Category</button>
				</p>	
			 ---> 	
				
			<h4>Attributes</h4>
			<table border="1" cellspacing="0" cellpadding="4">
				<tr>
					<th>name</th>
					<th>required</th>
					<th>type</th>
					<th>description</th>
					<th>status</th>
				</tr>
		
				{{each(a, attrib) attributes}}
					<tr>
						<td>${a}</td>
						<td>${attrib.required}</td>
						<td>${attrib.type}</td>
						<td>${attrib.description}</td>
						<td>${attrib.status}</td>
					</tr>
				{{/each}}

			{{if (arguments.length)}}
				{{each(a, attrib) arguments}}
						<tr>
							<td>${attrib.name} --</td>
							<td>${attrib.required}</td>
							<td>${attrib.type}</td>
							<td>${attrib.description}</td>
							<td>${attrib.status}</td>
						</tr>
				{{/each}}
			{{/if}}
			</table>
			
			<h4>Examples:</h4>
				{{if !(examples.length)}}
					<div class="infobox">No examples have been added</div>
				{{/if}}
				
			
				{{each examples}}
				<div class="example">
					<div class="e_description">${description}</div>
					<div class="e_example">
					
					<pre class="brush: cf">${example}</pre>
					
					</div>
					<div class="e_output">${output}</div>
				</div>
				{{/each}}
			<!---  
				<button id="btnAddExample" type="button">Add Example</button>
	 			<div id="addExample" style="display:none;">
					<form id="frmAddExample">
						<input type="hidden" name="item" value="${name}" id="item">
						<p>
						<label for="description">Example Description :</label>					
						<textarea name="description" rows="4" cols="40"></textarea>
						</p>
						<p>
						<label for="example">Code Example* :</label>					
						<textarea name="example" rows="8" cols="40"></textarea>
						</p>
						<p>
						<label for="output">Example Output :</label>					
						<textarea name="output" rows="4" cols="40"></textarea>
						</p>
						<p><input type="button" id="btnSubmitExample" value="Submit &rarr;"></p>
					</form>

				</div> ---> 
			
		</script>
		<div id="infoView"></div>
		
		
        </td>
		<td valign="top" id="sidebar">
            <h3>Community Links</h3>
            <ul class="links">
                <li>
                    <a href="http://www.getrailo.org">Railo Site</a>
                </li>
                <li>
                    <a href="http://blog.getrailo.com">Blog</a>
                </li>
                <li>
                    <a href="http://groups.google.com/group/railo/">Mailing List</a>
                </li>
                <li>
                    <a href="https://issues.jboss.org/browse/RAILO">Bug Tracker (JIRA)</a>
                </li>
                <li>
                    <a href="http://wiki.getrailo.org">Wiki</a>
                </li>
				<li>
					<a href="http://www.getrailo.org/download">Downloads</a>
				</li>
            </ul>
    </td>
    </tr>
</table>
</cfoutput>