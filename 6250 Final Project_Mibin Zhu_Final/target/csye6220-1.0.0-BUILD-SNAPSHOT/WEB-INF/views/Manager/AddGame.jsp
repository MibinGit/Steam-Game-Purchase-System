<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
		<title>Add Steam Game</title>
		<meta name = "viewport" content = "width=device-width, initial-scale=1">
		<link rel = "stylesheet" href = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
		<script src = "https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src = "https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	</head>

	<body>
		<nav class = "navbar navbar-expand-md bg-dark navbar-dark">
			<a class = "navbar-brand" href = "#">Steam Game Store</a>

			<button class = "navbar-toggler" type = "button" data-toggle = "collapse" data-target = "#collapsibleNavbar">
				<span class = "navbar-toggler-icon"></span>
			</button>

			<div class = "collapse navbar-collapse" id = "collapsibleNavbar">
				<ul class = "navbar-nav">

				</ul>
			</div>

			<sec:authorize access = "isAuthenticated()">
				<div class = "text-right">
					<a class = "navbar-brand" href = "<c:url value = "/Views/LogoutPage" />">Log Out</a>
				</div>
			</sec:authorize>
		</nav>

		<div class = "container">
			<div class = "jumbotron">
				<h1>ADD STEAM GAME</h1>
				<br>
				<p>Please enter the details of the game below.</p>
				<p>User will see all attributes.</p>
				<p>Please fill in carefully!</p>
				<a href = "<c:url value = "/" />">Return To The Manager Page</a><br>
			</div>
		</div>

		<div class = "container">
			<form:form id = 'game' modelAttribute = "game" action = '${pageContext.request.contextPath}/Manager/add' class = "form-signin" method = 'POST'>
				<div class = "form-group">
					<label><strong>Game Name : </strong></label>
					<form:input path = "gamename" class = "form-control" id = "gamename" required = "true"/>
					<form:errors path = "gamename"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Price : </strong></label>
					<form:input type = "number" path = "price" class = "form-control" id = "price" required = "true"/>
					<form:errors path = "price"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Issuer : </strong></label>
					<form:input path = "issuer" class = "form-control" id = "issuer" required = "true"/>
					<form:errors path = "issuer"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Issuedate : </strong></label>
					<form:input type = "date" path = "issuedate" class = "form-control" id = "issuedate" required = "true"/>
					<form:errors path = "issuedate"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Type : </strong></label>
					<form:input path = "type" class = "form-control" id = "type" required = "true"/>
					<form:errors path = "type"> </form:errors>
				</div>

				<div class = "form-group">
					<label><strong>Game Description : </strong></label>
					<form:textarea path = "description" class = "form-control" rows = "7" id = "description" required = "true"/>
					<form:errors path = "description"> </form:errors>
				</div>

				<div class = "text-center">
					<button class = "btn btn-primary btn-lg" type = "submit">Add Game</button>
				</div>
				<br>
				<br>
				<br>
			</form:form>
		</div>
	</body>
</html>