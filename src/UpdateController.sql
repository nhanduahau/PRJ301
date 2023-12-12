public class UpdateController extends HttpServlet {

    private static final String SUCCESS = "staffPage.jsp";
    private static final String ERROR = "staffPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;

        try {
            String txtMobileID = request.getParameter("mobileId");
            String txtPrice = request.getParameter("price");
            String txtDescription = request.getParameter("description");
            String txtQuantity = request.getParameter("quantity");
            String txtNotSale = request.getParameter("notSale");
            float price = Float.parseFloat(txtPrice);
            int quantity = Integer.parseInt(txtQuantity);
            boolean notSale = true;
            if (txtNotSale.equals("false")) {
                notSale = false;
            }
            DAO dao = new DAO();
            List<Mobile> listMobile = new ArrayList<>();
            listMobile = dao.getMobileListByIdOrName(txtMobileID, "");
            if (listMobile.size() > 0) {
                //Get the first Cake -- also that listCakes contain only 1 cake.
                Mobile mobile = listMobile.get(0);

                //update
                mobile.setPrice((price));
                mobile.setDescription(txtDescription);
                mobile.setQuantity(quantity);
                mobile.setNotSale(notSale);
                boolean result = dao.UpdateMobile(mobile);

                if (result == false) {
                    request.setAttribute("UPDATED_ERROR", "Update not successfully!");
                }
            } else {
                request.setAttribute("UPDATED_ERROR", "Cake not found!!");
                url = ERROR;
            }

        } catch (Exception e) {
            log("Error at UpdateCakeController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
