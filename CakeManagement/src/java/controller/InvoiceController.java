/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CakeDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dto.Cakes;
import dto.OrderDetails;
import dto.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
@WebServlet(name = "InvoiceController", urlPatterns = {"/InvoiceController"})

public class InvoiceController extends HttpServlet {

    private static final String REVIEW_PAGE = "invoicePage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REVIEW_PAGE;
        try {
            HttpSession session = request.getSession();

            String txtUserIDInvoice = request.getParameter("txtUserIDInvoice");
            String txtAddressInvoice = request.getParameter("txtAddressInvoice");
            String txtDateInvoice = request.getParameter("txtDateInvoice") + ":00.000";
            String txtPhoneInvoice = request.getParameter("txtPhoneInvoice");
            String txtTotalInvoice = request.getParameter("txtTotalInvoice");

            float total = Float.parseFloat(txtTotalInvoice);
            //Date
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
            LocalDateTime dateTime = LocalDateTime.parse(txtDateInvoice, formatter);

            //Random orderID
            Random random = new Random();
            int orderID = random.nextInt();

            Orders order = new Orders(orderID, dateTime, total, txtUserIDInvoice, txtPhoneInvoice, txtAddressInvoice);
            OrderDAO orderDao = new OrderDAO();
            boolean result = orderDao.CreateOrder(order);

            if (result) {
                List<OrderDetails> listODetails = (List<OrderDetails>) session.getAttribute("LIST_ODETAILS");
                OrderDetailDAO oDetailDao = new OrderDetailDAO();
                for (OrderDetails oDetails : listODetails) {
                    oDetails.setOrderID(orderID);
                    oDetailDao.CreateODetails(oDetails);

                }
            }

            //Paying successfully -> delete CART
            session.setAttribute("LIST_ODETAILS", null);
            session.setAttribute("CART", null);
            request.setAttribute("ORDER_SUCCESSFULLY", order);

        } catch (Exception e) {
            log("Error at InvoiceController: " + e.toString());
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
