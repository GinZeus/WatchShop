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
public class Product {
    private int p_id;
    private String product_name;
    
    private int brand_id;
    private int quantity;
    private float rate;
    private String thumbnail;
    private float ori_price;
    private float sale_price;
    private int discount;
    private int status;
    private Date create_time;
    private Date update_time;

    public Product() {
    }

    public Product(int p_id, String product_name, int brand_id, int quantity, float rate, String thumbnail, float ori_price, float sale_price, int discount, int status, Date create_time, Date update_time) {
        this.p_id = p_id;
        this.product_name = product_name;
        this.brand_id = brand_id;
        this.quantity = quantity;
        this.rate = rate;
        this.thumbnail = thumbnail;
        this.ori_price = ori_price;
        this.sale_price = sale_price;
        this.discount = discount;
        this.status = status;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public float getOri_price() {
        return ori_price;
    }

    public void setOri_price(float ori_price) {
        this.ori_price = ori_price;
    }

    public float getSale_price() {
        return sale_price;
    }

    public void setSale_price(float sale_price) {
        this.sale_price = sale_price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
        return "Product{" + "p_id=" + p_id + ", product_name=" + product_name + ", brand_id=" + brand_id + ", quantity=" + quantity + ", rate=" + rate + ", thumbnail=" + thumbnail + ", ori_price=" + ori_price + ", sale_price=" + sale_price + ", discount=" + discount + ", status=" + status + ", create_time=" + create_time + ", update_time=" + update_time + '}';
    }

    
    
    
}
