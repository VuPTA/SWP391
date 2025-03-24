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
@WebServlet(name = "AccountsListServlet", urlPatterns = {"/Accounts-list"})
public class AccountsListServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountsListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountsListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        AccountDAO dao = new AccountDAO();
        List<Account> accounts = dao.getAllAccounts();

        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("admin/account-list.jsp").forward(request, response);
        //  processRequest(request, response);
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
            // Kiểm tra đầu vào hợp lệ
            String accountIdParam = request.getParameter("accountId");
            String newStatus = request.getParameter("newStatus");

            if (accountIdParam == null || newStatus == null || accountIdParam.isEmpty() || newStatus.isEmpty()) {
                response.sendRedirect("Accounts-list?error=invalid_input");
                return;
            }

            int accountId = Integer.parseInt(accountIdParam);
            AccountDAO accountDAO = new AccountDAO();

            // Kiểm tra xem tài khoản có tồn tại không
            Account account = accountDAO.getAccountById(accountId);
            if (account == null) {
                response.sendRedirect("Accounts-list?error=not_found");
                return;
            }

            // Cập nhật trạng thái
            boolean success = accountDAO.updateStatus(accountId, newStatus);

            if (success) {
                response.sendRedirect("Accounts-list?success=true");
            } else {
                response.sendRedirect("Accounts-list?error=update_failed");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("Accounts-list?error=invalid_number");
        } catch (Exception e) {
            e.printStackTrace(); // Ghi log lỗi để dễ debug
            response.sendRedirect("Accounts-list?error=server_error");
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
