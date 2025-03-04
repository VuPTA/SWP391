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
        String query = "select SupplierName from Suppliers";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Supplier o = new Supplier(rs.getString(1));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
