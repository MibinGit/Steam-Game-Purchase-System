<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
		<title>Sign Up Page</title>
		<script type = "text/javascript" src = "<c:url value = "/resources/js/jquery-3.3.1.min.js"/>"></script>
		<meta name = "viewport" content = "width=device-width, initial-scale=1">
		<link rel = "stylesheet" href = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
		<script src = "https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src = "https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	</head>

	<body onload = 'document.f.username.focus();'>
		<nav class = "navbar navbar-expand-md bg-dark navbar-dark">
			<a class = "navbar-brand" href = "#">Steam Game Store</a>

			<button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#collapsibleNavbar">
				<span class = "navbar-toggler-icon"></span>
			</button>
		</nav>

		<div class = "container">
			<div class = "jumbotron">
				<h1>SIGN UP FOR AN ACCOUNT</h1>
				<br>
				<p>Please carefully fill in your personal information.</p>
				<p>The mailbox will be used to send mail.</p>
				<p>The date of birth will be used to determine if you can purchase the game!</p>
			</div>
		</div>

		<div class = "container">
			<form:form name = 'f' modelAttribute = "users" action = '${pageContext.request.contextPath }/views/users' class = "form-signin" method = 'POST'>
				<div class = "form-group">
					<label><strong>User Name : </strong></label>
					<form:input name = "username" path = "username" class = "form-control" placeholder = "Like : Jason" required = "true"/>
					<form:errors path = "username"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Password : </strong></label>
					<form:password path = "password" class = "form-control" placeholder = "Like : Li9+" required = "true"/>
					<form:errors path = "password"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>First Name : </strong></label>
					<form:input name = "firstName" path = "firstName" class = "form-control" placeholder = "Like : Mibin" required = "true"/>
					<form:errors path = "firstName"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Last Name : </strong></label>
					<form:input path = "lastName" class = "form-control" placeholder = "Like : Zhu" required = "true"/>
					<form:errors path = "lastName"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Birthday : </strong></label>
					<input type = "date" id = "bir" class = "form-control" required = true/>
					<form:hidden path = "birthDate" id = "birthDate"/>
					<form:errors path = "birthDate"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Email Address : </strong></label>
					<form:input path = "email" class = "form-control" placeholder = "Like : 123@163.com" required = "true"/>
					<form:errors path = "email"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Home Address : </strong></label>
					<form:input path = "address" class = "form-control" placeholder = "Like : abc,def,lmn" required = "true"/>
					<form:errors path = "address"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Phone Number : </strong></label>
					<form:input path = "phone" class = "form-control" placeholder = "Like : xxxxxxxxxx" required = "true"/>
					<form:errors path = "phone"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Role : </strong></label>
					<br>
					<form:select path = "role">
						<form:option value = "ROLE_TEACHER">Manager</form:option>
						<form:option value = "ROLE_STUDENT">User</form:option>
					</form:select>
				</div>

				<div class = "text-center">
					<button class = "btn btn-primary btn-lg" type = "submit">Submit</button>
				</div>
				<br>
				<br>
				<br>
			</form:form>
		</div>

		<script type = "text/javascript">
			$(function()
			{
				$("#bir").change(function()
				{
				  $("#birthDate").attr("value",$("#bir").val());
				});
				$("#username").attr("value",$("#user").text());
			});
		</script>
	</body>
</html>