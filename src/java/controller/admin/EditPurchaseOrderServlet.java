/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.ProductDAO;
import dal.PurchaseOrderDAO;
import dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.ProductVariant;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.Supplier;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditPurchaseOrderServlet", urlPatterns = {"/edit-purchase-order"})
public class EditPurchaseOrderServlet extends HttpServlet {

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
        try {
            SupplierDAO dao = new SupplierDAO();
            ProductDAO pdao = new ProductDAO();
            List<Supplier> suppliers = dao.getSuppliers();
            request.setAttribute("suppliers", suppliers);
            List<ProductVariant> products = pdao.getProductVariants();
            request.setAttribute("products", products);

            String id = request.getParameter("id");
            PurchaseOrderDAO podao = new PurchaseOrderDAO();
            PurchaseOrder po = podao.getPurchaseOrderById(id);
            request.setAttribute("po", po);

            request.getRequestDispatcher("admin/edit-purchase-order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lấy dữ liệu từ form
            String poId = request.getParameter("poId");
            String status = request.getParameter("status");
            String supplierID = request.getParameter("supplierID");
            String expectedDateStr = request.getParameter("expectedDate");
            int createBy = Integer.parseInt(request.getParameter("createdBy"));
            String createdDateStr = request.getParameter("createdDate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Timestamp createdDate = new Timestamp(dateFormat.parse(createdDateStr).getTime());

            Date expectedDate = (expectedDateStr == null || expectedDateStr.isEmpty()) ? null : Date.valueOf(expectedDateStr);  // Chuyển đổi từ chuỗi YYYY-MM-DD

            String[] productIds = request.getParameterValues("productID[]");
            String[] quantities = request.getParameterValues("quantity[]");
            String[] prices = request.getParameterValues("price[]");

            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            Integer updateBy = acc.getAccountId();
            Timestamp updateByDate = new Timestamp(System.currentTimeMillis());
            PurchaseOrderDAO podao = new PurchaseOrderDAO();

            List<PurchaseItem> purchaseItems = new ArrayList<>();
            for (int i = 0; i < productIds.length; i++) {
                purchaseItems.add(new PurchaseItem(productIds[i], Integer.parseInt(quantities[i]), Double.parseDouble(prices[i]), updateBy, updateByDate));
            }

            PurchaseOrder po = new PurchaseOrder(poId, supplierID, status, expectedDate, purchaseItems, createBy, createdDate, updateBy, updateByDate);
            podao.updatePurchaseOrder(po);
            request.setAttribute("message", "Update Purchase Order Success!");
            request.getRequestDispatcher("purchase-orders").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Update Purchase Order Fail!: " + e.getMessage());
            request.getRequestDispatcher("purchase-orders").forward(request, response);
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
