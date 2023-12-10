<%-- 
    Document   : manageOrders
    Created on : Dec 5, 2023, 12:30:42 AM
    Author     : tolyh
--%>

<%@page import="dto.OrderDetails"%>
<%@page import="dto.Orders"%>
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

            String search = request.getParameter("txtDateSearch");
            if (search == null) {
                search = "";
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
                <input type="text" name="txtDateSearch" placeholder="Search by Date" value="<%=search%>"/>
                <button type="submit" name="action" value="ManageOrders">Submit</button>
            </form>
        </div>
        <%
            List<Orders> listOrders = (List<Orders>) request.getAttribute("LIST_ORDERS");
            List<OrderDetails> listOrderDetails = (List<OrderDetails>) request.getAttribute("LIST_ORDERS_DETAILS");
            if (listOrders != null) {
                if (listOrders.size() > 0) {
        %>
        <table style="width: 80%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>User ID</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Cake ID</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody style="text-align: center">
                <%
                    int count = 0;
                    for (Orders order : listOrders) {
                        for (OrderDetails orderDetails : listOrderDetails) {
                            if (order.getOrderID() == orderDetails.getOrderID()) {
                %>

                <tr>
                    <td><%=++count%></td>

                    <td>
                        <%=order.getOrderID()%>
                    </td>

                    <td>                       
                        <%=order.getDateBuy()%>
                    </td>

                    <td>
                        <%=order.getUserID()%>
                    </td>

                    <td>
                        <%=order.getPhone()%>
                    </td>

                    <td>
                        <%=order.getAddress()%>
                    </td>

                    <td>
                        <%=orderDetails.getCakeID()%>
                    </td>
                    <td>
                        <%=orderDetails.getQuantity()%>

                    </td>

                </tr>
                <% }
                        }
                    }
                %>
            </tbody>

        </table>

        <%

            }
}
        %>

    </body>
</html>
