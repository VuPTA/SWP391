<%-- 
    Document   : addStorageCheck
    Created on : 4 Mar 2025, 22:33:02
    Author     : ANNT1
--%>

<%@ page import="java.util.List, model.StorageCheckInfor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách Storage Bin</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2 class="mt-4">Danh sách Storage Bin</h2>
            <form action="AddSCheckServlet" method="post">
                <div class="d-flex mt-3 mb-2">
                    <div>
                        <button type="submit" class="btn btn-success">Create</button>
                    </div>
                    <a href="<%= request.getContextPath() %>/SCheckInforServlet" class="btn btn-secondary ms-auto">Quay lại</a>
                </div>
                <table class="table table-bordered table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th>Warehouse ID</th>
                            <th>Bin ID</th>
                            <th>Warehouse Name</th>
                            <th>Bin Name</th>
                            <th>Bin Type</th>
                            <th>Capacity</th>
                            <th>Total Quantity</th>
                            <th>Status</th>
                            <th>Notes</th>
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<StorageCheckInfor> bininfor = (List<StorageCheckInfor>) request.getAttribute("bininfor");
                        
                                for (StorageCheckInfor bin : bininfor) {
                        %>
                        <tr>
                            <td><%= bin.getWarehouseID() %></td>
                            <td><%= bin.getStorageBinID() %></td>
                            <td><%= bin.getWarehouseName() %></td>
                            <td><%= bin.getBinName() %></td>
                            <td><%= bin.getBinType() %></td>
                            <td><%= bin.getCapacity() %></td>
                            <td><%= bin.getTotalQuantity() %></td>
                            <td><%= bin.getStatus() %></td>
                            <td>
                                <input type="text" name="notes_<%= bin.getStorageBinID() %>" class="form-control" placeholder="Nhập ghi chú...">
                            </td>
                            <td class="text-center">
                                <input type="radio" name="selectedBins" value="<%= bin.getStorageBinID() %>" required="">
                            </td>
                        </tr>

                        <% } %>
                    </tbody>
                </table>


            </form>
        </div>
    </body>
</html>

