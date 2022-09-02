/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository;

import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Ticket;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface TicketRepository {
    boolean addTicket(Map<String, CompanyCart> companyCart);
    List<Ticket> getListTicketsByTripId(int tripId);
}
