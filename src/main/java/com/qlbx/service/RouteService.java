/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.Route;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface RouteService {
    List<Route> getRoutes();
    boolean addRoute(Route route);
    List<Route> getAllRouteByCompanyId(int id);
    List<Route> getRoutesByCompanyId(int id, int page);
    long countRouteByCompanyId(int id);
    boolean deleteRouteById(int routeId);
}
