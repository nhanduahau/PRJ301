public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String ADMIN_PAGE = "capstoneList.jsp";
    private static final String ADMIN = "AD";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String txtuserID = request.getParameter("id");
            String txtpassword = request.getParameter("pass");
            DAO dao = new DAO();
            Users loginUser = dao.checkLogin(txtuserID.trim(), txtpassword.trim());

            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect userID or password!!");

            } else if (loginUser.getRoleID().equals(ADMIN)) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = ADMIN_PAGE;

            } else {
                request.setAttribute("ERROR", "Incorrect Role!");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }