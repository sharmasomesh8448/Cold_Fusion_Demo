<cfcomponent>
	<cffunction name = "ValidateLoginForm" returntype = "boolean" output = "false">
		<cfargument name = "email" type = "string" required = "true">
		<cfargument name = "password" type = "string" required = "true">
		<cfset variables.flag = true>
		<cfset variables.myArray = ArrayNew(1)>
		<cfif not isValid("email", arguments.email)>
			<cfset variables.flag = false>
		</cfif>
		<cfif len(arguments.password) GTE 6
					AND len(arguments.password) LTE 20 >
		<cfelse>
			<cfset variables.flag = false>
		</cfif>
		<cfreturn variables.flag>
	</cffunction>

	<cffunction name = "CheckFormData" returntype = "boolean" hint = "check the form data" output = "true">
		<cfargument name = "email" type = "string" required = "true" />
		<cfargument name = "password" type = "string" required = "true" />
		<cftry>
			<cfquery name = "request.getPwdAndSalt" datasource = "demods">
				SELECT PASSWORD, SALT,ID
				FROM Users
				WHERE EMAILID = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#arguments.email#">
			</cfquery>
			<cfif request.getPwdAndSalt.RecordCount EQ 1>
				<cfif request.getPwdAndSalt.PASSWORD EQ Hash(arguments.password & request.getPwdAndSalt.SALT, "SHA-512")>
					<!--- session.user = StructNew(); --->
					<cfset Session.user = request.getPwdAndSalt.ID >
					<cfreturn true>
				<cfelse>
					<cfreturn false>
				</cfif>
			<cfelse>
				<cfreturn false>
			</cfif>
			<cfcatch type="any">
				<cfoutput>Database exception occured</cfoutput>
				<cfreturn false>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>