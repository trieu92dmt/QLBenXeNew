/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.CompanyCart;
import com.qlbx.service.TicketService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("cart-api")
public class ApiCartController {
    @Autowired
    private TicketService ticketService;
    
    @PostMapping("/company-cart")
    public int addToCart(@RequestBody CompanyCart params, HttpSession session){
        Map<String, CompanyCart> cart = (Map<String, CompanyCart>) session.getAttribute("company-cart");
        if (cart == null)
            cart = new HashMap<>();
        if (cart.containsKey(params.getSeatNumber())){
            cart.remove(params.getSeatNumber());
        }else{
            cart.put(params.getSeatNumber(), params);
        }
        session.setAttribute("company-cart", cart);
        return cart.size();
    }
    
    @PostMapping("/update-ticket")
    public HttpStatus updateTicket(HttpSession session){
        if (this.ticketService.addTicket((Map<String, CompanyCart>)session.getAttribute("company-cart"))==true){
            session.removeAttribute("company-cart");
            return HttpStatus.OK;
        }
            
        return HttpStatus.BAD_REQUEST;
    }
    
    @PostMapping("/book-ticket")
    public HttpStatus bookTicket(HttpSession session){
        if (this.ticketService.addTicket((Map<String, CompanyCart>)session.getAttribute("company-cart"))==true){
            session.removeAttribute("company-cart");
            return HttpStatus.OK;
        }
            
        return HttpStatus.BAD_REQUEST;
    }
}
