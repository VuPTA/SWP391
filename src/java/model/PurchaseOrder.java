package model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class PurchaseOrder extends Audit {

    private String poId;
    private String supplier;
    private String status;
    private Date expectedDate;
    private List<PurchaseItem> purchaseItems; // Danh sách các PurchaseItem thuộc đơn hàng này

    public PurchaseOrder(String poId, String supplier, String status, Date expectedDate, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.poId = poId;
        this.supplier = supplier;
        this.status = status;
        this.expectedDate = expectedDate;
    }

    public PurchaseOrder(String poId, String supplier, String status, Date expectedDate, List<PurchaseItem> purchaseItems, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.poId = poId;
        this.supplier = supplier;
        this.status = status;
        this.expectedDate = expectedDate;
        this.purchaseItems = purchaseItems;
    }

    public PurchaseOrder(String poId, String supplier, String status, Date expectedDate, List<PurchaseItem> purchaseItems, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.poId = poId;
        this.supplier = supplier;
        this.status = status;
        this.expectedDate = expectedDate;
        this.purchaseItems = purchaseItems;
    }

    public PurchaseOrder() {
    }

    public String getPoId() {
        return poId;
    }

    public void setPoId(String poId) {
        this.poId = poId;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
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

    public List<PurchaseItem> getPurchaseItems() {
        return purchaseItems;
    }

    public void setPurchaseItems(List<PurchaseItem> purchaseItems) {
        this.purchaseItems = purchaseItems;
    }
}
