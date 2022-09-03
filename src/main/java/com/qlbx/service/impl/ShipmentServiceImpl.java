/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.ShipmentDetails;
import com.qlbx.repository.ShipmentRepository;
import com.qlbx.service.ShipmentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class ShipmentServiceImpl implements ShipmentService{
    @Autowired
    private ShipmentRepository shipmentRepository;

    @Override
    public List<ShipmentDetails> getlistShipmentByTripId(int tripId) {
        return this.shipmentRepository.getlistShipmentByTripId(tripId);
    }

    @Override
    public boolean addShipmentDetails(ShipmentDetails shipmentDetails) {
        Date date = new Date();
        shipmentDetails.setSendingTime(date);
        shipmentDetails.setStatus(0);
        return this.shipmentRepository.addShipmentDetails(shipmentDetails);
    }

    @Override
    public boolean updateShipmentDetails(int shipId) {
        ShipmentDetails s = this.shipmentRepository.getShipmentById(shipId);
        Date date = new Date();
        s.setReceivingTime(date);
        s.setStatus(1);
        return this.shipmentRepository.updateShipmentDetails(s);
    }

    @Override
    public ShipmentDetails getShipmentById(int shipId) {
        return this.shipmentRepository.getShipmentById(shipId);
    }
    
    
}
