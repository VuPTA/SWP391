package dal;

import model.*;
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

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, "
                + "a.Name AS CreatedByName, sc.CreatedDate, ua.Name AS UpdatedByName, "
                + "sc.UpdatedDate, sc.Status, sc.Note, sc.CheckCounter " // Lấy thêm CheckCounter
                + "FROM StorageCheck sc "
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID "
                + "JOIN Account a ON sc.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID"; // UpdatedBy có thể NULL

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String createdDate = (rs.getTimestamp("CreatedDate") != null)
                        ? dateFormat.format(rs.getTimestamp("CreatedDate")) : null;
                String updatedDate = (rs.getTimestamp("UpdatedDate") != null)
                        ? dateFormat.format(rs.getTimestamp("UpdatedDate")) : null;

                storageChecks.add(new StorageCheckInfor(
                        rs.getInt("StorageCheckID"),
                        rs.getString("BinID"),
                        rs.getString("BinName"),
                        rs.getString("CreatedByName"),
                        createdDate,
                        rs.getString("UpdatedByName"),
                        updatedDate,
                        rs.getString("Status"),
                        rs.getString("Note"),
                        rs.getInt("CheckCounter")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return storageChecks;
    }

    public List<StorageCheckDetail> getStorageCheckDetailsByStorageCheckID(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT scd.StorageCheckDetailID, scd.StorageCheckID, scd.BinProductID, "
                + "scd.ProductVariantID, pv.PVName, pv.Size, pv.Color, "
                + "scd.ActualQuantity, scd.ExpectedQuantity, scd.CheckPeriod, scd.Note, "
                + "a.Name AS CreatedByName, scd.CreatedDate, ua.Name AS UpdatedByName, scd.UpdatedDate "
                + "FROM StorageCheckDetail scd "
                + "JOIN ProductVariant pv ON scd.ProductVariantID = pv.ProductVariantID "
                + "LEFT JOIN Account a ON scd.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON scd.UpdatedBy = ua.AccountID "
                + "WHERE scd.StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, storageCheckID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String createdDate = (rs.getTimestamp("CreatedDate") != null)
                            ? dateFormat.format(rs.getTimestamp("CreatedDate")) : null;
                    String updatedDate = (rs.getTimestamp("UpdatedDate") != null)
                            ? dateFormat.format(rs.getTimestamp("UpdatedDate")) : null;
                    details.add(new StorageCheckDetail(
                            rs.getInt("StorageCheckDetailID"),
                            rs.getInt("StorageCheckID"),
                            rs.getInt("BinProductID"),
                            rs.getString("ProductVariantID"),
                            rs.getString("PVName"),
                            rs.getInt("Size"), // Thêm Size
                            rs.getString("Color"), // Thêm Color
                            rs.getInt("ActualQuantity"),
                            rs.getInt("ExpectedQuantity"),
                            rs.getInt("CheckPeriod"),
                            rs.getString("Note"),
                            rs.getString("CreatedByName"),
                            createdDate,
                            rs.getString("UpdatedByName"),
                            updatedDate
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }

    public List<StorageCheckDetail> getStorageCheckDetailsPending(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT pv.PVName, pv.Size, pv.Color, bp.Quantity "
                + "FROM StorageCheck sc "
                + "JOIN BinProduct bp ON sc.StorageBinID = bp.StorageBinID "
                + "JOIN ProductVariant pv ON bp.ProductVariantID = pv.ProductVariantID "
                + "WHERE sc.StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, storageCheckID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    details.add(new StorageCheckDetail(
                            rs.getString("PVName"),
                            rs.getInt("Size"),
                            rs.getString("Color"),
                            rs.getInt("Quantity")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
    
    public List<StorageCheckInfor> getStorageBinInfo() {
    List<StorageCheckInfor> storageBins = new ArrayList<>();
    String sql = "SELECT w.WarehouseID, sb.StorageBinID AS BinID, w.WarehouseName, "
               + "sb.BinName, sb.BinType, sb.Capacity, COALESCE(SUM(bp.Quantity), 0) AS TotalQuantity, sb.Status "
               + "FROM StorageBin sb "
               + "JOIN WareHouse w ON sb.WarehouseID = w.WarehouseID "
               + "LEFT JOIN BinProduct bp ON sb.StorageBinID = bp.StorageBinID "
               + "GROUP BY w.WarehouseID, sb.StorageBinID, w.WarehouseName, sb.BinName, sb.BinType, sb.Capacity, sb.Status;";

    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            storageBins.add(new StorageCheckInfor(
                rs.getString("WarehouseID"),
                rs.getString("BinID"),
                rs.getString("WarehouseName"),
                rs.getString("BinName"),
                rs.getString("BinType"),
                rs.getInt("Capacity"),
                rs.getInt("TotalQuantity"), // Tổng số lượng sản phẩm trong bin
                rs.getString("Status")
            ));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return storageBins;
}

     // Hàm tạo Storage Check với BinID, CheckCounter=0, Status='Pending', CreatedBy=2
    public boolean createStorageCheck(String binID, int createdBy) {
        String sql = "INSERT INTO StorageCheck (BinID, CheckCounter, Status, CreatedBy) VALUES (?, 0, 'Pending', ?)";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, binID);
            ps.setInt(2, createdBy);
            
            return ps.executeUpdate() > 0; // Trả về true nếu thêm thành công
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm cập nhật trạng thái Bin thành 'Checking' dựa trên BinID
    public boolean updateBinStatus(String binID, String status) {
        String sql = "UPDATE StorageBin SET Status = ? WHERE StorageBinID = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, status);
            ps.setString(2, binID);
            
            return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateStorageCheckDetail(StorageCheckDetail detail) {
        String sql = "UPDATE StorageCheckDetail SET ActualQuantity = ?, ExpectedQuantity = ?, Note = ? WHERE StorageCheckDetailID = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, detail.getActualQuantity());
            ps.setInt(2, detail.getExpectedQuantity());
            ps.setString(3, detail.getNote());
            ps.setInt(4, detail.getStorageCheckDetailID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
    StorageCheckDAO dao = new StorageCheckDAO();
    List<StorageCheckInfor> storageChecks = dao.getStorageBinInfo();

    // Kiểm tra nếu danh sách rỗng hoặc có dữ liệu
    if (storageChecks.isEmpty()) {
        System.out.println("⚠ Không có dữ liệu nào được truy xuất.");
    } else {
        System.out.println("=== KẾT QUẢ TRUY VẤN ===");
        for (StorageCheckInfor item : storageChecks) {
            System.out.println("🔹 ID: " + item.getStorageBinID());
            System.out.println("🏭 Warehouse Name: " + item.getWarehouseName());
            System.out.println("📦 Bin Name: " + item.getBinName());
            System.out.println("🔢 Bin Type: " + item.getBinType());
            System.out.println("📊 Capacity: " + item.getCapacity());
            System.out.println("📦 Total Quantity: " + item.getTotalQuantity());
            System.out.println("⚡ Status: " + item.getStatus());
            System.out.println("----------------------------");
        }
    }
}


}
