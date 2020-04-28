<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv = "Content-Type" content = "text/html; charset=ISO-8859-1">
        <title>Manager Information Page</title>
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
                <h1>USER INFO PAGE</h1>
                <br>
                <p>Below is your registration information, please check!</p>
                <a href = "<c:url value = "/" />">Return To The User Page</a><br>
            </div>
        </div>

        <div class = "container">
            <c:if test = "${not empty userinfo}">
                <form:form name = 'f' modelAttribute = "users" action = '${pageContext.request.contextPath }/views/users' class = "form-signin" method = 'POST'>
                    <div class = "form-group">
                        <label><strong>User Name : </strong></label>
                        <form>
                            <input name = "username" path = "username" class = "form-control" value = "${userinfo.username}" readonly>
                        </form>
                        <form:errors path = "username"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>First Name : </strong></label>
                        <form>
                            <input name = "firstName" path = "firstName" class = "form-control" value = "${userinfo.firstName}" readonly>
                        </form>
                        <form:errors path = "firstName"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>Last Name : </strong></label>
                        <form>
                            <input path = "lastName" class = "form-control" value = "${userinfo.lastName}" readonly>
                        </form>
                        <form:errors path = "lastName"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>Birthday : </strong></label>
                        <input type = "date" id = "bir" class = "form-control" value = "${userinfo.birthDate}" readonly>
                        <form:errors path = "birthDate"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>Email Address : </strong></label>
                        <form>
                            <input path = "email" class = "form-control" value = "${userinfo.email}" readonly>
                        </form>
                        <form:errors path = "email"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>Home Address : </strong></label>
                        <form>
                            <input path = "address" class = "form-control" value = "${userinfo.address}" readonly>
                        </form>
                        <form:errors path = "address"> </form:errors>
                    </div>

                    <div class = "form-group">
                        <label><strong>Phone Number : </strong></label>
                        <form>
                            <input path = "phone" class = "form-control" value = "${userinfo.phone}" readonly>
                        </form>
                        <form:errors path = "phone"> </form:errors>
                    </div>

                    <%--<div class = "text-center">--%>
                        <%--<button class = "btn btn-primary btn-lg" type = "submit">Update</button>--%>
                    <%--</div>--%>
                    <br>
                    <br>
                    <br>
                </form:form>
            </c:if>
        </div>
    </body>
</html>