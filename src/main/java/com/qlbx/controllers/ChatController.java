/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.controllers;

import com.qlbx.pojo.Message;
import com.qlbx.repository.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ASUS
 */
@RestController
public class ChatController {
    @Autowired
    private MessageService messageService;
    
    @GetMapping("/get-msg")
    public Message getMessage(@RequestParam(value = "messageId") String messageId ){
        return this.messageService.getMessage(messageId);
    }
}
