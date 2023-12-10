/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tolyh
 */
@WebServlet(name = "CreateUserController", urlPatterns = {"/CreateUserController"})
public class CreateUserController extends HttpServlet {

    private static final String LOGIN_PAGE = "loginPage.jsp";
    private static final String REGISTER_PAGE = "registerPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = REGISTER_PAGE;
        try {
            String txtUserID = request.getParameter("txtUserID");
            String txtFullName = request.getParameter("txtFullName");
            String txtRoleID = request.getParameter("txtRoleID");
            String txtPassword = request.getParameter("txtPassword");
            String txtConfirmPassword = request.getParameter("txtConfirmPassword");
            
            if (txtUserID.equals("") || txtFullName.equals("") || txtRoleID.equals("") || txtPassword.equals("")) {
                request.setAttribute("ERROR_CREATE", "Invalid field!");
            } else 
            if (txtConfirmPassword.equals(txtPassword)) {
                UserDAO dao = new UserDAO();
                Users user = dao.GetUser(txtUserID);
                if (user == null) {
                    Users newUser = new Users(txtUserID, txtFullName, txtPassword, txtRoleID);
                    boolean result = dao.CreateUser(newUser);
                    if (result == false) {
                        request.setAttribute("ERROR_CREATE", "Create Unsuccessfully!");
                    } else {
                        url = LOGIN_PAGE;
                    }
                } else {
                    request.setAttribute("ERROR_CREATE", "Username has been existed!");
                }

            } else {
                request.setAttribute("ERROR_CREATE", "Confirm password does not matched!");
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
