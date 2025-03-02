/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddAccountServlet", urlPatterns = {"/addAccount"})
public class AddAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AddAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccountServlet at " + request.getContextPath() + "</h1>");
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
        try {
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            // Validate ID là số nguyên
            int id;
            
        
            try {
                id = Integer.parseInt(idStr);
                if (id <= 0) {
                    request.setAttribute("msg", "ID phải là số nguyên dương!");
                    request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("msg", "ID phải là số nguyên hợp lệ!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số điện thoại có từ 9 đến 10 chữ số
            if (!phone.matches("\\d{9,10}")) {
                request.setAttribute("msg", "Số điện thoại phải từ 9 đến 10 chữ số!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            // Kiểm tra email có đúng định dạng
            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
                request.setAttribute("msg", "Email không hợp lệ!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            // Kiểm tra giới tính có hợp lệ không
//        if (!gender.equals("Male") && !gender.equals("Female") && !gender.equals("Other")) {
//            request.setAttribute("msg", "Giới tính không hợp lệ!");
//            request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
//            return;
//        }
            // Kiểm tra mật khẩu không được có dấu cách
            if (password.contains(" ")) {
                request.setAttribute("msg", "Mật khẩu không được chứa dấu cách!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            AccountDAO accountDAO = new AccountDAO();

            // Kiểm tra ID đã tồn tại chưa
            if (accountDAO.getAccountById(id) != null) {
                request.setAttribute("msg", "ID đã tồn tại!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            // Kiểm tra username đã tồn tại chưa
            if (accountDAO.getAccountByUsername(username) != null) {
                request.setAttribute("msg", "Username đã tồn tại!");
                request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng Account
            Account newAccount = new Account(id, username, password, role, name, gender, phone, email, status);

            // Thêm tài khoản vào database
            boolean isAdded = accountDAO.addAccount(newAccount);

            if (isAdded) {
                response.sendRedirect("addAccounts.jsp?success=true");
            } else {
                response.sendRedirect("addAccounts.jsp?error=true");
            }

        } catch (Exception e) {
            request.setAttribute("msg", "Đã xảy ra lỗi trong quá trình xử lý!");
            request.getRequestDispatcher("addAccounts.jsp").forward(request, response);
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
