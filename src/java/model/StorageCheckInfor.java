package model;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class StorageCheckInfor {

    private int storageCheckID;
    private String warehouseID;//Dung cho select Bin
    private String storageBinID;
    private String warehouseName;//
    private String binName;    
    private String createdByName;
    private String createdDate;
    private String updatedByName;
    private String updatedDate;
    private String binType;
    private int capacity;//
    private int totalQuantity;//
    private String status;
    private String note;
    private int checkCount;

    public StorageCheckInfor() {
    }

    public StorageCheckInfor(int storageCheckID, String storageBinID, String binName, String createdByName, String createdDate, String updatedByName, String updatedDate, String status, String note, int checkCount) {
        this.storageCheckID = storageCheckID;
        this.storageBinID = storageBinID;
        this.binName = binName;
        this.createdByName = createdByName;
        this.createdDate = createdDate;
        this.updatedByName = updatedByName;
        this.updatedDate = updatedDate;
        this.status = status;
        this.note = note;
        this.checkCount = checkCount;
    }

    public StorageCheckInfor(String warehouseID, String storageBinID, String warehouseName, String binName, String binType, int capacity, int totalQuantity, String status) {
        this.warehouseID = warehouseID;
        this.storageBinID = storageBinID;
        this.warehouseName = warehouseName;
        this.binName = binName;
        this.binType = binType;
        this.capacity = capacity;
        this.totalQuantity = totalQuantity;
        this.status = status;
    }

    public String getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(String warehouseID) {
        this.warehouseID = warehouseID;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public String getBinType() {
        return binType;
    }

    public void setBinType(String binType) {
        this.binType = binType;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public int getCheckCount() {
        return checkCount;
    }

    public void setCheckCount(int checkCount) {
        this.checkCount = checkCount;
    }

    public void setCreatedByName(String createdByName) {
        this.createdByName = createdByName;
    }

    public String getCreatedByName() {
        return createdByName;
    }

    public int getStorageCheckID() {
        return storageCheckID;
    }

    public void setStorageCheckID(int storageCheckID) {
        this.storageCheckID = storageCheckID;
    }

    public String getStorageBinID() {
        return storageBinID;
    }

    public void setStorageBinID(String storageBinID) {
        this.storageBinID = storageBinID;
    }

    public String getBinName() {
        return binName;
    }

    public void setBinName(String binName) {
        this.binName = binName;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getUpdatedByName() {
        return updatedByName;
    }

    public void setUpdatedByName(String updatedByName) {
        this.updatedByName = updatedByName;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
