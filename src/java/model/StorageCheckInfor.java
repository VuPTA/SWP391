package model;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class StorageCheckInfor {
    private int storageCheckID;
    private String storageBinID;
    private String binName;
    private String createdByName;
    private String createdDate;
    private String updatedByName; // Tên người cập nhật
    private String updatedDate;
    private String status;
    private String note;

    public StorageCheckInfor() {
    }

    public StorageCheckInfor(int storageCheckID, String storageBinID, String binName, String createdByName, String createdDate, String updatedByName, String updatedDate, String status, String note) {
        this.storageCheckID = storageCheckID;
        this.storageBinID = storageBinID;
        this.binName = binName;
        this.createdByName = createdByName;
        this.createdDate = createdDate;
        this.updatedByName = updatedByName;
        this.updatedDate = updatedDate;
        this.status = status;
        this.note = note;
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
