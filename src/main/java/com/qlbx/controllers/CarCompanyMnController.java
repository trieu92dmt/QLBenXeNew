/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qlbx.pojo.AvatarCarCompany;
import com.qlbx.pojo.CarCompany;
import com.qlbx.pojo.CarCompanyRegister;
import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Route;
import com.qlbx.pojo.Trip;
import com.qlbx.pojo.User;
import com.qlbx.service.CarCompanyService;
import com.qlbx.service.PackageService;
import com.qlbx.service.RouteService;
import com.qlbx.service.TripService;
import com.qlbx.service.UserService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@Transactional
@RequestMapping("/companyMn")
public class CarCompanyMnController {

    @Autowired
    private UserService userDetailsService;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private RouteService routeService;
    @Autowired
    private TripService tripService;
    @Autowired
    private CarCompanyService carCompanyService;

    @GetMapping("/company-info")
    public String companyInfoMn(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        int status = this.carCompanyService.getCarCompanyById(user.getUserId()).getStatus();
        if (status == 0 || status == -1) {
            return "redirect:/";
        }
        model.addAttribute("carCompany", this.carCompanyService.getCarCompanyById(user.getUserId()));
        return "companyInfo";
    }

    @GetMapping("/company-info-edit")
    public String companyInfoEdit(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        int status = this.carCompanyService.getCarCompanyById(user.getUserId()).getStatus();
        if (status == 0 || status == -1) {
            return "redirect:/";
        }
        model.addAttribute("carCompany", this.carCompanyService.getCarCompanyById(user.getUserId()));
        model.addAttribute("avatarCarCompany", new AvatarCarCompany());
        return "carCompanyInfoEdit";
    }

    @PostMapping("/update-company-info")
    public String updateCompanyinfo(@ModelAttribute(value = "avatarCarCompany") AvatarCarCompany avatarCarCompany, HttpSession session) {
        try {
            User user = (User) session.getAttribute("currentUser");
            CarCompany carCompany = this.carCompanyService.getCarCompanyById(user.getUserId());

            if (!avatarCarCompany.getFile().isEmpty()) {
                Map r = this.cloudinary.uploader().upload(avatarCarCompany.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));
                this.userDetailsService.updateUser(user);
            }
            carCompany.setCompanyName(avatarCarCompany.getCompanyName());
            carCompany.setAddress(avatarCarCompany.getAddress());
            carCompany.setEmail(avatarCarCompany.getEmail());
            carCompany.setPhoneNumber(avatarCarCompany.getPhoneNumber());
            this.carCompanyService.updateCarCompany(carCompany);
        } catch (IOException ex) {
            System.err.print(ex.getMessage());
        }
        return "redirect:/companyMn/company-info-edit";
    }

    @GetMapping("/company-route-manager")
    public String companyRouteMn(Model model, HttpSession session,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        User user = (User) session.getAttribute("currentUser");
        int status = this.carCompanyService.getCarCompanyById(user.getUserId()).getStatus();
        if (status == 0 || status == -1) {
            return "redirect:/";
        }
        CarCompany carCompany = user.getCarCompany();
        model.addAttribute("carCompany", carCompany);
        model.addAttribute("routes", this.routeService.getRoutesByCompanyId(user.getUserId(), page));
        model.addAttribute("route", new Route());
        model.addAttribute("routeCount", this.routeService.countRouteByCompanyId(user.getUserId()));
        return "companyRouteMn";
    }

    @PostMapping("/add-route")
    public String addRoute(Model model, @ModelAttribute(value = "route") Route route, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        route.setCompanyId(this.carCompanyService.getCarCompanyById(user.getUserId()));
        if (this.routeService.addRoute(route)) {
            model.addAttribute("messageSuccess", "Thêm mới thành công!");
        } else {
            model.addAttribute("messageFailure", "Đã có lỗi xảy ra!");
        }
        return "redirect:/companyMn/company-route-manager";
    }

    @GetMapping("/company-trip-manager")
    public String companyTripMn(Model model, @RequestParam Map<String, String> params, HttpSession session) throws ParseException {
        if (params != null) {
            int routeId = Integer.parseInt(params.getOrDefault("routeId", "1"));
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(params.getOrDefault("date", "2022-08-22"));
            List<Trip> list = this.tripService.getListTripsByRouteIdAndDate(routeId, date);
            model.addAttribute("routeId", routeId);
            model.addAttribute("date", params.getOrDefault("date", "2022-08-22"));
            model.addAttribute("trips", list);
        }
        User user = (User) session.getAttribute("currentUser");
        int status = this.carCompanyService.getCarCompanyById(user.getUserId()).getStatus();
        if (status == 0 || status == -1) {
            return "redirect:/";
        }
        model.addAttribute("routes", this.routeService.getAllRouteByCompanyId(user.getUserId()));
        model.addAttribute("trip", new Trip());
        return "companyTripMn";
    }

    @PostMapping("/add-trip")
    public String addTrip(Model model, @ModelAttribute(value = "trip") Trip trip) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("routeId", trip.getRouteId().getRouteId());
        model.addAttribute("date", formatter.format(trip.getDate()));
        if (this.tripService.addTrip(trip)) {
            model.addAttribute("messageSuccess", "Thêm mới thành công!");
        } else {
            model.addAttribute("messageFailure", "Đã có lỗi xảy ra!");
        }
        return "redirect:/companyMn/company-trip-manager";
    }

}
