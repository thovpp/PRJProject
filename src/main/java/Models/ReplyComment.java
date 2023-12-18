/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class ReplyComment {
    private int replyComment_id;
    private String replyComment_text;
    private Date replyComment_date;
    private String username;
    private int comment_id;

    public ReplyComment() {
    }

    public ReplyComment(int replyComment_id, String replyComment_text, Date replyComment_date, String username) {
        this.replyComment_id = replyComment_id;
        this.replyComment_text = replyComment_text;
        this.replyComment_date = replyComment_date;
        this.username = username;
    }

    public ReplyComment(int replyComment_id, String replyComment_text, Date replyComment_date, String username, int comment_id) {
        this.replyComment_id = replyComment_id;
        this.replyComment_text = replyComment_text;
        this.replyComment_date = replyComment_date;
        this.username = username;
        this.comment_id = comment_id;
    }

    public int getReplyComment_id() {
        return replyComment_id;
    }

    public void setReplyComment_id(int replyComment_id) {
        this.replyComment_id = replyComment_id;
    }

    public String getReplyComment_text() {
        return replyComment_text;
    }

    public void setReplyComment_text(String replyComment_text) {
        this.replyComment_text = replyComment_text;
    }

    public Date getReplyComment_date() {
        return replyComment_date;
    }

    public void setReplyComment_date(Date replyComment_date) {
        this.replyComment_date = replyComment_date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    @Override
    public String toString() {
        return "ReplyComment{" + "replyComment_id=" + replyComment_id + ", replyComment_text=" + replyComment_text + ", replyComment_date=" + replyComment_date + ", username=" + username + ", comment_id=" + comment_id + '}';
    }
    
    
}