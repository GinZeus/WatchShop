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

import model.OrderDetail;

/**
 *
 * @author DELL
 */
public class OrderDetailDAO extends BaseDAO {
    public void insertOrderDetails(OrderDetail s) {
        try {
            String sql = "insert into OrderDetails"
                    + "(order_id,p_id,price,quantity,i_total )"
                    + "values(?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            
            statement.setInt(1, s.getOrder_id());
            statement.setInt(2, s.getP_id());
            statement.setFloat(3, s.getPrice());
            statement.setInt(4, s.getQuantity());
            statement.setFloat(5, s.getI_total());
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<OrderDetail> getOrderDetailsById (String id){
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "select * from [OrderDetails] where order_id =? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            statement.setString(1, id);
            
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                 list.add(new OrderDetail(rs.getInt(1),
                         rs.getInt(2),
                         rs.getInt(3),
                         rs.getFloat(4),
                         rs.getInt(5),
                         rs.getFloat(6)
                 ));
                 
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static void main(String[] args) {
        OrderDetailDAO odd = new OrderDetailDAO();
        ArrayList<OrderDetail> ode = odd.getOrderDetailsById("5");
        for(OrderDetail o: ode){
            System.out.println(o);
        }
//            ode.setOrder_id(2);
//            ode.setP_id(1);
//            ode.setPrice(50);
//            ode.setQuantity(2);
//            ode.setI_total(100);
//            odd.insertOrderDetails(ode);

    }
}
