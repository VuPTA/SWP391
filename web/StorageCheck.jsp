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
        <title>Danh sách kiểm tra kho</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2 class="mt-4">Danh sách kiểm tra kho</h2>
            <a href="addStorageCheck.jsp" class="btn btn-primary mb-3">Thêm kiểm tra kho</a>
            <table class="table table-bordered table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Mã Bin</th>
                        <th>Tên Bin</th>
                        <th>Người tạo</th>
                        <th>Ngày tạo</th>
                        <th>Người cập nhật</th>
                        <th>Ngày cập nhật</th>
                        <th>Trạng thái</th>
                        <th>Ghi chú</th>
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
                        <td><%= check.getUpdatedByName() != null ? check.getUpdatedByName() : "Chưa cập nhật" %></td>
                        <td><%= check.getUpdatedDate() != null ? check.getUpdatedDate() : "Chưa cập nhật" %></td>
                        <td><%= check.getStatus() %></td>
                        <td><%= check.getNote() != null ? check.getNote() : "Không có" %></td>
                        <td> <a href="accountDetails?accountId=<%= check.getStorageCheckID()%>" class="btn btn-info">Xem chi tiết</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="text-center mt-3">
                <a href="dashboard-manager.jsp" class="btn btn-secondary">Quay lại</a>
            </div>
        </div>
    </body>
</html>
