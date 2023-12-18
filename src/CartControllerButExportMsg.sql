public class CartController extends HttpServlet {

    private static final String CART_PAGE = "viewCart.jsp";
    private static final String SEARCH = "SearchAllController";
// Lấy thông tin product

    private Products getProduct(List<Products> listProduct, String productId) {

        for (Products c : listProduct) {
            if (c.getProductID().equals(productId)) {
                return c;
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CART_PAGE;

        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            String txtProductId = request.getParameter("txtProductIDAdd");
            DAO dao = new DAO();
            List<Products> listProduct = dao.getAllProducts();
            if (listProduct.size() > 0) {
                request.setAttribute("LIST_PRODUCT", listProduct);
            }
            //Check is this parameter is not null
            if (action.equalsIgnoreCase("AddProduct")) {
                if (txtProductId != "") {
                    if (cart == null) {
                        cart = new Cart();
                    }
                    cart.addProduct(txtProductId, 1);
                    url = SEARCH;

                    Products product = getProduct(listProduct, txtProductId);
                    //hiển thị thông tin sau khi add to cart
                    if (product != null) {
                        request.setAttribute("myStation", "Added " + product.getProductName() + " - 1 cái - " + product.getPrice());
                        session.setAttribute("CART", cart);

                    }
                }
            } else if (action.equalsIgnoreCase("RemoveProduct")) {
                if (cart != null) {
                    cart.removeProduct(txtProductId);
                    session.setAttribute("CART", cart);
                }
            }
        } catch (Exception e) {
            log("Error at CartController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

	//JSP
	         <%}
                    }
                }
                String value = (String) request.getAttribute("myStation");
                if (value == null) {
                    value = "";

                }
            %>
        </tbody>
    </table>
        <%=value%>
</body>