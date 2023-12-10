<%-- 
    Document   : manageUser
    Created on : Dec 4, 2023, 10:32:23 PM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
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
            if (loginUser == null || !("AD".equals(loginUser.getRoleID()))) {
                response.sendRedirect("loginPage.jsp");
                return;
            }

            String search = request.getParameter("txtFullNameSearch");
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
                <input type="text" name="txtFullNameSearch" placeholder="Search by FullName" value="<%=search%>"/>
                <button type="submit" name="action" value="ManageUsers">Submit</button>
            </form>
            <%=result_Updated%>
        </div>
        
          <%
            List<Users> listUsers = (List<Users>) request.getAttribute("LIST_USERS");
            if (listUsers != null) {
                if (listUsers.size() > 0) {
        %>
        <table style="width: 60%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody style="text-align: center">
                <%
                    int count = 0;
                    for (Users user : listUsers) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=++count%></td>
                    <td>
                        <%=user.getUserID()%>
                    </td>

                    <td>                       
                        <input type="text" name="txtFullName"value="<%=user.getFullName()%>"/>
                    </td>

                    <td>
                        <input type="text" name="txtRoleID"value="<%=user.getRoleID()%>"/>
                    </td>

                    <td>
                        ***
                    </td>

                    <td>
                        <input type="submit" name="action" value="UpdateUser"/>
                        <input type="hidden" name="txtUserID" value="<%=user.getUserID()%>"/>
                        <input type="hidden" name="txtFullNameSearch" value="<%=search%>"/>
                    </td>
            </form>
            <td>
                <a href="MainController?txtFullNameSearch=<%=search%>&action=DeleteUser&txtUserID=<%=user.getUserID()%>">Delete</a>
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
