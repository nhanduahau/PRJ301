/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CakeDAO;
import dto.Cakes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tolyh
 */
@WebServlet(name = "UpdateCakeController", urlPatterns = {"/UpdateCakeController"})
public class UpdateCakeController extends HttpServlet {

    private static final String MANAGE_CAKES = "ManageCakesController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MANAGE_CAKES;

        try {
            String txtCakeID = request.getParameter("txtCakeID");
            String txtCakeName = request.getParameter("txtCakeName");
            String txtCakeDescription = request.getParameter("txtCakeDescription");
            String txtCakePrice = request.getParameter("txtCakePrice");

            CakeDAO dao = new CakeDAO();
            List<Cakes> listCakes = new ArrayList<>();
            listCakes = dao.SearchCake(txtCakeID);
            if (listCakes.size() > 0) {
                //Get the first Cake -- also that listCakes contain only 1 cake.
                Cakes cake = listCakes.get(0);

                //update
                cake.setCakeName((txtCakeName));
                cake.setDescription(txtCakeDescription);
                cake.setPrice(Float.parseFloat(txtCakePrice));
                boolean result = dao.UpdateCake(cake);

                if (result == false) {
                    request.setAttribute("UPDATED_ERROR", "Update not successfully!");
                }
            } else {
                request.setAttribute("UPDATED_ERROR", "Cake not found!!");
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
