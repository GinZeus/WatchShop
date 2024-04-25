/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
import java.sql.Date;
public class Account {
    private int acc_id;
    private String username;
    private String password;
    private String email;
    private int status;
    private int role_id;
    private float balance;
    private Date create_time;
    private Date update_time;

    public Account() {
    }

    public Account(int acc_id, String username, String password, String email, int status, int role_id, float balance, Date create_time, Date update_time) {
        this.acc_id = acc_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.status = status;
        this.role_id = role_id;
        this.balance = balance;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "Account{" + "acc_id=" + acc_id + ", username=" + username + ", password=" + password + ", email=" + email + ", status=" + status + ", role_id=" + role_id + ", balance=" + balance + ", create_time=" + create_time + ", update_time=" + update_time + '}';
    }
    
    
}
