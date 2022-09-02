/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.CarCompany;
import com.qlbx.repository.CarCompanyRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.mapping.Map;
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
public class CarCompanyRepositoryImpl implements CarCompanyRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<CarCompany> getListCarCompany() {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<CarCompany> query = builder.createQuery(CarCompany.class);
        Root root = query.from(CarCompany.class);
        query = query.select(root);
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }
    @Override
    public CarCompany getCarCompanyById(int id){
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(CarCompany.class,id);
    }

    @Override
    public boolean addCarCompany(CarCompany carCompany) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(carCompany);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

//    @Override
//    public CarCompany getCarCompanyById(int id) {
//        Session s = sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = s.getCriteriaBuilder();
//        CriteriaQuery<CarCompany> query = builder.createQuery(CarCompany.class);
//        Root root = query.from(CarCompany.class);
//        query = query.select(root);
//        query.where(builder.equal(root.get("id"),id));
//        Query q = s.createQuery(query);
//        return (CarCompany) q.getResultList().get(0);
//    }

}
