/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Account {
    private int accountId;
    private String username;
    private String password;
    private String role;
    private String name;
    private String Gender;
    private String Phone;
    private String Email;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Account(int accountId, String username, String password, String role) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Account(int accountId, String username, String password, String role, String name, String Gender, String Phone, String Email, String status) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.Gender = Gender;
        this.Phone = Phone;
        this.Email = Email;
        this.status = status;
    }

    public Account(int accountId, String username, String password, String role, String name, String Gender, String Phone, String Email) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.Gender = Gender;
        this.Phone = Phone;
        this.Email = Email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Account() {
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
