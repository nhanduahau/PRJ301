   private static final String ERROR = "staffPage.jsp";
    private static final String SUCCESS = "staffPage.jsp";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
           
            String txtMobileId = request.getParameter("txtMobileId");
            String txtMobileName = request.getParameter("txtMobileName");
            DAO dao = new DAO();
            List<Mobile> listMobile = dao.getMobileListByIdOrName(txtMobileId, txtMobileName);
            if (listMobile.size() > 0) {
                request.setAttribute("LIST_MOBILE_BY_IDORNAME", listMobile);
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }


