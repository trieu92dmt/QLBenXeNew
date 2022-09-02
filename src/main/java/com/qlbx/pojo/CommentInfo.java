/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.pojo;

/**
 *
 * @author ASUS
 */
public class CommentInfo {
    private Comment comment;
    private String username;
    private String avt;

    /**
     * @return the comment
     */
    public Comment getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(Comment comment) {
        this.comment = comment;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the avt
     */
    public String getAvt() {
        return avt;
    }

    /**
     * @param avt the avt to set
     */
    public void setAvt(String avt) {
        this.avt = avt;
    }
}
