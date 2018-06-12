<cfcomponent>
	<cfset This.name = "Demo_Login">
	<cfset This.Sessionmanagement = "Yes">
	<cfset This.Sessiontimeout = "#createtimespan(0, 0, 20, 0)#">
	

	<cffunction name = "onApplicationStart">
	</cffunction>

	<cffunction name = "onApplicationEnd">
	</cffunction>

	<cffunction name = "onRequestStart">
		
		<cfif CGI.SCRIPT_NAME EQ "/views/Home.cfm">
			<cfif StructKeyExists(session, "user")>
			<cfelse>
				<cflocation url = "../Views/LoginPage.cfm" addtoken = "false">
			</cfif>	
		</cfif>
		
	</cffunction>

	<cffunction name="onSessionStart"> 
		<cfscript> 
			Session.started = now(); 
			Session.shoppingCart = StructNew(); 
			Session.shoppingCart.items = 0; 
		</cfscript>  
		<cflog file="#This.Name#" type="Information" text="Session: #Session.sessionid# started"> 
	</cffunction> 

	<cffunction name="onSessionEnd"> 
		<cfargument name = "SessionScope" required = true/> 
		<cflog file = "#This.Name#" type = "Information" text = "Session: #arguments.SessionScope.sessionid# ended"> 
	</cffunction> 
</cfcomponent>