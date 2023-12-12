
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCHBYIDORNAME = "SearchByIdOrName";
    private static final String SEARCHBYIDORNAME_CONTROLLER = "SearchByIdOrNameController";
    private static final String SEARCHBYPRICE = "SearchByPrice";
    private static final String SEARCHBYPRICE_CONTROLLER = "SearchByPriceController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String CREATEMOBILE = "CreateMobile";
    private static final String CREATEMOBILE_CONTROLLER = "CreateMobileController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String VIEW_CART = "ViewCart";
    private static final String ADD_MOBILE = "AddMobile";
    private static final String REMOVE_MOBILE = "RemoveMobile";
    private static final String CART_CONTROLLER = "CartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            }
            if (action.equalsIgnoreCase(LOGIN)) {
                url = LOGGIN_CONTROLLER;
            } else if (action.equalsIgnoreCase(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            } else if (action.equalsIgnoreCase(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            } else if (action.equalsIgnoreCase(SEARCHBYIDORNAME)) {
                url = SEARCHBYIDORNAME_CONTROLLER;
            } else if (action.equalsIgnoreCase(SEARCHBYPRICE)) {
                url = SEARCHBYPRICE_CONTROLLER;
            } else if (action.equalsIgnoreCase(DELETE)) {
                url = DELETE_CONTROLLER;
            } else if (action.equalsIgnoreCase(CREATEMOBILE)) {
                url = CREATEMOBILE_CONTROLLER;
            } else if (action.equalsIgnoreCase(UPDATE)) {
                url = UPDATE_CONTROLLER;
            } else if (action.equalsIgnoreCase(ADD_MOBILE) || action.equalsIgnoreCase(REMOVE_MOBILE) || action.equalsIgnoreCase(VIEW_CART)) {
                url = CART_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }