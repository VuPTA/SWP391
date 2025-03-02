<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard">
        <h2>Xin chào, <%= account.getUsername() %>!</h2>
        <p>Vai trò của bạn: <strong><%= account.getRole() %></strong></p>

        <% if (account.getRole().equals("Admin")) { %>
            <a href="#">Quản lý tài khoản</a>
            <a href="#">Báo cáo hệ thống</a>
        <% } else if (account.getRole().equals("Nhân viên")) { %>
            <a href="#">Xem kho hàng</a>
            <a href="#">Tạo đơn hàng</a>
        <% } else if (account.getRole().equals("Quản lý")) { %>
            <a href="#">Quản lý nhân viên</a>
            <a href="#">Thống kê doanh số</a>
        <% } %>

        <a href="logout.jsp">Đăng xuất</a>
    </div>
</body>
</html>
