<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <title>Add Wish List</title>
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
                <h1>ADD WISH LIST</h1>
                <br>
                <p>All the games developed by the publisher are below.</p>
                <p>We will notify you when the game is released.</p>
                <p>Please ensure that your email address is accurate!</p>
                <a href = "<c:url value = "/" />">Return To The User Page</a><br>
            </div>
        </div>

        <div class = "container">
            <form:form id = 'wish' modelAttribute = "wish" action = '${pageContext.request.contextPath}/User/addwish' class = "form-signin" method = 'POST'>
                <div class = "form-group">
                    <label><strong>Wish Name : </strong></label>
                    <form:input path = "wishname" class = "form-control" id = "wishname" required = "true"/>
                    <form:errors path = "wishname"> </form:errors>
                </div>

                <div class = "form-group">
                    <label><strong>Wish Type : </strong></label>
                    <form:input path = "wishtype" class = "form-control" id = "wishtype" required = "true"/>
                    <form:errors path = "wishtype"> </form:errors>
                </div>

                <div class = "form-group">
                    <label><strong>Wish Description : </strong></label>
                    <form:textarea path = "wishdescription" class = "form-control" rows = "7" id = "wishdescription" required = "true"/>
                    <form:errors path = "wishdescription"> </form:errors>
                </div>

                <div class = "text-center">
                    <button class = "btn btn-primary btn-lg" type = "submit">Add Wish</button>
                </div>
                <br>
                <br>
                <br>
            </form:form>
        </div>
    </body>
</html>