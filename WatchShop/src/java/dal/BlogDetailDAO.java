/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogDetail;

/**
 *
 * @author Warspite
 */
public class BlogDetailDAO extends BaseDAO{
    public BlogDetail BlogDetails(String blogId) {
        try {
            String sql = "SELECT [bdetail_id]\n"
                    + "      ,[header1]\n"
                    + "      ,[cont1]\n"
                    + "      ,[image]\n"
                    + "      ,[header2]\n"
                    + "      ,[cont2]\n"
                    + "      ,[conclusion]\n"
                    + "      ,[status]\n"
                    + "  FROM [WatchShop].[dbo].[BlogDetail]"
                    + "  WHERE bdetail_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, blogId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                return new BlogDetail(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void InsertBlogDetail(String id, String header1, String cont1, String image, String header2, String cont2,String conclusion, String status){
        try{
            String sql = "INSERT INTO [dbo].[BlogDetail]\n"
                    + "           ([bdetail_id]\n"
                    + "           ,[header1]\n"
                    + "           ,[cont1]\n"
                    + "           ,[image]\n"
                    + "           ,[header2]\n"
                    + "           ,[cont2]\n"
                    + "           ,[conclusion]"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?"
                    + "           ,?)";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, header1);
            statement.setString(3, cont1);
            statement.setString(4, image);
            statement.setString(5, header2);
            statement.setString(6, cont2); 
            statement.setString(7, conclusion);
            statement.setString(8, status);
            statement.executeUpdate();
            
        }catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdateBlogDetail(String id, String header1, String cont1, String image, String header2, String cont2,String conclusion, String status){
        try{
            String sql = "UPDATE [dbo].[BlogDetail]\n"
                    + "   SET [header1] = ?\n"
                    + "      ,[cont1] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[header2] = ?\n"
                    + "      ,[cont2] = ?\n"
                    + "      ,[conclusion] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [bdetail_id] = ?";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, header1);
            statement.setString(2, cont1);
            statement.setString(3, image);
            statement.setString(4, header2);
            statement.setString(5, cont2);
            statement.setString(6, conclusion);
            statement.setString(7, status); 
            statement.setString(8, id);
            statement.executeUpdate();
            
        }catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdateBlogDetailWithoutImage(String id, String header1, String cont1, String header2, String cont2, String conclusion, String status) {
        try {
            String sql = "UPDATE [dbo].[BlogDetail]\n"
                    + "   SET [header1] = ?\n"
                    + "      ,[cont1] = ?\n"
                    + "      ,[header2] = ?\n"
                    + "      ,[cont2] = ?\n"
                    + "      ,[conclusion] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [bdetail_id] = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, header1);
            statement.setString(2, cont1);
            statement.setString(3, header2);
            statement.setString(4, cont2);
            statement.setString(5, conclusion);
            statement.setString(6, status);
            statement.setString(7, id);
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteBlogDetail(String bdetail_id){
        try{
            String sql = "DELETE FROM [dbo].[BlogDetail]\n" +
                         " WHERE [bdetail_id] = ?";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, bdetail_id);
            statement.executeUpdate();
            
        }catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
