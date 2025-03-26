<%-- 
    Document   : StorageCheckClear1
    Created on : 26 Mar 2025, 03:07:46
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
                <%-- Hiển thị messageBinID nếu có --%>
                <c:if test="${not empty message}">
                    <div class="alert alert-success">
                        ${message}
                    </div>
                </c:if>
                <form action="SCheckClearServlet1" method="post" class="p-3 bg-light rounded shadow-sm">
                    <h3 class="mb-3">Storage Check Clear</h3>
                    <div class="input-group">
                        <label for="storageCheckID" class="input-group-text">Enter ID</label>
                        <input type="text" id="storageCheckID" name="selectedSCid" list="SCidlist" 
                               class="form-control" placeholder="Enter ID..." required>
                        <button type="submit" class="btn btn-success px-4">Enter</button>

                        <!-- Search -->
                        <select id="searchType" name="searchType" class="form-select ms-2" ">
                            <option value="">Search by...</option>
                            <option value="ID">ID</option>
                            <option value="BinID">Bin Code</option>
                            <option value="BName">Bin Name</option>
                            <option value="Notes">Notes</option>
                        </select>
                        <input type="text" id="searchQuery" name="searchQuery" class="form-control" placeholder="Search...">
                        <button type="submit" class="btn btn-primary px-4">Search</button>
                    </div>
                </form>
                <table class="table table-bordered table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th>ID</th>
                            <th>Bin Code</th>
                            <th>Bin Name</th>                            
                            <th>Status</th>
                            <th>Notes</th>                 
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<StorageCheckInfor> scheckinfor = (List<StorageCheckInfor>) request.getAttribute("scheckinfor");
                            for (StorageCheckInfor check : scheckinfor) {
                        %>
                        <tr>
                            <td><%= check.getStorageCheckID() %></td>
                            <td><%= check.getStorageBinID() %></td>
                            <td><%= check.getBinName() %></td>                            
                            <td><%= check.getStatus() %></td>
                            <td><%= check.getNote() != null ? check.getNote() : "Không có" %></td>                            
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main><!-- End #main -->
        <!-- ======= Footer ======= -->
        <jsp:include page="/common/footer.jsp"></jsp:include>
    </body>
</html>