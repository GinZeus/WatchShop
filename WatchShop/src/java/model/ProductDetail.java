/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class ProductDetail {
    private int pdetail_id;
    private String des;
    private String material;
    private int width;
    private float duration;
    private String shape;
    private String image1 ;
    private String image2;

    public ProductDetail() {
    }

    public ProductDetail(int pdetail_id, String des, String material, int width, float duration, String shape, String image1, String image2) {
        this.pdetail_id = pdetail_id;
        this.des = des;
        this.material = material;
        this.width = width;
        this.duration = duration;
        this.shape = shape;
        this.image1 = image1;
        this.image2 = image2;
    }

    

    public int getPdetail_id() {
        return pdetail_id;
    }

    public void setPdetail_id(int pdetail_id) {
        this.pdetail_id = pdetail_id;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    @Override
    public String toString() {
        return "Product{" + "pdetail_id=" + pdetail_id + ", des=" + des + ", material=" + material + ", width=" + width + ", duration=" + duration + ", shape=" + shape + ", image1=" + image1 + ", image2=" + image2 + '}';
    }
}
