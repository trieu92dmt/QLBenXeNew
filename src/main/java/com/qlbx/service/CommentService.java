/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.Comment;
import com.qlbx.pojo.User;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface CommentService {
    Comment addComment(String content, int productId, User user);
    List<Comment> getListCommentByCompanyId(int companyId);
}
