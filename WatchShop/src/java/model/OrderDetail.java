/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class OrderDetail {
    private int odetail_id;
    private int order_id;
    private int  p_id;
    private float price;
    private int quantity;
    private float i_total;

    public OrderDetail() {
    }

    public OrderDetail(int odetail_id, int order_id, int p_id, float price, int quantity, float i_total) {
        this.odetail_id = odetail_id;
        this.order_id = order_id;
        this.p_id = p_id;
        this.price = price;
        this.quantity = quantity;
        this.i_total = i_total;
    }

    public int getOdetail_id() {
        return odetail_id;
    }

    public void setOdetail_id(int odetail_id) {
        this.odetail_id = odetail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getI_total() {
        return i_total;
    }

    public void setI_total(float i_total) {
        this.i_total = i_total;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "odetail_id=" + odetail_id + ", order_id=" + order_id + ", p_id=" + p_id + ", price=" + price + ", quantity=" + quantity + ", i_total=" + i_total + '}';
    }
    
}
