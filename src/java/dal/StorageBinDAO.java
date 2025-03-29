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
import model.BinType;
import model.StorageBin;
import model.WareHouse;
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
        String query = "select sb.*, bt.Name_Type, wh.WarehouseName from StorageBin sb \n" +
"left join BinType bt on sb.BinType_ID = bt.BinType_ID \n" +
"left join Warehouse wh on wh.WarehouseID = sb.WarehouseID\n" +
"order by sb.CreatedDate desc";
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
                BinType binType = new BinType();
                binType.setName(rs.getString(11));
                o.setBinTypeObj(binType);
                o.setWareHouse(new WareHouse(rs.getString(2), rs.getString(12)));
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
                + "      ,[BinType_ID]\n"
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
                + "      ,[BinType_ID] = ?\n"
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

    public boolean isContainProduct(String binId) {
        String query = "select distinct * from StorageBin sb\n"
                + "join BinProduct bp on sb.StorageBinID = bp.StorageBinID\n"
                + "where sb.StorageBinID = ? and bp.Quantity > 0";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, binId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public List<StorageBin> getStorageBinsActive() {
        List<StorageBin> list = new ArrayList<>();
        String query = "select sb.*, bt.Name_Type, wh.WarehouseName from StorageBin sb \n" +
"left join BinType bt on sb.BinType_ID = bt.BinType_ID \n" +
"left join Warehouse wh on wh.WarehouseID = sb.WarehouseID where sb.Status = 'Active'\n" +
"order by sb.CreatedDate desc";
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
                BinType binType = new BinType();
                binType.setName(rs.getString(11));
                o.setBinTypeObj(binType);
                o.setWareHouse(new WareHouse(rs.getString(2), rs.getString(12)));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean isValidCapacity(String binId, int capacity) {
        String query = "  select sum(bp.Quantity) from StorageBin sb "
                + "left join BinProduct bp on sb.StorageBinID = bp.StorageBinID "
                + "where sb.StorageBinID = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, binId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                return !(rs.getInt(1) > capacity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
