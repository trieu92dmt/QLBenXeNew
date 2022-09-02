/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.formatter;

import com.qlbx.pojo.Route;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class RouteFormatter implements Formatter<Route>{

    @Override
    public String print(Route t, Locale locale) {
        return String.valueOf(t.getRouteId());
    }

    @Override
    public Route parse(String routeId, Locale locale) throws ParseException {
        Route r = new Route();
        r.setRouteId(Integer.parseInt(routeId));
        return r;
    }
    
}
