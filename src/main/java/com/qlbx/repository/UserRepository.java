/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository;

import com.qlbx.pojo.User;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface UserRepository {
    boolean addUser(User user, String userRole);
    boolean updateUser(User user);
    List<User> getUsers(String username);
    User getUserById(int id);
}
