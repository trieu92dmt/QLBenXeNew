/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.Book;
import com.qlbx.pojo.CompanyCart;
import com.qlbx.pojo.Ticket;
import com.qlbx.repository.BookRepository;
import com.qlbx.repository.TripRepository;
import com.qlbx.service.BookService;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class BookServiceImpl implements BookService{

    @Autowired
    private BookRepository bookRepository;
    
    @Override
    public boolean addBook(Book book, Map<String, CompanyCart> companyCart) {
        return this.bookRepository.addBook(book, companyCart);
    }
    
}
