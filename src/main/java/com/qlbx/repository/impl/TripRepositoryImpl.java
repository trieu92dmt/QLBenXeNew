/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Route;
import com.qlbx.pojo.Trip;
import com.qlbx.repository.TripRepository;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
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
public class TripRepositoryImpl implements TripRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Trip> getListTripsByRouteId(int routeId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Trip> query = builder.createQuery(Trip.class);
        Root root = query.from(Trip.class);
        query = query.select(root);
        query.where(builder.equal(root.get("routeId"), routeId));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean addTrip(Trip trip) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(trip);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Trip> getListTripsByRouteIdAndDate(int routeId, Date date) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Trip> query = builder.createQuery(Trip.class);
        Root root = query.from(Trip.class);
        query = query.select(root);
        
        Predicate p1 = builder.equal(root.get("routeId"), routeId);
        Predicate p2 = builder.equal(root.get("date"), date);
        
        query.where(builder.and(p1, p2));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Trip getTripById(int tripId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Trip> query = builder.createQuery(Trip.class);
        Root root = query.from(Trip.class);
        query = query.select(root);
        
        query.where(builder.equal(root.get("tripId"),tripId));
        Query q = session.createQuery(query);
        return (Trip) q.getResultList().get(0);
    }

    @Override
    public List<Object[]> getListTripsByDestinationAndDate(int destination, Date date) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root<Trip> rootTrip = query.from(Trip.class);
        Root<Route> rootRoute = query.from(Route.class);
        
        Predicate p0 = builder.equal(rootTrip.get("routeId"), rootRoute.get("routeId"));
        Predicate p1 = builder.equal(rootRoute.get("destination"), destination);
        Predicate p2 = builder.equal(rootTrip.get("date"), date);
        
        query.where(builder.and(p0, p1, p2));
        query.multiselect(rootTrip.get("tripId"),
                        rootTrip.get("date"),
                        rootTrip.get("departureTime"),
                        rootTrip.get("time"),
                        rootTrip.get("ticketPrice"),
                        rootRoute.get("destination"),
                        rootRoute.get("companyId"));
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
}
