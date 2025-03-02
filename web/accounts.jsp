<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.Account" %>
<%
    List<Account> accounts = (List<Account>) request.getAttribute("accounts");
    String message = request.getParameter("success") != null ? "Cập nhật thành công!" :
                     request.getParameter("error") != null ? "Có lỗi xảy ra!" : "";
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Quản lý tài khoản</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Danh sách tài khoản</h2>

            <% if (!message.isEmpty()) { %>
            <div class="alert <%= request.getParameter("success") != null ? "alert-success" : "alert-danger" %>">
                <%= message %>
            </div>
            <% } %>
            <a href="addAccounts.jsp" class="btn btn-primary mb-3">Thêm tài khoản</a>

            <table class="table table-bordered table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Vai trò</th>
                        <th>Thay đổi vai trò</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Account acc : accounts) { %>
                    <tr>
                        <td><%= acc.getAccountId() %></td>
                        <td><%= acc.getUsername() %></td>
                        <td><%= acc.getRole() %></td>
                        <td>
                            <form action="updateRole" method="post" class="d-flex">
                                <input type="hidden" name="accountId" value="<%= acc.getAccountId() %>">
                                <select name="newRole" class="form-select me-2">
                                    <option value="1" <%= acc.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                                    <option value="2" <%= acc.getRole().equals("Manager") ? "selected" : "" %>>Manager</option>
                                    <option value="3" <%= acc.getRole().equals("Staff") ? "selected" : "" %>>Staff</option>
                                </select>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </form>
                        </td>
                        <td>
                            <% if (acc.getStatus().equalsIgnoreCase("Active")) { %>
                            <span class="badge bg-success">Active</span>
                            <% } else { %>
                            <span class="badge bg-danger">Inactive</span>
                            <% } %>
                        </td>
                        <td>
                            <form action="toggleStatus" method="post">
                                <input type="hidden" name="accountId" value="<%= acc.getAccountId() %>">
                                <input type="hidden" name="newStatus" value="<%= acc.getStatus().equalsIgnoreCase("Active") ? "Inactive" : "Active" %>">
                                <button type="submit" class="btn <%= acc.getStatus().equalsIgnoreCase("Active") ? "btn-warning" : "btn-success" %>">
                                    <%= acc.getStatus().equalsIgnoreCase("Active") ? "Deactivate" : "Activate" %>
                                </button>
                            </form>

                        </td>
                        <td> <a href="accountDetails?accountId=<%= acc.getAccountId() %>" class="btn btn-info">Xem chi tiết</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <a href="dashboard-manager.jsp" class="btn btn-secondary">Quay lại</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
