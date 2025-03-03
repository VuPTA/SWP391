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
import model.StorageBin;

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
        String query = "select * from purchase_orders order by CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                PurchaseOrder o = new PurchaseOrder(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getInt(7),
                        rs.getTimestamp(8));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
