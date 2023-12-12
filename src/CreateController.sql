public class CreateMobileController extends HttpServlet {

    private static final String SUCCESS = "staffPage.jsp";
    private static final String ERROR = "createMobile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;

        try {
            String txtMobileId = request.getParameter("txtMobileId");
            String txtMobileName = request.getParameter("txtMobileName");
            String txtMobileDescription = request.getParameter("txtMobileDescription");
            String txtMobilePrice = request.getParameter("txtMobilePrice");
            String txtQuantity = request.getParameter("txtQuantity");
            String txtYearOfProduction = request.getParameter("txtYearOfProduction");
            String txtNotSale = request.getParameter("txtNotSale");
            float price = Float.parseFloat(txtMobilePrice);
            int quantity = Integer.parseInt(txtQuantity);
            int yearOfProduction = Integer.parseInt(txtYearOfProduction);
            boolean notSale = true;
            if (txtNotSale.equals("false")) {
                notSale = false;
            }

            Mobile mobile = new Mobile(txtMobileId, txtMobileDescription, price, txtMobileName, yearOfProduction, quantity, notSale);
            DAO dao = new DAO();
            boolean result = dao.CreateMobile(mobile);
            if (result == false) {
                request.setAttribute("CREATE_ERROR", "CREATE not successfully!");
                url = ERROR;

            }
        } catch (Exception e) {
            log("Error at CreateCakeController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }