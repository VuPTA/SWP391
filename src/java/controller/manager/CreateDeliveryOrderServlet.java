/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.DeliveryOrderDAO;
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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.DeliveryItem;
import model.DeliveryOrder;
import model.ProductVariant;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.Supplier;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateDeliveryOrderServlet", urlPatterns = {"/create-delivery-order"})
public class CreateDeliveryOrderServlet extends HttpServlet {

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
            PurchaseOrderDAO dodao = new PurchaseOrderDAO();
            List<PurchaseOrder> POsToCreateDO = dodao.getPOsDropdownToCreateDO();
            request.setAttribute("purchaseOrders", POsToCreateDO);
            SupplierDAO dao = new SupplierDAO();
            List<Supplier> suppliers = dao.getSuppliers();
            request.setAttribute("suppliers", suppliers);
            request.getRequestDispatcher("manager/create-delivery-order.jsp").forward(request, response);
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
            DeliveryOrderDAO dodao = new DeliveryOrderDAO();
            String doId = dodao.getMaxDeliveryOrderID();

            double totalAmount = 0;
            List<DeliveryItem> deliveryItems = new ArrayList<>();
            for (int i = 0; i < productIds.length; i++) {
                int quantity = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                totalAmount += quantity * price;
                deliveryItems.add(new DeliveryItem(productIds[i], quantity, price, createdBy, createDate));
            }
            // Làm tròn tổng tiền đến 2 chữ số thập phân
            totalAmount = Math.round(totalAmount * 100.0) / 100.0;

            DeliveryOrder deliveryOrder = new DeliveryOrder(doId, poId, supplierID, "in transit", expectedDate, deliveryItems, createdBy, createDate);
            deliveryOrder.setTotalAmount(totalAmount);
            dodao.createDeliveryOrder(deliveryOrder);

            //check status and set status for PO
            PurchaseOrderDAO podao = new PurchaseOrderDAO();
            PurchaseOrder purchaseOrder = podao.getPurchaseOrderToCreateDO(poId);
            PurchaseOrder poUpdate = new PurchaseOrder();
            poUpdate.setPoId(poId);
            if (purchaseOrder.getStatus().equals("Pending") ) {
                poUpdate.setStatus("Processing");
                podao.updateStatusPurchaseOrder(poUpdate);
            }
//            else if (purchaseOrder.getPurchaseItems().size() == 0) {
//                poUpdate.setStatus("Received");
//                podao.updateStatusPurchaseOrder(poUpdate);
//            }

            request.setAttribute("message", "Create Delivery Order Success!");
            request.getRequestDispatcher("delivery-orders").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Delivery Order Fail!: " + e.getMessage());
            request.getRequestDispatcher("delivery-orders").forward(request, response);
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
