/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dto.OrderDetails;
import dto.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "ManageOrdersController", urlPatterns = {"/ManageOrdersController"})
public class ManageOrdersController extends HttpServlet {

    private static final String MANAGE_ORDERS = "manageOrders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MANAGE_ORDERS;
        try {
            String txtDate = request.getParameter("txtDateSearch");
            if (txtDate.trim().equals("")) {
                OrderDAO orderDao = new OrderDAO();
                List<Orders> listOrders = new ArrayList<>();
                listOrders = orderDao.GetOrders();
                if (listOrders.size() > 0) {
                    request.setAttribute("LIST_ORDERS", listOrders);
                }
            } else {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                LocalDateTime dateTime = LocalDateTime.parse(txtDate, formatter);

                OrderDAO orderDao = new OrderDAO();
                List<Orders> listOrders = new ArrayList<>();
                listOrders = orderDao.GetOrdersWithDate(dateTime);
                if (listOrders.size() > 0) {
                    request.setAttribute("LIST_ORDERS", listOrders);
                }

            }

            OrderDetailDAO orderDetailsDAO = new OrderDetailDAO();
            List<OrderDetails> listOrderDetails = new ArrayList<>();
            listOrderDetails = orderDetailsDAO.GetOrderDetails();
            if (listOrderDetails.size() > 0) {
                request.setAttribute("LIST_ORDERS_DETAILS", listOrderDetails);
            }
        } catch (Exception e) {
            log("Error at ManageOrdersController: " + e.toString());
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
