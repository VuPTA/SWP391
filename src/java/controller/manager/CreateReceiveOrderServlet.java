/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.DeliveryOrderDAO;
import dal.ProductDAO;
import dal.PurchaseOrderDAO;
import dal.ReceiveOrderDAO;
import dal.StorageBinDAO;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.DeliveryItem;
import model.DeliveryOrder;
import model.ProductVariant;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.ReceiveItem;
import model.ReceiveOrder;
import model.StorageBin;
import model.Supplier;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateReceiveOrderServlet", urlPatterns = {"/create-receive-order"})
public class CreateReceiveOrderServlet extends HttpServlet {

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
            DeliveryOrderDAO dodao = new DeliveryOrderDAO();
            List<DeliveryOrder> POsToCreateDO = dodao.getDOsDropdownToCreateRO();
            request.setAttribute("purchaseOrders", POsToCreateDO);
            SupplierDAO dao = new SupplierDAO();
            List<Supplier> suppliers = dao.getSuppliers();
            request.setAttribute("suppliers", suppliers);
            StorageBinDAO bidao = new StorageBinDAO();
            List<StorageBin> listDropDownBin = bidao.getStorageBinsActive();
            request.setAttribute("bi", listDropDownBin);
            request.getRequestDispatcher("manager/create-receive-order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
            String nott = request.getParameter("note");
            String binr = request.getParameter("binr");

            Date expectedDate = (expectedDateStr == null || expectedDateStr.isEmpty()) ? null : Date.valueOf(expectedDateStr);  // Chuyển đổi từ chuỗi YYYY-MM-DD
            expectedDate = Date.valueOf(LocalDate.now());

            String[] productIds = request.getParameterValues("productID[]");
            String[] quantities = request.getParameterValues("quantity[]");
            String[] quantities1 = request.getParameterValues("quantity1[]");
            String[] prices = request.getParameterValues("price[]");

            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            int createdBy = acc.getAccountId();
            Timestamp createDate = new Timestamp(System.currentTimeMillis());
            ReceiveOrderDAO dodao = new ReceiveOrderDAO();
            String doId = dodao.getMaxDeliveryOrderID();

            int totalQuantity = 0;
            double totalAmount = 0;
            List<ReceiveItem> deliveryItems = new ArrayList<>();
            for (int i = 0; i < productIds.length; i++) {
                int quantity = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                totalAmount += quantity * price;
                totalQuantity += quantity;
                deliveryItems.add(new ReceiveItem(productIds[i], quantity, price, createdBy, createDate));
            }

            double totalAmount1 = 0;
            for (int i = 0; i < productIds.length; i++) {
                int quantity = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                totalAmount1 += quantity * price;
            }
            String note = "";
            if (totalAmount == totalAmount) {
                note = "Đã giao đủ";
            } else {
                note = "Giao thiếu";
            }
            // Làm tròn tổng tiền đến 2 chữ số thập phân
            totalAmount = Math.round(totalAmount * 100.0) / 100.0;

            StorageBinDAO bidao = new StorageBinDAO();
            int binCapacity = bidao.getStorageBinById(binr).getCapacity();
            if (binCapacity < totalQuantity) {
                request.setAttribute("msg", "Số lượng sản phẩm vượt quá mức quy định của kho! ");
                request.getRequestDispatcher("create-receive-order").forward(request, response);
                return;
            }
            DeliveryOrderDAO podao = new DeliveryOrderDAO();

            DeliveryOrder dtt = podao.getDeliveryOrderById(poId);
            if (quantities.length < dtt.getDeliveryItems().size()) {
                note = "Giao thiếu. " + nott;
            } else {
                note = note + ".  " + nott;
            }
            //check status and set status for PO
            DeliveryOrder purchaseOrder = podao.getDeliveryOrderToCreateRO(poId);
            DeliveryOrder poUpdate = new DeliveryOrder();
            poUpdate.setDoId(poId);
            poUpdate.setStatus("Received");
            podao.updateStatusPurchaseOrder(poUpdate);
//            if (purchaseOrder.getStatus().equals("Pending") && purchaseOrder.getDeliveryItems().size() > 0) {
//                poUpdate.setStatus(note);
//                podao.updateStatusPurchaseOrder(poUpdate);
//            } else if (purchaseOrder.getDeliveryItems().size() == 0) {
//                poUpdate.setStatus(note);
//                podao.updateStatusPurchaseOrder(poUpdate);
//            }
              //check status and set status for PO
            PurchaseOrderDAO podao1 = new PurchaseOrderDAO();
            PurchaseOrder purchaseOrder1 = podao1.getPurchaseOrderToCreateDO(purchaseOrder.getPoId());
            PurchaseOrder poUpdate1 = new PurchaseOrder();
            poUpdate1.setPoId(purchaseOrder.getPoId());
            if (purchaseOrder1.getStatus().equals("Pending") && purchaseOrder1.getPurchaseItems().size() > 0) {
                poUpdate1.setStatus("Processing");
                podao1.updateStatusPurchaseOrder(poUpdate1);
            }
            else if (purchaseOrder1.getPurchaseItems().size() == 0) {
                poUpdate1.setStatus("Completed");
                podao1.updateStatusPurchaseOrder(poUpdate1);
            }

            
            

            ReceiveOrder deliveryOrder = new ReceiveOrder(doId, poId, supplierID, note, expectedDate, deliveryItems, createdBy, createDate);
            deliveryOrder.setTotalAmount(totalAmount);
            dodao.createDeliveryOrder(deliveryOrder);
            dodao.addTempBin(deliveryItems, binr);

            request.setAttribute("message", "Create Receive Order Success!");
            request.getRequestDispatcher("receive-orders").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Receive Order Fail!: " + e.getMessage());
            request.getRequestDispatcher("receive-orders").forward(request, response);
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
