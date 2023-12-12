<body>
        <%
            User loginUser = (User) session.getAttribute("LOGIN_USER");
            if (loginUser == null || (loginUser.getRole() != 2)) {
                response.sendRedirect("login.jsp");
                return;
            }

            String search = request.getParameter("txtMobileIDSearch");
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

        </div>

        <h1>Create Mobile</h1>
        <%=result_Updated%>

        <form action="MainController" method="POST">
            ID <input type="text" name="txtMobileId"value=""/> <br>
            Name<input type="text" name="txtMobileName"value=""/><br>
            Description<input type="text" name="txtMobileDescription"value=""/><br>
            Price<input type="text" name="txtMobilePrice"value=""/><br>
            Quantity<input type="text" name="txtQuantity"value=""/><br>
            YearOfProduction<input type="text" name="txtYearOfProduction"value=""/><br>
            <label>Not Sale?</label>
            <input type="radio" id="available" name="txtNotSale" value="true" checked>
            <label for="available">Yes</label>
            <input type="radio" id="notAvailable" name="txtNotSale" value="false">
            <label for="notAvailable">No</label><br>

            <button type="Submit" name="action" value="CreateMobile">CREATE</button>
        </form>

    </body>