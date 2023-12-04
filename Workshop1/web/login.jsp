<%-- 
    Document   : login
    Created on : Dec 2, 2023, 12:10:17 AM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
              <form action="MainController" method="POST">
            UserID <input name="id" /> 
            <br>
            Password <input type="password" name="pass" />
            <br>
            <br>
            <input name="action"  type="submit" value="Login" /> 
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
        </form>
    </body>
</html>
