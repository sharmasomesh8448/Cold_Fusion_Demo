<head>
	<link rel = "stylesheet" href = "../assets/css/login_page_style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel = "stylesheet">
	 <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href = "../assets/css/form_style.css">
</head>
<body>

	<div class = "outer-container">
	<div class = "row">
		<div class = "col-md-4">
			<div class="col-md-7 text-center text-md-left ">
				<h1 class="alt-h0 text-white lh-condensed-ultra mb-3">Built for developers</h1>
				<p class="alt-lead mb-4">
				  <a href="#" class="text-white">This is a demo project on Cold Fusion</a>
				</p>
			 </div>
		</div>
	</div>
	<div>
	<!--- Login form --->

		<h4><u>Login</u></h4>
		<div class="jumbotron">
		<cfform onsubmit = "return validateFormData()" method = "post">
			<table>
				<tr>
					<div class = "field">
						<td>Email Id:</td>
						<td><cfinput type = "text" name = "emailId" class="form-control" id = "emailId"></td>
						<td><div class = "errorfield" id = "emailIdError"></div></td>
					</div>
				</tr>
				<tr>
					<div class = "field">
						<td>Password:</td>
						<td><cfinput type = "password" name = "password" class="form-control" id = "password"></td>
						<td><div class = "errorfield" id = "passwordError"></div></td>
					</div>
				</tr>
				<tr>
					<td><cfinput type = "submit" name = "submit" class = "btn btn-info" id = "submit" value = "Login"></td>
				</tr>
			</table>
		</cfform>
		</div>
	</div>
	

	
	<cfif isDefined("form.submit")>
		<cfset formData = CreateObject("Component", "Models.Login") />
		<cfset validationStatus = formData.ValidateLoginForm(email = "#form.emailId#", password = "#form.password#") />
			<cfif validationStatus EQ true>
				<cfset userFormData = formData.CheckFormData(email = "#form.emailId#", password = "#form.password#") />

				<cfif userFormData EQ true> 
					   <cflocation url = "Home.cfm" addtoken = "false">
				<cfelse>
					<h5 class="errorfield">Opps! Email or Password is incorrect, Please provide the correct details</h5>
				</cfif>
			<cfelse>
			</cfif>
	</cfif>

	
	<!---  Link to Signup page --->
	<h4>New User?</h4>
	<a href = "Registration.cfm">Register Here</a>
	<script src = "../assets/js/validateLoginPage.js"></script>

</body>
</html>
