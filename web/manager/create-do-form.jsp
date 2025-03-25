<%-- 
    Document   : create-do-form
    Created on : Mar 23, 2025, 11:33:56 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form class="row g-3 needs-validation formpo" novalidate action="create-delivery-order" method="post" id="form-create-do">
    <div class="col-md-6">
        <label for="poId" class="form-label">Purchase Order</label>
        <select class="form-select" id="poId" name="poId" required>
            <option selected disabled value="">Choose a Purchase Order...</option>
            <c:forEach items="${purchaseOrders}" var="s">
                <option value="${s.poId}" ${po.poId eq s.poId ? 'selected' : ''}>${s.poId}</option>
            </c:forEach>
        </select>
        <div class="invalid-feedback">Please select a Purchase Order.</div>
    </div>
    <!-- Expected Date -->
    <div class="col-md-6">
        <label for="expectedDate" class="form-label">Expected Date</label>
        <input type="date" class="form-control" id="expectedDate" name="expectedDate" required value="${po.expectedDate}">
        <div class="invalid-feedback">Please select a valid date.</div>
    </div>

    <!-- Supplier -->
    <div class="col-md-12">
        <label for="supplierID" class="form-label">Supplier</label>
        <select class="form-select readonly-select" id="supplierID" name="supplierID" required>
            <option selected disabled value="">Choose a Supplier...</option>
            <c:forEach items="${suppliers}" var="s">
                <option value="${s.supplierID}" ${po.supplierObj.supplierID eq s.supplierID ? 'selected' : ''}>${s.supplierName}</option>
            </c:forEach>
        </select>
        <div class="invalid-feedback">Please select a Supplier.</div>
    </div>

    <!-- Purchase Items Table -->
    <div class="col-12">
        <label class="form-label">Delivery Items</label>
        <table class="table table-bordered" id="purchaseItemsTable">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${po.purchaseItems}" var="pi">
                    <tr>
                        <td>${pi.product.pvName} - ${pi.product.color.name} - ${pi.product.size.name}
                            <input type="hidden" name="productID[]" value="${pi.productVariantId}">
                            <input type="hidden" name="price[]" value="${pi.unitPrice}">
                        </td>
                        <td><input type="number" class="form-control quantity" name="quantity[]" min="1" value="${pi.quantity}" required max="${pi.quantity}">
                         <div class="invalid-feedback">Max is ${pi.quantity}.</div></td>
                        <td class="unitPrice">${pi.unitPrice}</td>
                        <td class="totalPrice">${pi.unitPrice * pi.quantity}</td>
                        <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                    </tr>
                </c:forEach>
            <tfoot>
                <tr>
                    <td colspan="3" class="text-end"><strong>Total Amount:</strong></td>
                    <td id="totalAmount">${po.totalAmount}</td>
                    <td></td>
                </tr>
            </tfoot>
            </tbody>
        </table>
    </div>

    <!-- Submit Button -->
    <div class="col-12">
        <button class="btn btn-primary" type="submit">Create Delivery Order</button>
        <a class="btn btn-danger" href="delivery-orders">Cancel</a>
    </div>
</form>

