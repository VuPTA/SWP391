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

        <title>Bin Detail</title>
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
                    <h1>Bin Detail</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Storage Bin</li>
                            <li class="breadcrumb-item active">Bin Detail</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Bin Detail</h5>

                                    <form class="row g-3 needs-validation" novalidate>
                                        <!-- Warehouse ID -->
                                        <div class="col-md-6">
                                            <label for="warehouseID" class="form-label">Warehouse</label>
                                            <select class="form-select readonly-select" id="warehouseID" name="warehouseID" readonly>
                                                <option selected disabled value="">Choose a Warehouse...</option>
                                            <c:forEach items="${warehouses}" var="warehouse">
                                                <option value="${warehouse.warehouseID}" ${sb.warehouseID eq warehouse.warehouseID ? 'selected' : '' }>${warehouse.warehouseName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Warehouse.</div>
                                    </div>

                                    <!-- Bin Name -->
                                    <div class="col-md-6">
                                        <label for="binName" class="form-label">Bin Name</label>
                                        <input type="text" class="form-control" id="binName" name="binName" value="${sb.binName}" readonly>
                                        <div class="invalid-feedback">Please enter a Bin Name.</div>
                                    </div>

                                    <!-- Bin Type -->
                                    <div class="col-md-6">
                                        <label for="binType" class="form-label">Bin Type</label>
                                        <select class="form-select readonly-select" id="binType" name="binType" readonly>
                                            <c:forEach items="${binTypes}" var="b">
                                                <option value="${b.id}" ${b.id == sb.binType ? 'selected' : ''}>${b.name}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Bin Type.</div>
                                    </div>

                                    <!-- Capacity -->
                                    <div class="col-md-6">
                                        <label for="capacity" class="form-label">Capacity</label>
                                        <input type="number" class="form-control" id="capacity" name="capacity" min="1" required value="${sb.capacity}" readonly>
                                        <div class="invalid-feedback">Please enter a valid Capacity.</div>
                                    </div>

                                    <!-- Status -->
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select readonly-select" id="status" name="status" required>
                                            <option value="Active" ${sb.status eq 'Active' ? 'selected' : '' }>Active</option>
                                            <option value="Lock" ${sb.status eq 'Lock' ? 'selected' : '' }>Lock</option>
                                            <option value="Inactive" ${sb.status eq 'Inactive' ? 'selected' : '' }>Inactive</option>
                                        </select>
                                    </div>

                                    <!-- Submit Button -->
<!--                                    <div class="col-12">
                                        <a class="btn btn-success" href="storage-bin">Back</a>
                                    </div>-->
                                </form>



<!--                            </div>
                        </div>
                    </div>-->


<!--                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">-->

                                <div style="display: flex; justify-content: space-between;align-items: center; padding-right: 10px">
                                    <h5 class="card-title">Products</h5>
                                </div>
                                <!-- Table with stripped rows -->
                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th>Product Variant Name</th>
                                            <th>Image</th>
                                            <th>Color</th>
                                            <th>Size</th>
                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${productVariants}" var="p">
                                            <tr>
                                                <td>${p.pvName}</td>
                                                <td><img src="${p.image}" style="width: 50px; height: 50px;"></td>
                                                <td>${p.color.name}</td>
                                                <td>${p.size.name}</td>
                                                <td>${p.quantity}</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <!-- End Table with stripped rows -->
                                 <div class="col-12">
                                        <a class="btn btn-success" href="storage-bin">Back</a>
                                    </div>

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
