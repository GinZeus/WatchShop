/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Brand {
    private int brand_id;
    private String brand_name;
    private String brand_address;
    private String brand_status;

    public Brand() {
    }

    public Brand(int brand_id, String brand_name, String brand_address, String brand_status) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.brand_address = brand_address;
        this.brand_status = brand_status;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getBrand_name() {
        return brand_name;
    }

    public void setBrand_name(String brand_name) {
        this.brand_name = brand_name;
    }

    public String getBrand_address() {
        return brand_address;
    }

    public void setBrand_address(String brand_address) {
        this.brand_address = brand_address;
    }

    public String getBrand_status() {
        return brand_status;
    }

    public void setBrand_status(String brand_status) {
        this.brand_status = brand_status;
    }

    @Override
    public String toString() {
        return "Brand{" + "brand_id=" + brand_id + ", brand_name=" + brand_name + ", brand_address=" + brand_address + ", brand_status=" + brand_status + '}';
    }
    
    
}
