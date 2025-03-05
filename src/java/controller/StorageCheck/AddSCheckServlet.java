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
        request.getRequestDispatcher("addStorageCheck.jsp").forward(request, response);
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
        // Lấy BinID từ request
        String binID = request.getParameter("selectedBins");

        // Kiểm tra nếu không có Bin nào được chọn
        if (binID == null || binID.isEmpty()) {
            request.setAttribute("message", "Vui lòng chọn một Storage Bin để tạo Storage Check!");
            request.getRequestDispatcher("addStorageCheck.jsp").forward(request, response);
            return;
        }

        StorageCheckDAO dao = new StorageCheckDAO();
        boolean isCreated = dao.createStorageCheck(binID, 2); // CreateBy = 2 (tạm thời cố định)
        boolean isUpdated = dao.updateBinStatus(binID, "Checking"); // Cập nhật trạng thái Bin thành Checking

        if (isCreated && isUpdated) {
            request.setAttribute("message", "Tạo Storage Check thành công!");
        } else {
            request.setAttribute("message", "Có lỗi xảy ra khi tạo Storage Check.");
        }
        List<StorageCheckInfor> bininfor = dao.getStorageBinInfo();
        request.setAttribute("bininfor", bininfor);
        request.getRequestDispatcher("addStorageCheck.jsp").forward(request, response);
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
