/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.formatter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class DateTimeFormatter implements Formatter<Date>{

    @Override
    public String print(Date t, Locale locale) {
        return t.toString();
    }

    @Override
    public Date parse(String string, Locale locale) throws ParseException {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        Date date = (Date)formatter.parse(string);
        return date;
    }
    
}
