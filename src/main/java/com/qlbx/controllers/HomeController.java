/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;


import com.qlbx.pojo.CompanyCart;
import com.qlbx.service.PackageService;
import com.qlbx.service.TripService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
public class HomeController {
    @Autowired
    private PackageService packageService;
    @Autowired
    private TripService tripService;
    
    @GetMapping(value="/")
    public String index(){
        return "home";
    }

    @GetMapping(value = "/searchResult")
    public String search(Model model, @RequestParam Map<String, String> params, HttpSession session) throws ParseException{
        int destination = Integer.parseInt(params.get("destination"));
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(params.get("departure-date"));
        model.addAttribute("trips", this.tripService.getListTripsByDestinationAndDate(destination, date));
        Map<String, CompanyCart> carts = (Map<String, CompanyCart>) session.getAttribute("company-cart");
        if (carts != null){
            model.addAttribute("carts",  carts.values());
        }
        return "searchResult";
    }
}
