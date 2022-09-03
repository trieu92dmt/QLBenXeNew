/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.service.ShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("/ship-api")
public class ApiShipmentController {
    @Autowired
    private ShipmentService shipmentService;
    
    @PostMapping("/update-ship-details/{shipId}")
    public HttpStatus deleteRouteById(@PathVariable(value = "shipId") int shipId){
        if (this.shipmentService.updateShipmentDetails(shipId))
            return HttpStatus.OK;
        return HttpStatus.BAD_REQUEST;
    }
}
