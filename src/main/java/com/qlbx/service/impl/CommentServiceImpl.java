/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.CarCompany;
import com.qlbx.pojo.Comment;
import com.qlbx.pojo.User;
import com.qlbx.repository.CarCompanyRepository;
import com.qlbx.repository.CommentRepository;
import com.qlbx.service.CommentService;
import com.qlbx.service.UserService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private HttpSession httpSession;
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private CarCompanyRepository carCompanyRepository;
    @Autowired
    private UserService userDetailsService;
    
    @Override
    public Comment addComment(String content, int companyId, User user) {
        
        CarCompany company = this.carCompanyRepository.getCarCompanyById(companyId);
        Comment c = new Comment();
        c.setContent(content);
        c.setCompanyId(company);
        c.setUserId(user);
        c.setCreatedDate(new Date());
        return this.commentRepository.addComment(c);
    }
    
    public List<Comment> getListCommentByCompanyId(int companyId) {
        return this.commentRepository.getListCommentByCompanyId(companyId);
    }
    
}
