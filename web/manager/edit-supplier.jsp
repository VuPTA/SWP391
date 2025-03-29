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

        <title>Edit Supplier</title>
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
                    <h1>Edit Supplier</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Suppliers</li>
                            <li class="breadcrumb-item active">Edit Supplier</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Edit Supplier</h5>

                                    <form class="row g-3 needs-validation" novalidate action="edit-supplier" method="post">

                                        <div class="col-md-12">
                                            <label for="name" class="form-label">Supplier Name</label>
                                            <input type="text" class="form-control" id="name" name="name" required value="${s.supplierName}">
                                        <input type="hidden" class="form-control" id="supplierId" name="supplierId" required value="${s.supplierID}">
                                        <div class="invalid-feedback">Please enter a Supplier Name.</div>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="address" class="form-label">Address</label>
                                        <textarea class="form-control" id="address" name="address" required>${s.address}</textarea>
                                        <div class="invalid-feedback">Please enter a Address.</div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="phone" class="form-label">Phone</label>
                                        <input type="text" class="form-control" id="phone" name="phone" pattern="^0\d{8,9}$" required value="${s.phone}">
                                        <div class="invalid-feedback">Phone must start with 0 and have 9 or 10 digits.</div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="tax" class="form-label">Tax Number</label>
                                        <input type="text" class="form-control" id="tax" name="tax" pattern="^\d{13}$" required value="${s.taxNumber}">
                                        <div class="invalid-feedback">Tax Number must contain 13 digits.</div>
                                    </div>
                                    <!-- Status -->
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="Active" ${s.status eq 'Active' ? 'selected' : '' }>Active</option>
                                            <option value="Inactive" ${s.status eq 'Inactive' ? 'selected' : '' }>Inactive</option>
                                        </select>
                                    </div>
                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Save Supplier</button>
                                        <a class="btn btn-danger" href="suppliers">Cancel</a>
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
