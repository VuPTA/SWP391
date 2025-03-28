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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ANNT1
 */
@WebServlet(name = "SCheckCancelServlet2", urlPatterns = {"/SCheckCancelServlet2"})
public class SCheckCancelServlet2 extends HttpServlet {

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
            out.println("<title>Servlet SCheckCancelServlet2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SCheckCancelServlet2 at " + request.getContextPath() + "</h1>");
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
        try {
            StorageCheckDAO dao = new StorageCheckDAO();
            List<StorageCheckInfor> scheckinfor = dao.getCancelStorageCheckInfor();
            request.setAttribute("scheckinfor", scheckinfor);
            request.getRequestDispatcher("StorageCheckCancel1.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        StorageCheckDAO dao = new StorageCheckDAO();
        // Lấy danh sách ID (có thể trùng StorageCheckID nhưng khác StorageCheckDetailID)
        String[] storageCheckIDs = request.getParameterValues("storageCheckID");
        String[] expectedQuantities = request.getParameterValues("expectedQuantity");
        String[] checkedQuantities = request.getParameterValues("checkedQuantity");
        String[] notesArray = request.getParameterValues("notes");
        String[] binProductIDs = request.getParameterValues("binProductID");
        String[] productVariantIDs = request.getParameterValues("productVariantID");

        if (storageCheckIDs != null) {
            List<StorageCheckDetail> checkList = new ArrayList<>();
            int storageCheckId = Integer.parseInt(storageCheckIDs[0]);
            String binID = dao.getStorageBinIDByStorageCheckID(storageCheckId);
            for (int i = 0; i < storageCheckIDs.length; i++) {

                int periodCount = dao.periodCheck(storageCheckId); // Lấy CheckPeriod trước
                int expectedQuantity = Integer.parseInt(expectedQuantities[i]);
                int checkedQuantity = Integer.parseInt(checkedQuantities[i]);
                String notes = notesArray[i] != null ? notesArray[i] : "";
                int binProductID = Integer.parseInt(binProductIDs[i]);
                String productVariantID = productVariantIDs[i];

                // Format ngày giờ hiện tại thành chuỗi
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                String formattedDate = dateFormat.format(new Date());

                // Tạo đối tượng mới
                StorageCheckDetail checkDetail = new StorageCheckDetail();
                checkDetail.setStorageCheckID(storageCheckId);
                checkDetail.setCheckPeriod(periodCount);
                checkDetail.setExpectedQuantity(expectedQuantity);
                checkDetail.setActualQuantity(checkedQuantity);
                checkDetail.setNote(notes);
                checkDetail.setBinProductID(binProductID);
                checkDetail.setProductVariantID(productVariantID);
                checkDetail.setCreatedByID(1);
                checkDetail.setUpdatedDate(formattedDate);

                checkList.add(checkDetail);
            }

            // Gọi DAO để lưu danh sách mới
            for (StorageCheckDetail detail : checkList) {
                if ("cancel".equals(action)) {
                    dao.updateStorageCheckStatus(storageCheckId, "Cancel");
                    dao.updateBinStatus(binID, "Active");
                    request.setAttribute("message", "Cancel successful");
                }
                List<StorageCheckInfor> scheckinfor = dao.getCancelStorageCheckInfor();
                request.setAttribute("scheckinfor", scheckinfor);
                request.getRequestDispatcher("StorageCheckCancel1.jsp").forward(request, response);
                return;
            }
        }
        request.setAttribute("message", "Clear failed");
        request.getRequestDispatcher("StorageCheckCancel1.jsp").forward(request, response);
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
