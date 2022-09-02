/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Package;
import com.qlbx.pojo.User;
import com.qlbx.repository.PackageRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
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
public class PackageRepositoryImpl implements PackageRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Package> getPackages() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Package> query = builder.createQuery(Package.class);
        Root root = query.from(Package.class);
        query = query.select(root);
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
}
