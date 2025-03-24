<%-- 
    Document   : StorageCheckDetailHistory
    Created on : 23 Mar 2025, 04:58:31
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
            <h2 class="mt-4">History storage check list</h2>
            <div class="d-flex mt-3 mb-2">
                <a href="SCheckDetailServlet?ScheckId=<%= request.getAttribute("scheckid") %>" class="btn btn-secondary ms-auto">Return</a> 
            </div>

            <table class="table table-bordered table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Item</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>System Quantity</th>
                        <th>Checked Quantity</th>
                        <th>Inspector</th>
                        <th>Inspection Order</th>
                        <th>Inspection Date</th>
                        <th>Notes</th>    
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
                        <td><%= check.getCheckPeriod() >= 1 ? check.getCheckPeriod() : "Chưa cập nhật" %></td>
                        <td><%= check.getCreatedDate() != null ? check.getCreatedDate() : "Chưa cập nhật" %></td>
                        <td><%= check.getNote() != null ? check.getNote() : "Không có" %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>

