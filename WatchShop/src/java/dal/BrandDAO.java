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

/**
 *
 * @author DELL
 */
public class BrandDAO extends BaseDAO {

    public ArrayList<Brand> BrandList() {
        ArrayList<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from [brand] where brand_status = 1 ORDER BY [brand_name] ASC  ";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Brand> ManagerBrandList() {
        ArrayList<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from [brand] ORDER BY [brand_name] ASC  ";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Brand getBrandById(String b_id) {
        try {
            String sql = "SELECT *"
                    + "  FROM [Brand]"
                    + "WHERE brand_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, b_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrand_id(rs.getInt("brand_id"));
                b.setBrand_name(rs.getString("brand_name"));
                b.setBrand_address(rs.getString("brand_address"));
                b.setBrand_status(rs.getString("brand_status"));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Brand> getBrandsByPaging(int index, int brandPerPage) {
        ArrayList<Brand> list = new ArrayList<>();

        try {
            String sql = "select * from [Brand] order by [brand_name] offset ? rows fetch next ? rows only";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (index - 1) * brandPerPage);
            statement.setInt(2, brandPerPage);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Brand> searchBrands(String brandName) {
        ArrayList<Brand> list = new ArrayList<>();

        try {
            String sql = "select *\n"
                    + "from [Brand] \n"
                    + "where [brand_name] like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + brandName + "%");

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new Brand(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertBrand(Brand brand) {
        String sql = "INSERT INTO [dbo].[Brand]\n"
                + "           ([brand_name]\n"
                + "           ,[brand_address]\n"
                + "           ,[brand_status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, brand.getBrand_name());
            ps.setString(2, brand.getBrand_address());
            ps.setString(3, brand.getBrand_status());

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editBrandInfo(Brand brand) {
        String sql = "UPDATE [dbo].[Brand]\n"
                + "   SET [brand_name] = ?\n"
                + "      ,[brand_address] = ?\n"
                + "      ,[brand_status] = ?\n"
                + " WHERE [brand_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, brand.getBrand_name());
            ps.setString(2, brand.getBrand_address());
            ps.setString(3, brand.getBrand_status());
            ps.setInt(4, brand.getBrand_id());

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public int countBrand() {
        int total = 0;
        try {
            String sql = "select COUNT(*) as count_brand from [Brand]\n"
                    + "where brand_status = 1";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_brand");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public static void main(String[] args) {
        BrandDAO bd = new BrandDAO();
//        ArrayList<Brand> list = bd.searchBrands("sam");
//        for (Brand b : list) {
//            System.out.println(b);
//        }
        System.out.println(bd.countBrand());
    }
}
