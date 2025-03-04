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
import model.Category;
import model.Product;
import model.ProductVariant;
import model.PurchaseOrder;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ProductVariant> getProducts() {
        List<ProductVariant> list = new ArrayList<>();
        String query = "select pv.ProductVariantID, pv.PVName, pv.Image, pv.Color, pv.Size,pv.Price,\n"
                + "pv.Quantity, p.ProductName, c.CategoryName from ProductVariant pv\n"
                + "left join Product p on pv.ProductID = p.ProductID\n"
                + "left join Category c on p.CategoryID = c.CategoryID";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                ProductVariant o = new ProductVariant(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        new Product(rs.getString(8)),
                        new Category(rs.getString(9)));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
