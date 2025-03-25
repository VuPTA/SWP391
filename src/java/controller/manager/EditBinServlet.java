/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.BinTypeDAO;
import dal.StorageBinDAO;
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
import model.BinType;
import model.StorageBin;
import model.WareHouse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditBinServlet", urlPatterns = {"/edit-bin"})
public class EditBinServlet extends HttpServlet {

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

            WareHouseDAO whdao = new WareHouseDAO();
            List<WareHouse> warehouses = whdao.getWareHouses();
            request.setAttribute("warehouses", warehouses);

            BinTypeDAO btdao = new BinTypeDAO();
            List<BinType> binTypes = btdao.getBinTypes();
            request.setAttribute("binTypes", binTypes);

            StorageBinDAO dao = new StorageBinDAO();
            StorageBin sb = dao.getStorageBinById(id);
            request.setAttribute("sb", sb);
            request.getRequestDispatcher("manager/edit-bin.jsp").forward(request, response);
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
            StorageBinDAO binDAO = new StorageBinDAO();
            String storageBinID = request.getParameter("storageBinID");
            String status = request.getParameter("status");
            if (status.equals("Inactive") && binDAO.isContainProduct(storageBinID)) {
                // bin contain product -> can not set inactive
                request.setAttribute("errorMessage", "This storage bin contains products so it cannot be set to inactive");
                request.getRequestDispatcher("storage-bin").forward(request, response);
            } else {

                String warehouseID = request.getParameter("warehouseID");
                String binName = request.getParameter("binName");
                String binType = request.getParameter("binType");

                int capacity = Integer.parseInt(request.getParameter("capacity"));
                HttpSession session = request.getSession();
                Account acc = (Account) session.getAttribute("account");
                Integer updateBy = acc.getAccountId();

                StorageBin bin = new StorageBin(storageBinID, warehouseID, binName, binType, capacity, status, updateBy, new Timestamp(System.currentTimeMillis()));

                binDAO.updateBin(bin);
                request.setAttribute("message", "Update Storage Bin Success!");
                request.getRequestDispatcher("storage-bin").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Update Storage Bin Fail!: " + e.getMessage());
            request.getRequestDispatcher("storage-bin").forward(request, response);
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
