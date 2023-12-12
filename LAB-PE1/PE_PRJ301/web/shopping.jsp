<%-- 
    Document   : index
    Created on : au 28, 2023, 9:01:26 PM
    Author     : Hoadnt
--%>

<%@page import="pe.prj301.shopping.Products"%>
<%@page import="java.util.List"%>
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

        <form action ="MainController">
            <input type ="submit" name ="action" value ="SearchAll" />
        </form>
        <%            List<Products> listProduct = (List<Products>) request.getAttribute("LIST_ALL_PRODUCT");
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
                    <td></td>
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
