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
public class ProductVariant extends Audit {

    private String productVariantID;
    private String productID;
    private String pvName;
    private String image;
    private Color color;
    private Size size;
    private double price;
    private int quantity;

    private Product product;
    private Category category;

    public ProductVariant() {
    }

    public ProductVariant(String productVariantID, String productID, String pvName, String image, Color color, Size size, int quantity, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.productVariantID = productVariantID;
        this.productID = productID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
    }

    public ProductVariant(String productVariantID, String productID, String pvName, String image, Color color, Size size, int quantity,double price, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.productVariantID = productVariantID;
        this.productID = productID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }
    
    public ProductVariant(String productVariantID, String productID, String pvName, String image, Color color, Size size,double price, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.productVariantID = productVariantID;
        this.productID = productID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.price = price;
    }
    
    public ProductVariant(String productVariantID, String productID, String pvName, String image, Color color, Size size,double price, Integer updatedBy, Timestamp updatedDate) {
        super(updatedBy, updatedDate);
        this.productVariantID = productVariantID;
        this.productID = productID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.price = price;
    }

    public ProductVariant(String productVariantID, String pvName, String image, Color color, Size size, double price, int quantity, Product product, Category category) {
        this.productVariantID = productVariantID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
        this.product = product;
        this.category = category;
    }
    
    public ProductVariant(String productVariantID, String pvName, String image, Color color, Size size, double price, int quantity) {
        this.productVariantID = productVariantID;
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
    }

    public ProductVariant(String pvName, Color color, Size size) {
        this.pvName = pvName;
        this.color = color;
        this.size = size;
    }

    public ProductVariant(String pvName, String image, Color color, Size size, int quantity) {
        this.pvName = pvName;
        this.image = image;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
    }

    public String getProductVariantID() {
        return productVariantID;
    }

    public void setProductVariantID(String productVariantID) {
        this.productVariantID = productVariantID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getPvName() {
        return pvName;
    }

    public void setPvName(String pvName) {
        this.pvName = pvName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ProductVariant{" + "productVariantID=" + productVariantID + ", pvName=" + pvName + ", image=" + image + ", color=" + color + ", size=" + size + ", quantity=" + quantity + ", product=" + product + ", category=" + category + '}';
    }

}
