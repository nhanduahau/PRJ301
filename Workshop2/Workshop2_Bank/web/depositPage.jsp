<%-- 
    Document   : depositPage
    Created on : Dec 8, 2023, 3:01:01 AM
    Author     : tolyh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit Page</title>
    </head>
    <body>
        <%
            String username = (String)request.getParameter("txtUsername");
            if (username != null) {
        %>
        <form action="MainController" method="POST">
            <input type="text" name="" value="<%=username%>" disabled="disabled"> 
            
            <input type="hidden" name="txtUsername" value="<%=username%>">
            <input type="text" name="txtNewValue" value="">
            <button type="submit" name="action" value="UpdateDeposit">Add Deposit</button>

        </form>
        <%
        } else {

        %>
        <p>Please choose customer!</p>
        <%}%>
    </body>
</html>
