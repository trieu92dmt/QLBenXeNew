/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.repository.CompanyStatRepository;
import com.qlbx.service.CompanyStatService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class CompanyStatServiceImpl implements CompanyStatService{
    @Autowired
    private CompanyStatRepository companyStatRepository;

    @Override
    public List<Object[]> frequencyStatByMonth(int month, int year, int companyId) {
        return this.companyStatRepository.frequencyStatByMonth(month, year, companyId);
    }

    @Override
    public List<Object[]> frequencyStatByQuarter(int quarter, int year, int companyId) {
        return this.companyStatRepository.frequencyStatByQuarter(quarter, year, companyId);
    }

    @Override
    public List<Object[]> frequencyStatByYear(int year, int companyId) {
        return this.companyStatRepository.frequencyStatByYear(year, companyId);
    }

    @Override
    public List<Object[]> revenueStatByMonth(int month, int year, int companyId) {
        return this.companyStatRepository.revenueStatByMonth(month, year, companyId);
    }

    @Override
    public List<Object[]> revenueStatByQuarter(int quarter, int year, int companyId) {
        return this.companyStatRepository.revenueStatByQuarter(quarter, year, companyId);
    }

    @Override
    public List<Object[]> revenueStatByYear(int year, int companyId) {
        return this.companyStatRepository.revenueStatByYear(year, companyId);
    }
    
}
