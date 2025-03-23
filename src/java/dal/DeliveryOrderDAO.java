/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.DeliveryItem;
import model.DeliveryOrder;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.Supplier;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class DeliveryOrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<DeliveryOrder> getDeliveryOrders() {
        List<DeliveryOrder> list = new ArrayList<>();
        String query = "select po.*, s.SupplierName from delivery_orders po left join Suppliers s on s.SupplierID = po.Supplier order by po.CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                DeliveryOrder o = new DeliveryOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getInt(9),
                        rs.getTimestamp(10));
                o.setSupplier(new Supplier(rs.getString(3), rs.getString("SupplierName")));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getMaxDeliveryOrderID() {
        String sql = "SELECT DO_ID FROM delivery_orders";
        String prefixId = "DO";
        return Helpers.getMaxID(sql, prefixId);
    }

    public void createDeliveryOrder(DeliveryOrder po) {
        String sql = "INSERT INTO [delivery_orders] ([DO_ID]\n"
                + "      ,[PO_ID]\n"
                + "      ,[Supplier]\n"
                + "      ,[Status]\n"
                + "      ,[Expected_date]\n"
                + "      ,[total_amount]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?,?,?,?)";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, po.getDoId());
            ps.setString(2, po.getPoId());
            ps.setString(3, po.getSupplierId());
            ps.setString(4, po.getStatus());
            ps.setDate(5, (Date) po.getExpectedDate());
            ps.setDouble(6, po.getTotalAmount());
            ps.setInt(7, po.getCreatedBy());
            ps.setTimestamp(8, po.getCreatedDate());
            ps.executeUpdate();

            // Chèn các sản phẩm vào purchase_order_items
            String itemSQL = "INSERT INTO [delivery_Item] ([DO_ID],[ProductVariantID]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[UnitPrice]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (DeliveryItem pi : po.getDeliveryItems()) {
                itemStmt.setString(1, po.getDoId());
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

    public DeliveryOrder getDeliveryOrderById(String id) {
        String query = "select po.*, s.SupplierName from delivery_orders po left join Suppliers s on s.SupplierID = po.Supplier where po.DO_ID =?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                DeliveryOrder o = new DeliveryOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getInt(9),
                        rs.getTimestamp(10));
                o.setSupplier(new Supplier(rs.getString(3), rs.getString("SupplierName")));
                DeliveryItemDAO pidao = new DeliveryItemDAO();
                List<DeliveryItem> pis = pidao.getDeliveryItemByDO(rs.getString(1));
                o.setDeliveryItems(pis);
                double totalAmount = 0;
                for (DeliveryItem pi : pis) {
                    totalAmount += pi.getUnitPrice() * pi.getQuantity();
                }
                o.setTotalAmount(totalAmount);
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
