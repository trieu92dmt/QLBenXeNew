/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qlbx.pojo.User;
import com.qlbx.repository.UserRepository;
import com.qlbx.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudianry;

    @Override
    public boolean addUser(User user, String userRole) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setRole(userRole);
        try {
            if (!user.getFile().isEmpty()) {
                Map r = this.cloudianry.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));
            }
            else if (user.getAvatar() == null){
                user.setAvatar("https://res.cloudinary.com/minhtrieu-cloudinary/image/upload/v1661619527/rkren0obyueqlndsnuon.png");
            }
        } catch (IOException ex) {
            Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.userRepository.addUser(user, userRole);
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }
    @Override
    public User getUserById(int id) {
        return  this.userRepository.getUserById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("Tài khoản không tồn tại");
        }

        User user = users.get(0);
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getRole()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

    @Override
    public boolean updateUser(User user) {
        return this.userRepository.updateUser(user);
    }
}
