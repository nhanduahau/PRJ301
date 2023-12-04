<%-- 
    Document   : staffPage
    Created on : Dec 2, 2023, 12:16:33 AM
    Author     : tolyh
--%>

<%@page import="java.util.List"%>
<%@page import="ws.dto.Mobile"%>
<%@page import="ws.dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
    </head>
    <body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRole() != 2)) {
                response.sendRedirect("login.jsp");
                return;
            }
            String txtMobileId = request.getParameter("txtMobileId");
            if (txtMobileId == null) {
                txtMobileId = "";
            }
            String txtMobileName = request.getParameter("txtMobileName");
            if (txtMobileName == null) {
                txtMobileName = "";
            }
        %>
        <h1>Staff Page</h1>
        <form action="MainController?action=Logout">
            <input type="submit" value="Logout"/>
        </form>
        <form action ="MainController">
            <input type ="text" placeholder="Search by ID " name ="txtMobileId" value="<%=txtMobileId%>" />
            <input type ="text" placeholder="Search by Name " name ="txtMobileName" value="<%=txtMobileName%>" />
            <input type ="submit" name ="action" value ="SearchByIdOrName" />
        </form>
        <%
            List<Mobile> listMobile = (List<Mobile>) request.getAttribute("LIST_MOBILE_BY_IDORNAME");
            if (listMobile != null) {
                if (listMobile.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Mobile Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Year Of Production</th>
                    <th>Quantity</th>
                    <th>Not Sale</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Mobile c : listMobile) {

                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getMobileId()%></td>
                    <td>
                        <input type="text" name="mobileName" value="<%= c.getMobileName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="description" value="<%= c.getDescription()%>" required=""/>
                    </td>

                    <td>
                        <input type="text" name="price" value="<%= c.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="yearOfProduction" value="<%= c.getYearOfProduction()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="quantity" value="<%= c.getQuantity()%>" required=""/>
                    </td>

                    <td>
                        <input type="text" name="notSale" value="<%= c.isNotSale()%>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="mobileId" value="<%= c.getMobileId()%>"/>
                        <input type="hidden" name="search" value="<%= "SearchByIdOrName"%>"/>
                    </td>
                    <td>
                        <a href="MainController?search=<%="SearchByIdOrName"%>&action=Delete&txtMobileId=<%=c.getMobileId()%>">Delete</a>
                    </td>
                </tr>
            </form>
            <%}
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
