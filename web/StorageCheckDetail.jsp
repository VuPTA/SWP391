<%-- 
    Document   : StorageCheckDetail
    Created on : 4 Mar 2025, 23:28:04
    Author     : ANNT1
--%>

<%@ page import="java.util.List, model.StorageCheckDetail" %>
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
            <a href="addStorageCheck.jsp" class="btn btn-primary mb-3">Lịch sử kiểm tra kho</a>
            <table class="table table-bordered table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Vật phẩm</th>
                        <th>Kích cỡ</th>
                        <th>Màu sắc</th>
                        <th>Số lượng dự kiến</th>
                        <th>Số lượng thực tế</th>
                        <th>Người kiểm</th>
                        <th>Ngày kiểm</th>                        
                        <th>Ghi chú</th>
                        <th></th>
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
                        <td><%= check.getActualQuantity() %></td>                        
                        <td><%= check.getCreatedBy() != null ? check.getCreatedBy() : "Chưa cập nhật" %></td>
                        <td><%= check.getCreatedDate() != null ? check.getCreatedDate() : "Chưa cập nhật" %></td>
                        <td><%= check.getNote() != null ? check.getNote() : "Không có" %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
                <a href="accountDetails?accountId=" class="btn btn-success">Lưu</a>
            <div class="text-center mt-3">
                <a href="<%= request.getContextPath() %>/SCheckInforServlet" class="btn btn-secondary">Quay lại</a>

            </div>
        </div>
    </body>
</html>
