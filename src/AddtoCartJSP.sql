<body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRole() != 0)) {
                response.sendRedirect("login.jsp");
                return;
            }
            String txtMin = request.getParameter("txtMin");
            if (txtMin == null) {
                txtMin = "";
            }
            String txtMax = request.getParameter("txtMax");
            if (txtMax == null) {
                txtMax = "";
            }
        %>
        <h1>User Page</h1>
        <form action="MainController?action=Logout">
            <input type="submit" value="Logout"/>
        </form>
        <form action ="MainController">
            <input type ="number" placeholder="Search by Min Price " name ="txtMin" value="<%=txtMin%>" />
            <input type ="number" placeholder="Search by Max Price " name ="txtMax" value="<%=txtMax%>" />
            <input type ="submit" name ="action" value ="SearchByPrice" />
        </form>
        <%
            String error = (String) request.getAttribute("ExNum");
            if (error == null) {
                error = "";
            }
        %>

        <%= error%>

        <%
            List<Mobile> listMobile = (List<Mobile>) request.getAttribute("LIST_MOBILE_BY_PRICE");
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
                    <th>Add to Cart</th>
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
                        <button type="submit" name="action" value="AddMobile">Add Mobile</button>
                        <input type="hidden" name="txtMobileIDAdd" value="<%=c.getMobileId()%>"/>
                        <input type="hidden" name="txtQuantityBuy" value="1"/>
                        <input type="hidden" name="txtPriceBuy" value="<%=c.getPrice()%>">
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