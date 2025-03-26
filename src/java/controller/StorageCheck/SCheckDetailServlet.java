/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.StorageCheck;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;
import dal.StorageCheckDAO;
import java.util.ArrayList;

/**
 *
 * @author ANNT1
 */
@WebServlet(name = "SCheckDetailServlet", urlPatterns = {"/SCheckDetailServlet"})
public class SCheckDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SCheckDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SCheckDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        StorageCheckDAO dao = new StorageCheckDAO();
        List<StorageCheckInfor> scheckinfor = dao.getPendingStorageCheckInfor();
        request.setAttribute("scheckinfor", scheckinfor);
        request.getRequestDispatcher("StorageCheckDetail1.jsp").forward(request, response);
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
        String scheckId = request.getParameter("selectedSCid");
        String searchQuery = request.getParameter("searchQuery");
        String searchType = request.getParameter("searchType");
        StorageCheckDAO dao = new StorageCheckDAO();

        if (scheckId != null) {
            int ScheckId = Integer.parseInt(scheckId);
            if (dao.isPendingOrRecount(ScheckId)) {//check có phải status pending-recount
                List<StorageCheckDetail> scheckdetail = dao.getStorageCheckDetailsByStorageCheckID(ScheckId);
                if (!scheckdetail.isEmpty()) {
                    request.setAttribute("scheckdetail", scheckdetail);
                } else {
                    List<StorageCheckDetail> scheckdetailpending = dao.getStorageCheckDetailsPending(ScheckId);
                    request.setAttribute("scheckdetail", scheckdetailpending);
                }
                request.getRequestDispatcher("StorageCheckDetail2.jsp").forward(request, response);
            } else {
                List<StorageCheckInfor> scheckinfor = dao.getPendingStorageCheckInfor();
                request.setAttribute("scheckinfor", scheckinfor);
                request.setAttribute("message", "This ID is not available");
                request.getRequestDispatcher("StorageCheckDetail1.jsp").forward(request, response);
            }
        }

        if (searchQuery != null) {
            List<StorageCheckInfor> scheckinfor = dao.getCountedStorageCheckInfor(searchType, searchQuery);
            request.setAttribute("scheckinfor", scheckinfor);
            request.setAttribute("message", "Searched");
            request.getRequestDispatcher("StorageCheckDetail1.jsp").forward(request, response);
        }
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
