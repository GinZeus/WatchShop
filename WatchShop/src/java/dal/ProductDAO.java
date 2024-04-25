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
import model.Product;

/**
 *
 * @author DELL
 */
public class ProductDAO extends BaseDAO {

    public ArrayList<Product> getTop10Product() {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "select top 10* from product where status != 0";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String sql = "select * from product where status !=0";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductByBrand(String id, int index, String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product"
                    + " WHERE brand_id=?"
                    + " AND sale_price >= ? AND sale_price <= ? and status !=0"
                    + " ORDER BY " + var + " " + sort
                    + " OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, id);
            statement.setString(2, min);
            statement.setString(3, max);
            statement.setInt(4, (index - 1) * 6);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getAllProductByBrand(String id, String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product"
                    + " WHERE brand_id=?"
                    + " AND sale_price >= ? AND sale_price <= ? and status !=0"
                    + " ORDER BY " + var + " " + sort;
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, id);
            statement.setString(2, min);
            statement.setString(3, max);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductByPaging(int index) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "select * from [product] where status !=0 order by [p_id] offset ? rows fetch next 6 rows only";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (index - 1) * 6);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductByCategory(String id, int index, String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product p, mid m"
                    + " WHERE p.p_id = m.p_id AND m.cate_id = ?"
                    + " AND p.sale_price >= ? AND p.sale_price <= ? and status !=0"
                    + " ORDER BY p." + var + " " + sort
                    + " OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, id);
            statement.setString(2, min);
            statement.setString(3, max);
            statement.setInt(4, (index - 1) * 6);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getAllProductByCategory(String id, String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product p, mid m"
                    + " WHERE p.p_id = m.p_id AND m.cate_id = ?"
                    + " AND p.sale_price >= ? AND p.sale_price <= ? and status !=0"
                    + " ORDER BY p." + var + " " + sort;
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, id);
            statement.setString(2, min);
            statement.setString(3, max);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductForShop(int index, String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product "
                    + " WHERE sale_price >= ? AND sale_price <= ? and status !=0"
                    + " ORDER BY " + var + " " + sort
                    + " OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, min);
            statement.setString(2, max);
            statement.setInt(3, (index - 1) * 6);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getAllProductForShop(String var, String sort, String min, String max) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM product "
                    + " WHERE sale_price >= ? AND sale_price <= ? and status !=0"
                    + " ORDER BY " + var + " " + sort;

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, min);
            statement.setString(2, max);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductBySearch(String mess) {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "select * from [product] where [product_name] like ? and status !=0";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + mess + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(String mess) {

        try {
            String sql = "select * from [product] where [p_id]=? and status !=0";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, mess);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Product product = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12));
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void calculateRateStarPro(String pid) {
        FeedbackDAO fbDAO = new FeedbackDAO();
        ArrayList<Feedback> flist = fbDAO.getFeedbackFromPid(pid);

        //Rate star
        float total_star = 0;
        float avg_star;
        if (flist.isEmpty()) {
            avg_star = 0;
        } else {
            for (Feedback o : flist) {
                total_star += o.getRate_s();
            }
            avg_star = total_star / flist.size();
        }
        try {
            String sql = "update Product "
                    + "set [rate]=?\n"
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setFloat(1, avg_star);
            statement.setString(2, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertProduct(String product_name, String brand, String quantity, String thumbnail, String ori_price, String sale_price, String discount) {
        try {
            String sql = "insert into [Product]([product_name],[brand_id],[thumbnail],[quantity],[ori_price],[sale_price],[discount],[rate],[status],[create_time],[update_time] )\n"
                    + "values (?,?,?,?,?,?,?,0,1,GETDATE(),getDate())";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product_name);
            statement.setString(2, brand);
            statement.setString(3, thumbnail);
            statement.setString(4, quantity);
            statement.setString(5, ori_price);
            statement.setString(6, sale_price);
            statement.setString(7, discount);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modifyProductQuantity(int id, int num) {
        try {
            String sql = "update [Product]"
                    + "set[quantity]=quantity + ?,"
                    + "[update_time]=GETDATE() "
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, num);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product getLastestProduct() {

        try {
            String sql = "select top 1 * from Product where status !=0 order by p_id desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editProduct(String product_name, String brand_id, String quantity, String thumbnail, String ori_price, String sale_price, String discount, String status, String pid) {
        try {
            String sql = "update [Product]"
                    + "set [product_name]=?,"
                    + "[brand_id]=?,"
                    + "[quantity]=?,"
                    + "[thumbnail]=?,"
                    + "[ori_price]=?,"
                    + "[sale_price]=?,"
                    + "[discount]=?,"
                    + "[status]=?,"
                    + "[update_time]=GETDATE() "
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product_name);
            statement.setString(2, brand_id);
            statement.setString(3, quantity);
            statement.setString(4, thumbnail);
            statement.setString(5, ori_price);
            statement.setString(6, sale_price);
            statement.setString(7, discount);
            statement.setString(8, status);
            statement.setString(9, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(String pid) {
        try {
            String sql = "update [Product]"
                    + "set [status]=0 "
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setStatusById(String id, String status) {
        try {
            String sql = "update [Product]"
                    + "set [status]=? "
                    + "where p_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatusOfProductByBrand(String brand_id, String status) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [status] = ?\n"
                    + "   FROM \n"
                    + "		Brand as br inner join Product as p\n"
                    + "		on br.brand_id = p.brand_id\n"
                    + "	WHERE br.brand_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, brand_id);
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> GetTop5BestSellingProducts() {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "SELECT top 5 p.*\n"
                    + "FROM Product p\n"
                    + "JOIN OrderDetails od ON p.p_id = od.p_id\n"
                    + "JOIN [Order] o ON od.order_id = o.order_id\n"
                    + "WHERE o.status IN (4, 5) and p.status != 0\n"
                    + "GROUP BY p.p_id, p.product_name, p.brand_id, p.quantity, p.rate, p.thumbnail, p.ori_price, p.sale_price, p.status, p.discount, p.create_time, p.update_time\n"
                    + "ORDER BY SUM(od.quantity) DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int countProduct() {
        int total = 0;
        try {
            String sql = "select COUNT(*) as count_product from [Product]\n"
                    + "where [status] IN (1, 2)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_product");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    public ArrayList<Product> getTop5RatingProducts() {
        ArrayList<Product> list = new ArrayList<>();

        try {
            String sql = "select top 5 * from product where status != 0 order by [rate] desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getFloat(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();

//        Product p = pd.getProductById("1");
//        System.out.println(p);
//        ArrayList<Product> list = pd.getProductByBrand("3", 1, "sale_price", "desc", "0", "10000");
//        for (Product o : list) {
//            System.out.println(o);
//        }
          ArrayList<Product> list = pd.getTop5RatingProducts();
          for (Product o : list) {
            System.out.println(o);
        }
    }
}
