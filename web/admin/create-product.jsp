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
                    <h1>Create Product</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Products</li>
                            <li class="breadcrumb-item active">Create Product</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Create Product</h5>

                                    <form class="row g-3 needs-validation" novalidate action="create-product" method="post" enctype="multipart/form-data">
                                        <!-- Product Name -->
                                        <div class="col-md-6">
                                            <label for="productName" class="form-label">Product Name</label>
                                            <input type="text" class="form-control" id="productName" name="productName" required>
                                            <div class="invalid-feedback">Please enter a Product Name.</div>
                                        </div>
                                        <!-- Category -->
                                        <div class="col-md-6">
                                            <label for="categoryID" class="form-label">Category</label>
                                            <select class="form-select" id="categoryID" name="categoryID" required>
                                                <option selected disabled value="">Choose a Category...</option>
                                            <c:forEach items="${categories}" var="s">
                                                <option value="${s.categoryId}">${s.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Category.</div>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea type="text" class="form-control" id="description" name="description"></textarea>
                                    </div>



                                    <!-- Product Variant Table -->
                                    <div class="col-12">
                                        <label class="form-label">Product Variant</label>
                                        <button type="button" id="addVariant" class="btn btn-success btn-sm" style="float: right; margin-bottom: 16px">Add Variant</button>

                                        <table class="table table-bordered" id="productvariantsTable">
                                            <thead>
                                                <tr>
                                                    <th>Product Variant Name</th>
                                                    <th>Image</th>
                                                    <th>Color</th>
                                                    <th>Size</th>
                                                    <th>Price</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>

                                                    <td><input type="text" class="form-control name" name="name[]" required></td>
                                                    <td><input type="file" class="form-control image" name="image[]" required onchange="previewImage(this)">
                                                        <img src="" alt="Preview" class="img-preview mt-2" style="width: 50px; height: 50px; display: none;"><!-- comment --></td>
                                                    <td>
                                                        <select class="form-select" id="color" name="color[]" required>
                                                            <option selected disabled value="">Choose a Color...</option>
                                                            <c:forEach items="${colors}" var="c">
                                                                <option value="${c.id}">${c.name}</option>
                                                            </c:forEach>

                                                        </select>
                                                        <div class="invalid-feedback">Please select a Color.
                                                        </div>
                                                    </td>
                                                    <td> <select class="form-select" id="size" name="size[]" required>
                                                            <option selected disabled value="">Choose a Size...</option>

                                                            <c:forEach items="${sizes}" var="c">
                                                                <option value="${c.id}">${c.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <div class="invalid-feedback">Please select a Size.
                                                        </div></td>
                                                    <td><input type="number" class="form-control price" name="price[]" min="0.01" step="0.01" value="1" required></td>
                                                    <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Create Product</button>
                                        <a class="btn btn-danger" href="products">Cancel</a>
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
                $(document).ready(function () {
                    const form = document.querySelector("form");
                    const tableBody = document.querySelector("#productvariantsTable tbody");
                    form.addEventListener("submit", function (event) {
                        if (tableBody.children.length === 0) {
                            alert("You must add at least one product variant.");
                            event.preventDefault(); // Ngăn không cho gửi form
                        }
                    });
                    // Xử lý nút xóa, đảm bảo luôn còn ít nhất một dòng
                    // Xử lý xóa dòng
                    tableBody.addEventListener("click", function (event) {
                        if (event.target.classList.contains("removeRow")) {
                            const row = event.target.closest("tr");
                            if (tableBody.children.length > 1) {
                                row.remove();
                            } else {
                                alert("At least one product variant is required.");
                            }
                        }
                    });


                    // Xử lý thêm dòng mới
                    $("#addVariant").click(function () {
                        let newRow = `
                    <tr>
                        <td><input type="text" class="form-control name" name="name[]" required></td>
                        <td>
                            <input type="file" class="form-control image" name="image[]" required onchange="previewImage(this)">
                            <img src="" alt="Preview" class="img-preview mt-2" style="width: 50px; height: 50px; display: none;">
                        </td>
                        <td>
                            <select class="form-select" name="color[]" required>
                                <option selected disabled value="">Choose a Color...</option>
            <c:forEach items="${colors}" var="c">
                                                                    <option value="${c.id}">${c.name}</option>
            </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a Color.</div>
                        </td>
                        <td> 
                            <select class="form-select" name="size[]" required>
                                <option selected disabled value="">Choose a Size...</option>
            <c:forEach items="${sizes}" var="c">
                                                                    <option value="${c.id}">${c.name}</option>
            </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a Size.</div>
                        </td>
                        <td><input type="number" class="form-control price" name="price[]" min="0.01" step="0.01" value="1" required></td>
                        <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                    </tr>`;
                        $("#productvariantsTable tbody").append(newRow);
                    });
                    // Preview hình ảnh
                    window.previewImage = function (input) {
                        let file = input.files[0];
                        if (file) {
                            let reader = new FileReader();
                            reader.onload = function (e) {
                                $(input).siblings(".img-preview").attr("src", e.target.result).show();
                            };
                            reader.readAsDataURL(file);
                        }
                    };


                });
        </script>

    </body>

</html>
