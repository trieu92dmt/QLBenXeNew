/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.Book;
import com.qlbx.pojo.CompanyCart;
import com.qlbx.service.BookService;
import com.qlbx.utils.Utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author ASUS
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private BookService bookService;
    
    @GetMapping("/show")
    public String cart(Model model, HttpSession session){
        Map<String, CompanyCart> carts = (Map<String, CompanyCart>) session.getAttribute("company-cart");
        if (carts != null)
        {
            model.addAttribute("carts",  carts.values());
            model.addAttribute("totalPrice", Utils.totalPrice(carts));
        }
        else model.addAttribute("totalPrice", 0);
        model.addAttribute("book", new Book());
        
        return "cart";
    }
    
    @PostMapping("/pay-ticket")
    public String pay(@ModelAttribute(value = "book") Book book, HttpSession session){
        Map<String, CompanyCart> carts = (Map<String, CompanyCart>) session.getAttribute("company-cart");
        book.setTicketQuantity(carts.size());
        book.setTotal(Utils.totalPrice(carts));
        this.bookService.addBook(book, carts);
        session.removeAttribute("company-cart");
        return "redirect:/cart/show";
    }
}
