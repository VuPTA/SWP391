<%-- 
    Document   : StorageCheck
    Created on : 4 Mar 2025, 19:34:01
    Author     : ANNT1
--%>
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
                    <form action="SCheckInforServlet" method="post" class="p-3 bg-light rounded shadow-sm">
                        <h2 class="mt-4">Storage Check All list</h2>
                        <div class="d-flex mt-3 mb-2">

                        </div>
                        <table class="table table-bordered table-hover">
                            <thead class="table-primary">
                                <tr>
                                    <th>ID</th>
                                    <th>Bin Code</th>
                                    <th>Bin Name</th>
                                    <th>Created By</th>
                                    <th>Created Date</th>
                                    <th>Inspection Count</th>
                                    <th>Updated By</th>
                                    <th>Updated Date</th>
                                    <th>Status</th>
                                    <th>Notes</th>
                                    <th></th>
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
                                <td><%= check.getCreatedByName() %></td>
                                <td><%= check.getCreatedDate() %></td>
                                <td><%= check.getCheckCount() %></td>
                                <td><%= check.getUpdatedByName() != null ? check.getUpdatedByName() : "Chưa cập nhật" %></td>
                                <td><%= check.getUpdatedDate() != null ? check.getUpdatedDate() : "Chưa cập nhật" %></td>
                                <td><%= check.getStatus() %></td>
                                <td><%= check.getNote() != null ? check.getNote() : "Không có" %></td>
                                <td> 

                                    <button type="submit" class="btn btn-info px-4">Detail</button>
                                </td>
                        <input type="hidden" name="hisscheckid" value="<%= check.getStorageCheckID() %>">
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
