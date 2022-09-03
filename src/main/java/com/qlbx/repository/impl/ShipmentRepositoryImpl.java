/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.ShipmentDetails;
import com.qlbx.repository.ShipmentRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class ShipmentRepositoryImpl implements ShipmentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<ShipmentDetails> getlistShipmentByTripId(int tripId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<ShipmentDetails> query = builder.createQuery(ShipmentDetails.class);
        Root root = query.from(ShipmentDetails.class);
        query = query.select(root);
        query.where(builder.equal(root.get("tripId"), tripId));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addShipmentDetails(ShipmentDetails shipmentDetails) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(shipmentDetails);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateShipmentDetails(ShipmentDetails shipmentDetails) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.merge(shipmentDetails);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public ShipmentDetails getShipmentById(int shipId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(ShipmentDetails.class,shipId);
    }
}
