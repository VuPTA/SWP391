<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.Account" %>


<%
    List<Account> accounts = (List<Account>) request.getAttribute("accounts");
    String message = request.getParameter("success") != null ? "Cập nhật thành công!" :
                     request.getParameter("error") != null ? "Có lỗi xảy ra!" : "";
%>


<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - NiceAdmin Bootstrap Template</title>
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

        <!-- ======= Header ======= -->
        <jsp:include page="../common/header.jsp"></jsp:include><!-- End Header -->

            <!-- ======= Sidebar ======= -->
        <jsp:include page="../common/sidebar.jsp"></jsp:include><!-- End Sidebar-->





            <main id="main" class="main">

                <div class="container mt-5">
                <c:if test="${not empty message}">
                    <div class="alert ${param.success != null ? 'alert-success' : 'alert-danger'}">
                        ${message}
                    </div>
                </c:if>
            </div>


            <div class="pagetitle">
                <h1>Account List</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Account List</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">

                                <div style="display: flex; justify-content: space-between;align-items: center; padding-right: 10px">
                                    <h5 class="card-title">Account List</h5>
                                    <a href="addAccounts.jsp" class="btn btn-primary" style="height: 40px">Add new account</a>
                                </div>
                                <!-- Table with stripped rows -->
                                <table class="table datatable">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>ID</th>
                                            <th>Username</th>
                                            <th>Vai trò</th>                                          
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            <th></th>

                                        </tr>
                                    </thead>

                                    <c:forEach items="${accounts}" var="acc">
                                        <tr>
                                            <td>${acc.accountId}</td>
                                            <td>${acc.username}</td>
                                            <td>${acc.role}</td>                                              
                                            <td>${acc.status}</td>
                                            <td>
                                                <form action="Accounts-list" method="post">
                                                    <input type="hidden" name="accountId" value="${acc.accountId}">
                                                    <input type="hidden" name="newStatus" value="${acc.status eq 'Active' ? 'Inactive' : 'Active'}">
                                                    <button type="submit" class="btn ${acc.status eq 'Active' ? 'btn-warning' : 'btn-success'}">
                                                        ${acc.status eq 'Active' ? 'Deactivate' : 'Activate'}
                                                    </button>
                                                </form>
                                            </td>
                                            <td style="text-align: right"><a href="edit-account?accountId=${acc.accountId}" class="edit-btn"> <i class="bx bx-edit"> </i> Xem chi tiết </a></td>
                                        </tr>
                                    </c:forEach>

                                </table>
                                <!-- End Table with stripped rows -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <jsp:include page="../common/footer.jsp"></jsp:include>


        <script>
                window.onload = function () {
            <c:if test="${not empty param.success}">
                    alert("Cập nhật thành công!");
            </c:if>
            <c:if test="${not empty param.error}">
                    alert("Có lỗi xảy ra!");
            </c:if>
                };
        </script>


    </body>
</html>
