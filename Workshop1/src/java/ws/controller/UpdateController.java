/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ws.dao.DAO;
import ws.dto.Mobile;

/**
 *
 * @author tolyh
 */
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
