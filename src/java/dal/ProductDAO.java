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
import model.Category;
import model.Product;
import model.ProductVariant;
import model.PurchaseItem;
import model.PurchaseOrder;
import utils.Helpers;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ProductVariant> getProductVariants() {
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

    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        String query = "select\n"
                + "p.*, c.CategoryName\n"
                + "from Product p\n"
                + "left join Category c on p.CategoryID = c.CategoryID order by p.CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product o = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        new Category(rs.getString(10)),
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

    public String getMaxProductID() {
        String sql = "SELECT [ProductID] FROM [Product]";
        String prefixId = "PROD";
        return Helpers.getMaxID(sql, prefixId);
    }

    public List<String> generateProductVariantNewID(int numberOfIds) {
        List<String> ids = new ArrayList<>();
        String sql = "SELECT [ProductVariantID] FROM [ProductVariant]";
        String prefixId = "VAR";
        try {
            try (PreparedStatement stmt = DBContext.getConnection().prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                int maxNumber = 0;
                while (rs.next()) {
                    String id = rs.getString(1);
                    if (id != null) {
                        int number = Helpers.extractNumber(id, prefixId + "(\\d+)");
                        if (number > maxNumber) {
                            maxNumber = number;
                        }
                    }
                }
                for (int i = 0; i < numberOfIds; i++) {
                    ids.add(String.format(prefixId + "%03d", maxNumber + 1));
                    maxNumber += 1;
                }
                return ids;
            }
        } catch (Exception e) {
            System.out.println("Error function generateProductVariantNewID: " + e.getMessage());
        }
        return null;
    }

    public void createProduct(Product po) {
        String sql = "INSERT INTO [Product] ([ProductID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[Status]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?,?,?)";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, po.getProductID());
            ps.setString(2, po.getCategoryID());
            ps.setString(3, po.getProductName());
            ps.setString(4, po.getDescription());
            ps.setString(5, po.getStatus());
            ps.setInt(6, po.getCreatedBy());
            ps.setTimestamp(7, po.getCreatedDate());
            ps.executeUpdate();

            // inser product variant
            String itemSQL = "INSERT INTO [ProductVariant] ([ProductVariantID]\n"
                    + "      ,[ProductID]\n"
                    + "      ,[PVName]\n"
                    + "      ,[Image]\n"
                    + "      ,[Color]\n"
                    + "      ,[Size]\n"
                    + "      ,[Price]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (ProductVariant pi : po.getProductVariants()) {
                itemStmt.setString(1, pi.getProductVariantID());
                itemStmt.setString(2, pi.getProductID());
                itemStmt.setString(3, pi.getPvName());
                itemStmt.setString(4, pi.getImage());
                itemStmt.setString(5, pi.getColor());
                itemStmt.setString(6, pi.getSize());
                itemStmt.setDouble(7, pi.getPrice());
                itemStmt.setInt(8, pi.getQuantity());
                itemStmt.setInt(9, pi.getCreatedBy());
                itemStmt.setTimestamp(10, pi.getCreatedDate());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(String id) {
        String query = "select\n"
                + "p.*\n"
                + "from Product p\n"
                + "where p.ProductID = ?";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, id);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Product o = new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6), rs.getTimestamp(7), getProductVariantsByProductId(rs.getString(1)));
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<ProductVariant> getProductVariantsByProductId(String productId) {
        List<ProductVariant> list = new ArrayList<>();
        String query = "select pv.ProductVariantID, pv.PVName, pv.Image, pv.Color, pv.Size,pv.Price,\n"
                + "pv.Quantity from ProductVariant pv\n"
                + "where pv.ProductID = ?\n";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            ps.setString(1, productId);
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                ProductVariant o = new ProductVariant(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateProduct(Product po) {
        String sql = "update [Product] \n"
                + "      set [CategoryID] = ?\n"
                + "      ,[ProductName]= ?\n"
                + "      ,[Description]= ?\n"
                + "      ,[Status]= ?\n"
                + "      ,[UpdatedBy]= ?\n"
                + "      ,[UpdatedDate]= ? where [ProductID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, po.getCategoryID());
            ps.setString(2, po.getProductName());
            ps.setString(3, po.getDescription());
            ps.setString(4, po.getStatus());
            ps.setInt(5, po.getUpdatedBy());
            ps.setTimestamp(6, po.getUpdatedDate());
            ps.setString(7, po.getProductID());
            ps.executeUpdate();

            //delete variants
            String sqlDelete = "delete from [ProductVariant] where [ProductID] = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(sqlDelete);
            deleteStmt.setString(1, po.getProductID());
            deleteStmt.executeUpdate();

            // inser product variant
            String itemSQL = "INSERT INTO [ProductVariant] ([ProductVariantID]\n"
                    + "      ,[ProductID]\n"
                    + "      ,[PVName]\n"
                    + "      ,[Image]\n"
                    + "      ,[Color]\n"
                    + "      ,[Size]\n"
                    + "      ,[Price]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedDate],[UpdatedBy],[UpdatedDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(itemSQL);
            for (ProductVariant pi : po.getProductVariants()) {
                itemStmt.setString(1, pi.getProductVariantID());
                itemStmt.setString(2, pi.getProductID());
                itemStmt.setString(3, pi.getPvName());
                itemStmt.setString(4, pi.getImage());
                itemStmt.setString(5, pi.getColor());
                itemStmt.setString(6, pi.getSize());
                itemStmt.setDouble(7, pi.getPrice());
                itemStmt.setInt(8, pi.getQuantity());
                itemStmt.setInt(9, pi.getCreatedBy());
                itemStmt.setTimestamp(10, pi.getCreatedDate());
                itemStmt.setInt(11, pi.getUpdatedBy());
                itemStmt.setTimestamp(12, pi.getUpdatedDate());

                itemStmt.addBatch();
            }

            itemStmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public List<ProductVariant> getProductVariantsInBin(String binId) {
//        List<ProductVariant> list = new ArrayList<>();
//        String query = "select pv.ProductVariantID, pv.PVName, pv.Image, cp.ColorName, sp.SizeName, bp.Quantity from StorageBin sb\n"
//                + "left join BinProduct bp on sb.StorageBinID = bp.StorageBinID\n"
//                + "left join ProductVariant pv on pv.ProductVariantID = bp.ProductVariantID\n"
//                + "left join ColorProduct cp on cp.Color_ID = pv.Color_ID\n"
//                + "left join SizeProduct sp on sp.Size_ID = pv.Size_ID\n"
//                + "where sb.StorageBinID = ? and bp.Quantity > 0";
//        try {
//            conn = DBContext.getConnection(); //mo ket noi toi sql
//            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
//            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
//            while (rs.next()) {
//                ProductVariant o = new ProductVariant(rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getDouble(6),
//                        rs.getInt(7),
//                        new Product(rs.getString(8)),
//                        new Category(rs.getString(9)));
//                list.add(o);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
}
