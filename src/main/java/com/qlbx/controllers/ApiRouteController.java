/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
@RequestMapping("/route-api")
public class ApiRouteController {
    @Autowired
    private RouteService routeService;
    
    @DeleteMapping("/delete-route-by-id/{routeId}")
    public HttpStatus deleteRouteById(@PathVariable(value = "routeId") int routeId){
        if (routeService.deleteRouteById(routeId))
            return HttpStatus.OK;
        return HttpStatus.BAD_REQUEST;
    }
}
