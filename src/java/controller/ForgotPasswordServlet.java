package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private AccountDAO accountDAO = new AccountDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (accountDAO.isEmailExists(email)) {
            String otp = String.format("%06d", new Random().nextInt(999999));
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            EmailService.sendEmail(email, "Mã OTP", "Your OTP is: " + otp);
            response.sendRedirect("enter_otp.jsp");
        } else {
            request.setAttribute("msg", "Email không tồn tại!");
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        }
    }
}
