<%-- 
    Document   : loginPage
    Created on : Dec 7, 2023, 2:45:07 AM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <!--your code here-->
        <form action="MainController" method="POST">
            Username <input name="txtUserID" /> 
            <br>
            Password <input type="password" name="txtPassword" />
            <br>
            <br>
            <input name="action"  type="submit" value="Login" /> 
            <button type="reset">Reset</button> <br>

            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
        </form>
        <p>Create new user account? <a href="/Workshop2/registerPage.jsp">Click here</a></p>

    </body>
</html>
