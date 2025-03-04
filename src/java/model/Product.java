/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Product extends Audit {

    private String productID;
    private String categoryID;
    private String productName;
    private String description;
    private String status;

    private Category category;
    private List<ProductVariant> productVariants;

    public Product() {
    }

    public Product(String productID, String categoryID, String productName, String description, String status, List<ProductVariant> productVariants, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(String productID, String categoryID, String productName, String description, String status, int createdBy, Timestamp createdDate, List<ProductVariant> productVariants) {
        super(createdBy, createdDate);
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(String productID, String categoryID, String productName, String description, String status, List<ProductVariant> productVariants, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(String productID, String categoryID, String productName, String description, String status, Category category, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.category = category;
    }

    public Product(String productID, String categoryID, String productName, String description, String status, List<ProductVariant> productVariants) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
        this.productVariants = productVariants;
    }

    public Product(String productID, String categoryID, String productName, String description, String status, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.status = status;
    }

    public Product(String productName) {
        this.productName = productName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ProductVariant> getProductVariants() {
        return productVariants;
    }

    public void setProductVariants(List<ProductVariant> productVariants) {
        this.productVariants = productVariants;
    }
}
