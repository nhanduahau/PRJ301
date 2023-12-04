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
import javax.servlet.http.HttpSession;
import ws.dao.DAO;
import ws.dto.User;

/**
 *
 * @author tolyh
 */
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String STAFF_PAGE = "staffPage.jsp";
    private static final String USER_PAGE = "userPage.jsp";
    private static final int USER = 0;
    private static final int STAFF = 2;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String txtuserID = request.getParameter("id");
            String txtpassword = request.getParameter("pass");
            int password = Integer.parseInt(txtpassword);
            DAO dao = new DAO();
            User loginUser = dao.checkLogin(txtuserID.trim(), password);

            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect userID or password!!");

            } else if (loginUser.getRole() == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = USER_PAGE;
            } else if (loginUser.getRole() == 2) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = STAFF_PAGE;
            } else {
                request.setAttribute("ERROR", "Incorrect Role!");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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
