public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String STAFF_PAGE = "staffPage.jsp";
    private static final String USER_PAGE = "userPage.jsp";
    private static final int USER = 0;
    private static final int STAFF = 2;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String txtuserID = request.getParameter("id");
            String txtpassword = request.getParameter("pass");
            int password = Integer.parseInt(txtpassword);
            DAO dao = new DAO();
            User loginUser = dao.checkLogin(txtuserID.trim(), password);

            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect userID or password!!");

            } else if (loginUser.getRole() == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = USER_PAGE;
            } else if (loginUser.getRole() == 2) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = STAFF_PAGE;
            } else {
                request.setAttribute("ERROR", "Incorrect Role!");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }