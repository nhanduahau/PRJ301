/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.prj301.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.prj301.shopping.Cart;
import pe.prj301.shopping.DAO;
import pe.prj301.shopping.Products;

/**
 *
 * @author tolyh
 */
public class CartController extends HttpServlet {

        private static final String CART_PAGE = "viewCart.jsp";

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String url = CART_PAGE;

            try {
                String action = request.getParameter("action");
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("CART");
                String txtProductID = request.getParameter("txtProductIDAdd");
                DAO dao = new DAO();
                List<Products> listMobile = dao.getAllProduct();
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
