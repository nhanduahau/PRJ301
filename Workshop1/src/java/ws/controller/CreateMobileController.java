/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ws.dao.DAO;
import ws.dto.Mobile;

/**
 *
 * @author NHANTO
 */
public class CreateMobileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
