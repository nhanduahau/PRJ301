/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDAO;
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phann
 */
public class UpdateWalletController extends HttpServlet {

    private static final String SUCCESS = "accountPage.jsp";
    private static final String ERROR = "withdrawPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String action = request.getParameter("action");
            String txtUsername = request.getParameter("txtUsername");
            String txtNewValue = request.getParameter("txtNewValue");

            float newValue = Float.parseFloat(txtNewValue);

            AccountDAO dao = new AccountDAO();
            List<Account> listAccount = new ArrayList<>();
            listAccount = dao.getAccountByName(txtUsername);

            if (listAccount.size() > 0) {
                Account currentAccount = listAccount.get(0);
                float currentWallet = currentAccount.getWallet();

                if (action.equalsIgnoreCase("UpdateDeposit")) {
                    currentAccount.setWallet(currentWallet + newValue);
                    dao.UpdateWallet(currentAccount);

                } else if (action.equalsIgnoreCase("UpdateWithdraw")) {
                    if (currentWallet >= newValue) {
                        currentAccount.setWallet(currentWallet - newValue);
                        dao.UpdateWallet(currentAccount);
                    } else {
                        url = ERROR;
                        request.setAttribute("ERROR", "CURRENT WALLET IS NOT ENOUGH");
                    }
                }
            } else {
                request.setAttribute("ERROR", "CUSTOMER NOT FOUND");
            }
        } catch (Exception e) {
            log("Error at UpdateWalletController: " + e.toString());
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
