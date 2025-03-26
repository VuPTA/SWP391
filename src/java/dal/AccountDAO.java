package dal;

import model.Account;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {

    public static void main(String[] args) throws ClassNotFoundException {
        AccountDAO d = new AccountDAO();
        System.out.println(d.isEmailExists("uchihad.saitama@gmail.com"));
        //d.addAccount(new Account(55, "aaa", "ddd", "Manager", "aaa", "Nam", "0987878787", "aaa", "Active"));
    }

    public Account login(String username, String password) {
        String sql = "SELECT AccountID, UserName, Password, RoleID, Name, Gender, Phone, Email, Status FROM Account WHERE UserName=? AND Password=?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("AccountID");
                String role = mapRole(rs.getInt("RoleID"));
                String name = rs.getString("Name");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String status = rs.getString("Status");
                return new Account(id, username, password, role, name, gender, phone, email, status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String mapRole(int roleId) {
        switch (roleId) {
            case 1:
                return "Admin";
            case 2:
                return "Manager";
            case 3:
                return "Staff";
            default:
                return "Unknown";
        }
    }

    private int mapRole2(String role) {
        switch (role) {
            case "Admin":
                return 1;
            case "Manager":
                return 2;
            case "Staff":
                return 3;
            default:
                return 0;
        }
    }

    public boolean updateAccount(int accountId, String password, String role, String name, String gender, String phone, String email, String status) {
        String sql = "UPDATE accounts SET password = ?, role = ?, name = ?, gender = ?, phone = ?, email = ?, status = ? WHERE account_id = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, password);
            stmt.setString(2, role);
            stmt.setString(3, name);
            stmt.setString(4, gender);
            stmt.setString(5, phone);
            stmt.setString(6, email);
            stmt.setString(7, status);
            stmt.setInt(8, accountId);

            return stmt.executeUpdate() > 0; // Trả về true nếu có dòng bị ảnh hưởng (cập nhật thành công)
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProfile(int accountId, String newName, String newPhone, String newEmail, String newGender) {
        String sql = "UPDATE Account SET Name=?, Phone=?, Email=?, Gender=? WHERE AccountID=?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newName);
            ps.setString(2, newPhone);
            ps.setString(3, newEmail);
            ps.setString(4, newGender);
            ps.setInt(5, accountId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Account getAccountById(int accountId) {

        String sql = "SELECT * FROM Account WHERE AccountID=?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(
                        rs.getInt("AccountID"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        mapRole(rs.getInt("RoleID")),
                        rs.getString("Name"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getString("Email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE UserName = ?";

        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccountId(rs.getInt("AccountID"));
                account.setName(rs.getString("Name"));
                account.setGender(rs.getString("Gender"));
                account.setPhone(rs.getString("Phone"));
                account.setEmail(rs.getString("Email"));
                account.setUsername(rs.getString("UserName"));
                account.setPassword(rs.getString("Password")); // Cần hash password khi lưu
                account.setRole(mapRole(rs.getInt("RoleID")));
                account.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return account;
    }

    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                accounts.add(new Account(
                        rs.getInt("AccountID"),
                        rs.getString("UserName"),
                        rs.getString("Password"),
                        mapRole(rs.getInt("RoleID")),
                        rs.getString("Name"),
                        rs.getString("Gender"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public boolean updateRole(int accountId, int newRoleId) {
        String sql = "UPDATE Account SET RoleID=? WHERE AccountID=?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, newRoleId);
            ps.setInt(2, accountId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStatus(int accountId, String newStatus) {
        String sql = "UPDATE Account SET Status = ? WHERE accountId = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, accountId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addAccount(Account account) {
        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Account (UserName, Password, RoleID, Status, Name, Gender, Phone, Email) VALUES (?, ?, ?, ?,?,?,?,?)")) {
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword()); // Cần mã hóa password
            preparedStatement.setInt(3, mapRole2(account.getRole()));
            preparedStatement.setString(4, "Active");
            preparedStatement.setString(5, account.getName());
            preparedStatement.setString(6, account.getGender());
            preparedStatement.setString(7, account.getPhone());
            preparedStatement.setString(8, account.getEmail());
//            preparedStatement.setInt(9, account.getAccountId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isEmailExists(String email) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "SELECT * FROM Account WHERE Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(String email, String newPassword) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "UPDATE Account SET Password = ? WHERE Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account getAccountByEmail(String username) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE Email = ?";

        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccountId(rs.getInt("AccountID"));
                account.setName(rs.getString("Name"));
                account.setGender(rs.getString("Gender"));
                account.setPhone(rs.getString("Phone"));
                account.setEmail(rs.getString("Email"));
                account.setUsername(rs.getString("UserName"));
                account.setPassword(rs.getString("Password")); // Cần hash password khi lưu
                account.setRole(mapRole(rs.getInt("RoleID")));
                account.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return account;
    }

    public Account getAccountByPhone(String username) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE Phone = ?";

        try (Connection connection = DBContext.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                account = new Account();
                account.setAccountId(rs.getInt("AccountID"));
                account.setName(rs.getString("Name"));
                account.setGender(rs.getString("Gender"));
                account.setPhone(rs.getString("Phone"));
                account.setEmail(rs.getString("Email"));
                account.setUsername(rs.getString("UserName"));
                account.setPassword(rs.getString("Password")); // Cần hash password khi lưu
                account.setRole(mapRole(rs.getInt("RoleID")));
                account.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return account;
    }

    public void ChangePass(String email, String newpass) {
          String sql = "UPDATE Account SET Password = ? WHERE Email = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, newpass);
            stmt.setString(2, email);
            
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Mật khẩu đã được cập nhật thành công.");
            } else {
                System.out.println("Không tìm thấy email này trong hệ thống.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
