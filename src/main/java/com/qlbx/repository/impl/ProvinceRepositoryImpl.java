/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Province;
import com.qlbx.repository.ProvinceRepository;
import java.util.List;
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
public class ProvinceRepositoryImpl implements ProvinceRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Province> getListProvince() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.createQuery("From Province").getResultList();
    }
    
}
