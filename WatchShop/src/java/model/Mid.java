/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Mid {
    private int p_id;
    private int cate_id;

    public Mid() {
    }

    public Mid(int p_id, int cate_id) {
        this.p_id = p_id;
        this.cate_id = cate_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    @Override
    public String toString() {
        return "Mid{" + "p_id=" + p_id + ", cate_id=" + cate_id + '}';
    }
    
}
