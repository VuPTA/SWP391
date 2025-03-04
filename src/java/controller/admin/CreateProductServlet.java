/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Account;
import model.Category;
import model.Product;
import model.ProductVariant;
import model.Supplier;
import utils.Helpers;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateProductServlet", urlPatterns = {"/create-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class CreateProductServlet extends HttpServlet {

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
            CategoryDAO cdao = new CategoryDAO();
            List<Category> categories = cdao.getAllCategories();
            request.setAttribute("categories", categories);

            request.getRequestDispatcher("admin/create-product.jsp").forward(request, response);
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
            ProductDAO pdao = new ProductDAO();
            // Lấy dữ liệu từ form
            String productName = request.getParameter("productName");
            String categoryID = request.getParameter("categoryID");
            String description = request.getParameter("description");

            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            int createdBy = acc.getAccountId();
            Timestamp createDate = new Timestamp(System.currentTimeMillis());
            String productId = pdao.getMaxProductID();

            // Lấy danh sách biến thể sản phẩm
            String[] names = request.getParameterValues("name[]");
            String[] colors = request.getParameterValues("color[]");
            String[] sizes = request.getParameterValues("size[]");
            String[] prices = request.getParameterValues("price[]");
            String[] quantities = request.getParameterValues("quantity[]");
            List<String> productVariantIds = pdao.generateProductVariantNewID(names.length);

            List<ProductVariant> variants = new ArrayList<>();

            // Lấy danh sách ảnh đúng (chỉ lấy `image[]`)
            List<Part> imageParts = request.getParts().stream()
                    .filter(part -> "image[]".equals(part.getName()) && part.getSize() > 0)
                    .collect(Collectors.toList());
            int imageIndex = 0;

            for (int i = 0; i < names.length; i++) {
                Part imagePart = imageParts.get(imageIndex++);
                String imageName = Helpers.saveImage(imagePart, request);

                ProductVariant variant = new ProductVariant(
                        productVariantIds.get(i),
                        productId,
                        names[i],
                        imageName,
                        colors[i],
                        sizes[i],
                        Integer.parseInt(quantities[i]),
                        Double.parseDouble(prices[i]),
                        createdBy,
                        createDate);
                variants.add(variant);
            }

            // Lưu vào DB
            Product product = new Product(productId, categoryID, productName, description, "Available", variants, createdBy, createDate);
            pdao.createProduct(product);

            // Chuyển hướng sau khi tạo sản phẩm thành công
            request.setAttribute("message", "Create Product Success!");
            request.getRequestDispatcher("products").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Create Product Fail!: " + e.getMessage());
            request.getRequestDispatcher("products").forward(request, response);
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
