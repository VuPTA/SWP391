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
public class ReceiveItem extends Audit {

    private int deliveryItemId;
    private String doId;  // Foreign Key
    private String productVariantId;
    private int quantity;
    private double unitPrice;

    private ProductVariant product;

    public ReceiveItem() {
    }

    public ReceiveItem(String productVariantId, int quantity, double unitPrice, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public ReceiveItem(String productVariantId, int quantity, double unitPrice, Integer updatedBy, Timestamp updatedDate) {
        super(updatedBy, updatedDate);
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public ReceiveItem(int deliveryItemId, String doId, String productVariantId, int quantity, double unitPrice, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.deliveryItemId = deliveryItemId;
        this.doId = doId;
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public ReceiveItem(int deliveryItemId, String doId, String productVariantId, int quantity, double unitPrice, ProductVariant product, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.deliveryItemId = deliveryItemId;
        this.doId = doId;
        this.productVariantId = productVariantId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
    }

    public int getDeliveryItemId() {
        return deliveryItemId;
    }

    public void setDeliveryItemId(int deliveryItemId) {
        this.deliveryItemId = deliveryItemId;
    }

    public String getDoId() {
        return doId;
    }

    public void setDoId(String doId) {
        this.doId = doId;
    }


    public String getPoId() {
        return doId;
    }

    public void setPoId(String doId) {
        this.doId = doId;
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

    public ProductVariant getProduct() {
        return product;
    }

    public void setProduct(ProductVariant product) {
        this.product = product;
    }

}
