package dal;

import model.*;
import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO {
    private static final String SELECT_ALL = "SELECT c.CategoryID, c.CategoryName, c.Description, " +
            "a1.Username AS CreatedByName, c.CreatedDate, " +
            "a2.Username AS UpdatedByName, c.UpdatedDate " +
            "FROM Category c " +
            "LEFT JOIN Account a1 ON c.CreatedBy = a1.AccountID " +
            "LEFT JOIN Account a2 ON c.UpdatedBy = a2.AccountID where c.Status='Active' " ;

    private static final String INSERT = "INSERT INTO Category (CategoryName, Description, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, CategoryID, Status) " +
            "VALUES (?, ?, ?, GETDATE(), ?, GETDATE(), ?, 'Active')";

    private static final String UPDATE = "UPDATE Category SET CategoryName=?, Description=?, UpdatedBy=?, UpdatedDate=GETDATE() WHERE CategoryID=?";

    private static final String DELETE = "UPDATE Category SET Status='InActive' WHERE CategoryID=?";

    private static final String SELECT_BY_ID = "SELECT * FROM Category WHERE CategoryID=?";

     public static void main(String[] args) throws ClassNotFoundException {
       CategoryDAO d = new CategoryDAO();
         System.out.println(d.getCategoryById(2).getCategoryName());
    }
    
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("CategoryID"));
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

    public void addCategory(Category category) {
        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {

            preparedStatement.setString(1, category.getCategoryName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.setInt(3, category.getCreatedBy());
            preparedStatement.setInt(4, category.getUpdatedBy());
            preparedStatement.setInt(5, category.getCategoryId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCategory(Category category) {
        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {

            preparedStatement.setString(1, category.getCategoryName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.setInt(3, category.getUpdatedBy());
            preparedStatement.setInt(4, category.getCategoryId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCategory(int id) {
        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE)) {

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Category getCategoryById(int id) {
        Category category = null;
        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                category = new Category();
                category.setCategoryId(resultSet.getInt("CategoryID"));
                category.setCategoryName(resultSet.getString("CategoryName"));
                category.setDescription(resultSet.getString("Description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }
}
