package dal;

import model.*;
import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import utils.Helpers;

public class CategoryDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static final String SELECT_ALL = "SELECT c.CategoryID, c.CategoryName, c.Description, "
            + "a1.Username AS CreatedByName, c.CreatedDate, "
            + "a2.Username AS UpdatedByName, c.UpdatedDate "
            + "FROM Category c "
            + "LEFT JOIN Account a1 ON c.CreatedBy = a1.AccountID "
            + "LEFT JOIN Account a2 ON c.UpdatedBy = a2.AccountID where c.Status='Active' ";

    private static final String SELECT_BY_ID = "SELECT * FROM Category WHERE CategoryID=?";

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL); ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getString("CategoryID"));
                category.setCategoryName(resultSet.getString("CategoryName"));
                category.setDescription(resultSet.getString("Description"));
                category.setCreatedByName(resultSet.getString("CreatedByName"));
                category.setCreatedDate(resultSet.getTimestamp("CreatedDate"));
                category.setUpdatedByName(resultSet.getString("UpdatedByName"));
                category.setUpdatedDate(resultSet.getTimestamp("UpdatedDate"));

                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Category> getCategoryWithAllStatus() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category order by CreatedDate desc";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(query);//nem cau lenh query sang sql
            rs = ps.executeQuery();//chay cau lenh query, nhan ket qua tra ve
            while (rs.next()) {
                Category o = new Category(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(5),
                        rs.getTimestamp(6),
                        rs.getInt(7),
                        rs.getTimestamp(8),
                        rs.getString(4));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertCategory(Category c) {
        String sql = "INSERT INTO Category ([CategoryID],[CategoryName],[Description],[Status],[CreatedBy],[CreatedDate]) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getCategoryId());
            ps.setString(2, c.getCategoryName());
            ps.setString(3, c.getDescription());
            ps.setString(4, c.getStatus());
            ps.setInt(5, c.getCreatedBy());
            ps.setTimestamp(6, c.getCreatedDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCategory(Category c) {
        String sql = "Update Category set \n"
                + "      [CategoryName] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[UpdatedBy] = ?\n"
                + "      ,[UpdatedDate] = ? where [CategoryID] = ?";

        try {
            conn = DBContext.getConnection(); //mo ket noi toi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, c.getCategoryName());
            ps.setString(2, c.getDescription());
            ps.setString(3, c.getStatus());
            ps.setInt(4, c.getUpdatedBy());
            ps.setTimestamp(5, c.getUpdatedDate());
            ps.setString(6, c.getCategoryId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Category getCategoryById(String id) {
        Category category = null;
        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {

            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                category = new Category(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getInt(5),
                        resultSet.getTimestamp(6),
                        resultSet.getInt(7),
                        resultSet.getTimestamp(8),
                        resultSet.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public String getMaxCategoryID() {
        String sql = "SELECT CategoryID FROM Category";
        String prefixId = "CAT";
        return Helpers.getMaxID(sql, prefixId);
    }
}
