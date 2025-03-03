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
                    <h1>Create Bin</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Storage Bin</li>
                            <li class="breadcrumb-item active">Create Bin</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Create Bin</h5>

                                    <form class="row g-3 needs-validation" novalidate action="create-bin" method="post">
                                        <!-- Warehouse ID -->
                                        <div class="col-md-6">
                                            <label for="warehouseID" class="form-label">Warehouse</label>
                                            <select class="form-select" id="warehouseID" name="warehouseID" required>
                                                <option selected disabled value="">Choose a Warehouse...</option>
                                                <c:forEach items="${warehouses}" var="warehouse">
                                                <option value="${warehouse.warehouseID}">${warehouse.warehouseName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Warehouse.</div>
                                    </div>

                                    <!-- Bin Name -->
                                    <div class="col-md-6">
                                        <label for="binName" class="form-label">Bin Name</label>
                                        <input type="text" class="form-control" id="binName" name="binName" required>
                                        <div class="invalid-feedback">Please enter a Bin Name.</div>
                                    </div>

                                    <!-- Bin Type -->
                                    <div class="col-md-6">
                                        <label for="binType" class="form-label">Bin Type</label>
                                        <select class="form-select" id="binType" name="binType" required>
                                            <option selected disabled value="">Choose Bin Type...</option>
                                            <option value="Small">Small</option>
                                            <option value="Standard">Standard</option>
                                            <option value="Large">Large</option>
                                        </select>
                                        <div class="invalid-feedback">Please select a Bin Type.</div>
                                    </div>

                                    <!-- Capacity -->
                                    <div class="col-md-6">
                                        <label for="capacity" class="form-label">Capacity</label>
                                        <input type="number" class="form-control" id="capacity" name="capacity" min="1" required>
                                        <div class="invalid-feedback">Please enter a valid Capacity.</div>
                                    </div>

                                    <!-- Time Locked (Datetime) -->
                                    <div class="col-md-6">
                                        <label for="timeLocked" class="form-label">Time Locked</label>
                                        <input type="datetime-local" class="form-control" id="timeLocked" name="timeLocked">
                                    </div>

                                    <!-- Time Unlock (Datetime) -->
                                    <div class="col-md-6">
                                        <label for="timeUnlock" class="form-label">Time Unlock</label>
                                        <input type="datetime-local" class="form-control" id="timeUnlock" name="timeUnlock">
                                    </div>

                                    <!-- Created By (Hidden) -->
                                    <input type="hidden" name="createdBy" value="${currentUserId}">

                                    <!-- Updated By (Hidden) -->
                                    <input type="hidden" name="updatedBy" value="${currentUserId}">

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Create Bin</button>
                                        <a class="btn btn-danger" href="storage-bin">Cancel</a>
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let now = new Date();

                // Chuyển sang múi giờ Việt Nam (GMT+7)
                let vietnamTime = new Date(now.getTime() + (7 * 60 * 60 * 1000));

                // Định dạng thành YYYY-MM-DDTHH:MM để đặt vào min
                let formattedNow = vietnamTime.toISOString().slice(0, 16);

                document.getElementById("timeLocked").setAttribute("min", formattedNow);
                document.getElementById("timeUnlock").setAttribute("min", formattedNow);
            });
        </script>
    </body>

</html>
