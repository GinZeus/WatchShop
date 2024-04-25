/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author DELL
 */
public class OrderDAO extends BaseDAO {

    public void insertOrder(Order s) {
        try {
            String sql = "insert into [Order]([user_id],[fullname],[address],[email],[note],[phone_number],[order_date],[status],[total],[update_time])\n"
                    + "values(?,?,?,?,?,?,getDate(),1,?,getDate())";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getUser_id());
            statement.setString(2, s.getFullName());
            statement.setString(3, s.getAddress());
            statement.setString(4, s.getEmail());
            statement.setString(5, s.getNote());
            statement.setString(6, s.getPhoneNumber());

            statement.setFloat(7, s.getTotal());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Order getOrderByUId(String u_id) {
        Order p = new Order();

        try {
            String sql = "select top 1 * from [order] where [user_id]=?  order by order_id desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, u_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                p = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getFloat(9),
                        rs.getInt(10),
                        rs.getDate(11)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public Order getOrderByOId(String o_id) {
        Order p = new Order();

        try {
            String sql = "select * from [order] where [order_id]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, o_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                p = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getFloat(9),
                        rs.getInt(10),
                        rs.getDate(11)
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public ArrayList<Order> getOrdersByStatus(String id, int status) {
        ArrayList<Order> list = new ArrayList<>();

        try {
            String sql = "select  * from [Order] where [user_id] =? and [status] =? order by [order_date] desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.setInt(2, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getFloat(9),
                        rs.getInt(10),
                        rs.getDate(11)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean checkUserBuyPro(int user_id, String p_id) {
        try {
            String sql = "select * from [Order] o, [OrderDetails] od\n"
                    + "  where o.order_id=od.order_id\n"
                    + "  and o.user_id = ?\n"
                    + "  and od.p_id = ?\n"
                    + "  and status = 4";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, user_id);
            statement.setString(2, p_id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Order> getListOrders(int status) {
        ArrayList<Order> list = new ArrayList<>();

        try {
            String sql = "select  * from [Order] where [status] =? order by [order_date] desc";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getFloat(9),
                        rs.getInt(10),
                        rs.getDate(11)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void completeOrder(String oid) {
        try {
            String sql = "update [Order]"
                    + "set[status]=5"
                    + "where order_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, oid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrderStatus(String id, String status) {
        try {
            String sql = "update [Order] set [status] = ? where [order_id]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDeliveryTime(String id) {
        try {
            String sql = "update [Order] set [update_time] = GETDATE() where [order_id]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countOrderSuccess() {
        int total = 0;
        try {
            String sql = "select COUNT(*) as count_order_success from [Order] o\n"
                    + "where o.status IN (4, 5) ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                total = rs.getInt("count_order_success");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void editOrder(String id, String fullname, String phone_number, String address, String note) {
        try {
            String sql = "update [Order] set [fullname] = ?,[phone_number]= ?,[address]=?,[note]=? where [order_id]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, phone_number);
            statement.setString(3, address);
            statement.setString(4, note);
            statement.setString(5, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Float> getRevenueOfLast7Days() throws SQLException {
        ArrayList<Float> revenues = new ArrayList<>(Collections.nCopies(7, 0f));
        try {
            String sql = "SELECT SUM(total) AS revenue, CONVERT(DATE, update_time) AS update_date "
                    + "FROM [Order] "
                    + "WHERE update_time >= ? AND [status] IN (4, 5) "
                    + "GROUP BY CONVERT(DATE, update_time) "
                    + "ORDER BY CONVERT(DATE, update_time) DESC";

            LocalDate today = LocalDate.now();
            LocalDate sevenDaysAgo = today.minusDays(6);

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, java.sql.Date.valueOf(sevenDaysAgo));

            ResultSet resultSet = statement.executeQuery();
            int index = 6; // Last index in the revenues array

            while (resultSet.next() && index >= 0) {
                Float revenue = resultSet.getFloat("revenue");
                LocalDate updateDate = resultSet.getDate("update_date").toLocalDate();

                int dateIndex = (int) ChronoUnit.DAYS.between(updateDate, today);

                revenues.set(dateIndex, revenue);
                index--;
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Collections.reverse(revenues);
        return revenues;
    }

    public static void main(String[] args) throws SQLException {
        OrderDAO od = new OrderDAO();
//        Order o = new Order();
//        o.setUser_id(2);
//        o.setFullName("Dat");
//        o.setAddress("Bac Ninh");
//        o.setNote("Khong co gi");
//        o.setEmail("nguyendat@email.com");
//        o.setStatus(1);
//        o.setPhoneNumber("0987654312");
//        o.setTotal(124);
//        od.insertOrder(o);
//        float total = od.getTotalRevenue();
//        System.out.println(total);

        ArrayList<Float> total = od.getRevenueOfLast7Days();
        for (Float float1 : total) {
            System.out.println(float1);
        }

    }

}
