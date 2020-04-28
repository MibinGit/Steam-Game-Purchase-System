<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <title>Buy Steam Game</title>
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
                <h1>BUY A GAME</h1>
                <br>
                <p>All the games developed by the publisher are below.</p>
                <p>Please select the game you are interested in to buy!</p>
                <a href = "<c:url value = "/" />">Return To The User Page</a><br>
            </div>
        </div>

        <div class = "container">
            <div class = "jumbotron">
                <form action = "${pageContext.request.contextPath }/User/add" method = 'POST' >
                    <c:if test = "${empty game}">
                        <p>Sorry, there have no game now</p>
                    </c:if>

                    <table class = "table table-hover">
                        <tr>
                            <td>#</td>
                            <td>Game Name</td>
                            <td>Game Price</td>
                            <td>Game Issuer</td>
                            <td>Game Issuedate</td>
                            <td>Game Type</td>
                            <td>Game Description</td>
                        </tr>

                        <c:if test = "${not empty game}">
                            <c:forEach items = "${game}" var = "game">
                                <tr>
                                    <td><input type = "checkbox" name = "gameid" value = "${game.id}" /></td>
                                    <td>${game.gamename}</td>
                                    <td>${game.price}</td>
                                    <td>${game.issuer}</td>
                                    <td>${game.issuedate}</td>
                                    <td>${game.type}</td>
                                    <td>${game.description}</td>
                                </tr>
                            </c:forEach>
                            <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
                        </c:if>
                    </table>

                    <div class = "text-center">
                        <button class = "btn btn-primary btn-lg" type = "submit">Add To Cart</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>