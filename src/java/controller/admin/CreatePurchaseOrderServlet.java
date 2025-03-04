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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
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
@WebServlet(name = "CreatePurchaseOrderServlet", urlPatterns = {"/create-purchase-order"})
public class CreatePurchaseOrderServlet extends HttpServlet {

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
            request.getRequestDispatcher("admin/create-purchase-order.jsp").forward(request, response);
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
            String supplierID = request.getParameter("supplierID");
            String expectedDateStr = request.getParameter("expectedDate");

            Date expectedDate = (expectedDateStr == null || expectedDateStr.isEmpty()) ? null : Date.valueOf(expectedDateStr);  // Chuyển đổi từ chuỗi YYYY-MM-DD

            String[] productIds = request.getParameterValues("productID[]");
            String[] quantities = request.getParameterValues("quantity[]");
            String[] prices = request.getParameterValues("price[]");

            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            int createdBy = acc.getAccountId();
            Timestamp createDate = new Timestamp(System.currentTimeMillis());
            PurchaseOrderDAO podao = new PurchaseOrderDAO();
            String poId = podao.getMaxPurchaseOrderID();

            List<PurchaseItem> purchaseItems = new ArrayList<>();
            for (int i = 0; i < productIds.length; i++) {
                purchaseItems.add(new PurchaseItem(productIds[i], Integer.parseInt(quantities[i]), Double.parseDouble(prices[i]), createdBy, createDate));
            }

            PurchaseOrder po = new PurchaseOrder(poId, supplierID, "Pending", expectedDate, purchaseItems, createdBy, createDate);
            podao.createPurchaseOrder(po);
            request.setAttribute("message", "Create Purchase Order Success!");
            request.getRequestDispatcher("purchase-orders").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Purchase Order Fail!: " + e.getMessage());
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
