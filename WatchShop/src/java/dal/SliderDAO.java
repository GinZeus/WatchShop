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

import model.Slider;

/**
 *
 * @author DELL
 */
public class SliderDAO extends BaseDAO {

    public ArrayList<Slider> AllSliderList() {
        ArrayList<Slider> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM [slider] where [status] IN (1, 2)";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Slider> Top4Slider() {
        ArrayList<Slider> list = new ArrayList<>();

        try {
            String sql = "select TOP 4 * from [slider] where status = 1 ORDER BY [update_time] Desc  ";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDate(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertSlider(String sliderThumbnail, String sliderContent) {
        String sql = "INSERT INTO [Slider] ([thumbnail], [content], [status], [create_time], [update_time])\n"
                + "VALUES (?,?,1,GETDATE(),GETDATE());";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sliderThumbnail);
            ps.setString(2, sliderContent);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editSliderInfo(String sliderThumbnail, String sliderStatus, String sliderContent, String sliderS_id) {
        String sql = "UPDATE [dbo].[Slider]\n"
                + "SET [thumbnail] = ?, [status] = ?, [content] = ?, [update_time] = GETDATE()\n"
                + "WHERE s_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sliderThumbnail);
            ps.setString(2, sliderStatus);
            ps.setString(3, sliderContent);
            ps.setString(4, sliderS_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public void editSliderInfoWithoutThumbail(String sliderStatus, String sliderContent, String sliderS_id) {
        String sql = "UPDATE [dbo].[Slider]\n"
                + "SET [status] = ?, [content] = ?, [update_time] = GETDATE()\n"
                + "WHERE s_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sliderStatus);
            ps.setString(2, sliderContent);
            ps.setString(3, sliderS_id);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteSlider(String s_id) {
        String sql = "DELETE FROM [dbo].[Slider] WHERE s_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public static void main(String[] args) {
        SliderDAO sliderDAO = new SliderDAO(); // You may need to initialize your SliderDAO with a connection

        ArrayList<Slider> sliderList = sliderDAO.AllSliderList();

        // Print the sliders
        for (Slider slider : sliderList) {
            System.out.println(slider);
        }
    }
}