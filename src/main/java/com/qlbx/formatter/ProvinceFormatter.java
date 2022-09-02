/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.formatter;

import com.qlbx.pojo.Province;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ASUS
 */
public class ProvinceFormatter implements Formatter<Province>{

    @Override
    public String print(Province t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Province parse(String string, Locale locale) throws ParseException {
        Province province = new Province();
        province.setId(Integer.parseInt(string));
        return province;
    }
    
}
