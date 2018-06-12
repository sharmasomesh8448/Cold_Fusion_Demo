<cflock scope = "Session" type = "Exclusive" timeout = "20">
	<cfif StructKeyExists(session, "user")>
		<cfset StructDelete(Session, "user")>
		<cflocation url = "LoginPage.cfm" addtoken = "false">
	</cfif>	
</cflock>	