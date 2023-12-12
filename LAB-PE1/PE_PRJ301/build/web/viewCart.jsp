<%-- 
    Document   : viewCart
    Created on : au 28, 2023, 9:07:46 PM
    Author     : hd
--%>

<%@page import="java.util.Map"%>
<%@page import="pe.prj301.shopping.Cart"%>
<%@page import="java.util.List"%>
<%@page import="pe.prj301.shopping.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
    </head>
    <body>
        <h1>Your Shopping cart</h1>
        <!--your code here--> 
    <body>
        <%
            String cartEmpty = (String) request.getAttribute("CART_NULL");
            if (cartEmpty == null) {
                cartEmpty = "";
            }
        %>
        <%
            List<Products> listProducts = (List<Products>) request.getAttribute("LIST_MOBILE");
            Cart cart = (Cart) session.getAttribute("CART");
            if (listProducts != null && cart != null) {
                Map<String, Integer> listOrders = cart.getItems();
                if (listProducts.size() > 0 && listOrders.size() > 0) {
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
                        for (Products products : listProducts) {
                            if (products.getProductID().equals(key)) {
                                float total = products.getPrice() * listOrders.get(key);
                                totalCart += total;
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=key%></td>
                    <td><%=products.getProductName()%></td>
                    <td><%=products.getDescription()%></td>
                    <td><%=products.getPrice()%></td>
                    <td>                        
                        <input type="text" name="txtQuantityBuy" value="<%=listOrders.get(key)%>"/>

                    </td>
                    <td><%=total%></td>

                    <td>
                        <button type="submit" name="action" value="RemoveMobile">Remove</button>

                    </td>
                </tr>

                <input type="hidden" name="txtProductIDAdd" value="<%=products.getMobileId()%>"/>
                <input type="hidden" name="txtPriceBuy" value="<%=products.getPrice()%>">

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
</body>
</html>
