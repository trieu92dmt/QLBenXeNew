/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.formatter;

import com.qlbx.pojo.Trip;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class TripFormatter  implements Formatter<Trip>{

    @Override
    public String print(Trip t, Locale locale) {
        return String.valueOf(t.getTripId());
    }

    @Override
    public Trip parse(String tripId, Locale locale) throws ParseException {
        Trip trip = new Trip();
        trip.setTripId(Integer.parseInt(tripId));
        return trip;
    }
    
}
