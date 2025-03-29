/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditAccountServlet", urlPatterns = {"/edit-account"})
public class EditAccountServlet extends HttpServlet {

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

        int id = Integer.parseInt(request.getParameter("id"));

        AccountDAO adao = new AccountDAO();
        Account acc = adao.getAccountById(id);

        request.setAttribute("acc", acc);
        request.getRequestDispatcher("admin/edit-account.jsp").forward(request, response);
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
            String accountIdStr = request.getParameter("accountId");
            if (accountIdStr != null && !accountIdStr.isEmpty()) {
                int accountId = Integer.parseInt(accountIdStr);
                AccountDAO accountDAO = new AccountDAO();
                Account acc = accountDAO.getAccountById(accountId);

                if (acc != null) {
                    request.setAttribute("acc", acc); 
                    request.getRequestDispatcher("admin/edit-account.jsp").forward(request, response);
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("account-list.jsp?error=not_found");
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
        try {
            // Lấy dữ liệu từ form
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String status = request.getParameter("status");

            // Gọi DAO để cập nhật thông tin
            AccountDAO dao = new AccountDAO();
            int roleid = dao.mapRole2(role);
            boolean success = dao.updateAccount(accountId, password, roleid, name, gender, phone, email, status);

            // Chuyển hướng sau khi cập nhật
            if (success) {
                 Account acc = dao.getAccountById(accountId);

                if (acc != null) {
                    request.setAttribute("message", "Update successful");
                    request.setAttribute("acc", acc); 
                    request.getRequestDispatcher("admin/edit-account.jsp").forward(request, response);
                    return;
                }
            } else {
                response.sendRedirect("admin/edit-account.jsp?accountId=" + accountId + "&error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/edit-account.jsp?error=1");
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
