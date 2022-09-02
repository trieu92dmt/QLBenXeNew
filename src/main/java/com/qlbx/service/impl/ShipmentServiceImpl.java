/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.ShipmentDetails;
import com.qlbx.repository.ShipmentRepository;
import com.qlbx.service.ShipmentService;
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
        return this.shipmentRepository.addShipmentDetails(shipmentDetails);
    }
    
    
}
