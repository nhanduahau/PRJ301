/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tolyh
 */
public class MainController extends HttpServlet {

    private static final String SONG_PAGE = "songPage.jsp";
    private static final String LISTALLSONG = "ListAllSong";
    private static final String LISTALLSONG_CONTROLLER = "ListAllSongController";
    private static final String REMOVESONG = "RemoveSong";
    private static final String REMOVESONG_CONTROLLER = "RemoveSongController";
    private static final String ADDSONG = "AddSong";
    private static final String ADDSONG_CONTROLLER = "AddSongController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SONG_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = SONG_PAGE;
            }
            if (action.equalsIgnoreCase(LISTALLSONG)) {
                url = LISTALLSONG_CONTROLLER;
            }else if (action.equalsIgnoreCase(REMOVESONG)) {
                url = REMOVESONG_CONTROLLER;
            }else if (action.equalsIgnoreCase(ADDSONG)) {
                url = ADDSONG_CONTROLLER;
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
