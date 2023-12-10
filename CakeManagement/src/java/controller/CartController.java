/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CakeDAO;
import dto.Cakes;
import dto.CartObject;
import dto.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tolyh
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private static final String CART = "cartPage.jsp";
    private static final String CAKES = "ourCakesPage.jsp";
    private static final String CHECK_OUT = "checkOutPage.jsp";

    private boolean isExisting(List<Cakes> listCakes, String cakeID) {
        boolean result = false;
        for (Cakes cake : listCakes) {
            if (cake.getCakeID().equals(cakeID)) {
                result = true;
                break;
            }
        }
        return result;
    }

    private boolean cartIsEmpty(CartObject cart) {
        boolean result = true;
        if (cart == null) {
            result = false;
        } else {
            if (cart.getItems() == null) {
                result = false;
            } else if (cart.getItems().size() == 0) {
                result = false;
            }
        }

        return result;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = CART;
        try {

            String action = request.getParameter("action");
            HttpSession session = request.getSession(true);
            CartObject cart = (CartObject) session.getAttribute("CART");
            String txtCakeIDBuy = request.getParameter("txtCakeIDBuy");
            String txtPriceBuy = request.getParameter("txtPriceBuy");
            String txtQuantityBuy = request.getParameter("txtQuantityBuy");

            List<Cakes> listCakes = new ArrayList<>();
            CakeDAO dao = new CakeDAO();

            listCakes = dao.SearchCake("");
            if (listCakes.size() > 0) {
                request.setAttribute("LIST_CAKES", listCakes);
            }

            if (action.equalsIgnoreCase("ViewCart")) {
                if (cartIsEmpty(cart) == false) {
                    request.setAttribute("CART_NULL", "Your CART is empty!!");
                }

            } else if (action.equalsIgnoreCase("CheckOut")) {
                if (cartIsEmpty(cart) == false) {
                    url = CAKES;
                } else {
                    url = CHECK_OUT;
                }

            } else if (isExisting(listCakes, txtCakeIDBuy)) { //Check that cake is existing in DB

                float price = Float.parseFloat(txtPriceBuy);
                int quantity = Integer.parseInt(txtQuantityBuy);

                if (action.equalsIgnoreCase("BuyCake")) {
                    if (cart == null) {
                        cart = new CartObject();
                    }

                    //If not exist will set quantity = 1, if exist but click buy --> Do not change quantity
                    if (cart.getItems() != null) {
                        if (cart.getItems().containsKey(txtCakeIDBuy)) {
                            quantity = cart.getItems().get(txtCakeIDBuy);
                        }
                    }

                    cart.addCakes(txtCakeIDBuy, quantity);

                    session.setAttribute("CART", cart);

                } else if (action.equalsIgnoreCase("ChangeQuantity")) {
                    if (quantity > 0 && cart != null) {

                        cart.addCakes(txtCakeIDBuy, quantity);
                        session.setAttribute("CART", cart);

                    }
                } else if (action.equalsIgnoreCase("RemoveCake")) {
                    if (cart != null) {
                        cart.removeCake(txtCakeIDBuy);
                        session.setAttribute("CART", cart);
                    }
                }

                //If action is Buy --> Check in cart is have this Cakes?
                //If yes -> send to cart page
                //If no -> add new to --> send to cart page
                //If changeQuantity 
                //Check is this Cake have in CART?
                //If yes
                // < 1 --> How current quantity
                // Else change quantity
                //If No --> Do Nothing
                //If Remove 
                //Check is this Cake have in CART?
                //If yes -> Remove
                //If No --> Do nothing
                ////Cart Object: xai HashMap
                //
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
