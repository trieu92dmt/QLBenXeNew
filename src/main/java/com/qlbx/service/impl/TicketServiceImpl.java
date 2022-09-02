/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Ticket;
import com.qlbx.repository.TicketRepository;
import com.qlbx.service.TicketService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class TicketServiceImpl implements TicketService{
    @Autowired
    private TicketRepository ticketRepository;
    
    @Override
    public boolean addTicket(Map<String, CompanyCart> companyCart) {
        if (companyCart != null)
            return this.ticketRepository.addTicket(companyCart);
        return false;
    }

    @Override
    public List<Ticket> getListTicketsByTripId(int tripId) {
        return this.ticketRepository.getListTicketsByTripId(tripId);
    }
    
}
