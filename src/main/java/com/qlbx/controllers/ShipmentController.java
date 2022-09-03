/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.ShipmentDetails;
import com.qlbx.pojo.User;
import com.qlbx.service.RouteService;
import com.qlbx.service.ShipmentService;
import com.qlbx.service.TripService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/companyMn")
public class ShipmentController {
    @Autowired
    private ShipmentService shipmentService;
    @Autowired
    private RouteService routeService;
    @Autowired
    private TripService tripService;
    @Autowired
    private MailSender mailSender;
    
    @GetMapping("/shipment")
    public String shipment(Model model, HttpSession session, @RequestParam Map<String, String> params){
        try{
            int tripId = Integer.parseInt(params.get("tripId"));
            List<ShipmentDetails> list = this.shipmentService.getlistShipmentByTripId(tripId);
            model.addAttribute("trip", this.tripService.getTripById(tripId));
            model.addAttribute("shipments", list);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        User user = (User) session.getAttribute("currentUser");
        model.addAttribute("routes", this.routeService.getAllRouteByCompanyId(user.getUserId()));
        model.addAttribute("shipmentDetails", new ShipmentDetails());
        return "shipment";
    }
    
    @PostMapping("/add-ship-details")
    public String saveShipmentDetails(@ModelAttribute(value = "shipmentDetails") ShipmentDetails shipmentDetails){
        this.shipmentService.addShipmentDetails(shipmentDetails);
        
        return "redirect:/companyMn/shipment";
    }
    
    @GetMapping("/send-email/{shipId}")
    public String sendEmail(@PathVariable(value = "shipId") int shipId){
        ShipmentDetails shipment = this.shipmentService.getShipmentById(shipId);
        SimpleMailMessage m = new SimpleMailMessage();
        m.setFrom("trieu251101ou@gmail.com");
        m.setTo(shipment.getReceiverEmail());
        m.setSubject("Thong bao nhan hang");
        m.setText("Thong bao quy khach den nhan hang");
        
        this.mailSender.send(m);
        return "redirect:/companyMn/shipment";
    }
}
