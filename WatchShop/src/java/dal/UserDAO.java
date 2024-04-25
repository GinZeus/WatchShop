/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Warspite
 */
public class UserDAO extends BaseDAO {

    PreparedStatement ps = null;
    ResultSet rs;

    public User getUserInfo(String accId) {
        String sql = "SELECT [user_id]\n"
                + ",[fullname]\n"
                + "  ,[address]\n"
                + "    ,[phone_number]\n"
                + "	, [avatar]\n"
                + " FROM [dbo].[User]\n"
                + "  WHERE [user_id]= ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, accId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void editUserInfo(String accId, String fullName, String address, String phoneNumber, String avatar) {
        String sql = "UPDATE [dbo].[User]\n"
                + "                  SET \n"
                + "                    [fullname] = ?\n"
                + "                    ,[address] = ?\n"
                + "               ,[phone_number] = ?\n"
                + "      ,[avatar] = ?\n"
                + "            WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, phoneNumber);
            ps.setString(4, avatar);
            ps.setString(5, accId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editUserInfoWithoutAvatar(String accId, String fullName, String address, String phoneNumber) {
        String sql = "UPDATE [dbo].[User]\n"
                + "                  SET \n"
                + "                    [fullname] = ?\n"
                + "                    ,[address] = ?\n"
                + "               ,[phone_number] = ?\n"
                + "            WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, phoneNumber);
            ps.setString(4, accId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createNewUser(String accId) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([user_id]\n"
                + "           ,[avatar])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,'')";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, accId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//        public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//        System.out.println(dao.getUserInfo("1"));
//    }
}
