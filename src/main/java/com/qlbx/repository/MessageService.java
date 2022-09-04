/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository;

import com.qlbx.pojo.Message;

/**
 *
 * @author ASUS
 */
public interface MessageService {
    String createMessage(Message message);
    Message getMessage(String messageId);
}
