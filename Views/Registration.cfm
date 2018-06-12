<html>
<head>
	<!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href = "../assets/css/form_style.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
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
		<div class = "col-sm-8">
			<cfform onsubmit = "return validateForm()" method = "post" class="jumbotron">
					<table>
						<tr>
							<div class="field">
								<td><b>First Name:</b></td>
								<td><cfinput type = "text" name = "FirstName" class="form-control" id = "firstName" placeholder = "Enter first Name"></td>
								<td><div class = "errorfield" id = "firstNameError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Middle Name:</b> </td>
								<td><cfinput type = "text" name = "MiddleName" class="form-control" id = "middleName" placeholder = "Enter middle Name"></td>
								<td><div class = "errorfield" id = "middleNameError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Last Name: </b></td>
								<td><cfinput type = "text" name = "LastName" class="form-control" id = "lastName" placeholder = "Enter last name"></td>
								<td><div class = "errorfield" id = "lastNameError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
							<td><b>Gender:<b></td>
							<td>
								<cfselect name = "UserGender" class="form-control" id = "UserGender" multiple = "no">
									<option value = "male" id = "male" selected>Male</option>
									<option value = "female" id = "female">Female</option>
								</cfselect>
							</td>
							<td><div class = "errorfield" id = "genderError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
							<td><b>Date of birth:</b></td>
								<td><input type = "date" name = "BirthDate" class="form-control" id = "birthDate"></td>
							<td><div class = "errorfield" id = "dateOfBirthError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Address:</b></td>
								<td><cfinput type = "text" name = "Address" class="form-control" id = "address"></td>
								<td><div class = "errorfield" id = "addressError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Phone Number:</b></td>
								<td><cfinput type = "text" name = "PhoneNumber" class="form-control" id = "phoneNumber"></td>
								<td><div class = "errorfield" id = "phoneNumberError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Email Id:</b></td>
								<td><cfinput type = "text" name = "EmailId" class="form-control" id = "emailId"></td>
								<td><div class = "errorfield" id = "emailIdError"></div></td>
							</div>
						</tr>
						<tr>
							<div id = "field">
								<td><b>Password:</b></td>
								<td><cfinput type = "password" name = "Password" class="form-control" id = "password"></td>
								<td><div class = "errorfield" id = "passwordError"></div></td>
							</div>
						</tr>
						<tr>
							<div class = "field">
								<td><b>Confirm Password:</b></td>
								<td><cfinput type = "password" name = "ConfirmPassword" class="form-control" id = "confirmPassword"></td>
								<td><div class = "errorfield" id = "confirmPasswordError"></div></td>
							</div>
						</tr>
						<tr>
							<td><cfinput type = "submit" name = "SaveChanges" class = "btn btn-md btn-info" value = "Submit" ></td>
						</tr>
						
					</table>
					<div class="Login">
					<a href="./LoginPage.cfm">Login</a>
					</div>
				</cfform>
			</div>
		</div>
		</div>
		
		 <cfif isDefined("form.SaveChanges") >
			
			<cfset formData = CreateObject("Component", "Models.Registration") />
			<cfset isValid = formData.validateRegistrationForm()>
			<cfif isValid EQ "true">
			
				<cfset formDataInserted = formData.insertDataRegistrationForm(argumentCollection="form")>
				<cfif formDataInserted EQ true>
					<cflocation url = "LoginPage.cfm" addtoken = "false">
				<cfelse>
					<h5>Opps! Please check all the fields</h5>
				</cfif>
			<cfelse>
				<cfoutput>#isValid#</cfoutput>
			</cfif>
		</cfif> 
		<script src = "../assets/js/validateRegistrationForm.js"></script>
		
</body>
</html>
