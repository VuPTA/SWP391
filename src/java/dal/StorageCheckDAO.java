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

    //
    public List<StorageCheckInfor> getStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, \n"
                + "       a.Name AS CreatedByName, sc.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, sc.UpdatedDate, \n"
                + "       sc.Status, sc.Note, sc.CheckCounter \n"
                + "FROM StorageCheck sc\n"
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID\n"
                + "JOIN Account a ON sc.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID";

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

    public List<StorageCheckInfor> getPendingStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, \n"
                + "       a.Name AS CreatedByName, sc.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, sc.UpdatedDate, \n"
                + "       sc.Status, sc.Note, sc.CheckCounter \n"
                + "FROM StorageCheck sc\n"
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID\n"
                + "JOIN Account a ON sc.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID\n"
                + "WHERE sc.Status IN ('Pending', 'Recount');";

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

    //Counted SC list
    public List<StorageCheckInfor> getCountedStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, \n"
                + "       a.Name AS CreatedByName, sc.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, sc.UpdatedDate, \n"
                + "       sc.Status, sc.Note, sc.CheckCounter \n"
                + "FROM StorageCheck sc\n"
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID\n"
                + "JOIN Account a ON sc.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID\n"
                + "WHERE sc.Status IN ('Counted');";

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

    //SC list có status != Cancel, Cleared
    public List<StorageCheckInfor> getCancelStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, \n"
                + "       a.Name AS CreatedByName, sc.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, sc.UpdatedDate, \n"
                + "       sc.Status, sc.Note, sc.CheckCounter \n"
                + "FROM StorageCheck sc\n"
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID\n"
                + "JOIN Account a ON sc.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID\n"
                + "WHERE sc.Status NOT IN ('Cancel', 'Cleared');";

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

    //Search Counted SC list
    public List<StorageCheckInfor> getCountedStorageCheckInfor(String searchType, String searchQuery) {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();
        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, "
                + "a.Name AS CreatedByName, sc.CreatedDate, "
                + "ua.Name AS UpdatedByName, sc.UpdatedDate, "
                + "sc.Status, sc.Note, sc.CheckCounter "
                + "FROM StorageCheck sc "
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID "
                + "JOIN Account a ON sc.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID "
                + "WHERE sc.Status = 'Counted' ";

        // Nếu có điều kiện tìm kiếm thì thêm vào SQL
        if (searchType != null && !searchType.isEmpty() && searchQuery != null && !searchQuery.isEmpty()) {
            sql += " AND " + searchType + " LIKE ?";
        }

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            // Nếu có điều kiện tìm kiếm, set giá trị cho tham số
            if (searchType != null && !searchType.isEmpty() && searchQuery != null && !searchQuery.isEmpty()) {
                ps.setString(1, "%" + searchQuery + "%"); // Tìm kiếm theo từ khóa
            }

            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return storageChecks;
    }

    public boolean isPendingOrRecount(int storageCheckID) {
        String sql = "SELECT COUNT(*) FROM StorageCheck WHERE StorageCheckID = ? AND Status IN ('Pending', 'Recount')";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, storageCheckID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isCounted(int storageCheckID) {
        String sql = "SELECT COUNT(*) FROM StorageCheck WHERE StorageCheckID = ? AND Status IN ('Counted')";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, storageCheckID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isNotCancelledOrCleared(int storageCheckID) {
        String sql = "SELECT COUNT(*) FROM StorageCheck WHERE StorageCheckID = ? AND Status NOT IN ('Cancel', 'Cleared')";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, storageCheckID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Nếu có ít nhất 1 kết quả, tức là không phải 'Cancel' hoặc 'Cleared'
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<StorageCheckInfor> getDeStorageCheckInfor() {
        List<StorageCheckInfor> storageChecks = new ArrayList<>();

        String sql = "SELECT sc.StorageCheckID, sb.StorageBinID AS BinID, sb.BinName, "
                + "a.Name AS CreatedByName, sc.CreatedDate, ua.Name AS UpdatedByName, "
                + "sc.UpdatedDate, sc.Status, sc.Note, sc.CheckCounter "
                + "FROM StorageCheck sc "
                + "JOIN StorageBin sb ON sc.StorageBinID = sb.StorageBinID "
                + "JOIN Account a ON sc.CreatedBy = a.AccountID "
                + "LEFT JOIN Account ua ON sc.UpdatedBy = ua.AccountID "
                + "WHERE sc.Status = 'Cancel'";

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
        String sql = "SELECT scd.StorageCheckDetailID, scd.StorageCheckID, scd.BinProductID, \n"
                + "       scd.ProductVariantID, pv.PVName, \n"
                + "       s.SizeName AS Size,  \n"
                + "       c.ColorName AS Color,  \n"
                + "       scd.ActualQuantity, scd.ExpectedQuantity, scd.CheckPeriod, scd.Note, \n"
                + "       a.Name AS CreatedByName, scd.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, scd.UpdatedDate\n"
                + "FROM StorageCheckDetail scd\n"
                + "JOIN ProductVariant pv ON scd.ProductVariantID = pv.ProductVariantID\n"
                + "JOIN SizeProduct s ON pv.Size_ID = s.Size_ID       \n"
                + "JOIN ColorProduct c ON pv.Color_ID = c.Color_ID    \n"
                + "LEFT JOIN Account a ON scd.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON scd.UpdatedBy = ua.AccountID\n"
                + "WHERE scd.StorageCheckID = ?;";

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

    //for detail, chỉ lấy max period count
    public List<StorageCheckDetail> getStorageCheckDetailsByStorageCheckIDMaxPeriod(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT scd.StorageCheckDetailID, scd.StorageCheckID, scd.BinProductID, \n"
                + "       scd.ProductVariantID, pv.PVName, c.ColorName AS Color, s.SizeName AS Size, \n"
                + "       scd.ActualQuantity, scd.ExpectedQuantity, scd.CheckPeriod, scd.Note, \n"
                + "       a.Name AS CreatedByName, scd.CreatedDate, \n"
                + "       ua.Name AS UpdatedByName, scd.UpdatedDate\n"
                + "FROM StorageCheckDetail scd\n"
                + "JOIN ProductVariant pv ON scd.ProductVariantID = pv.ProductVariantID\n"
                + "JOIN ColorProduct c ON pv.Color_ID = c.Color_ID\n"
                + "JOIN SizeProduct s ON pv.Size_ID = s.Size_ID\n"
                + "LEFT JOIN Account a ON scd.CreatedBy = a.AccountID\n"
                + "LEFT JOIN Account ua ON scd.UpdatedBy = ua.AccountID\n"
                + "WHERE scd.StorageCheckID = ? \n"
                + "  AND scd.CheckPeriod = (SELECT MAX(CheckPeriod) FROM StorageCheckDetail WHERE StorageCheckID = ?);";

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

    //Dùng khi 1 SC chưa đc tạo SCDetail
    public List<StorageCheckDetail> getStorageCheckDetailsPending(int storageCheckID) {
        List<StorageCheckDetail> details = new ArrayList<>();
        String sql = "SELECT sc.StorageCheckID, bp.BinProductID, pv.ProductVariantID, \n"
                + "       pv.PVName, s.SizeName as Size, c.ColorName as Color, bp.Quantity\n"
                + "FROM StorageCheck sc\n"
                + "JOIN BinProduct bp ON sc.StorageBinID = bp.StorageBinID\n"
                + "JOIN ProductVariant pv ON bp.ProductVariantID = pv.ProductVariantID\n"
                + "JOIN ColorProduct c ON pv.Color_ID = c.Color_ID\n"
                + "JOIN SizeProduct s ON pv.Size_ID = s.Size_ID\n"
                + "WHERE sc.StorageCheckID = ?;";

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
        String sql = "SELECT w.WarehouseID, sb.StorageBinID AS BinID, w.WarehouseName,\n"
                + "       sb.BinName, bt.Name_Type AS BinType, sb.Capacity, \n"
                + "       COALESCE(SUM(bp.Quantity), 0) AS TotalQuantity, sb.Status\n"
                + "FROM StorageBin sb\n"
                + "JOIN WareHouse w ON sb.WarehouseID = w.WarehouseID\n"
                + "JOIN BinType bt ON sb.BinType_ID = bt.BinType_ID  -- Thêm JOIN với BinType\n"
                + "JOIN BinProduct bp ON sb.StorageBinID = bp.StorageBinID\n"
                + "WHERE sb.Status <> 'Lock for check'\n"
                + "GROUP BY w.WarehouseID, sb.StorageBinID, w.WarehouseName, sb.BinName, bt.Name_Type, sb.Capacity, sb.Status;";

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

    public List<StorageCheckInfor> searchStorageBinInfo(String searchType, String searchQuery) {
        List<StorageCheckInfor> storageBins = new ArrayList<>();
        String sql = "SELECT w.WarehouseID, sb.StorageBinID AS BinID, w.WarehouseName, "
                + "       sb.BinName, bt.Name_Type AS BinType, sb.Capacity, "
                + "       COALESCE(SUM(bp.Quantity), 0) AS TotalQuantity, sb.Status "
                + "FROM StorageBin sb "
                + "JOIN WareHouse w ON sb.WarehouseID = w.WarehouseID "
                + "JOIN BinType bt ON sb.BinType_ID = bt.BinType_ID "
                + "LEFT JOIN BinProduct bp ON sb.StorageBinID = bp.StorageBinID "
                + "WHERE sb.Status <> 'Lock for check' ";

        // Thêm điều kiện tìm kiếm nếu searchQuery không rỗng
        if (searchType != null && searchQuery != null && !searchQuery.isEmpty()) {
            sql += " AND " + searchType + " LIKE ?";
        }

        sql += " GROUP BY w.WarehouseID, sb.StorageBinID, w.WarehouseName, "
                + "sb.BinName, bt.Name_Type, sb.Capacity, sb.Status";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            if (searchType != null && searchQuery != null && !searchQuery.isEmpty()) {
                ps.setString(1, "%" + searchQuery + "%");
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    storageBins.add(new StorageCheckInfor(
                            rs.getString("WarehouseID"),
                            rs.getString("BinID"),
                            rs.getString("WarehouseName"),
                            rs.getString("BinName"),
                            rs.getString("BinType"),
                            rs.getInt("Capacity"),
                            rs.getInt("TotalQuantity"),
                            rs.getString("Status")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return storageBins;
    }

    // Hàm tạo Storage Check với BinID, CheckCounter=0, Status='Pending'
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

    //Để lấy Id ngay sau khi add 1 đơn
    public int getLatestStorageCheckID(String binID) {
        String sql = "SELECT MAX(StorageCheckID) FROM StorageCheck WHERE StorageBinID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, binID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean updateBinStatus(String binID, String status) {
        String sql = "UPDATE StorageBin SET Status = ? WHERE StorageBinID = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, binID);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //UpdatedBy, CheckCounter, UpdatedBy, UpdatedDate
    public boolean updateStorageCheck(int storageCheckID, StorageCheckDetail detail) {
        String sql = "UPDATE StorageCheck SET CheckCounter = ?, UpdatedBy = ?, UpdatedDate = ? WHERE StorageCheckID = ?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            Timestamp updatedTimestamp = Timestamp.valueOf(detail.getUpdatedDate());
            ps.setInt(1, detail.getCheckPeriod());
            ps.setInt(2, detail.getCreatedByID());
            ps.setTimestamp(3, updatedTimestamp);
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
            psCheck.setInt(1, detail.getStorageCheckID());
            ResultSet rs = psCheck.executeQuery();
            int nextCheckPeriod = 1;
            if (rs.next()) {
                nextCheckPeriod = rs.getInt(1);
            }
            psInsert.setInt(1, detail.getStorageCheckID());
            psInsert.setInt(2, detail.getBinProductID());
            psInsert.setString(3, detail.getProductVariantID());
            psInsert.setInt(4, detail.getActualQuantity());
            psInsert.setInt(5, detail.getExpectedQuantity());
            psInsert.setInt(6, nextCheckPeriod);
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

    public static void main(String[] args) {
        StorageCheckDAO dao = new StorageCheckDAO();
        int testStorageCheckID = 10; // Thay số này bằng ID thực tế trong database

        List<StorageCheckInfor> details = dao.getCancelStorageCheckInfor();

        if (details.isEmpty()) {
            System.out.println("No storage check details found for StorageCheckID: " + testStorageCheckID);
        } else {
            for (StorageCheckInfor detail : details) {
                System.out.println(detail);
            }
        }
    }
}
