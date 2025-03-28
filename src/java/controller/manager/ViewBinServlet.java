/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.BinTypeDAO;
import dal.ProductDAO;
import dal.StorageBinDAO;
import dal.WareHouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.BinType;
import model.ProductVariant;
import model.StorageBin;
import model.WareHouse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewBinServlet", urlPatterns = {"/view-bin"})
public class ViewBinServlet extends HttpServlet {

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

            ProductDAO pdao = new ProductDAO();
            List<ProductVariant> productVariants = pdao.getProductVariantsInBin(id);
            request.setAttribute("productVariants", productVariants);

            request.getRequestDispatcher("manager/view-bin.jsp").forward(request, response);
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
        processRequest(request, response);
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
