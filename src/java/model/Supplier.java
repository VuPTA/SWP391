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
public class Supplier extends Audit{
    private String supplierID;
    private String supplierName;
    private String address;
    private String phone;
    private String taxNumber;
    private String status;

    public Supplier() {
    }

    public Supplier(String supplierID,String supplierName) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
    }

    public Supplier(String supplierID, String supplierName, String address, String phone, String taxNumber, String status, int createdBy, Timestamp createdDate, Integer updatedBy, Timestamp updatedDate) {
        super(createdBy, createdDate, updatedBy, updatedDate);
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.address = address;
        this.phone = phone;
        this.taxNumber = taxNumber;
        this.status = status;
    }

    public Supplier(String supplierID, String supplierName, String address, String phone, String taxNumber, String status, int createdBy, Timestamp createdDate) {
        super(createdBy, createdDate);
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.address = address;
        this.phone = phone;
        this.taxNumber = taxNumber;
        this.status = status;
    }

    public Supplier(String supplierID, String supplierName, String address, String phone, String taxNumber, String status, Integer updatedBy, Timestamp updatedDate) {
        super(updatedBy, updatedDate);
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.address = address;
        this.phone = phone;
        this.taxNumber = taxNumber;
        this.status = status;
    }

    public String getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(String supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTaxNumber() {
        return taxNumber;
    }

    public void setTaxNumber(String taxNumber) {
        this.taxNumber = taxNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
