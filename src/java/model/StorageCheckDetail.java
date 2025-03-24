/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ANNT1
 */
public class StorageCheckDetail {
    private int storageCheckDetailID;
    private int storageCheckID;
    private int binProductID;
    private String productVariantID;
    private String pvName; // Tên sản phẩm
    private int size; 
    private String color; 
    private int actualQuantity;
    private int expectedQuantity;
    private int checkPeriod;
    private String note;
    private String createdBy;
    private int createdByID;
    private String createdDate;
    private String updatedBy; // Có thể NULL
    private String updatedDate;

    public StorageCheckDetail() {
    }


    public StorageCheckDetail(int storageCheckDetailID, int storageCheckID, int binProductID, String productVariantID, String pvName, int size, String color, int actualQuantity, int expectedQuantity, int checkPeriod, String note, String createdBy, String createdDate, String updatedBy, String updatedDate) {
        this.storageCheckDetailID = storageCheckDetailID;
        this.storageCheckID = storageCheckID;
        this.binProductID = binProductID;
        this.productVariantID = productVariantID;
        this.pvName = pvName;
        this.size = size;
        this.color = color;
        this.actualQuantity = actualQuantity;
        this.expectedQuantity = expectedQuantity;
        this.checkPeriod = checkPeriod;
        this.note = note;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
    }
    
    //newpending
    public StorageCheckDetail(int storageCheckID, int binProductID, String productVariantID, String pvName, int size, String color, int expectedQuantity) {    
        this.storageCheckID = storageCheckID;
        this.binProductID = binProductID;
        this.productVariantID = productVariantID;
        this.pvName = pvName;
        this.size = size;
        this.color = color;
        this.expectedQuantity = expectedQuantity;
    }

    //Pending
    public StorageCheckDetail(String pvName, int size, String color, int expectedQuantity) {
        this.pvName = pvName;
        this.size = size;
        this.color = color;
        this.expectedQuantity = expectedQuantity;
    }

    public int getCreatedByID() {
        return createdByID;
    }

    public void setCreatedByID(int createdByID) {
        this.createdByID = createdByID;
    }
    
    
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public int getStorageCheckDetailID() {
        return storageCheckDetailID;
    }

    public void setStorageCheckDetailID(int storageCheckDetailID) {
        this.storageCheckDetailID = storageCheckDetailID;
    }

    public int getStorageCheckID() {
        return storageCheckID;
    }

    public void setStorageCheckID(int storageCheckID) {
        this.storageCheckID = storageCheckID;
    }

    public int getBinProductID() {
        return binProductID;
    }

    public void setBinProductID(int binProductID) {
        this.binProductID = binProductID;
    }

    public String getProductVariantID() {
        return productVariantID;
    }

    public void setProductVariantID(String productVariantID) {
        this.productVariantID = productVariantID;
    }

    public String getPvName() {
        return pvName;
    }

    public void setPvName(String pvName) {
        this.pvName = pvName;
    }

    public int getActualQuantity() {
        return actualQuantity;
    }

    public void setActualQuantity(int actualQuantity) {
        this.actualQuantity = actualQuantity;
    }

    public int getExpectedQuantity() {
        return expectedQuantity;
    }

    public void setExpectedQuantity(int expectedQuantity) {
        this.expectedQuantity = expectedQuantity;
    }

    public int getCheckPeriod() {
        return checkPeriod;
    }

    public void setCheckPeriod(int checkPeriod) {
        this.checkPeriod = checkPeriod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    
}
