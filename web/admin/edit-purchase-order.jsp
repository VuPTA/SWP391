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
                    <h1>Edit Purchase Order</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item">Purchase Orders</li>
                            <li class="breadcrumb-item active">Edit Purchase Order</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">


                        <div class="col-lg-12">

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Edit Purchase Order</h5>

                                    <form class="row g-3 needs-validation formpo" novalidate action="edit-purchase-order" method="post">
                                        <!-- Supplier -->
                                        <div class="col-md-6">
                                            <input type="hidden" class="form-control" id="poId" name="poId" value="${po.poId}">
                                        <input type="hidden" class="form-control" id="createdBy" name="createdBy" value="${po.createdBy}">
                                        <input type="hidden" class="form-control" id="createdDate" name="createdDate" value="${po.createdDate}">
                                        <label for="supplierID" class="form-label">Supplier</label>
                                        <select class="form-select" id="supplierID" name="supplierID" required ${po.status ne 'Draft' ? 'disabled' : ''}>
                                            <option selected disabled value="">Choose a Supplier...</option>
                                            <c:forEach items="${suppliers}" var="s">
                                                <option value="${s.supplierID}" ${po.supplier eq s.supplierID ? 'selected' : ''}>${s.supplierName}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a Supplier.</div>
                                    </div>

                                    <!-- Expected Date -->
                                    <div class="col-md-6">
                                        <label for="expectedDate" class="form-label">Expected Date</label>
                                        <input type="date" class="form-control" id="expectedDate" name="expectedDate" required value="${po.expectedDate}" ${po.status ne 'Draft' ? 'disabled' : ''}>
                                        <div class="invalid-feedback">Please select a valid date.</div>
                                    </div>
                                    <!-- Status -->
                                    <div class="col-md-12">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required disabled>
                                            <option value="Pending" ${po.status eq 'Draft' ? 'selected' : '' }>Draft</option>
                                            <option value="Delivering" ${po.status eq 'Pending' ? 'selected' : '' }>Pending</option>
                                            <option value="Received" ${po.status eq 'Processing ' ? 'selected' : '' }>Processing</option>
                                            <option value="Delivering" ${po.status eq 'Received' ? 'selected' : '' }>Received</option>
                                            <option value="Delivering" ${po.status eq 'Cancelled' ? 'selected' : '' }>Cancelled</option>
                                        </select>
                                    </div>

                                    <!-- Search Products -->
                                    <div class="col-md-6">
                                        <label class="form-label">Search Product</label>
                                        <input type="text" class="form-control" id="searchProduct" placeholder="Type to search..." ${po.status ne 'Draft' ? 'disabled' : ''}>
                                        <ul class="list-group mt-2" id="productList" style="display: none; position: absolute; z-index: 1000;"></ul>
                                    </div>

                                    <!-- Purchase Items Table -->
                                    <div class="col-12">
                                        <label class="form-label">Purchase Items</label>
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
                                                <c:forEach items="${po.purchaseItems}" var="pi">
                                                    <tr>
                                                        <td>${pi.product.pvName} - ${pi.product.color.name} - ${pi.product.size.name}
                                                            <input type="hidden" name="productID[]" value="${pi.productVariantId}">
                                                            <input type="hidden" name="price[]" value="${pi.unitPrice}">
                                                        </td>
                                                        <td><input type="number" class="form-control quantity" name="quantity[]" min="1" value="${pi.quantity}" required ${po.status ne 'Draft' ? 'disabled' : ''}></td>
                                                        <td class="unitPrice">${pi.unitPrice}</td>
                                                        <td class="totalPrice">${pi.unitPrice * pi.quantity}</td>
                                                        <td><button type="button" class="btn btn-danger btn-sm removeRow" ${po.status ne 'Draft' ? 'disabled' : ''}>Remove</button></td>
                                                    </tr>
                                                </c:forEach>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-end"><strong>Total Amount:</strong></td>
                                                    <td id="totalAmount">${po.totalAmount}</td>
                                                    <td></td>
                                                </tr>
                                            </tfoot>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit" ${po.status ne 'Draft' ? 'disabled' : ''}>Save Purchase Order</button>
                                        <a class="btn btn-danger" href="purchase-orders">Cancel</a>
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
                    let formattedNow = vietnamTime.toISOString().slice(0, 10);

                    document.getElementById("expectedDate").setAttribute("min", formattedNow);
                });
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const searchProduct = document.getElementById("searchProduct");
                    const productList = document.getElementById("productList");
                    const tableBody = document.querySelector("#purchaseItemsTable tbody");

                    const form = document.getElementsByClassName("formpo")[0];
                    form.addEventListener("submit", function (event) {
                        if (tableBody.children.length === 0) {
                            alert("You must add at least one purchase item.");
                            event.preventDefault(); // Ngăn không cho gửi form
                        }
                        const statusValue = document.getElementById("status").value;
                        if (statusValue == "Completed") {
                            if (!confirm("Are you sure you want to change? If the status is Completed, you cannot change it later.")) {
                                event.preventDefault();
                            }
                        }

                    });
                    // Xử lý nút xóa, đảm bảo luôn còn ít nhất một dòng
                    // Xử lý xóa dòng
                    tableBody.addEventListener("click", function (event) {
                        if (event.target.classList.contains("removeRow")) {
                            const row = event.target.closest("tr");
                            if (tableBody.children.length > 1) {
                                row.remove();
                                updateTotals();
                            } else {
                                alert("At least one purchase item is required.");
                            }
                        }
                    });

                    //dữ liệu sản phẩm 
                    var products = [];
            <c:forEach items="${products}" var="o">
                    products.push({
                        id: "${o.productVariantID}",
                        name: "${o.pvName}",
                        image: "${o.image}",
                        color: "${o.color.name}",
                        size: "${o.size.name}",
                        price: ${o.price},
                        quantity: ${o.quantity},
                        category: "${o.category.categoryName}",
                        product: "${o.product.productName}"
                    });
            </c:forEach>

                    // Tìm kiếm sản phẩm
                    searchProduct.addEventListener("input", function () {
                        const searchText = this.value.toLowerCase();
                        productList.innerHTML = "";
                        if (searchText.length === 0) {
                            productList.style.display = "none";
                            return;
                        }

                        const filteredProducts = products.filter(p => p.name.toLowerCase().includes(searchText));

                        filteredProducts.forEach(p => {
                            const li = document.createElement("li");
                            li.classList.add("list-group-item", "list-group-item-action");
                            li.innerHTML =
                                    "<div style='display: flex; align-items: center; gap: 10px;'>" +
                                    "<img src='" + p.image + "' alt='" + p.name + "' style='width: 50px; height: 50px; object-fit: cover; border-radius: 5px;'>" +
                                    "<div>" +
                                    "<strong>" + p.name + "</strong> - $" + (p.price ?? 0) + "<br>" +
                                    "<small>" +
                                    "Color: " + p.color + " | Size: " + p.size + " | Quantity: " + p.quantity + "<br>" +
                                    "Category: " + p.category + " | Product: " + p.product +
                                    "</small>" +
                                    "</div>" +
                                    "</div>";
                            li.dataset.id = p.id;
                            li.dataset.name = p.name;
                            li.dataset.price = p.price;
                            li.addEventListener("click", function () {
                                addProductToTable(p.id, p.name, p.price, p.color, p.size);
                                searchProduct.value = "";
                                productList.style.display = "none";
                            });
                            productList.appendChild(li);
                        });

                        productList.style.display = "block";
                    });

                    // Thêm sản phẩm vào bảng
                    function addProductToTable(id, name, price, color, size) {
                        const existingRow = document.querySelector(`tr[data-id="` + id + `"]`);
                        if (existingRow) {
                            let quantityInput = existingRow.querySelector(".quantity");
                            quantityInput.value = parseInt(quantityInput.value) + 1;
                            updateTotals();
                            return;
                        }

                        const newRow = document.createElement("tr");
                        newRow.dataset.id = id;
                        newRow.innerHTML = `
                    <td>` + name + " - " + color + " - " + size + `<input type="hidden" name="productID[]" value="` + id + `"><input type="hidden" name="price[]" value="` + price + `"></td>
                    <td><input type="number" class="form-control quantity" name="quantity[]" min="1" value="1" required></td>
                    <td class="unitPrice">` + price + `</td>
                    <td class="totalPrice">` + price + `</td>
                    <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                `;
                        tableBody.appendChild(newRow);
                        updateTotals();
                    }

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

                    tableBody.addEventListener("input", function (e) {
                        if (e.target.classList.contains("quantity")) {
                            updateTotals();
                        }
                    });

                    // Ẩn dropdown khi click bên ngoài
                    document.addEventListener("click", function (e) {
                        if (!searchProduct.contains(e.target) && !productList.contains(e.target)) {
                            productList.style.display = "none";
                        }
                    });
                });
        </script>
    </body>

</html>
