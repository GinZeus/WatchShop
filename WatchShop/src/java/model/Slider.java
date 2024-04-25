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
public class Slider {
    private int s_id;
    private String thumbnail;
    private int status;
    private String content;
    private Date create_time;
    private Date update_time;

    public Slider() {
    }

    public Slider(int s_id, String thumbnail, int status, String content, Date create_time, Date update_time) {
        this.s_id = s_id;
        this.thumbnail = thumbnail;
        this.status = status;
        this.content = content;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
        return "Slider{" + "s_id=" + s_id + ", thumbnail=" + thumbnail + ", status=" + status + ", content=" + content + ", create_time=" + create_time + ", update_time=" + update_time + '}';
    }
    
}
