/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.User;
import com.qlbx.service.CompanyStatService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/companyMn")
public class CarCompanyStatController {

    @Autowired
    private CompanyStatService companyStatService;

    @GetMapping("/revenue-stat")
    public String revenueStat(Model model, @RequestParam(required = false) Map<String, String> params, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (params != null && !params.isEmpty()) {
            if (params.get("month") != "" && params.get("month") != null) {
                int month = Integer.parseInt(params.get("month"));
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.revenueStatByMonth(month, year, user.getUserId()));
            }else if (params.get("quarter") != "" && params.get("quarter") != null){
                int quarter = Integer.parseInt(params.get("quarter"));
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.revenueStatByQuarter(quarter, year, user.getUserId()));
            }else{
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.revenueStatByYear(year, user.getUserId()));
            }
        }
        return "revenue-stat";
    }

    @GetMapping("/frequency-stat")
    public String frequencyStat(Model model, @RequestParam(required = false) Map<String, String> params, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (params != null && !params.isEmpty()) {
            if (params.get("month") != "" && params.get("month") != null) {
                int month = Integer.parseInt(params.get("month"));
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.frequencyStatByMonth(month, year, user.getUserId()));
            }else if (params.get("quarter") != "" && params.get("quarter") != null){
                int quarter = Integer.parseInt(params.get("quarter"));
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.frequencyStatByQuarter(quarter, year, user.getUserId()));
            }else{
                int year = Integer.parseInt(params.get("year"));
                model.addAttribute("statResult", this.companyStatService.frequencyStatByYear(year, user.getUserId()));
            }
        }
        return "frequency-stat";
    }
}
