<cfcomponent>
	<cfset error = "true" >
	<cfquery name = "check_unique_email" datasource = "demods"> select count(id) as count from Users where emailId = '#Form.EmailId#' </cfquery>
	<cffunction name = "validateRegistrationForm" returntype = "string" output = "true">
		 <cfif not isValid("regex", form.FirstName, "^[a-zA-Z]*$")>
			<cfset error =  "Something went wrong">
		<cfelseif form.MiddleName NEQ "" and not isValid("regex", form.MiddleName, "^[a-zA-Z]*$")>
			<cfset error =  "Something went wrong">
		<cfelseif not isValid("regex", form.LastName, "^[a-zA-Z]*$")>
			<cfset error =  "Something went wrong">
		<cfelseif not (form.UserGender EQ "male" or form.UserGender EQ "female")>
			<cfset error =  "Something went wrong">
		<!--- <cfelseif not isValid("date", form.BirthDate)>
			<cfset error =  "Something went wrong"> --->
		<cfelseif not(len(form.Address) GTE 3 AND len(form.Address) LTE 100)>
			<cfset error =  "Something went wrong">
		<cfelseif not(len(form.PhoneNumber) EQ 10)>
			<cfset error =  "Something went wrong">
		<cfelseif not isValid("email", form.EmailId)>
			<cfset error =  "Something went wrong">
		<cfelseif not(len(form.Password) GTE 6 AND len(form.Password) LTE 20)>
			<cfset error =  "Something went wrong">
		<cfelseif not(len(form.ConfirmPassword) GTE 6 AND len(form.ConfirmPassword) LTE 20)>
			<cfset error =  "Something went wrong">
		<cfelseif check_unique_email.count NEQ 0>
			<cfreturn "Email already Present">	
		</cfif>  	
		<cfreturn error>
	</cffunction>

	<cffunction name = "insertDataRegistrationForm" returntype = "boolean" output = "true">
		<cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />
		<cfset variables.hashedPassword = Hash(form.Password & variables.salt, "SHA-512") />
		<!--- insert both variables.salt and variables.hashedPassword into table --->

		<cfquery name = "insertData" datasource = "demods">
		
			INSERT INTO Users(FirstName, MiddleName, LastName, Gender, DateOfBirth, Address, PhoneNumber, EmailId, Password, ConfirmPassword, Salt)
			VALUES ('#Form.FirstName#','#Form.MiddleName#', '#Form.LastName#', '#Form.UserGender#', '#Form.BirthDate#', '#Form.Address#', '#Form.PhoneNumber#',
			'#Form.EmailId#','#variables.hashedPassword#', '#variables.hashedPassword#', '#variables.salt#')
		</cfquery>

		<cfreturn true>
	</cffunction>
</cfcomponent>