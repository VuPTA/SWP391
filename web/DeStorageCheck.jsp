<%-- 
    Document   : DeStorageCheck
    Created on : 23 Mar 2025, 03:53:03
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
            <div class="p-2 bg-light rounded shadow-sm">
                <h2 class="mt-4">Deactivate storage check list</h2>
                <div class="d-flex mt-3 mb-2">
                    <a href="SCheckCancelServlet1" class="btn btn-secondary ms-auto">Return</a>
                </div>
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
                            <a href="DeSCheckInforServlet?ACscheckid=<%= check.getStorageCheckID() %>" class="btn btn-danger">Activate</a>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>

