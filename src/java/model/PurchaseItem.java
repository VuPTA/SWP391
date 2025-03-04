/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class PurchaseItem extends Audit{
    private int purchaseItemId;
    private String poId;  // Foreign Key
    private String productVariantId;
    private int quantity;
    private double unitPrice;

    public PurchaseItem() {
    }

    public PurchaseItem(String productVariantId, int quantity, double unitPrice, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public PurchaseItem(int purchaseItemId, String poId, String productVariantId, int quantity, double unitPrice, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.purchaseItemId = purchaseItemId;
        this.poId = poId;
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getPurchaseItemId() {
        return purchaseItemId;
    }

    public void setPurchaseItemId(int purchaseItemId) {
        this.purchaseItemId = purchaseItemId;
    }

    public String getPoId() {
        return poId;
    }

    public void setPoId(String poId) {
        this.poId = poId;
    }

    public String getProductVariantId() {
        return productVariantId;
    }

    public void setProductVariantId(String productVariantId) {
        this.productVariantId = productVariantId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    
}
