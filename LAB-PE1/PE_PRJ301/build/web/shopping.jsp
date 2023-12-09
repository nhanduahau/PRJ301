<%-- 
    Document   : index
    Created on : au 28, 2023, 9:01:26 PM
    Author     : Hoadnt
--%>

<%@page import="java.util.List"%>
<%@page import="pe.prj301.shopping.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1>Welcome to FPTU's shop</h1>
        <!--your code here-->
        <%


        %>

        <!--        <p>Create Mobile? <a href="/Workshop1/createMobile.jsp">Create Mobile</a></p>-->
        <form action ="MainController">
            <input type ="submit" name ="action" value ="Search" />
        </form>
        <%            List<Products> listProduct = (List<Products>) request.getAttribute("LIST_ALL_PRODUCTS");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>
        </br>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Add</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (Products c : listProduct) {

                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><%= c.getProductID()%></td>
                    <td>
                        <input type="text" name="productName" value="<%= c.getProductName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="description" value="<%= c.getDescription()%>" required=""/>
                    </td>

                    <td>
                        <input type="text" name="price" value="<%= c.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Add"/>
                        <input type="hidden" name="txtProductIDAdd" value="<%= c.getProductID()%>"/>
                        <input type="hidden" name="search" value="<%= "SearchByIdOrName"%>"/>
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
