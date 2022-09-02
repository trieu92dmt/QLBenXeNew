/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.CarCompany;
import com.qlbx.repository.CarCompanyRepository;
import com.qlbx.service.CarCompanyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class CarCompanyServiceImpl implements CarCompanyService{
    @Autowired
    private CarCompanyRepository carCompanyRepository;
    
    @Override
    public List<CarCompany> getListCarCompany() {
        return this.carCompanyRepository.getListCarCompany();
    }
    @Override
    public CarCompany getCarCompanyById(int id){
        return this.carCompanyRepository.getCarCompanyById(id);
    }

    @Override
    public boolean addCarCompany(CarCompany carCompany) {
        return this.carCompanyRepository.addCarCompany(carCompany);
    }

//    @Override
//    public CarCompany getCarCompanyById(int id) {
//        return this.carCompanyRepository.getCarCompanyById(id);
//    }
}
