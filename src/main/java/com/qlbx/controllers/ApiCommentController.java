/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.Comment;
import com.qlbx.pojo.CommentInfo;
import com.qlbx.pojo.User;
import com.qlbx.service.CommentService;
import java.util.Map;
import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @PostMapping(path = "/cmt-api/add-comment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<CommentInfo> addComment(@RequestBody Map<String, String> params, HttpSession session){
        try{
            String content = params.get("content");
            int companyId = Integer.parseInt(params.get("companyId"));
            User user = (User) session.getAttribute("currentUser");
            
            Comment c = this.commentService.addComment(content, companyId, user);
            CommentInfo cf = new CommentInfo();
            cf.setComment(c);
            cf.setUsername(user.getUsername());
            cf.setAvt(user.getAvatar());
            
            return new ResponseEntity<>(cf, HttpStatus.CREATED);
    
        } catch (Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
}
