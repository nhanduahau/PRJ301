<%-- 
    Document   : userPage
    Created on : Dec 4, 2023, 12:59:34 PM
    Author     : tolyh
--%>

<%@page import="dto.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Users loginUser = (Users) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !("US".equals(loginUser.getRoleID()))) {
                response.sendRedirect("loginPage.jsp");
                return;
            }
        %>

        <a href="MainController?action=Logout" class="Logout">Logout</a>    
        <form action="MainController" method="GET">
            <button type="submit" name="action" value="OurCakes">Our Cakes</button>
            <button type="submit" name="action" value="ViewCart">Cart</button>
            
        </form>
    </body>
</html>
