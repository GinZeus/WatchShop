/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class BlogDetail {
    private int bdetail_id;
    private String header1;
    private String cont1;
    private String image;
    private String header2;
    private String cont2;
    private String conclusion;
    private String status;

    public BlogDetail(){}

    public BlogDetail(int bdetail_id, String header1, String cont1, String image, String header2, String cont2, String conclusion, String status) {
        this.bdetail_id = bdetail_id;
        this.header1 = header1;
        this.cont1 = cont1;
        this.image = image;
        this.header2 = header2;
        this.cont2 = cont2;
        this.conclusion = conclusion;
        this.status = status;
    }

    public int getBdetail_id() {
        return bdetail_id;
    }

    public void setBdetail_id(int bdetail_id) {
        this.bdetail_id = bdetail_id;
    }

    public String getHeader1() {
        return header1;
    }

    public void setHeader1(String header1) {
        this.header1 = header1;
    }

    public String getCont1() {
        return cont1;
    }

    public void setCont1(String cont1) {
        this.cont1 = cont1;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getHeader2() {
        return header2;
    }

    public void setHeader2(String header2) {
        this.header2 = header2;
    }

    public String getCont2() {
        return cont2;
    }

    public void setCont2(String cont2) {
        this.cont2 = cont2;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BlogDetail{" + "bdetail_id=" + bdetail_id + ", header1=" + header1 + ", cont1=" + cont1 + ", image=" + image + ", header2=" + header2 + ", cont2=" + cont2 + ", conclusion=" + conclusion + ", status=" + status + '}';
    }
    
    
    
}
