/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.Trip;
import com.qlbx.repository.TripRepository;
import com.qlbx.service.TripService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class TripServiceImpl implements TripService{
    @Autowired
    private TripRepository tripRepository;
    
    @Override
    public List<Trip> getListTripsByRouteId(int routeId) {
        return this.tripRepository.getListTripsByRouteId(routeId);
    }

    @Override
    public boolean addTrip(Trip trip) {
        return this.tripRepository.addTrip(trip);
    }

    @Override
    public List<Trip> getListTripsByRouteIdAndDate(int routeId, Date date) {
        return this.tripRepository.getListTripsByRouteIdAndDate(routeId, date);
    }

    @Override
    public Trip getTripById(int tripId) {
        return this.tripRepository.getTripById(tripId);
    }

    @Override
    public List<Object[]> getListTripsByDestinationAndDate(int destination, Date date) {
        return this.tripRepository.getListTripsByDestinationAndDate(destination, date);
    }
    
}
