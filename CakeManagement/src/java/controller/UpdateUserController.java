/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {

    private static final String MANAGE_USERS = "ManageUsersController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MANAGE_USERS;

        try {
            String txtUserID = request.getParameter("txtUserID");
            String txtFullName = request.getParameter("txtFullName");
            String txtRoleID = request.getParameter("txtRoleID");
            
            HttpSession session = request.getSession();
            Users currentUser = (Users) session.getAttribute("LOGIN_USER");

            if (currentUser.getUserID().equalsIgnoreCase(txtUserID)) {
                request.setAttribute("UPDATED_ERROR", "Cannot update Login user!"); //Cannot update current User
            } else {
                UserDAO dao = new UserDAO();
                Users user = dao.GetUser(txtUserID);
                if (user != null) {
                    user.setFullName(txtFullName);
                    user.setRoleID(txtRoleID);

                    boolean result = dao.UpdateUser(user);
                    if (result == false) {
                        request.setAttribute("UPDATED_ERROR", "Update not successfully!");
                    }
                } else {
                    request.setAttribute("UPDATED_ERROR", "User not found!");
                }
            }
        } catch (Exception e) {
            log("Error at UpdateUserController: " + e.toString());
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
