<%-- 
    Document   : registerPage
    Created on : Dec 7, 2023, 2:44:58 AM
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
     style="text-align: center">
        <%
        String result_Updated = (String) request.getAttribute("ERROR_CREATE");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>
        <h1>CREATE USER</h1>
        <%=result_Updated%>
        <form action="MainController" method="POST">
            User ID <br>
            <input type="text" name="txtUserID" value=""/> <br>
            Full Name <br>
            <input type="text" name="txtFullName"value=""/> <br>
            Password <br>
            <input type="password" name="txtPassword"value=""/> <br>
            Confirm <br>
            <input type="password" name="txtConfirmPassword"value=""/> <br>
            <button type="submit" name="action" value="CreateUser">Create</button>
            <button type="reset">Reset</button> <br>
            <p>Already have account? <a href="/Workshop2">Click here</a></p>
        </form> 
    </body>
</html>
