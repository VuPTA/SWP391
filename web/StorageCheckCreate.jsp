<%-- 
    Document   : addStorageCheck
    Created on : 4 Mar 2025, 22:33:02
    Author     : ANNT1
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, model.StorageCheckInfor" %>
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
                <%-- Hiển thị messageBinID nếu có --%>
                <c:if test="${not empty messageBinID}">
                    <div class="alert alert-success">
                        StorageCheck ID mới tạo: ${messageBinID}
                    </div>
                </c:if>      
                <div class="p-2 bg-light rounded shadow-sm">
                    <h3 class="mb-3">Storage Check Create</h3>
                    <div class="d-flex mt-3 mb-2">
                        <div>
                            <button type="submit" class="btn btn-success" form="storageCheckForm">Create</button>
                        </div>
                        <a href="<%= request.getContextPath() %>/SCheckInforServlet" class="btn btn-secondary ms-auto">Quay lại</a>
                    </div>
                </div>

                <form action="AddSCheckServlet" method="post"  id="storageCheckForm">


                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>Warehouse ID</th>
                                <th>Bin ID</th>
                                <th>Warehouse Name</th>
                                <th>Bin Name</th>
                                <th>Bin Type</th>
                                <th>Capacity</th>
                                <th>Total Quantity</th>
                                <th>Status</th>
                                <th>Notes</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<StorageCheckInfor> bininfor = (List<StorageCheckInfor>) request.getAttribute("bininfor");
                        
                                    for (StorageCheckInfor bin : bininfor) {
                            %>
                            <tr>
                                <td><%= bin.getWarehouseID() %></td>
                                <td><%= bin.getStorageBinID() %></td>
                                <td><%= bin.getWarehouseName() %></td>
                                <td><%= bin.getBinName() %></td>
                                <td><%= bin.getBinType() %></td>
                                <td><%= bin.getCapacity() %></td>
                                <td><%= bin.getTotalQuantity() %></td>
                                <td><%= bin.getStatus() %></td>
                                <td>
                                    <input type="text" name="notes_<%= bin.getStorageBinID() %>" class="form-control" placeholder="Nhập ghi chú...">
                                </td>
                                <td class="text-center">
                                    <input type="radio" name="selectedBins" value="<%= bin.getStorageBinID() %>" required="">
                                </td>
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

