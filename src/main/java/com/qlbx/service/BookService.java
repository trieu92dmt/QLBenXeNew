/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.Book;
import com.qlbx.pojo.CompanyCart;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public interface BookService {
    boolean addBook(Book book, Map<String, CompanyCart> companyCart);
}
