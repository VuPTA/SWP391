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

/**
 *
 * @author ANNT1
 */
@WebServlet(name = "AddSCheckServlet", urlPatterns = {"/AddSCheckServlet"})
public class AddSCheckServlet extends HttpServlet {

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
            out.println("<title>Servlet AddSCheckServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSCheckServlet at " + request.getContextPath() + "</h1>");
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
        StorageCheckDAO storageCheckDAO = new StorageCheckDAO();
        List<StorageCheckInfor> bininfor = storageCheckDAO.getStorageBinInfo();
        request.setAttribute("bininfor", bininfor);
        request.getRequestDispatcher("StorageCheckCreate.jsp").forward(request, response);
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
        String binID = request.getParameter("selectedBins");
        String binID2 = request.getParameter("selectedSCid");
        String note = request.getParameter("notes_" + binID);
        String searchType = request.getParameter("searchType");
        String searchQuery = request.getParameter("searchQuery");
        int messageBinID = 0;
        StorageCheckDAO dao = new StorageCheckDAO();

        if (binID2 != null) {
            dao.createStorageCheck(binID2, 2, note); // CreateBy = 2 (tạm thời cố định)
            dao.updateBinStatus(binID2, "Lock for check");
            messageBinID = dao.getLatestStorageCheckID(binID2);
        }

        if (binID != null) {
            dao.createStorageCheck(binID, 2, note); // CreateBy = 2 (tạm thời cố định)
            dao.updateBinStatus(binID, "Lock for check");
            messageBinID = dao.getLatestStorageCheckID(binID);
        }

        if (searchQuery != null) {            
            dao.updateBinStatus(binID, "Lock for check");
            messageBinID = dao.getLatestStorageCheckID(binID);
            List<StorageCheckInfor> bininfor = dao.searchStorageBinInfo(searchType, searchQuery);
            request.setAttribute("bininfor", bininfor);
            request.setAttribute("messageBinID", messageBinID);
            request.getRequestDispatcher("StorageCheckCreate.jsp").forward(request, response);
            return;
        }

        List<StorageCheckInfor> bininfor = dao.getStorageBinInfo();
        request.setAttribute("bininfor", bininfor);
        request.setAttribute("messageBinID", messageBinID);
        request.getRequestDispatcher("StorageCheckCreate.jsp").forward(request, response);
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
