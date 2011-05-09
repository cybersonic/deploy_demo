<!---
	The environment setting can be set to "design", "development", "testing", "maintenance" or "production".
	For example, set it to "design" or "development" when you are building your application and to "production" when it's running live.
--->

<cfif FindNoCase("localhost", CGI.http_host)>
	<cfset set(environment="design")>	
<cfelse>
	<cfset set(environment="production")>
</cfif>
