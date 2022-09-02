/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Ticket;
import com.qlbx.repository.TicketRepository;
import com.qlbx.service.TripService;
import java.util.List;
import java.util.Map;
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
public class TicketRepositoryImpl implements TicketRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private TripService tripService;

    @Override
    public boolean addTicket(Map<String, CompanyCart> companyCart) {
        try {
            Session session = sessionFactory.getObject().getCurrentSession();
            for (CompanyCart c : companyCart.values()) {
                Ticket ticket = new Ticket();
                ticket.setSeatNumber(c.getSeatNumber());
                ticket.setPrice(c.getPrice());
                ticket.setTripId(this.tripService.getTripById(c.getTripId()));
                session.save(ticket);
            }
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Ticket> getListTicketsByTripId(int tripId) {
        Session session = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Ticket> query = builder.createQuery(Ticket.class);
        Root root = query.from(Ticket.class);
        query = query.select(root);
        query.where(builder.equal(root.get("tripId"), tripId));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

}
