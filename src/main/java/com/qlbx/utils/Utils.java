/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.utils;

import com.qlbx.pojo.CompanyCart;
import java.math.BigInteger;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class Utils {
    public static BigInteger totalPrice(Map<String, CompanyCart> cart){
        BigInteger total = new BigInteger("0");
        if (cart != null)
            for (CompanyCart c: cart.values()){
                total = total.add(c.getPrice());
            }
        return total;
    }
}
