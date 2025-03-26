package model;

import java.sql.Timestamp;

public class StorageBin extends Audit {

    private String storageBinID;
    private String warehouseID;
    private String binName;
    private String binType;
    private int capacity;
    private String status;
    
    private BinType binTypeObj;
    private WareHouse wareHouse;

    // Constructor
    public StorageBin() {
    }

    public StorageBin(String storageBinID, String warehouseID, String binName, String binType, int capacity, String status, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        this.storageBinID = storageBinID;
        this.warehouseID = warehouseID;
        this.binName = binName;
        this.binType = binType;
        this.capacity = capacity;
        this.status = status;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
    }

    public StorageBin(String storageBinID, String warehouseID, String binName, String binType, int capacity, String status, int createdBy, Timestamp createdDate) {
        this.storageBinID = storageBinID;
        this.warehouseID = warehouseID;
        this.binName = binName;
        this.binType = binType;
        this.capacity = capacity;
        this.status = status;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
    }

    public StorageBin(String storageBinID, String warehouseID, String binName, String binType, int capacity, String status, Integer updatedBy, Timestamp updatedDate) {
        this.storageBinID = storageBinID;
        this.warehouseID = warehouseID;
        this.binName = binName;
        this.binType = binType;
        this.capacity = capacity;
        this.status = status;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
    }

    public String getStorageBinID() {
        return storageBinID;
    }

    public void setStorageBinID(String storageBinID) {
        this.storageBinID = storageBinID;
    }

    public String getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(String warehouseID) {
        this.warehouseID = warehouseID;
    }

    public String getBinName() {
        return binName;
    }

    public void setBinName(String binName) {
        this.binName = binName;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BinType getBinTypeObj() {
        return binTypeObj;
    }

    public void setBinTypeObj(BinType binTypeObj) {
        this.binTypeObj = binTypeObj;
    }

    public WareHouse getWareHouse() {
        return wareHouse;
    }

    public void setWareHouse(WareHouse wareHouse) {
        this.wareHouse = wareHouse;
    }

}
