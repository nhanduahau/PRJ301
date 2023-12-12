 </head>
    <body>
              <form action="MainController" method="POST">
            UserID <input name="id" /> 
            <br>
            Password <input type="password" name="pass" />
            <br>
            <br>
            <input name="action"  type="submit" value="Login" /> 
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
        </form>
    </body>