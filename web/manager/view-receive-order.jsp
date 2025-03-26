<%-- 
    Document   : create-bin
    Created on : Mar 2, 2025, 11:52:04 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Forms / Validation - NiceAdmin Bootstrap Template</title>
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
        <style>
            .readonly-select,input[readonly]{
                pointer-events: none;
                background-color: #e9ecef;
            }
        </style>
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
                    <h1>View Receive Order</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Receive Orders</li>
                            <li class="breadcrumb-item active">View Receive Order</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Receive Order Detail</h5>

                                    <form class="row g-3 needs-validation formpo" novalidate>
                                        <div class="col-md-6">
                                            <label for="poId" class="form-label">Delivery Order</label>
                                            <input type="text" class="form-control" id="poId" name="poId" required disabled value="${delivery.poId}">
                                    </div>
                                    <!-- Expected Date -->
                                    <div class="col-md-6">
                                        <label for="expectedDate" class="form-label">Expected Date</label>
                                        <input type="date" class="form-control" id="expectedDate" name="expectedDate" required disabled value="${delivery.expectedDate}">
                                    </div>

                                    <!-- Supplier -->
                                    <div class="col-md-12">
                                        <label for="supplierID" class="form-label">Supplier</label>
                                        <input type="text" class="form-control" id="supplierID" name="supplierID" required disabled value="${delivery.supplier.supplierName}">
                                    </div>

                                    <!-- Purchase Items Table -->
                                    <div class="col-12">
                                        <label class="form-label">Receive Items</label>
                                        <table class="table table-bordered" id="purchaseItemsTable">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Quantity</th>
                                                    <th>Unit Price</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Rows will be added dynamically -->
                                                <c:forEach items="${delivery.deliveryItems}" var="pi">
                                                    <tr>
                                                        <td>${pi.product.pvName} - ${pi.product.color} - ${pi.product.size}</td>
                                                        <td>${pi.quantity}</td>
                                                        <td class="unitPrice">${pi.unitPrice}</td>
                                                        <td class="totalPrice">${pi.unitPrice * pi.quantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-end"><strong>Total Amount:</strong></td>
                                                    <td id="totalAmount">${delivery.totalAmount}</td>
                                                </tr>
                                            </tfoot>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <a class="btn btn-primary" href="receive-orders">Back</a>
                                    </div>
                                </form>
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
