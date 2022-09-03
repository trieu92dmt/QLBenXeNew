 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.service.CarCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private CarCompanyService carCompanyService;
    
    @GetMapping("/dashboard")
    public String home(){
        return "admin-dashboard";
    }
    
    @GetMapping("/companyMn")
    public String companyMn(Model model){
        model.addAttribute("listCompany",this.carCompanyService.getListCarCompany());
        return "companyMn-ad";
    }
}
