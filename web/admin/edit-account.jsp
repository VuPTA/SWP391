<%-- 
    Document   : edit-account
    Created on : Mar 17, 2025, 7:20:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Edit Account</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <base href="${pageContext.request.contextPath}/">
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: NiceAdmin
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Updated: Apr 20 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>
        <%@ page import="model.Account" %>
        <%
            Account acc = (Account) request.getAttribute("acc");
            if (acc == null) {
                response.sendRedirect("account-list.jsp?error=not_found");
                return;
            }
        %>


        <!-- ======= Header ======= -->
        <jsp:include page="../common/header.jsp"></jsp:include><!-- End Header -->

            <!-- ======= Sidebar ======= -->
        <jsp:include page="../common/sidebar.jsp"></jsp:include><!-- End Sidebar-->

            <main id="main" class="main">

                <div class="container mt-5">
                    <h2>Chỉnh sửa tài khoản</h2>
                    
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger">Cập nhật thất bại!</div>
                <% } %>

                <form action="edit-account" method="post">
                    <input type="hidden" name="accountId" value="<%= acc.getAccountId() %>">

                    <div class="mb-3">
                        <label>Username:</label>
                        <input type="text" class="form-control" value="<%= acc.getUsername() %>" disabled>
                    </div>

                    <div class="mb-3">
                        <label>Password:</label>
                        <input type="password" class="form-control" name="password" value="<%= acc.getPassword() %>">
                    </div>

                    <div class="mb-3">
                        <label>Role:</label>
                        <input type="text" class="form-control" name="role" value="<%= acc.getRole() %>">
                    </div>

                    <div class="mb-3">
                        <label>Name:</label>
                        <input type="text" class="form-control" name="name" value="<%= acc.getName() %>">
                    </div>

                    <div class="mb-3">
                        <label>Gender:</label>
                        <select name="gender" class="form-control">
                            <option value="Male" <%= acc.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                            <option value="Female" <%= acc.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Phone:</label>
                        <input type="text" class="form-control" name="phone" value="<%= acc.getPhone() %>">
                    </div>

                    <div class="mb-3">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="email" value="<%= acc.getEmail() %>">
                    </div>

                    <div class="mb-3">
                        <label>Status:</label>
                        <select name="status" class="form-control">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    <a href="account-list.jsp" class="btn btn-secondary">Quay lại</a>
                </form>
            </div>

        </main><!-- End #main -->


        <!-- ======= Footer ======= -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>



</html>
