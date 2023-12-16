 <%
            UsersDTO loginUser = (UsersDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !(loginUser.getRoleID().equals("AD"))) {
                response.sendRedirect("login.jsp");
                return;
            }
            loginUser.getFullName();
            String txtMobileId = request.getParameter("txtMobileId");
            if (txtMobileId == null) {
                txtMobileId = "";
            }
            String txtMobileName = request.getParameter("txtMobileName");
            if (txtMobileName == null) {
                txtMobileName = "";
            }
              %>
        <h1>Hello World!</h1>
        <p> hello <%=loginUser.getFullName()%></p>