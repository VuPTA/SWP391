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

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, \n"
                + "       a.Name AS CreatedByName, sc.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, sc.UpdatedDate, \n"
                + "       sc.Status, sc.Note, sc.CheckCounter \n"
                + "FROM StorageCheck sc\n"
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID\n"
                + "JOIN Account a ON sc.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID\n"
                + "WHERE sc.Status <> 'Deactivate';";

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

    public List<StorageCheckInfor> getDeStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, "
                + "a.Name AS CreatedByName, sc.CreatedDate, ua.Name AS UpdatedByName, "
                + "sc.UpdatedDate, sc.Status, sc.Note, sc.CheckCounter " // Lấy thêm CheckCounter
                + "FROM StorageCheck sc "
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID "
                + "JOIN Account a ON sc.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID "
                + "WHERE sc.Status = 'Deactivate'";  // Thêm điều kiện lọc trạng thái

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

    //for history
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

    //for detail
    public List<StorageCheckDetail> getStorageCheckDetailsByStorageCheckIDMaxPeriod(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT scd.StorageCheckDetailID, scd.StorageCheckID, scd.BinProductID, "
                + "scd.ProductVariantID, pv.PVName, pv.Size, pv.Color, "
                + "scd.ActualQuantity, scd.ExpectedQuantity, scd.CheckPeriod, scd.Note, "
                + "a.Name AS CreatedByName, scd.CreatedDate, ua.Name AS UpdatedByName, scd.UpdatedDate "
                + "FROM StorageCheckDetail scd "
                + "JOIN ProductVariant pv ON scd.ProductVariantID = pv.ProductVariantID "
                + "LEFT JOIN Account a ON scd.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON scd.UpdatedBy = ua.AccountID "
                + "WHERE scd.StorageCheckID = ? "
                + "AND scd.CheckPeriod = (SELECT MAX(CheckPeriod) FROM StorageCheckDetail WHERE StorageCheckID = ?)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, storageCheckID);
            ps.setInt(2, storageCheckID);
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

    //new
    public List<StorageCheckDetail> getStorageCheckDetailsPending(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT sc.StorageCheckID, bp.BinProductID, pv.ProductVariantID, "
                + "pv.PVName, pv.Size, pv.Color, bp.Quantity "
                + "FROM StorageCheck sc "
                + "JOIN BinProduct bp ON sc.StorageBinID = bp.StorageBinID "
                + "JOIN ProductVariant pv ON bp.ProductVariantID = pv.ProductVariantID "
                + "WHERE sc.StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, storageCheckID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    details.add(new StorageCheckDetail(
                            rs.getInt("StorageCheckID"), // Đổi từ StorageBinID thành StorageCheckID
                            rs.getInt("BinProductID"),
                            rs.getString("ProductVariantID"),
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

    public String getStorageBinIDByStorageCheckID(int storageCheckID) {
        String sql = "SELECT StorageBinID FROM StorageCheck WHERE StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, storageCheckID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("StorageBinID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Trả về null nếu không tìm thấy
    }

    //Danh sach để pick bin tạo Scheck mới
    public List<StorageCheckInfor> getStorageBinInfo() {
        List<StorageCheckInfor> storageBins = new ArrayList<>();
        String sql = "SELECT w.WarehouseID, sb.StorageBinID AS BinID, w.WarehouseName, "
                + "sb.BinName, sb.BinType, sb.Capacity, COALESCE(SUM(bp.Quantity), 0) AS TotalQuantity, sb.Status "
                + "FROM StorageBin sb "
                + "JOIN WareHouse w ON sb.WarehouseID = w.WarehouseID "
                + "LEFT JOIN BinProduct bp ON sb.StorageBinID = bp.StorageBinID "
                + "WHERE sb.Status <> 'Lock' "
        + "GROUP BY w.WarehouseID, sb.StorageBinID, w.WarehouseName, sb.BinName, sb.BinType, sb.Capacity, sb.Status;";


        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

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
    public boolean createStorageCheck(String binID, int createdBy, String note) {
        String sql = "INSERT INTO StorageCheck (StorageBinID, CheckCounter, Status, Note, CreatedBy, UpdatedDate) "
                + "VALUES (?, 0, 'Pending', ?, ?, NULL)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, binID);
            ps.setString(2, note);      // Chèn giá trị note vào
            ps.setInt(3, createdBy);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm cập nhật trạng thái Bin thành 'Checking' dựa trên BinID
    public boolean updateBinStatus(String binID, String status) {
        String sql = "UPDATE StorageBin SET Status = ? WHERE StorageBinID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, binID);

            return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //UpdatedBy, CheckCounter, UpdatedBy, UpdatedDate
    public boolean updateStorageCheck(int storageCheckID, StorageCheckDetail detail) {
        String sql = "UPDATE StorageCheck SET CheckCounter = ?, UpdatedBy = ?, UpdatedDate = ? WHERE StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            // Set CheckCounter
            ps.setInt(1, detail.getCheckPeriod());

            // Set UpdatedBy
            ps.setInt(2, detail.getCreatedByID());

            // Set UpdatedDate (chuyển đổi String -> Timestamp)
            Timestamp updatedTimestamp = Timestamp.valueOf(detail.getUpdatedDate());
            ps.setTimestamp(3, updatedTimestamp);

            // Set StorageCheckID
            ps.setInt(4, storageCheckID);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm cập nhật trạng thái StorageCheck theo Id
    public boolean updateStorageCheckStatus(int storageCheckID, String newStatus) {
        String sql = "UPDATE StorageCheck SET Status = ? WHERE StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newStatus);
            ps.setInt(2, storageCheckID);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void createStorageCheckDetailN(StorageCheckDetail detail) {
        String insertSQL = "INSERT INTO StorageCheckDetail (StorageCheckID, BinProductID, ProductVariantID, ActualQuantity, ExpectedQuantity, CheckPeriod, Note, CreatedBy) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement psInsert = conn.prepareStatement(insertSQL)) {

            psInsert.setInt(1, detail.getStorageCheckID());
            psInsert.setInt(2, detail.getBinProductID());
            psInsert.setString(3, detail.getProductVariantID());
            psInsert.setInt(4, detail.getActualQuantity());
            psInsert.setInt(5, detail.getExpectedQuantity());
            psInsert.setInt(6, detail.getCheckPeriod()); // Nhận từ servlet
            psInsert.setString(7, detail.getNote());
            psInsert.setInt(8, detail.getCreatedByID());

            psInsert.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //CheckPeriod tính ở hàm luôn(Ko dùng-để tham khảo)
    public void createStorageCheckDetail(StorageCheckDetail detail) {
        String getCheckPeriodSQL = "SELECT COALESCE(MAX(CheckPeriod), 0) + 1 FROM StorageCheckDetail WHERE StorageCheckID = ?";
        String insertSQL = "INSERT INTO StorageCheckDetail (StorageCheckID, BinProductID, ProductVariantID, ActualQuantity, ExpectedQuantity, CheckPeriod, Note, CreatedBy) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement psCheck = conn.prepareStatement(getCheckPeriodSQL); PreparedStatement psInsert = conn.prepareStatement(insertSQL)) {

            // Lấy giá trị CheckPeriod mới
            psCheck.setInt(1, detail.getStorageCheckID());
            ResultSet rs = psCheck.executeQuery();
            int nextCheckPeriod = 1;
            if (rs.next()) {
                nextCheckPeriod = rs.getInt(1);
            }

            // Chèn dữ liệu mới với CheckPeriod được tính
            psInsert.setInt(1, detail.getStorageCheckID());
            psInsert.setInt(2, detail.getBinProductID());
            psInsert.setString(3, detail.getProductVariantID());
            psInsert.setInt(4, detail.getActualQuantity());
            psInsert.setInt(5, detail.getExpectedQuantity());
            psInsert.setInt(6, nextCheckPeriod); // Giá trị CheckPeriod mới
            psInsert.setString(7, detail.getNote());
            psInsert.setInt(8, detail.getCreatedByID());

            psInsert.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBinProductQuantity(StorageCheckDetail detail) {
        String updateSQL = "UPDATE BinProduct SET Quantity = ? WHERE BinProductID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement psUpdate = conn.prepareStatement(updateSQL)) {

            psUpdate.setInt(1, detail.getActualQuantity()); // Cập nhật quantity bằng ActualQuantity
            psUpdate.setInt(2, detail.getBinProductID()); // Xác định BinProductID để update

            psUpdate.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int periodCheck(int storageCheckID) {
        String sql = "SELECT COALESCE(MAX(CheckPeriod), 0) + 1 FROM StorageCheckDetail WHERE StorageCheckID = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, storageCheckID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1; // Nếu có lỗi, trả về 1 (CheckPeriod bắt đầu từ 1)
    }

    //code sai giữ xem lại
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
        int testStorageCheckID = 10; // Thay số này bằng ID thực tế trong database

        List<StorageCheckDetail> details = dao.getStorageCheckDetailsPending(testStorageCheckID);

        if (details.isEmpty()) {
            System.out.println("No storage check details found for StorageCheckID: " + testStorageCheckID);
        } else {
            for (StorageCheckDetail detail : details) {
                System.out.println(detail);
            }
        }
    }
//    public static void main(String[] args) {
//        StorageCheckDAO dao = new StorageCheckDAO();
//
//        // Test tạo mới StorageCheckDetail
//        StorageCheckDetail testDetail = new StorageCheckDetail();
//        testDetail.setStorageCheckID(1);  // Giả sử có StorageCheckID = 1
//        testDetail.setBinProductID(1);    // Test với BinProductID giả định
//        testDetail.setProductVariantID("VAR001");
//        testDetail.setActualQuantity(99);
//        testDetail.setExpectedQuantity(15);
//        testDetail.setNote("Test kiểm tra lưu dữ liệu");
//        testDetail.setCreatedByID(1);  // Giả sử người tạo có ID = 1
//
//        dao.createStorageCheckDetail(testDetail);
//        // Lấy thông tin StorageCheck hiện có
//        List<StorageCheckDetail> storageChecks = dao.getStorageCheckDetailsByStorageCheckID(1);
//
//        System.out.println("✅ Đã thử chèn StorageCheckDetail mới!");
//
//        // Kiểm tra nếu danh sách rỗng hoặc có dữ liệu
//        if (storageChecks.isEmpty()) {
//            System.out.println("⚠ Không có dữ liệu nào được truy xuất.");
//        } else {
//            System.out.println("=== KẾT QUẢ TRUY VẤN ===");
//            for (StorageCheckDetail item : storageChecks) {
//                System.out.println("🔹 ID: " + item.getStorageCheckDetailID());
//                System.out.println("🏭 Warehouse Name: " + item.getCreatedBy());
//                System.out.println("📦 Bin Name: " + item.getProductVariantID());
//                System.out.println("🔢 Bin Type: " + item.getActualQuantity());
//                System.out.println("📊 Check: " + item.getCheckPeriod());
//                System.out.println("📦 Total Quantity: " + item.getPvName());
//                System.out.println("⚡ Status: " + item.getSize());
//                System.out.println("----------------------------");
//            }
//        }
//    }

}
