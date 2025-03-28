<%-- 
    Document   : storage-bin-list
    Created on : Mar 2, 2025, 11:05:28 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>List Purchase Order</title>
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

                <div class="pagetitle">
                    <h1>Purchase Orders</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Purchase Orders</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">

                                    <div style="display: flex; justify-content: space-between;align-items: center; padding-right: 10px">
                                        <h5 class="card-title">Purchase Order List</h5>
                                    <c:if test="${sessionScope.account != null && (sessionScope.account.role eq 'Staff' || sessionScope.account.role eq 'Manager')}">
                                        <a href="create-purchase-order" class="btn btn-primary" style="height: 40px">Create Purchase Order</a>
                                    </c:if>
                                </div>
                                <!-- Table with stripped rows -->
                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th>PO ID</th>
                                            <th>Supplier</th>
                                            <th>Total Amount</th>
                                            <th>Expected Date</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${purchaseOrders}" var="po">
                                            <tr>
                                                <td>${po.poId}</td>
                                                <td>${po.supplierObj.supplierName}</td>
                                                <td>${po.totalAmount}</td>
                                                <td>${po.expectedDate}</td>
                                                <td>${po.status}</td>
                                                <td style="text-align: right">
                                                    
                                                    </a>
                                                    <c:if test="${sessionScope.account != null && sessionScope.account.role eq 'Manager' && po.status eq 'Draft'}">
                                                        <a href="confirm-purchase-order?id=${po.poId}&status=Pending" class="edit-btn" title="Approve">
                                                            <i class="bx bx-check-circle"></i>
                                                        </a>
                                                        <a href="confirm-purchase-order?id=${po.poId}&status=Cancelled" class="edit-btn" title="Reject">
                                                            <i class="bx bx-block"></i>
                                                        </a>
                                                    </c:if>
                                                    <a href="edit-purchase-order?id=${po.poId}" class="edit-btn" title="Edit">
                                                        <i class="bx bx-edit"></i>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <!-- End Table with stripped rows -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>

</html>
