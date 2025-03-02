<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Category" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Danh Mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Chỉnh Sửa Danh Mục</h2>

        <%
            Category category = (Category) request.getAttribute("category");
            if (category == null) {
        %>
            <div class="alert alert-danger text-center">Tên danh mục không được đe trong.</div>
            
             <a href="CategoryListServlet" class="btn btn-secondary">Quay lại</a>
        <%
                return;
            }
        %>

        <div class="card shadow-lg p-4">
            <form action="EditCategoryServlet" method="post">
                <input type="hidden" name="categoryId" value="<%= category.getCategoryId() %>">

                <div class="mb-3">
                    <label for="name" class="form-label">Tên danh mục:</label>
                    <input type="text" id="name" name="name" class="form-control" value="<%= category.getCategoryName() %>" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả:</label>
                    <textarea id="description" name="description" class="form-control" rows="3"><%= category.getDescription() %></textarea>
                </div>

            

                

                <div class="d-flex justify-content-between">
                    <a href="CategoryListServlet" class="btn btn-secondary">Quay lại</a>
                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
