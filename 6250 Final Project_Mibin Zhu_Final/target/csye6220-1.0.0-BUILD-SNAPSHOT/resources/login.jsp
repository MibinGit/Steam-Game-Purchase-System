<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <meta name = "viewport" content = "width=device-width, initial-scale=1">
        <title>Login Page</title>
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

        <div class = "container">
            <div class = "jumbotron">
                <h1>COME AND ENJOY THE GAME!!!</h1>
                <br>
                <p>Please use your Username and Password to login!</p>
            </div>
        </div>

        <div class = "container">
            <div class = "jumbotron">
                <form name = 'f' action = '${pageContext.request.contextPath}/login' method = 'POST' class = "form-signin">
                    <table>
                        <tr>
                            <td>User Name :  </td>
                            <td><input type = 'text' name = 'username' value = '' class = "form-control" placeholder = "Username"></td>
                        </tr>

                        <tr></tr>

                        <tr>
                            <td>Password :  </td>
                            <td><input type = 'password' name = 'password' class = "form-control" placeholder = "Password"/></td>
                        </tr>

                        <tr>
                            <td colspan = '2'><input name = "submit" type = "submit" class = "btn btn-primary" value = "Login"/></td>
                        </tr>

                        <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                    </table>
                    <p class = "mt-5 mb-3 text-muted">If you don't have an account, Please <a href = '<c:url value = "/SignupPage"/>'>Sign Up</a> here.</p>
                </form>
            </div>
        </div>
    </body>
</html>