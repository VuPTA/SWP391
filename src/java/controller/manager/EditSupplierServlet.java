/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.StorageBinDAO;
import dal.SupplierDAO;
import dal.WareHouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;
import model.Account;
import model.StorageBin;
import model.Supplier;
import model.WareHouse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditSupplierServlet", urlPatterns = {"/edit-supplier"})
public class EditSupplierServlet extends HttpServlet {

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
            String id = request.getParameter("id");
            SupplierDAO dao = new SupplierDAO();
            Supplier sb = dao.getSupplierById(id);
            request.setAttribute("s", sb);
            request.getRequestDispatcher("manager/edit-supplier.jsp").forward(request, response);
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
            String supplierId = request.getParameter("supplierId");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String tax = request.getParameter("tax");
            String status = request.getParameter("status");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            Integer updateBy = acc.getAccountId();

            SupplierDAO dao = new SupplierDAO();
            //check dupplicate phone or tax
            if (dao.isDupplicatePhoneOrTax(phone, tax, supplierId)) {
                request.setAttribute("errorMessage", "Phone or Tax is exists! Please input valid data");
                request.getRequestDispatcher("suppliers").forward(request, response);
            } else {
                Supplier supplier = new Supplier(supplierId, name, address, phone, tax, status, updateBy, new Timestamp(System.currentTimeMillis()));

                dao.updateSupplier(supplier);
                request.setAttribute("message", "Update Supplier Success!");
                request.getRequestDispatcher("suppliers").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Update Supplier Fail!: " + e.getMessage());
            request.getRequestDispatcher("suppliers").forward(request, response);
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
