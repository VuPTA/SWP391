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
import model.Color;
import model.ProductVariant;
import model.PurchaseItem;
import model.PurchaseOrder;
import model.Size;

/**
 *
 * @author Admin
 */
public class PurchaseItemDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<PurchaseItem> getPurchaseItemsByPO(String poId) {
        List<PurchaseItem> list = new ArrayList<>();
        String query = "select p.*, pv.PVName, pv.Size, pv.Color from purchase_Item p\n"
                + "left join ProductVariant pv on p.ProductVariantID = pv.ProductVariantID where PO_ID = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, poId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseItem o = new PurchaseItem(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5),
                        new ProductVariant(rs.getString(10),new Color(rs.getInt(11)), new Size(rs.getInt(12))),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getInt(8),
                        rs.getTimestamp(9));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<PurchaseItem> getPurchaseItemsByPOToCreateDO(String poId) {
        List<PurchaseItem> list = new ArrayList<>();
        String query = "SELECT \n"
                + "    pi.purchase_item_ID, \n"
                + "    pi.PO_ID,  \n"
                + "    pi.ProductVariantID, \n"
                + "    pi.Quantity - COALESCE(SUM(di.Quantity), 0) AS RemainingQuantity, \n"
                + "    pi.UnitPrice, pv.PVName, pv.Size, pv.Color\n"
                + "FROM purchase_item pi\n"
                + "LEFT JOIN delivery_item di \n"
                + "    ON pi.ProductVariantID = di.ProductVariantID\n"
                + "    AND EXISTS (\n"
                + "        SELECT 1 \n"
                + "        FROM delivery_orders do \n"
                + "        WHERE do.DO_ID = di.DO_ID \n"
                + "        AND do.PO_ID = pi.PO_ID\n"
                + "    )\n"
                + "	left join ProductVariant pv on pi.ProductVariantID = pv.ProductVariantID\n"
                + "WHERE pi.PO_ID = ? \n"
                + "GROUP BY \n"
                + "    pi.purchase_item_ID, pi.PO_ID, pi.ProductVariantID, pi.Quantity, pi.UnitPrice, pv.PVName, pv.Size, pv.Color\n"
                + "HAVING pi.Quantity - COALESCE(SUM(di.Quantity), 0) > 0; ";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, poId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseItem o = new PurchaseItem(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5),
                        new ProductVariant(rs.getString(6), new Color(rs.getInt(8)),  new Size(rs.getInt(7))));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
