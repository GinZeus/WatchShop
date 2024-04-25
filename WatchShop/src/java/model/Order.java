/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Order {
    private int order_id;
    private int user_id;
    private String fullName;
    
    private String email;
    private String address;
    private String phoneNumber;
    private String note;
    private Date order_date;
    private float total;
    private int status;
    private Date update_time;

    public Order() {
    }

    public Order(int order_id, int user_id, String fullName,  String email, String address,String phoneNumber, String note, Date order_date, float total, int status, Date update_time) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.note = note;
        this.order_date = order_date;
        this.total = total;
        this.status = status;
        this.update_time = update_time;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", fullName=" + fullName + ", phoneNumber=" + phoneNumber + ", email=" + email + ", address=" + address + ", note=" + note + ", order_date=" + order_date + ", total=" + total + ", status=" + status + ", update_time=" + update_time + '}';
    }

    
    
    
}
