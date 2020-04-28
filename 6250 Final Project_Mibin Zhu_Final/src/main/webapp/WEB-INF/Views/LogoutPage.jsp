<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Logout Page</title>
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
                <h1>LOGOUT SUCCESS</h1>
                <br>
                <p>Click the link below to return to the main interface!</p>
                <a href = "<c:url value = "/" />">Return To The Home Page</a><br>
            </div>
        </div>
    </body>
</html>