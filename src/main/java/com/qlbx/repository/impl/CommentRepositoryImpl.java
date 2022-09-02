/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Comment;
import com.qlbx.repository.CommentRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ASUS
 */
@Repository
@Transactional
public class CommentRepositoryImpl implements CommentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public Comment addComment(Comment c) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(c);
            return c;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return null;
    }

    @Override
    public List<Comment> getListCommentByCompanyId(int companyId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);
        query.where(builder.equal(root.get("companyId"), companyId));
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
}
