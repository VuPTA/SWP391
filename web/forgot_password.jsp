<%-- 
    Document   : forgot_password
    Created on : Feb 11, 2025, 6:49:53 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ForgotPasswordServlet" method="post">
            <input type="email" name="email" placeholder="Nhập email" required>
            <button type="submit">Gửi OTP</button>
        </form>
    </body>
</html>
