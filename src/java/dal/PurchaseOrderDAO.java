/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.StorageBin;
import model.Supplier;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class PurchaseOrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<PurchaseOrder> getPurchaseOrders() {
        List<PurchaseOrder> list = new ArrayList<>();
        String query = "select po.*, s.SupplierName from purchase_orders po left join Suppliers s on s.SupplierID = po.Supplier order by po.CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseOrder o = new PurchaseOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9));
                o.setSupplierObj(new Supplier(rs.getString(2), rs.getString("SupplierName")));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getMaxPurchaseOrderID() {
        String sql = "SELECT PO_ID FROM purchase_orders";
        String prefixId = "PO";
        return Helpers.getMaxID(sql, prefixId);
    }

    public void createPurchaseOrder(PurchaseOrder po) {
        String sql = "INSERT INTO [purchase_orders] ([PO_ID],[Supplier], [Status],[Expected_date],TOTALAMOUNT,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?,?,?)";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, po.getPoId());
            ps.setString(2, po.getSupplier());
            ps.setString(3, po.getStatus());
            ps.setDate(4, (Date) po.getExpectedDate());
            ps.setDouble(5, po.getTotalAmount());
            ps.setInt(6, po.getCreatedBy());
            ps.setTimestamp(7, po.getCreatedDate());
            ps.executeUpdate();

            // Chèn các sản phẩm vào purchase_order_items
            String itemSQL = "INSERT INTO [purchase_Item] ([PO_ID],[ProductVariantID]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[UnitPrice]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (PurchaseItem pi : po.getPurchaseItems()) {
                itemStmt.setString(1, po.getPoId());
                itemStmt.setString(2, pi.getProductVariantId());
                itemStmt.setInt(3, pi.getQuantity());
                itemStmt.setDouble(4, pi.getUnitPrice());
                itemStmt.setInt(5, pi.getCreatedBy());
                itemStmt.setTimestamp(6, pi.getCreatedDate());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public PurchaseOrder getPurchaseOrderById(String id) {
        String query = "select * from purchase_orders where PO_ID =?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseOrder o = new PurchaseOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9));

                PurchaseItemDAO pidao = new PurchaseItemDAO();
                List<PurchaseItem> pis = pidao.getPurchaseItemsByPO(rs.getString(1));
                o.setPurchaseItems(pis);
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updatePurchaseOrder(PurchaseOrder po) {
        String sql = "update [purchase_orders] set [Supplier] = ?, [Expected_date] = ?,TOTALAMOUNT=?,[UpdatedBy] = ?\n"
                + "      ,[UpdatedDate] = ? where [PO_ID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);

            ps.setString(1, po.getSupplier());
            ps.setDate(2, (Date) po.getExpectedDate());
            ps.setDouble(3, po.getTotalAmount());
            ps.setInt(4, po.getUpdatedBy());
            ps.setTimestamp(5, po.getUpdatedDate());
            ps.setString(6, po.getPoId());
            ps.executeUpdate();

            //delete all old purchase item 
            String sqlDeletePI = "delete from purchase_Item where [PO_ID] = ?";
            PreparedStatement deletePIStmt = conn.prepareStatement(sqlDeletePI);
            deletePIStmt.setString(1, po.getPoId());
            deletePIStmt.executeUpdate();

            //insert purchase item
            // Chèn các sản phẩm vào purchase_order_items
            String itemSQL = "insert into [purchase_Item] ([PO_ID],[ProductVariantID]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[UnitPrice]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedDate],[UpdatedBy]\n"
                    + "      ,[UpdatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (PurchaseItem pi : po.getPurchaseItems()) {
                itemStmt.setString(1, po.getPoId());
                itemStmt.setString(2, pi.getProductVariantId());
                itemStmt.setInt(3, pi.getQuantity());
                itemStmt.setDouble(4, pi.getUnitPrice());
                itemStmt.setInt(5, po.getCreatedBy());
                itemStmt.setTimestamp(6, po.getCreatedDate());
                itemStmt.setInt(7, pi.getUpdatedBy());
                itemStmt.setTimestamp(8, pi.getUpdatedDate());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<PurchaseOrder> getPOsDropdownToCreateDO() {
        List<PurchaseOrder> list = new ArrayList<>();
        String query = "select po.*, s.SupplierName from purchase_orders po left join Suppliers s on s.SupplierID = po.Supplier where po.Status != 'Received' order by po.CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseOrder o = new PurchaseOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9));
                o.setSupplierObj(new Supplier(rs.getString(2), rs.getString("SupplierName")));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public PurchaseOrder getPurchaseOrderToCreateDO(String id) {
        String query = "select po.*, s.SupplierName from purchase_orders po left join Suppliers s on s.SupplierID = po.Supplier where po.PO_ID =?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseOrder o = new PurchaseOrder(rs.getString(1),
                        rs.getDate(4),
                        new Supplier(rs.getString(2), 
                                rs.getString("SupplierName")));
                o.setStatus(rs.getString("Status"));
                PurchaseItemDAO pidao = new PurchaseItemDAO();
                List<PurchaseItem> pis = pidao.getPurchaseItemsByPOToCreateDO(rs.getString(1));
                double totalAmount = 0;
                for (PurchaseItem pi : pis) {
                    totalAmount += pi.getUnitPrice() * pi.getQuantity();
                }
                o.setPurchaseItems(pis);
                o.setTotalAmount(totalAmount);
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void updateStatusPurchaseOrder(PurchaseOrder po) {
        String sql = "update [purchase_orders] set Status = ? where [PO_ID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, po.getStatus());
            ps.setString(2, po.getPoId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
