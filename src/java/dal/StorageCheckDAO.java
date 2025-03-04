package dal;

import model.StorageCheckInfor;
import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
/**
 *
 * @author ANNT1
 */
public class StorageCheckDAO {
    public SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    
    public List<StorageCheckInfor> getStorageCheckInfor() {
    List<StorageCheckInfor> storageChecks = new ArrayList<>();

    String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, " +
                 "a.Name AS CreatedByName, sc.CreatedDate, ua.Name AS UpdatedByName, " +
                 "sc.UpdatedDate, sc.Status, sc.Note " +
                 "FROM StorageCheck sc " +
                 "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID " +
                 "JOIN Account a ON sc.CreatedBy = a.AccountID " +
                 "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID"; // UpdatedBy có thể NULL

    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            String createdDate = (rs.getTimestamp("CreatedDate") != null) ? 
                                 dateFormat.format(rs.getTimestamp("CreatedDate")) : null;
            String updatedDate = (rs.getTimestamp("UpdatedDate") != null) ? 
                                 dateFormat.format(rs.getTimestamp("UpdatedDate")) : null;

            storageChecks.add(new StorageCheckInfor(
                rs.getInt("StorageCheckID"),
                rs.getString("BinID"),
                rs.getString("BinName"),
                rs.getString("CreatedByName"),
                createdDate,
                rs.getString("UpdatedByName"),
                updatedDate,
                rs.getString("Status"),
                rs.getString("Note")
            ));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return storageChecks;
}

    public static void main(String[] args) {
    StorageCheckDAO dao = new StorageCheckDAO();
    List<StorageCheckInfor> storageChecks = dao.getStorageCheckInfor();

    System.out.println("=== KẾT QUẢ TRUY VẤN ===");
    for (StorageCheckInfor item : storageChecks) {
        System.out.println("📌 ID: " + item.getStorageCheckID());
        System.out.println("📌 Bin Name: " + item.getBinName());
        System.out.println("📌 Created By: " + item.getCreatedByName());
        System.out.println("📌 Created Date: " + item.getCreatedDate());
        System.out.println("📌 Updated By: " + item.getUpdatedByName());
        System.out.println("📌 Updated Date: " + item.getUpdatedDate());
        System.out.println("📌 Status: " + item.getStatus());
        System.out.println("📌 Note: " + item.getNote());
        System.out.println("-------------------------");
    }
}

}
