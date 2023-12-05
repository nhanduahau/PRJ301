<%-- 
    Document   : createMobile
    Created on : Dec 5, 2023, 2:59:12 PM
    Author     : NHANTO
--%>

<%@page import="ws.dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Mobile</title>
    </head>
    <body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRole() != 2)) {
                response.sendRedirect("login.jsp");
                return;
            }

            String search = request.getParameter("txtCakeIDSearch");
            if (search == null) {
                search = "";
            }

            String result_Updated = (String) request.getAttribute("CREATE_ERROR");
            if (result_Updated == null) {
                result_Updated = "";
            }
        %>
        <div style="text-align: center">

            <a href="MainController?action=Logout" class="Logout" style="text-align: right">Logout</a>    

            <h1>Hello <%=loginUser.getFullName()%></h1>
            <form action="MainController">
                <button type="submit" name="action" value="Orders">Orders</button>
                <button type="submit" name="action" value="ManageUsers">Manage Users</button>
                <button type="submit" name="action" value="ManageCakes">Manage Cakes</button>
            </form>
        </div>

        <h1>Create Mobile</h1>
        <%=result_Updated%>

        <form action="MainController" method="POST">
            ID <input type="text" name="txtCakeID"value=""/> <br>
            Name<input type="text" name="txtCakeName"value=""/><br>
            Description<input type="text" name="txtCakeDescription"value=""/><br>
            Price<input type="text" name="txtCakePrice"value=""/><br>
            Image<input type="text" name="txtCakeImage"value=""/><br>
            <button type="Submit" name="action" value="CreateCake">CREATE</button>
        </form>

    </body>
</html>
