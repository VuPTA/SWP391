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
                    <h1>Create Receive Order</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Receive Orders</li>
                            <li class="breadcrumb-item active">Create Receive Order</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Create Receive Order</h5>

                                    <form class="row g-3 needs-validation formpo" novalidate action="create-receive-order" method="post" id="form-create-do">
                                        <div class="col-md-6">
                                            <label for="poId" class="form-label">Delivery Order</label>
                                            <select class="form-select" id="poId" name="poId" required>
                                                <option selected disabled value="">Choose a Delivery Order...</option>
                                            <c:forEach items="${purchaseOrders}" var="s">
                                                <option value="${s.doId}">${s.doId}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Delivery Order.</div>
                                    </div>
                                    <!-- Expected Date -->
                                    <div class="col-md-6">
                                        <label for="expectedDate" class="form-label">Expected Date</label>
                                        <input type="date" class="form-control" id="expectedDate" name="expectedDate" required>
                                        <div class="invalid-feedback">Please select a valid date.</div>
                                    </div>

                                    <!-- Supplier -->
                                    <div class="col-md-12">
                                        <label for="supplierID" class="form-label">Supplier</label>
                                        <select class="form-select readonly-select" id="supplierID" name="supplierID" required>
                                            <option selected disabled value="">Choose a Supplier...</option>
                                            <c:forEach items="${suppliers}" var="s">
                                                <option value="${s.supplierID}">${s.supplierName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Supplier.</div>
                                    </div>


                                    <!-- Search Products -->
                                    <!--                                    <div class="col-md-6">
                                                                            <label class="form-label">Search Product</label>
                                                                            <input type="text" class="form-control" id="searchProduct" placeholder="Type to search...">
                                                                            <ul class="list-group mt-2" id="productList" style="display: none; position: absolute; z-index: 1000;"></ul>
                                                                        </div>-->

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
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Rows will be added dynamically -->
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-end"><strong>Total Amount:</strong></td>
                                                    <td id="totalAmount">0.00</td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Create Receive Order</button>
                                        <a class="btn btn-danger" href="receive-orders">Cancel</a>
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
                $(document).on("submit", ".formpo", function (event) {
                    var tableBody = $("#purchaseItemsTable tbody"); // Lấy tbody của bảng
                    if (tableBody.children().length === 0) {
                        alert("Receive must have at least one item.");
                        event.preventDefault(); // Ngăn không cho gửi form
                    }
                });

                // Cập nhật tổng tiền
                function updateTotals() {
                    let totalAmount = 0;
                    document.querySelectorAll("#purchaseItemsTable tbody tr").forEach(row => {
                        const quantity = parseFloat(row.querySelector(".quantity").value) || 0;
                        const unitPrice = parseFloat(row.querySelector(".unitPrice").textContent) || 0;
                        const total = (quantity * unitPrice).toFixed(2);

                        // Gán total vào ô totalPrice (là <td>, không phải input)
                        row.querySelector(".totalPrice").textContent = total;
                        totalAmount += parseFloat(total);
                    });
                    // Hiển thị tổng tiền
                    document.getElementById("totalAmount").textContent = totalAmount.toFixed(2);
                }
                $(document).on("click", ".removeRow", function () {
                    if ($("#purchaseItemsTable tbody tr").length > 1) {
                        $(this).closest("tr").remove();
                        updateTotals();
                    } else {
                        alert("At least one item is required.");
                    }
                });
                $(document).on("input", ".quantity", function () {
                    let quantity = parseInt($(this).val()) || 0;
                    let price = parseFloat($(this).closest("tr").find(".price").text()) || 0;
                    let total = quantity * price;

                    $(this).closest("tr").find(".total").text(total.toFixed(2)); // Cập nhật tổng tiền hàng trong dòng
                    updateTotals(); // Cập nhật tổng số tiền toàn bảng
                });

            });

        </script>
        <script>
            $(document).ready(function () {
                $(document).on("change", "#poId", function () {
                    var poId = $(this).val(); // Lấy giá trị PO được chọn

                    if (poId) {
                        $.ajax({
                            url: "po-to-create-do", // Gửi đến Servlet xử lý
                            method: "GET",
                            data: {poId: poId},
                            success: function (response) {
                                if (response) {
                                    $("#form-create-do").html(response);
                                }
                            },
                            error: function () {
                                alert("Lỗi khi lấy dữ liệu!");
                            }
                        });
                    } else {
                        $("#poDetails").html(""); // Xóa nội dung nếu không chọn PO
                    }
                });
            });
        </script>
    </body>

</html>
