public class CartController extends HttpServlet {

    private static final String CART_PAGE = "cartMobile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CART_PAGE;

        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            CartObj cart = (CartObj) session.getAttribute("CART");
            String txtMobileId = request.getParameter("txtMobileIDAdd");
            DAO dao = new DAO();
            List<Mobile> listMobile = dao.getMobileListByIdOrName("", "");
            if (listMobile.size() > 0) {
                request.setAttribute("LIST_MOBILE", listMobile);
            }
            //Check is this parameter is not null
            if (action.equalsIgnoreCase("AddMobile")) {
                if (txtMobileId != "") {
                    if (cart == null) {
                        cart = new CartObj();
                    }
                    cart.addMobile(txtMobileId, 1);

                    session.setAttribute("CART", cart);
                }
            } else if (action.equalsIgnoreCase("RemoveMobile")) {
                if (cart != null) {
                    cart.removeMobile(txtMobileId);
                    session.setAttribute("CART", cart);
                }
            }
        } catch (Exception e) {
            log("Error at CartController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }