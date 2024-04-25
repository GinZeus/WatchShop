/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class Blog {
    private int blog_id;
    private String title;
    private String thumbnail;
    private String intro;
    private String author;
    private Date update_time;
    private int status;

    public Blog(){}

    public Blog(int blog_id, String title, String thumbnail, String intro, String author, Date update_time, int status) {
        this.blog_id = blog_id;
        this.title = title;
        this.thumbnail = thumbnail;
        this.intro = intro;
        this.author = author;
        this.update_time = update_time;
        this.status = status;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public String getTitle() {
        return title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public String getIntro() {
        return intro;
    }

    public String getAuthor() {
        return author;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public int getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "Blog{" + "blog_id=" + blog_id + ", title=" + title + ", thumbnail=" + thumbnail + ", intro=" + intro + ", author=" + author + ", update_time=" + update_time + ", status=" + status + '}';
    }
    
    
    
}
