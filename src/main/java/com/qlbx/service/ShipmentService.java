/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.ShipmentDetails;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface ShipmentService {
    List<ShipmentDetails> getlistShipmentByTripId(int tripId);
    boolean addShipmentDetails(ShipmentDetails shipmentDetails);
}
