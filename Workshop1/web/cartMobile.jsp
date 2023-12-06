<%-- 
    Document   : cartMobile
    Created on : Dec 6, 2023, 10:16:43 PM
    Author     : tolyh
--%>

<%@page import="java.util.Map"%>
<%@page import="ws.dto.CartObj"%>
<%@page import="java.util.List"%>
<%@page import="ws.dto.Mobile"%>
<%@page import="ws.dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CART Page</title>
    </head>
    <body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRole() != 0)) {
                response.sendRedirect("login.jsp");
                return;
            }
            String cartEmpty = (String) request.getAttribute("CART_NULL");
            if (cartEmpty == null) {
                cartEmpty = "";
            }
        %>

        <a href="MainController?action=Logout" class="Logout">Logout</a>    

        <form action="MainController" method="POST">
            <button type="submit" name="action" value="SearchByPrice">Mobile Page</button>
        </form>



        <%
            List<Mobile> listMobile = (List<Mobile>) request.getAttribute("LIST_MOBILE");
            CartObj cart = (CartObj) session.getAttribute("CART");
            if (listMobile != null && cart != null) {
                Map<String, Integer> listOrders = cart.getItems();
                if (listMobile.size() > 0 && listOrders.size() > 0) {
                    float totalCart = 0;


        %>
        <table style="text-align: center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mobile Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%                    for (String key : listOrders.keySet()) {
                        for (Mobile mobile : listMobile) {
                            if (mobile.getMobileId().equals(key)) {
                                float total = mobile.getPrice() * listOrders.get(key);
                                totalCart += total;
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=key%></td>
                    <td><%=mobile.getMobileName()%></td>
                    <td><%=mobile.getDescription()%></td>
                    <td><%=mobile.getPrice()%></td>
                    <td>                        
                        <input type="text" name="txtQuantityBuy" value="<%=listOrders.get(key)%>"/>

                    </td>
                    <td><%=total%></td>

                    <td>
                        <button type="submit" name="action" value="RemoveMobile">Remove</button>

                    </td>
                </tr>

                <input type="hidden" name="txtMobileIDAdd" value="<%=mobile.getMobileId()%>"/>
                <input type="hidden" name="txtPriceBuy" value="<%=mobile.getPrice()%>">

            </form>
            <%
                    }
                }
            %>

        </tbody>
    </table>
    <%
        }

    %>
    <form action="MainController" method="POST">
        <button type="submit" name="action" value="SearchByPrice">Add more</button>
    </form>


    <h3>Cart Total</h3>
    <h4>Total: <%=totalCart%>$</h4>


    <%
            }
        }
    %>
</body>
</html>
