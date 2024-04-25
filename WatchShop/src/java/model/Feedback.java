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
public class Feedback {
    private int fb_id;
    private int user_id;
    private int p_id;
    private String content;
    private int rate_s;
    private int status;
    private Date update_time;

    public Feedback() {
    }

    public Feedback(int fb_id, int user_id, int p_id, String content, int rate_s, int status, Date update_time) {
        this.fb_id = fb_id;
        this.user_id = user_id;
        this.p_id = p_id;
        this.content = content;
        this.rate_s = rate_s;
        this.status = status;
        this.update_time = update_time;
    }

    public int getFb_id() {
        return fb_id;
    }

    public void setFb_id(int fb_id) {
        this.fb_id = fb_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate_s() {
        return rate_s;
    }

    public void setRate_s(int rate_s) {
        this.rate_s = rate_s;
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
        return "Feedback{" + "fb_id=" + fb_id + ", user_id=" + user_id + ", p_id=" + p_id + ", content=" + content + ", rate_s=" + rate_s + ", status=" + status + ", update_time=" + update_time + '}';
    }
    
    
}
