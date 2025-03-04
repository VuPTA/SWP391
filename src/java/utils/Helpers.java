/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class Helpers {
    public static String getMaxID(String sql, String prefixId) {
        try {
            try (PreparedStatement stmt = DBContext.getConnection().prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
                int maxNumber = 0;
                while (rs.next()) {
                    String id = rs.getString(1);
                    if (id != null) {
                        int number = Helpers.extractNumber(id, prefixId+"(\\d+)");
                        if (number > maxNumber) {
                            maxNumber = number;
                        }
                    }
                }
                return String.format(prefixId +"%03d", maxNumber + 1);
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
}
