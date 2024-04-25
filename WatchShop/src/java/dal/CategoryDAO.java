/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

import model.Category;

/**
 *
 * @author DELL
 */
public class CategoryDAO extends BaseDAO {
    public ArrayList<Category> CategoryList() {
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            String sql = "select * from [category] where status = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                 list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void insertCate(String cate_name) {
        String sql = "INSERT INTO [dbo].[Category] ([cate_name],[status]) VALUES (?,1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate_name);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editCateInfo(String cate_name, String cate_id) {
        String sql = "UPDATE [dbo].[Category] SET [cate_name] = ? WHERE [cate_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate_name);
            ps.setString(2, cate_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteCate(String cate_id) {
        String sql = "UPDATE [dbo].[Category] SET [status] = 0 WHERE [cate_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cate_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int countCate() {
        int total = 0;
        try {
            String sql = "select COUNT(*) as count_category from [Category]\n"
                    + "where status = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_category");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    public static void main(String[] args) {
        CategoryDAO cd =new CategoryDAO();
//        ArrayList<Category> list= cd.CategoryList();
//        for(Category c : list ){
//            System.out.println(c);
//        }
        System.out.println(cd.countCate());
    }
}
