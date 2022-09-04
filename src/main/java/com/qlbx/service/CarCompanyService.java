/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import com.qlbx.pojo.CarCompany;
import java.util.List;

/**
 *
 * @author ASUS
 */
public interface CarCompanyService {
    boolean addCarCompany(CarCompany carCompany);
    boolean updateCarCompany(CarCompany carCompany);
    boolean updateStatus(int companyId, int status);
    Long countListCarCompany();
    List<CarCompany> getListCarCompany();
    List<CarCompany> getListCarCompanyByPage(int page);
    CarCompany getCarCompanyById(int id);
}


