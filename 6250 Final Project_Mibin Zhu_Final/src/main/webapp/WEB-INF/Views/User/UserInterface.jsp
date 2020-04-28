<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
		<title>User Page</title>
		<meta name = "viewport" content = "width=device-width, initial-scale=1">
		<link rel = "stylesheet" href = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
		<script src = "https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src = "https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
		<script src = "https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script type = "text/javascript">
            function delgame(id)
            {
                document.getElementById(id).style.display = "none";
            }
		</script>
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
						<a class = "nav-link" href = "<c:url value = "/User/BuyGame" />">Buy Steam Game</a>
					</li>

					<li class = "nav-item">
						<a class = "nav-link" href = "<c:url value = "/User/WishList" />">Wish List</a>
					</li>

					<li class = "nav-item">
						<a class = "nav-link" href = "<c:url value = "/User/UserInformation" />">Personal Info</a>
					</li>
				</ul>
			</div>

			<form class = "form-inline">
				<div class = "form-group">
					<input type = "text" class = "form-control" id = "exampleInputName2" placeholder = "Monster Hunter">
				</div>
				<button type = "submit" class = "btn btn-primary">Search</button>
			</form>

			<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>

			<sec:authorize access = "isAuthenticated()">
				<div class = "text-right">
					<a class = "navbar-brand" href = "<c:url value = "/Views/LogoutPage" />">Log Out</a>
				</div>
			</sec:authorize>
		</nav>

		<div class = "container">
			<div class = "jumbotron">
				<dl class = "dl-horizontal">
					<h1>You are login as a user successfully!</h1>
					<br>
					<dt>Buy Game</dt>
					<dd>You can purchase any game that the publisher has added to the steam mall.</dd>
					<br>
					<dt>Wish List</dt>
					<dd>If the game you want to buy has not yet been officially released,</dd>
					<dd>you can register the game you want to purchase in the form of a reservation.</dd>
					<br>
					<dt>Personal Information</dt>
					<dd>You can see the user information you registered on this page.</dd>
					<br>
					<dt>Game Cart</dt>
					<dd>The first form below is your shopping list, you can delete it.</dd>
					<br>
					<dt>Wish List Table</dt>
					<dd>The second form below is your wish list that you have already added, you can delete it.</dd>
				</dl>
			</div>
		</div>

		<div class = "container">
			<div class = "jumbotron">
				<h3 class = "text-primary">Your Game Cart : </h3>
				<table class = "table table-hover">
					<tr>
						<td>Game Name</td>
						<td>Game Price</td>
						<td>Game Issuer</td>
						<td>Game Issuedate</td>
						<td>Game Type</td>
						<td>Game Description</td>
						<td>Drop State</td>
					</tr>

					<c:if test = "${not empty userinfo}">
						<c:forEach items = "${userinfo.game}" var = "game">
							<tr id = "${game.id}">
								<td>${game.gamename}</td>
								<td>${game.price}</td>
								<td>${game.issuer}</td>
								<td>${game.issuedate}</td>
								<td>${game.type}</td>
								<td>${game.description}</td>
								<td>
									<button type = "submit" class = "btn btn-primary btn-sm" onclick = "delgame(${game.id})">DELETE</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>

		<div class = "container">
			<div class = "jumbotron">
				<h3 class = "text-primary">Your Wish List : </h3>
				<table class = "table table-hover">
					<tr>
						<td>Wish Name</td>
						<td>Wish Type</td>
						<td>Wish Description</td>
					</tr>

					<c:if test = "${not empty userinfo}">
						<c:forEach items = "${userinfo.wish}" var = "wish">
							<tr id = "w${wish.id}">
								<td>${wish.wishname}</td>
								<td>${wish.wishtype}</td>
								<td>${wish.wishdescription}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</body>
</html>
