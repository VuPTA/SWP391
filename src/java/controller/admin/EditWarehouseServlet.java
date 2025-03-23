/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
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
import model.Account;
import model.Category;
import model.WareHouse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditWarehouseServlet", urlPatterns = {"/edit-warehouse"})
public class EditWarehouseServlet extends HttpServlet {

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
            WareHouseDAO dao = new WareHouseDAO();
            WareHouse wareHouse = dao.getWareHouseById(id);
            request.setAttribute("w", wareHouse);
            request.getRequestDispatcher("admin/edit-warehouse.jsp").forward(request, response);
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
            String warehouseId = request.getParameter("warehouseId");

            String name = request.getParameter("name");
            String location = request.getParameter("location");
            String note = request.getParameter("note");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            Integer updateBy = acc.getAccountId();

            WareHouseDAO dao = new WareHouseDAO();
            WareHouse wareHouse = new WareHouse(warehouseId, name, location, note, updateBy, new Timestamp(System.currentTimeMillis()));
            dao.updateWareHouse(wareHouse);

            request.setAttribute("message", "Update WareHouse Success!");
            request.getRequestDispatcher("warehouses").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Update WareHouse Fail!: " + e.getMessage());
            request.getRequestDispatcher("warehouses").forward(request, response);
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
