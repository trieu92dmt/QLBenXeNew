/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.CompanyCart;
import com.qlbx.service.CarCompanyService;
import com.qlbx.service.ProvinceService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 *
 * @author ASUS
 */
@Controller
@ControllerAdvice
public class CommonController {
    @Autowired
    private CarCompanyService carCompanyService;
    @Autowired
    private ProvinceService provinceService;
    
    @ModelAttribute
    public void commonAttr(Model model, HttpSession session){
        model.addAttribute("carCompany", this.carCompanyService.getListCarCompany());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("provinces", this.provinceService.getListProvince());
        Map<String, CompanyCart> cart = (Map<String, CompanyCart>) session.getAttribute("company-cart");
        if (cart == null)
            model.addAttribute("countCart", 0);
        else 
            model.addAttribute("countCart", cart.size());
        
    }
    
    @GetMapping(value = "error")
    public String error(){
        return "error";
    }
}
