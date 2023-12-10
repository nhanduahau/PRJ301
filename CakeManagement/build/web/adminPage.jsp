<%-- 
    Document   : adminPage
    Created on : Dec 4, 2023, 12:59:41 PM
    Author     : tolyh
--%>

<%@page import="dto.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN Page</title>
    </head>
    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("AD".equals(loginUser.getRoleID()))) {
                response.sendRedirect("loginPage.jsp");
                return;
            }
        %>
        <div style="text-align: center">
            <a href="MainController?action=Logout" class="Logout" style="text-align: right">Logout</a>    
            <h1>Hello <%=loginUser.getFullName()%></h1>

            <form action="MainController">
                <button type="submit" name="action" value="ManageOrders">Orders</button>
                <button type="submit" name="action" value="ManageUsers">Manage Users</button>
                <button type="submit" name="action" value="ManageCakes">Manage Cakes</button>
            </form>

        </div>

    </body>
</html>
