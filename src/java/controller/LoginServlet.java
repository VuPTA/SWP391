package controller;

import dal.AccountDAO;
import dal.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account account = dao.login(username, password);

        if (account != null) {
            if ("inactive".equals(account.getStatus().toLowerCase())) {
                request.setAttribute("msg", "Tài khoản đang bị khóa");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
//            switch (account.getRole()) {
//                case "Admin":
//                    response.sendRedirect("admin/dashboard.jsp");
//                    break;
//                case "Staff":
//                    response.sendRedirect("staff/dashboard.jsp");
//                    break;
//                case "Manager":
//                    response.sendRedirect("manager/dashboard.jsp");
//
//                    break;
//                default:
//                    throw new AssertionError();
//            }
        } else {
            request.setAttribute("msg", "Invalid password or number!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
