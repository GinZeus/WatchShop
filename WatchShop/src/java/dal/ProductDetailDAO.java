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
import model.Product;
import model.ProductDetail;

/**
 *
 * @author datng
 */
public class ProductDetailDAO extends BaseDAO {

    public ProductDetail getInfoByID(String pid) {
        try {
            String sql = "select * \n"
                    + "from ProductDetail i, Product p\n"
                    + "where i.pdetail_id=p.p_id\n"
                    + "and pdetail_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductDetail s = new ProductDetail();
                s.setPdetail_id(rs.getInt("pdetail_id"));
                s.setDes(rs.getString("des"));
                s.setMaterial(rs.getString("material"));
                s.setWidth(rs.getInt("width"));
                s.setDuration(rs.getFloat("duration"));
                s.setShape(rs.getString("shape"));
                s.setImage1(rs.getString("image1"));
                s.setImage2(rs.getString("image2"));
                return s;

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertProductInfo(int p_id, String des, String material, String width, String duration, String shape, String image1, String image2) {
        try {
            String sql = "insert into [ProductDetail]([pdetail_id],[des],[material],[width],[shape],[duration],[image1],[image2])\n"
                    + "values (?,?,?,?,?,?,?,?)";                
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, p_id);
            statement.setString(2, des);
            statement.setString(3, material);
            statement.setString(4, width);
            statement.setString(5, shape);
            statement.setString(6, duration);
            statement.setString(7, image1);
            statement.setString(8, image2);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editProductInfo(String des, String material, String width, String duration, String shape, String image1, String image2, String pid) {
        try {
            String sql = "update [ProductDetail]"
                    + "set [des]=?,"
                    + "[material]=?,"
                    + "[width]=?,"
                    + "[duration]=?,"
                    + "[shape]=?,"
                    + "[image1]=?,"
                    + "[image2]=? "
                    + "where pdetail_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, des);
            statement.setString(2, material);
            statement.setString(3, width);
            statement.setString(4, duration);
            statement.setString(5, shape);
            statement.setString(6, image1);
            statement.setString(7, image2);
            statement.setString(8, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ProductDetailDAO dao = new ProductDetailDAO();
        dao.insertProductInfo(11, "test", "steel", "100", "10000", "circle", "https://www.therelux.com/cdn/shop/files/PhotoRoom_000_20231004_092031_900x.jpg?v=1696443845", "https://www.therelux.com/cdn/shop/files/PhotoRoom_000_20231004_092031_900x.jpg?v=1696443845");
    }
}
