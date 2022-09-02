/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.Ticket;
import com.qlbx.service.TicketService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("/ticket-api")
public class ApiTicketController {
    @Autowired
    private TicketService ticketService;
    
    @GetMapping("/tickets")
    public ResponseEntity<List<Ticket>> getListTripsByRouteIdAndDate(@RequestParam Map<String, String> params){
        try{
            int tripId = Integer.parseInt(params.get("tripId"));
            List<Ticket> list = this.ticketService.getListTicketsByTripId(tripId);
            return new ResponseEntity<>(list, HttpStatus.CREATED);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
