/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PurchaseOrder;
import model.Supplier;
import model.WareHouse;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class SupplierDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Supplier> getSuppliers() {
        List<Supplier> list = new ArrayList<>();
        String query = "select * from Suppliers where Status = 'Active'";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Supplier o = new Supplier(rs.getString(1), rs.getString(2));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Supplier> getSuppliersWithAllStatus() {
        List<Supplier> list = new ArrayList<>();
        String query = "select * from Suppliers";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Supplier o = new Supplier(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getInt(9),
                        rs.getTimestamp(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertSupplier(Supplier c) {
        String sql = "INSERT INTO Suppliers ([SupplierID]\n"
                + "      ,[SupplierName]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Tax_number]\n"
                + "      ,[Status]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getSupplierID());
            ps.setString(2, c.getSupplierName());
            ps.setString(3, c.getAddress());
            ps.setString(4, c.getPhone());
            ps.setString(5, c.getTaxNumber());
            ps.setString(6, c.getStatus());
            ps.setInt(7, c.getCreatedBy());
            ps.setTimestamp(8, c.getCreatedDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSupplier(Supplier c) {
        String sql = "Update Suppliers set \n"
                + "     [SupplierName] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Tax_number] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[UpdatedBy] = ?\n"
                + "      ,[UpdatedDate] = ? where [SupplierID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getSupplierName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getPhone());
            ps.setString(4, c.getTaxNumber());
            ps.setString(5, c.getStatus());
            ps.setInt(6, c.getUpdatedBy());
            ps.setTimestamp(7, c.getUpdatedDate());
            ps.setString(8, c.getSupplierID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Supplier getSupplierById(String id) {
        Supplier s = null;
        String query = "select * from Suppliers where [SupplierID] = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                s = new Supplier(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getInt(9),
                        rs.getTimestamp(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public boolean isDupplicatePhoneOrTax(String phone, String tax, String supplierId) {
        String query = "select * from Suppliers where (Phone = ? or Tax_number = ?) and ( ? is null or SupplierID != ?)";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, phone);
            ps.setString(2, tax);
            ps.setString(3, supplierId);
            ps.setString(4, supplierId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
               return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getMaxSupplierID() {
        String sql = "SELECT [SupplierID] FROM [Suppliers]";
        String prefixId = "SUP";
        return Helpers.getMaxID(sql, prefixId);
    }
}
