/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Route;
import com.qlbx.pojo.Ticket;
import com.qlbx.pojo.Trip;
import com.qlbx.repository.CompanyStatRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class CompanyStatRepositoryImpl implements CompanyStatRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Object[]> frequencyStatByMonth(int month, int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("MONTH", Integer.class, rootTrip.get("date")), month));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.count(rootTrip.get("tripId")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Object[]> frequencyStatByQuarter(int quarter, int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("QUARTER", Integer.class, rootTrip.get("date")), quarter));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.count(rootTrip.get("tripId")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Object[]> frequencyStatByYear(int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.count(rootTrip.get("tripId")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Object[]> revenueStatByMonth(int month, int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);
        Root rootTicket = query.from(Ticket.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootTrip.get("tripId"), rootTicket.get("tripId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("MONTH", Integer.class, rootTrip.get("date")), month));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.sum(rootTicket.get("price")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Object[]> revenueStatByQuarter(int quarter, int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);
        Root rootTicket = query.from(Ticket.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootTrip.get("tripId"), rootTicket.get("tripId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("QUARTER", Integer.class, rootTrip.get("date")), quarter));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.sum(rootTicket.get("price")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }

    @Override
    public List<Object[]> revenueStatByYear(int year, int companyId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        
        Root rootRoute = query.from(Route.class);
        Root rootTrip = query.from(Trip.class);
        Root rootTicket = query.from(Ticket.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootRoute.get("routeId"), rootTrip.get("routeId")));
        predicates.add(builder.equal(rootTrip.get("tripId"), rootTicket.get("tripId")));
        predicates.add(builder.equal(rootRoute.get("companyId"), companyId));
        predicates.add(builder.equal(builder.function("YEAR", Integer.class, rootTrip.get("date")), year));
        
        query.where(predicates.toArray(new Predicate[]{}));
        query.groupBy(rootRoute.get("routeId"));
        
        query.multiselect(rootRoute.get("routeId"), rootRoute.get("destination"), builder.sum(rootTicket.get("price")));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
    }
    
}
