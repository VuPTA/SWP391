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
import model.StorageBin;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class StorageBinDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<StorageBin> getStorageBins() {
        List<StorageBin> list = new ArrayList<>();
        String query = "select * from StorageBin order by CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                StorageBin o = new StorageBin(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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

    public StorageBin getStorageBinById(String id) {
        String query = "select * from StorageBin a where a.StorageBinID = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                StorageBin o = new StorageBin(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getInt(9),
                        rs.getTimestamp(10));
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getMaxStorageBinID() {
        String sql = "SELECT StorageBinID FROM StorageBin";
        String prefixId = "BIN";
        return Helpers.getMaxID(sql, prefixId);
    }

    public void insertBin(StorageBin bin) {
        String sql = "INSERT INTO StorageBin ([StorageBinID]\n"
                + "      ,[WarehouseID]\n"
                + "      ,[BinName]\n"
                + "      ,[BinType]\n"
                + "      ,[Capacity]\n"
                + "      ,[Status]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, bin.getStorageBinID());
            ps.setString(2, bin.getWarehouseID());
            ps.setString(3, bin.getBinName());
            ps.setString(4, bin.getBinType());
            ps.setInt(5, bin.getCapacity());
            ps.setString(6, bin.getStatus());
            ps.setInt(7, bin.getCreatedBy());
            ps.setTimestamp(8, bin.getCreatedDate());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBin(StorageBin bin) {
        String sql = "Update StorageBin set \n"
                + "      [WarehouseID] = ?\n"
                + "      ,[BinName] = ?\n"
                + "      ,[BinType] = ?\n"
                + "      ,[Capacity] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[UpdatedBy] = ?\n"
                + "      ,[UpdatedDate] = ? where [StorageBinID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);

            ps.setString(1, bin.getWarehouseID());
            ps.setString(2, bin.getBinName());
            ps.setString(3, bin.getBinType());
            ps.setInt(4, bin.getCapacity());
            ps.setString(5, bin.getStatus());
            ps.setInt(6, bin.getUpdatedBy());
            ps.setTimestamp(7, bin.getUpdatedDate());
            ps.setString(8, bin.getStorageBinID());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
