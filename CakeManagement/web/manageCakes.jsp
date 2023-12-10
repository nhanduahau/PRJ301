<%-- 
    Document   : manageCakes
    Created on : Dec 4, 2023, 1:35:43 PM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
<%@page import="dto.Cakes"%>
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

            String search = request.getParameter("txtCakeIDSearch");
            if (search == null) {
                search = "";
            }

            String result_Updated = (String) request.getAttribute("UPDATED_ERROR");
            if (result_Updated == null) {
                result_Updated = "";
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
        <div>
            <form action="MainController">
                <input type="text" name="txtCakeIDSearch" placeholder="Search by Cake ID" value="<%=search%>"/>
                <button type="submit" name="action" value="ManageCakes">Submit</button>
            </form>
                <p>Create Cakes? <a href="/CakeManagement/createCake.jsp">Click Here</a></p>
            <%=result_Updated%>
        </div>
        <%
            List<Cakes> listCakes = (List<Cakes>) request.getAttribute("LIST_CAKES");
            if (listCakes != null) {
                if (listCakes.size() > 0) {
        %>
        <table style="width: 80%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Cake ID</th>
                    <th>Cake Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody style="text-align: center">
                <%
                    int count = 0;
                    for (Cakes cake : listCakes) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=++count%></td>
                    <td>
                        <%=cake.getCakeID()%>
                    </td>

                    <td>                       
                        <input type="text" name="txtCakeName"value="<%=cake.getCakeName()%>"/>
                    </td>

                    <td>
                        <input type="text" name="txtCakeDescription"value="<%=cake.getDescription()%>"/>
                    </td>

                    <td>
                        <input type="text" name="txtCakePrice"value="<%=cake.getPrice()%>"/>
                    </td>

                    <td>
                        <img src="<%=cake.getImage()%>" width="100" height="100">
                        
                    </td>

                    <td>
                        <input type="submit" name="action" value="UpdateCake"/>
                        <input type="hidden" name="txtCakeID" value="<%=cake.getCakeID()%>"/>
                        <input type="hidden" name="txtCakeIDSearch" value="<%=search%>"/>
                    </td>
            </form>
            <td>
                <a href="MainController?txtCakeIDSearch=<%=search%>&action=DeleteCake&txtCakeID=<%=cake.getCakeID()%>">Delete</a>
            </td>
        </tr>
        <% }
        %>
    </tbody>

</table>

<%
        }

    }
%>
</body>
</html>