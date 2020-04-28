<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page session = "false" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>

<html>
	<head>
        <title>Steam Game Store</title>
        <meta charset = "utf-8">
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
        </nav>
        
        <div class = "container">
            <div class = "jumbotron">
                <h1>COME AND ENJOY THE GAME</h1>
                <br>
                <p>Welcome to our Steam Game Store!</p>
                <p>With the growing number of steam games.</p>
                <p>How to select a proper game for each user has gradually becomes a problem.</p>
                <p>So we provided a standard platform to solve this problem for a convenient and good user experience.</p>
            </div>
       	</div>

        <div class = "container">
            <div class = "jumbotron">
                <c:if test = "${username == 'anonymousUser'}">
                    <h2>Click the following link to login!</h2>
                    <a href = "<c:url value = "/resources/login.jsp"/>" class = "nav-link">Log In</a><br>
                </c:if>

                <sec:authorize access = "hasRole('TEACHER')">
                    <h2>Login as a manager successfully!</h2>
                    <p>Click the following link to add more games!</p>
                    <a href = "<c:url value = "/Manager/ManagerInterface"/>">Manager Interface</a><br>
                    <hr>
                </sec:authorize>

                <sec:authorize access = "hasRole('STUDENT')">
                    <h2>Login as a user successfully!</h2>
                    <p>Click the following link to buy more games!</p>
                    <a href = "<c:url value = "/User/UserInterface"/>">User Interface</a><br>
                    <hr>
                </sec:authorize>

                <sec:authorize access = "isAuthenticated()">
                    <p>Click the following link to logout!</p>
                    <a href = "<c:url value = "/Views/LogoutPage"/>">Log out</a>
                </sec:authorize>
            </div>
        </div>
	</body>
</html>