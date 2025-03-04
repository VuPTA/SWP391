package model;

import java.sql.Timestamp;

public class Category {
    private String categoryId;
    private String categoryName;
    private String description;
    private int createdBy; // ID người tạo
    private String createdByName; // Tên người tạo
    private Timestamp createdDate;
    private int updatedBy; // ID người cập nhật
    private String updatedByName; // Tên người cập nhật
    private Timestamp updatedDate;
    private String status;

    public String getStatus() {
        return status;
    }

    public Category(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Category(String categoryId, String categoryName, String description,
                    int createdBy, String createdByName, Timestamp createdDate,
                    int updatedBy, String updatedByName, Timestamp updatedDate) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.createdBy = createdBy;
        this.createdByName = createdByName;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.updatedByName = updatedByName;
        this.updatedDate = updatedDate;
    }

    public Category() {
    }

    // Constructor cho CREATE / UPDATE (không cần tên người dùng)
    public Category(String categoryId, String categoryName, String description,
                    int createdBy, Timestamp createdDate, int updatedBy, Timestamp updatedDate) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
    }

    public Category(String categoryId, String categoryName, String description, int updatedBy) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.updatedBy = updatedBy;
    }

    // Getter & Setter (Giữ nguyên cả ID và Name)
    public String getCategoryId() { return categoryId; }
    public void setCategoryId(String categoryId) { this.categoryId = categoryId; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }

    public String getCreatedByName() { return createdByName; }
    public void setCreatedByName(String createdByName) { this.createdByName = createdByName; }

    public Timestamp getCreatedDate() { return createdDate; }
    public void setCreatedDate(Timestamp createdDate) { this.createdDate = createdDate; }

    public int getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(int updatedBy) { this.updatedBy = updatedBy; }

    public String getUpdatedByName() { return updatedByName; }
    public void setUpdatedByName(String updatedByName) { this.updatedByName = updatedByName; }

    public Timestamp getUpdatedDate() { return updatedDate; }
    public void setUpdatedDate(Timestamp updatedDate) { this.updatedDate = updatedDate; }
}
