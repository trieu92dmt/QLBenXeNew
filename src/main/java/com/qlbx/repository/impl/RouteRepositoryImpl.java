/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.CarCompany;
import com.qlbx.pojo.Route;
import com.qlbx.repository.RouteRepository;
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
public class RouteRepositoryImpl implements RouteRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Route> getRoutes() {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Route> query = builder.createQuery(Route.class);
        Root root = query.from(Route.class);
        query = query.select(root);
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean addRoute(Route route) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(route);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Route> getRoutesByCompanyId(int id, int page) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Route> query = builder.createQuery(Route.class);
        Root root = query.from(Route.class);
        query = query.select(root);
        query.where(builder.equal(root.get("companyId"), id));
        Query q = session.createQuery(query);
        
        int max = 6;
        q.setMaxResults(max);
        q.setFirstResult((page-1)*max);
        
        return q.getResultList();
    }

    @Override
    public long countRouteByCompanyId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Route.class);
        query = query.select(root);
        query.where(builder.equal(root.get("companyId"), id));
        query.multiselect(builder.count(root.get("routeId")));
        Query q = session.createQuery(query);
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public List<Route> getAllRouteByCompanyId(int id) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Route> query = builder.createQuery(Route.class);
        Root root = query.from(Route.class);
        query = query.select(root);
        query.where(builder.equal(root.get("companyId"), id));
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public boolean deleteRouteById(int routeId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            Query q = session.createQuery("Delete Route Where routeId = :id");
            q.setInteger("id", routeId);
            q.executeUpdate();
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }
    
}
