<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm danh mục</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
      <%
               String msg = (String)request.getAttribute("msg");
                if(msg == null) msg = "";
                
            %>
    <div class="container mt-4">
        <h2 class="text-center">Thêm danh mục mới</h2>

        <form action="AddCategoryServlet" method="post">
            <div style="color: red"><%=msg%></div>
            <div class="mb-3">
                <label class="form-label">Mã danh mục</label>
                <input type="text" name="categoryId" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên danh mục</label>
                <input type="text" name="categoryName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả</label>
                <textarea name="description" class="form-control" required></textarea>
            </div>
            <button type="submit" class="btn btn-success">Lưu</button>
            <a href="CategoryListServlet" class="btn btn-secondary">Quay lại</a>
        </form>
    </div>
</body>
</html>
