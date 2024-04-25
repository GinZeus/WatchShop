/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.dashbroad.AdminDashboardController;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Account;

/**
 *
 * @author DELL
 */
public class AccountDAO extends BaseDAO {

    public Account getAccountByName(String username) {

        try {
            String sql = "select * from [Account] where [username] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, username);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9)
                );
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountByMail(String email) {

        try {
            String sql = "select * from [Account] where [email] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, email);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9)
                );
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountToAccess(String username, String password) {

        try {
            String sql = "select * from [Account] where [username] = ? AND [password]= ?";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9)
                );
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountInfo(String accId) {
        String sql = "SELECT [acc_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[status]\n"
                + "      ,[role_id]\n"
                + "      ,[balance]\n"
                + "      ,[create_time]\n"
                + "      ,[update_time]\n"
                + "  FROM [WatchShop].[dbo].[Account]\n"
                + "  WHERE acc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, accId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getFloat(7),
                        rs.getDate(8),
                        rs.getDate(9));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public void changePassword(String accId, String newPassword) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + "   ,[update_time] = GETDATE()"
                + " WHERE acc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, accId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modifyBalance(Float x) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [balance] = balance + ?\n"
                + " WHERE role_id= 2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, x);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeAccountStatus(String id, String status) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [status] = ?\n"
                + " WHERE acc_id= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, id);

            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendMail(String to, String title, String content) {
        String HOST_NAME = "smtp.gmail.com";
        int TSL_PORT = 587; // Port for TLS/STARTTLS
        String APP_EMAIL = "watchshopg44@gmail.com"; // your email
        String APP_PASSWORD = "ukxb rddi ysmw sixy"; // your password
        String RECEIVE_EMAIL = to;

        // Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", TSL_PORT);

        //get session
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
            }
        });

        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(RECEIVE_EMAIL));
            message.setSubject(title);
            message.setContent(content, "text/html");

            // send message
            Transport.send(message);

            System.out.println("Message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Account> AccountList() {
        ArrayList<Account> list = new ArrayList<>();

        try {
            String sql = "select * from Account ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Account> getAccountsByStatus(String status) {
        ArrayList<Account> list = new ArrayList<>();

        try {
            String sql = "select * from [Account] where [status]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account checkAccountExist(String username) {

        try {
            String sql = "select * from account\n"
                    + "where [username] = ?\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /*    public static void main(String[] args) {
        Account acc = new Account();
        AccountDAO dao = new AccountDAO();
        acc = dao.checkAccountExist("qwer");
        System.out.println(acc);
        
    }*/
    public Account checkEmailExist(String email) {

        try {
            String sql = "select * from account\n"
                    + "where [email] = ?\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getDate(8),
                        rs.getDate(9));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /*    public static void main(String[] args) {
        Account acc = new Account();
        AccountDAO dao = new AccountDAO();
        acc = dao.checkGmailExist("onlynanh@email.com");
        System.out.println(acc);
        
    }*/
    public void registerAccount(String username, String email, String password, String role_id) {

        try {
            String sql = "INSERT INTO Account(username, password, email, status, role_id, balance, create_time, update_time)\n"
                    + "VALUES (?, ?, ?, 1, ?, 0, GETDATE(), GETDATE());";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, role_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeStatus(String email) {
        String sql = "UPDATE Account\n"
                + "SET status = 2\n"
                + "WHERE email = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void changeRole(String id, String role) {
        String sql = "UPDATE [Account] "
                + "SET [role_id] = ? "
                + "WHERE [acc_id] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, id);
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Integer> getRegistrationsOfLast7Days() {
        ArrayList<Integer> counts = new ArrayList<>(Collections.nCopies(7, 0));
        try {
            String sql = "SELECT count(acc_id) AS count,\n"
                    + "CONVERT(DATE, create_time) AS create_time \n"
                    + "FROM [Account] \n"
                    + "WHERE create_time >= ?\n"
                    + "GROUP BY CONVERT(DATE, create_time)\n"
                    + "ORDER BY CONVERT(DATE, create_time) DESC";

            LocalDate today = LocalDate.now();
            LocalDate sevenDaysAgo = today.minusDays(6);

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, java.sql.Date.valueOf(sevenDaysAgo));

            ResultSet rs = statement.executeQuery();
            int index = 6;
            while (rs.next() && index >= 0) {
                Integer count = rs.getInt("count");
                LocalDate create_time = rs.getDate("create_time").toLocalDate();
                int dateIndex = (int) ChronoUnit.DAYS.between(create_time, today);
                counts.set(dateIndex, count);
                index--;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboardController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Collections.reverse(counts);
        return counts;
    }
    
    public Float getBalanceByAccId(int accId) {
        String sql = "SELECT [balance]\n"
                + "  FROM [WatchShop].[dbo].[Account]\n"
                + "  WHERE acc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getFloat(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void main(String[] args) {
        AccountDAO acd = new AccountDAO();

    }
}
