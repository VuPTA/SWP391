<%-- 
    Document   : StorageCheckDetail
    Created on : 4 Mar 2025, 23:28:04
    Author     : ANNT1
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.util.List, model.StorageCheckInfor" %>
<%@ page import="java.util.List, model.StorageCheckDetail" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Danh sách kiểm tra kho</title>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <!-- ======= Header ======= -->
        <jsp:include page="/common/header.jsp"></jsp:include><!-- End Header -->

            <!-- ======= Sidebar ======= -->
        <jsp:include page="/common/sidebar.jsp"></jsp:include><!-- End Sidebar-->
            <main id="main" class="main">
                <div class="container">
                    <h2 class="mt-4">Storage Check Count</h2>
                    <div class="d-flex mt-3 mb-2">
                        <div>
                            <button type="submit" class="btn btn-success" name="action" value="save" form="storageCheckForm">Save</button>
                        </div>

                        <a href="<%= request.getContextPath() %>/SCheckDetailServlet" class="btn btn-secondary ms-auto">Return</a>
                </div>

                <!-- Form bao quanh bảng -->
                <form action="UpdateSCheckServlet" method="POST" id="storageCheckForm">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>Item</th>
                                <th>Size</th>
                                <th>Color</th>
                                <th>System Quantity</th>
                                <th>Checked Quantity</th>
                                <th>Counter</th>
                                <th>Counting time</th>
                                <th>Counting Date</th>
                                <th>Notes</th>                        
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<StorageCheckDetail> scheckdetail = (List<StorageCheckDetail>) request.getAttribute("scheckdetail");
                                for (StorageCheckDetail check : scheckdetail) {
                            %>
                            <tr>
                                <td><%= check.getPvName() %></td>
                                <td><%= check.getSize() %></td>
                                <td><%= check.getColor() %></td>
                                <td><%= check.getExpectedQuantity() %></td>
                                <td>
                                    <input type="number" name="checkedQuantity" 
                                           value="<%= check.getActualQuantity() %>" class="form-control">
                                </td>                   
                                <td><%= check.getCreatedBy() != null ? check.getCreatedBy() : "Chưa cập nhật" %></td>
                                <td><%= check.getCheckPeriod() >= 1 ? check.getCheckPeriod() : "Chưa cập nhật" %></td>
                                <td><%= check.getCreatedDate() != null ? check.getCreatedDate() : "Chưa cập nhật" %></td>
                                <td>
                                    <input type="text" name="notes" 
                                           value="<%= check.getNote() != null ? check.getNote() : "" %>" class="form-control">
                                </td>
                        <input type="hidden" name="expectedQuantity" value="<%= check.getExpectedQuantity() %>">
                        <input type="hidden" name="storageCheckID" value="<%= check.getStorageCheckID() %>">
                        <input type="hidden" name="binProductID" value="<%= check.getBinProductID() %>">
                        <input type="hidden" name="productVariantID" value="<%= check.getProductVariantID() %>">
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </form>
            </div>
        </main><!-- End #main -->
        <!-- ======= Footer ======= -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
</html>
