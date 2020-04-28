<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
		<title>Manager Page</title>
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
					<li class = "nav-item">
						<a class = "nav-link" href = "<c:url value = "/Manager/AddGame" />">Add Steam Game</a>
					</li>

					<li class = "nav-item">
						<a class = "nav-link" href = "<c:url value = "/Manager/ManagerInformation" />">Personal Info</a>
					</li>
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
				<dl class = "dl-horizontal">
					<h1>You are login as a manager successfully!</h1>
					<br>
					<dt>Add Game</dt>
					<dd>You can add any game that you think users will be interested in.</dd>
					<br>
					<dt>Personal Information</dt>
					<dd>You can see the user information you registered on this page.</dd>
					<br>
					<dt>Game Cart</dt>
					<dd>The form below is the game list that you have added.</dd>
				</dl>
			</div>
		</div>

		<div class = "container">
			<div class = "jumbotron">
				<h3 class = "text-primary">Your Game List : </h3>
				<table class = "table table-hover">
					<tr>
						<td>Game Name</td>
						<td>Game Price</td>
						<td>Game Issuer</td>
						<td>Game Issuedate</td>
						<td>Game Type</td>
						<td>Game Description</td>
					</tr>

					<c:if test = "${not empty userinfo}">
						<c:forEach items = "${userinfo.game}" var = "game">
							<tr>
								<td>${game.gamename}</td>
								<td>${game.price}</td>
								<td>${game.issuer}</td>
								<td>${game.issuedate}</td>
								<td>${game.type}</td>
								<td>${game.description}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</body>
</html>