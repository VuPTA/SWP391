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

@WebServlet("/verify-otp")
public class VerifyOTPServlet extends HttpServlet {

    private AccountDAO accountDAO = new AccountDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String enteredOTP = request.getParameter("otp");
        HttpSession session = request.getSession();
        String sessionOTP = (String) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");

        if (sessionOTP != null && sessionOTP.equals(enteredOTP)) {
            String newPassword = "Pass" + new Random().nextInt(9999);
            accountDAO.updatePassword(email, newPassword);

            EmailService.sendEmail(email, "Mật khẩu mới của bạn", "Mật khẩu mới: " + newPassword);
            session.invalidate(); // Xóa session
            accountDAO.updatePassword(email, newPassword);
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("msg", "otp không chính xác!");
            request.getRequestDispatcher("enter_otp.jsp").forward(request, response);
        }
    }
}
