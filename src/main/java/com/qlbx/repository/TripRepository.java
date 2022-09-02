/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository;

import com.qlbx.pojo.Trip;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface TripRepository {
    boolean addTrip(Trip trip);
    List<Trip> getListTripsByRouteId(int routeId);
    List<Trip> getListTripsByRouteIdAndDate(int routeId, Date date);
    List<Object[]> getListTripsByDestinationAndDate(int destination, Date date);
    Trip getTripById(int tripId);
}
