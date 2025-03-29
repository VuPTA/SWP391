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

        <title>Create Warehouse</title>
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
                    <h1>Create Warehouse</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Warehouses</li>
                            <li class="breadcrumb-item active">Create Warehouse</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Create Warehouse</h5>

                                    <form class="row g-3 needs-validation" novalidate action="create-warehouse" method="post">

                                        <div class="col-md-12">
                                            <label for="name" class="form-label">Warehouse Name</label>
                                            <input type="text" class="form-control" id="name" name="name" required>
                                            <div class="invalid-feedback">Please enter a Warehouse Name.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="province" class="form-label">Province</label>
                                            <select class="form-control" id="province" name="province" required>
                                                <option selected disabled value="">Choose a Province...</option>
                                            </select>
                                            <input type="hidden" id="provinceName" name="provinceName">
                                            <div class="invalid-feedback">Please enter a valid Province.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="district" class="form-label">District</label>
                                            <select class="form-control" id="district" name="district" required>
                                                <option selected disabled value="">Choose a District...</option>
                                            </select>
                                            <input type="hidden" id="districtName" name="districtName">
                                            <div class="invalid-feedback">Please enter a valid District.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="ward" class="form-label">Ward</label>
                                            <select class="form-control" id="ward" name="ward" required>
                                                <option selected disabled value="">Choose a Ward...</option>
                                            </select>
                                            <input type="hidden" id="wardName" name="wardName">
                                            <div class="invalid-feedback">Please enter a valid Ward.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="location" class="form-label">Location</label>
                                            <input type="text" class="form-control" id="location" name="location" required>
                                            <div class="invalid-feedback">Please enter a valid Location.</div>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="note" class="form-label">Note</label>
                                            <textarea class="form-control" id="note" name="note" required></textarea>
                                            <div class="invalid-feedback">Please enter a valid Note.</div>
                                        </div>




                                        <!-- Submit Button -->
                                        <div class="col-12">
                                            <button class="btn btn-primary" type="submit">Create Warehouse</button>
                                            <a class="btn btn-danger" href="warehouses">Cancel</a>
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
            let addressSelected = {province: "", district: "", ward: ""};

            // Gọi API lấy danh sách tỉnh/thành phố khi trang tải
            $(document).ready(function () {
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    url: "https://provinces.open-api.vn/api/p/",
                    success: function (data) {
                        console.log(data);
                        let options = '<option selected disabled value="">Choose a Province...</option>';
                        data.forEach(function (p) {
                            options += "<option value='" + p.code + "'>" + p.name + "</option>";
                        });
                        $("#province").html(options);
                    }
                });
            });

            // Khi chọn tỉnh/thành phố -> Gọi API lấy quận/huyện
            $("#province").on("change", function () {
                let provinceId = $(this).val();
                $("#district").html('<option selected disabled value="">Choose a District...</option>');
                $("#ward").html('<option selected disabled value="">Choose a Ward...</option>');

                if (provinceId) {
                    $("#provinceName").val($("#province option:selected").text());
                    addressSelected.province = $("#province option:selected").text();

                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        url: "https://provinces.open-api.vn/api/p/" + provinceId + "?depth=2",
                        success: function (data) {
                            let options = '<option selected disabled value="">Choose a District...</option>';
                            data.districts.forEach(function (d) {
                                options += "<option value='" + d.code + "'>" + d.name + "</option>";
                            });
                            $("#district").html(options);
                        }
                    });
                }
            });

            // Khi chọn quận/huyện -> Gọi API lấy xã/phường
            $("#district").on("change", function () {
                let districtId = $(this).val();
                $("#ward").html('<option selected disabled value="">Choose a Ward...</option>');

                if (districtId) {
                    $("#districtName").val($("#district option:selected").text());
                    addressSelected.district = $("#district option:selected").text();

                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        url: "https://provinces.open-api.vn/api/d/" + districtId + "?depth=2",
                        success: function (data) {
                            let options = '<option selected disabled value="">Choose a Ward...</option>';
                            data.wards.forEach(function (w) {
                                options += "<option value='" + w.code + "'>" + w.name + "</option>";
                            });
                            $("#ward").html(options);
                        }
                    });
                }
            });

            // Khi chọn xã/phường -> Lưu vào biến
            $("#ward").on("change", function () {
                $("#wardName").val($("#ward option:selected").text());
                addressSelected.ward = $("#ward option:selected").text();
            });
        </script>

    </body>

</html>
