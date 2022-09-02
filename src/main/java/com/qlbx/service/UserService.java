/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author ASUS
 */
public interface UserService extends UserDetailsService{
    boolean addUser(User user, String userRole);
    boolean updateUser(User user);
    List<User> getUsers(String username);
    User getUserById (int id);
}
