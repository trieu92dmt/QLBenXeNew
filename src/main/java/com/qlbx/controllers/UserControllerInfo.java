/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qlbx.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qlbx.pojo.AvatarUser;
import com.qlbx.pojo.User;
import com.qlbx.service.UserService;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ACER
 */
@Controller
@Transactional
@RequestMapping("/userMn")
public class UserControllerInfo {

    @Autowired
    private UserService userDetailsService;

    @Autowired
    private Cloudinary cloudinary;

    @GetMapping("/user-info")
    public String userInfo(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        model.addAttribute("user", this.userDetailsService.getUserById(user.getUserId()));
        return "userInf";
    }

    @GetMapping("/user-info-edit")
    public String InfoEdit(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        model.addAttribute("user", this.userDetailsService.getUserById(user.getUserId()));
        model.addAttribute("avatarUser", new AvatarUser());
        return "userInfoEdit";
    }

    @PostMapping("/update-user-info")
    public String updateUserinfo(@ModelAttribute(value = "avatarUser") AvatarUser userAvatar, HttpSession session) {
        try {
            User user = (User) session.getAttribute("currentUser");

            

            if (!userAvatar.getFile().isEmpty()) {
                Map r = this.cloudinary.uploader().upload(userAvatar.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));
                this.userDetailsService.updateUser(user);
            }
            user.setUsername(userAvatar.getUserName());
            user.setEmail(userAvatar.getEmail());
            user.setPhoneNumber(userAvatar.getPhoneNumber());
            this.userDetailsService.addUser(user,user.getRole());
        } catch (IOException ex) {
            System.err.print(ex.getMessage());
        }
        return "redirect:/userMn/user-info-edit";
    }
}
