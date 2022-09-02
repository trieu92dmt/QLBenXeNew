/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.Province;
import com.qlbx.repository.ProvinceRepository;
import com.qlbx.service.ProvinceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class ProvinceServiceImpl implements ProvinceService{
    @Autowired
    private ProvinceRepository provinceRepository;
    
    @Override
    public List<Province> getListProvince() {
        return this.provinceRepository.getListProvince();
    }
    
}
