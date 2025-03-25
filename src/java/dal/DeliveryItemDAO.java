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
import model.DeliveryItem;
import model.ProductVariant;
import model.PurchaseItem;
import model.Size;

/**
 *
 * @author Admin
 */
public class DeliveryItemDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<DeliveryItem> getDeliveryItemByDO(String doId) {
        List<DeliveryItem> list = new ArrayList<>();
        String query = "select di.*, pv.PVName, pv.Color, pv.Size from delivery_item di\n"
                + "left join ProductVariant pv on di.ProductVariantID = pv.ProductVariantID\n"
                + "where di.DO_ID = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, doId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                DeliveryItem o = new DeliveryItem(rs.getInt(1),
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
}
