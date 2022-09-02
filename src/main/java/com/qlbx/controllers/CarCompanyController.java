/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.Bill;
import com.qlbx.pojo.CarCompany;
import com.qlbx.pojo.CarCompanyRegister;
import com.qlbx.pojo.User;
import com.qlbx.service.CarCompanyService;
import com.qlbx.service.CommentService;
import com.qlbx.service.PackageService;
import com.qlbx.service.RouteService;
import com.qlbx.service.TripService;
import com.qlbx.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
public class CarCompanyController {
    @Autowired
    private RouteService routeService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private PackageService packageService;
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private CarCompanyService carCompanyService;
    @Autowired
    private TripService tripService;
    

    @GetMapping("/package")
    public String chosePackage(Model model) {
        model.addAttribute("packages", this.packageService.getPackages());
        model.addAttribute("carCompanyRegister", new CarCompanyRegister());
        return "package";
    }


    @PostMapping("/carCompanyRegister")
    public String carCompanyRegister(@ModelAttribute(value = "carCompanyRegister") CarCompanyRegister carCompanyRegister) {
        String username = carCompanyRegister.getUser().getUsername();
        if (userDetailsService.addUser(carCompanyRegister.getUser(), User.COMPANY) == true){ 
            carCompanyRegister.getCarCompany().setId(userDetailsService.getUsers(username).get(0).getUserId());
            carCompanyRegister.getCarCompany().setUser(userDetailsService.getUsers(username).get(0));
            if (carCompanyService.addCarCompany(carCompanyRegister.getCarCompany()) == true)
                return "redirect:/login";
        }
        return "package";
    }
    
    @GetMapping("/list-company")
    public String listCarCompany(Model model){
        model.addAttribute("carcompany", this.carCompanyService.getListCarCompany());
        
    return "listCarCompany";
    }
    
    @GetMapping("/carCompanyDetails/{id}")
    public String carCompanyDetails(Model model,@PathVariable(value = "id")int id, @RequestParam(required = false) Map<String, String> searchInfo) throws ParseException{
        if (searchInfo.get("routeId") != null && searchInfo.get("departure-date")!=null){
            int routeId = Integer.parseInt(searchInfo.get("routeId"));
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(searchInfo.get("departure-date"));
            model.addAttribute("trips", this.tripService.getListTripsByRouteIdAndDate(routeId, date));
        }
        CarCompany carCompany = this.carCompanyService.getCarCompanyById(id);
        model.addAttribute("carcompany",carCompany);
        model.addAttribute("routes", this.routeService.getAllRouteByCompanyId(id));
        model.addAttribute("comments", this.commentService.getListCommentByCompanyId(id));
        return "carCompanyDetails";
    }
}
