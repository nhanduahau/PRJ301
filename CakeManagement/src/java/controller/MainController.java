/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tolyh
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "loginPage.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String MANAGE_ORDERS = "ManageOrders";
    private static final String MANAGE_ORDERS_CONTROLLER = "ManageOrdersController";

    private static final String MANAGE_CAKES = "ManageCakes";
    private static final String MANAGE_CAKES_CONTROLLER = "ManageCakesController";

    private static final String UPDATE_CAKES = "UpdateCake";
    private static final String UPDATE_CAKES_CONTROLLER = "UpdateCakeController";

    private static final String DELETE_CAKES = "DeleteCake";
    private static final String DELETE_CAKES_CONTROLLER = "DeleteCakeController";

    private static final String CREATE_CAKES = "CreateCake";
    private static final String CREATE_CAKES_CONTROLLER = "CreateCakeController";

    private static final String MANAGE_USERS = "ManageUsers";
    private static final String MANAGE_USERS_CONTROLLER = "ManageUsersController";

    private static final String UPDATE_USERS = "UpdateUser";
    private static final String UPDATE_USERS_CONTROLLER = "UpdateUserController";

    private static final String DELETE_USERS = "DeleteUser";
    private static final String DELETE_USERS_CONTROLLER = "DeleteUserController";

    private static final String CREATE_USERS = "CreateUser";
    private static final String CREATE_USERS_CONTROLLER = "CreateUserController";

    private static final String VIEW_CART = "ViewCart";
    private static final String CHECK_OUT = "CheckOut";
    private static final String BUY_CAKES = "BuyCake";
    private static final String CHANGE_QUANTITY = "ChangeQuantity";
    private static final String REMOVE_CAKE = "RemoveCake";
    private static final String CART_CONTROLLER = "CartController";

    private static final String SAVE_ORDER = "Invoice";
    private static final String SAVE_ORDER_CONTROLLER = "InvoiceController";

    private static final String ABOUT_US = "AboutUs";
    private static final String HOME = "Home";
    private static final String CAKES_CONTROLLER = "CakesController";

    private static final String OUR_CAKES = "OurCakes";
    private static final String OUR_CAKES_CONTROLLER = "OurCakesController";

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
                url = LOGIN_CONTROLLER;
            } else if (action.equalsIgnoreCase(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            } else if (action.equalsIgnoreCase(MANAGE_ORDERS)) {
                url = MANAGE_ORDERS_CONTROLLER;
            } else if (action.equalsIgnoreCase(MANAGE_CAKES)) {
                url = MANAGE_CAKES_CONTROLLER;
            } else if (action.equalsIgnoreCase(UPDATE_CAKES)) {
                url = UPDATE_CAKES_CONTROLLER;
            } else if (action.equalsIgnoreCase(DELETE_CAKES)) {
                url = DELETE_CAKES_CONTROLLER;
            } else if (action.equalsIgnoreCase(CREATE_CAKES)) {
                url = CREATE_CAKES_CONTROLLER;
            } else if (action.equalsIgnoreCase(MANAGE_USERS)) {
                url = MANAGE_USERS_CONTROLLER;
            } else if (action.equalsIgnoreCase(UPDATE_USERS)) {
                url = UPDATE_USERS_CONTROLLER;
            } else if (action.equalsIgnoreCase(DELETE_USERS)) {
                url = DELETE_USERS_CONTROLLER;
            } else if (action.equalsIgnoreCase(CREATE_USERS)) {
                url = CREATE_USERS_CONTROLLER;
            } else if (action.equalsIgnoreCase(OUR_CAKES)) {
                url = OUR_CAKES_CONTROLLER;
            } else if (action.equalsIgnoreCase(BUY_CAKES) || action.equalsIgnoreCase(CHANGE_QUANTITY)
                    || action.equalsIgnoreCase(REMOVE_CAKE) || action.equalsIgnoreCase(VIEW_CART)
                    || action.equalsIgnoreCase(CHECK_OUT)) {
                url = CART_CONTROLLER;
            } else if (action.equalsIgnoreCase(SAVE_ORDER)) {
                url = SAVE_ORDER_CONTROLLER;
            } else if (action.equalsIgnoreCase(ABOUT_US) || action.equalsIgnoreCase(HOME)) {
                url = CAKES_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
