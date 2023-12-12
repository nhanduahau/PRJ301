public class DeleteController extends HttpServlet {

    private static final String ERROR = "SearchByIdOrNameController";
    private static final String SUCCESS = "SearchByIdOrNameController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String txtMobileId = request.getParameter("txtMobileId");
            DAO dao = new DAO();
            boolean checkDelete = dao.delete(txtMobileId);
            if (checkDelete) {
                url = SUCCESS;

            }
        } catch (Exception e) {
            log("Error at DeleteController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }