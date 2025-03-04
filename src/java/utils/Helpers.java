/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dal.DBContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class Helpers {

    private static final String IMAGE_UPLOAD_DIR = "images";

    public static String getMaxID(String sql, String prefixId) {
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
                return String.format(prefixId + "%03d", maxNumber + 1);
            }
        } catch (Exception e) {
            System.out.println("Error function getMaxID: " + e.getMessage());
        }
        return null;
    }

    public static int extractNumber(String id, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(id);
        if (matcher.matches()) {
            return Integer.parseInt(matcher.group(1));
        }
        throw new IllegalArgumentException("Invalid ID format: " + id);
    }

    // Lưu ảnh vào thư mục trên server
    public static String saveImage(Part imagePart, HttpServletRequest request) throws IOException {
        String fileName = extractFileName(imagePart);
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + IMAGE_UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);

        return IMAGE_UPLOAD_DIR + "/" + fileName;
    }

    public static String extractFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.png";
    }
}
