/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.StorageBin;
import model.WareHouse;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class WareHouseDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<WareHouse> getWareHouses() {
        List<WareHouse> list = new ArrayList<>();
        String query = "select * from WareHouse order by CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                WareHouse o = new WareHouse(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertWareHouse(WareHouse c) {
        String sql = "INSERT INTO Warehouse ([WarehouseID]\n"
                + "      ,[WarehouseName]\n"
                + "      ,[Location]\n"
                + "      ,[Note]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getWarehouseID());
            ps.setString(2, c.getWarehouseName());
            ps.setString(3, c.getLocation());
            ps.setString(4, c.getNote());
            ps.setInt(5, c.getCreatedBy());
            ps.setTimestamp(6, c.getCreatedDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateWareHouse(WareHouse c) {
        String sql = "Update Warehouse set \n"
                + "     [WarehouseName] = ?\n"
                + "      ,[Location] = ?\n"
                + "      ,[Note] = ?\n"
                + "      ,[UpdatedBy] = ?\n"
                + "      ,[UpdatedDate] = ? where [WarehouseID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getWarehouseName());
            ps.setString(2, c.getLocation());
            ps.setString(3, c.getNote());
            ps.setInt(4, c.getUpdatedBy());
            ps.setTimestamp(5, c.getUpdatedDate());
            ps.setString(6, c.getWarehouseID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public WareHouse getWareHouseById(String id) {
        WareHouse wareHouse = null;
        String query = "select * from WareHouse where [WarehouseID] = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                wareHouse = new WareHouse(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wareHouse;
    }

    public String getMaxWareHouseID() {
        String sql = "SELECT WarehouseID FROM Warehouse";
        String prefixId = "WH";
        return Helpers.getMaxID(sql, prefixId);
    }
}
