/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.qlbx.pojo.Book;
import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Ticket;
import com.qlbx.repository.BookRepository;
import com.qlbx.repository.TripRepository;
import java.util.Map;
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
public class BookRepositoryImpl implements BookRepository{
    @Autowired
    private TripRepository tripRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addBook(Book book, Map<String, CompanyCart> companyCart) {
        Session session = sessionFactory.getObject().getCurrentSession();
        try{
            session.save(book);
            for (CompanyCart c : companyCart.values()) {
                Ticket ticket = new Ticket();
                ticket.setSeatNumber(c.getSeatNumber());
                ticket.setPrice(c.getPrice());
                ticket.setTripId(this.tripRepository.getTripById(c.getTripId()));
                ticket.setBookId(book);
                session.save(ticket);
            }
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }
    
}
