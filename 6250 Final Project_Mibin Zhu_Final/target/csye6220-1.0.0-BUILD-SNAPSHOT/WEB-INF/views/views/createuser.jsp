<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <title>Status Page</title>
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

            <%--<div class = "collapse navbar-collapse" id = "collapsibleNavbar">--%>
            <%--<ul class = "navbar-nav">--%>
            <%--<li class = "nav-item">--%>
            <%--<a class = "nav-link" href = "">Game Store</a>--%>
            <%--</li>--%>

            <%--<li class = "nav-item">--%>
            <%--<a class = "nav-link" href = "">Wish List</a>--%>
            <%--</li>--%>

            <%--<li class = "nav-item">--%>
            <%--<a class = "nav-link" href = "">Personal Info</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</div>--%>
        </nav>

        <%--<div class = "container">--%>
            <%--<div class = "jumbotron">--%>
                <%--<h1>User Page</h1>--%>
                <%--<br>--%>
                <%--<p>You are login as a user successfully!</p>--%>
            <%--</div>--%>
        <%--</div>--%>

        <div class = "container">
            <div class = "jumbotron">
                <c:if test = "${not empty status}">
                    <c:if test="${status=='successful'}">
                        <h1>You are ${status} in creating a new user!</h1>
                            <c:if test = "${not empty user}">
                                <p>Your username is : ${user.username}</p>
                            </c:if><br>

                            <p>Please<a href = "<c:url value = "/resources/login.jsp"/>">login here.</a></p>
                    </c:if>

                    <c:if test = "${status != 'successful'}">
                        <h1>You are updating the user!</h1>
                            <c:if test = "${not empty user}">
                                <p>Your username is : ${user.username }</p>
                            </c:if><br>

                            <p>Please<a href = "<c:url value = "/resources/login.jsp"/>">login here.</a></p>
                    </c:if>
                </c:if>
                <a href = "<c:url value = "/" />">Return to home!</a>
            </div>
        </div>
    </body>
</html>