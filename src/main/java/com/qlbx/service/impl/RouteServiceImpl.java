/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.Route;
import com.qlbx.repository.RouteRepository;
import com.qlbx.service.RouteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class RouteServiceImpl implements RouteService{
    @Autowired
    private RouteRepository routeRepository;
    
    @Override
    public List<Route> getRoutes() {
        return this.routeRepository.getRoutes();
    }

    @Override
    public boolean addRoute(Route route) {
        return this.routeRepository.addRoute(route);
    }

    @Override
    public List<Route> getRoutesByCompanyId(int id, int page) {
        return this.routeRepository.getRoutesByCompanyId(id, page);
    }

    @Override
    public long countRouteByCompanyId(int id) {
        return this.routeRepository.countRouteByCompanyId(id);
    }

    @Override
    public List<Route> getAllRouteByCompanyId(int id) {
        return this.routeRepository.getAllRouteByCompanyId(id);
    }

    @Override
    public boolean deleteRouteById(int routeId) {
        return this.routeRepository.deleteRouteById(routeId);
    }
    
}
