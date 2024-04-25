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
import model.Mid;

/**
 *
 * @author datng
 */
public class MidDAO extends BaseDAO {

    public void addProductCate(int p_id, String[] category) {
        try {
            String sql = "insert into Mid([p_id],[cate_id])\n"
                    + "values (?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            if (category == null){
                return;
            }
            for (String cate : category) {
                statement.setInt(1, p_id);
                statement.setString(2, cate);
                statement.executeUpdate();
            }  
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteProductCate (String p_id){
        try {
            String sql = "delete from Mid\n"
                    + "where p_id =?\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MidDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Mid> getCatePid(String pid) {
        ArrayList<Mid> mids = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "  FROM [Mid]"
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Mid m = new Mid();
                m.setP_id(rs.getInt("p_id"));
                m.setCate_id(rs.getInt("cate_id"));
                mids.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MidDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mids;
    }
    public static void main(String[] args) {
        MidDAO mid = new MidDAO();
        ArrayList<Mid> mids= mid.getCatePid("1");
        for (Mid m:mids){
            System.out.println(m);
        }
    }
}
