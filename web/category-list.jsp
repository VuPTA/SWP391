<%@ page import="java.util.List, model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách danh mục</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Danh sách danh mục</h2>
    <a href="addCategory.jsp" class="btn btn-primary mb-3">Thêm danh mục</a>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Mô tả</th>
                <th>Người tạo</th>
                <th>Ngày tạo</th>
                <th>Người cập nhật</th>
                <th>Ngày cập nhật</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                for (Category category : categories) {
            %>
            <tr>
                <td><%= category.getCategoryId() %></td>
                <td><%= category.getCategoryName() %></td>
                <td><%= category.getDescription() %></td>
                <td><%= category.getCreatedByName() %></td>
                <td><%= category.getCreatedDate() %></td>
                <td><%= category.getUpdatedByName() != null ? category.getUpdatedByName() : "Chưa cập nhật" %></td>
                <td><%= category.getUpdatedDate() != null ? category.getUpdatedDate() : "Chưa cập nhật" %></td>
                <td>
                    <a href="EditCategoryServlet?id=<%= category.getCategoryId() %>" class="btn btn-warning btn-sm">Sửa</a>
                    <form action="DeleteCategoryServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= category.getCategoryId() %>">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</button>
                    </form>
                </td>
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
