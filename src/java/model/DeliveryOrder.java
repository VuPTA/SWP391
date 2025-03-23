package model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class DeliveryOrder extends Audit {

    private String doId;
    private String poId;
    private String supplierId;
    private String status;
    private Date expectedDate;
    private double totalAmount;
    private List<DeliveryItem> deliveryItems; // Danh sách các deliveryItems thuộc đơn hàng này
    private Supplier supplier;

    public DeliveryOrder(String doId, String poId, String supplierId, String status, Date expectedDate, double totalAmount, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.poId = poId;
        this.doId = doId;
        this.supplierId = supplierId;
        this.status = status;
        this.expectedDate = expectedDate;
        this.totalAmount = totalAmount;
    }

    public DeliveryOrder(String doId, String poId, String supplierId, String status, Date expectedDate, List<DeliveryItem> deliveryItems, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.poId = poId;
        this.doId = doId;
        this.supplierId = supplierId;
        this.status = status;
        this.expectedDate = expectedDate;
        this.deliveryItems = deliveryItems;
    }

    public DeliveryOrder(String doId, String poId, String supplierId, String status, Date expectedDate, List<DeliveryItem> deliveryItems, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.poId = poId;
        this.doId = doId;
        this.supplierId = supplierId;
        this.status = status;
        this.expectedDate = expectedDate;
        this.deliveryItems = deliveryItems;
    }

    public DeliveryOrder(String doId, String poId, String supplierId, String status, Date expectedDate, List<DeliveryItem> deliveryItems, Integer updatedBy, Timestamp updatedDate) {
        super(updatedBy, updatedDate);
        this.poId = poId;
        this.doId = doId;
        this.supplierId = supplierId;
        this.status = status;
        this.expectedDate = expectedDate;
        this.deliveryItems = deliveryItems;
    }

    public DeliveryOrder() {
    }

    public String getPoId() {
        return poId;
    }

    public void setPoId(String poId) {
        this.poId = poId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getExpectedDate() {
        return expectedDate;
    }

    public void setExpectedDate(Date expectedDate) {
        this.expectedDate = expectedDate;
    }

    public List<DeliveryItem> getDeliveryItems() {
        return deliveryItems;
    }

    public void setDeliveryItems(List<DeliveryItem> deliveryItems) {
        this.deliveryItems = deliveryItems;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDoId() {
        return doId;
    }

    public void setDoId(String doId) {
        this.doId = doId;
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

}
