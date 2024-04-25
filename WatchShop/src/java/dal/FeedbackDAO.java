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
import model.Feedback;

/**
 *
 * @author datng
 */
public class FeedbackDAO extends BaseDAO {

    public ArrayList<Feedback> getFeedbackFromPid(String p_id) {
        ArrayList<Feedback> list = new ArrayList<>();

        try {
            String sql = "  select * from Feedback where status = 1 and p_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setFb_id(rs.getInt("fb_id"));
                f.setUser_id(rs.getInt("user_id"));
                f.setP_id(rs.getInt("p_id"));
                f.setContent(rs.getNString("content"));
                f.setRate_s(rs.getInt("rate_s"));
                f.setStatus(rs.getInt("status"));
                f.setUpdate_time(rs.getDate("update_time"));
                list.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalFeedbackOfProduct(String p_id) {
        int total = 0;
        try {
            String sql = " select COUNT(*) as count_feedback from Feedback where p_id=? and status=1";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_feedback");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void postFeedback(int acc_id, String pid, String content, String rate) {
        try {
            String sql = "insert into [Feedback]"
                    + "(user_id,p_id,content,rate_s,status,update_time)"
                    + " values(?,?,?,?,'1',GETDATE())";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, acc_id);
            statement.setString(2, pid);
            statement.setString(3, content);
            statement.setString(4, rate);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Feedback getFeedbackProFromUid(String p_id, int u_id) {
        try {
            String sql = "select * from Feedback where p_id = ? and user_id = ? and status = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p_id);
            statement.setInt(2, u_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setFb_id(rs.getInt("fb_id"));
                f.setUser_id(rs.getInt("user_id"));
                f.setP_id(rs.getInt("p_id"));
                f.setContent(rs.getNString("content"));
                f.setRate_s(rs.getInt("rate_s"));
                f.setStatus(rs.getInt("status"));
                f.setUpdate_time(rs.getDate("update_time"));
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editFeedback(int user_id, String p_id, String rate, String content) {
        try {
            String sql = "update Feedback set "
                    + "rate_s = ?, "
                    + "content=?, "
                    + "update_time = GETDATE() "
                    + "where p_id = ? "
                    + "and user_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, rate);
            statement.setString(2, content);
            statement.setString(3, p_id);
            statement.setInt(4, user_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteFeedbackByFid (String fb_id){
        try {
            String sql = "update Feedback "
                    + "set [status]=0\n"
                    + "where fb_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fb_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getTotalFeedback() {
        int total = 0;
        try {
            String sql = " select COUNT(*) as count_feedback from Feedback where status=1";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_feedback");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        System.out.println(dao.getTotalFeedback());
    }
}
