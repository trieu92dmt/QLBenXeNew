/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service;

import java.util.List;

/**
 *
 * @author ASUS
 */
public interface CompanyStatService {
    List<Object[]> frequencyStatByMonth(int month, int year, int companyId);
    List<Object[]> frequencyStatByQuarter(int quarter, int year, int companyId);
    List<Object[]> frequencyStatByYear(int year, int companyId);
    List<Object[]> revenueStatByMonth(int month, int year, int companyId);
    List<Object[]> revenueStatByQuarter(int quarter, int year, int companyId);
    List<Object[]> revenueStatByYear(int year, int companyId);
}
