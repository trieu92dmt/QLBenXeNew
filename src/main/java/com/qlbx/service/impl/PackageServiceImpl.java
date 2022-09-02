/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.service.impl;

import com.qlbx.pojo.Package;
import com.qlbx.repository.PackageRepository;
import com.qlbx.service.PackageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class PackageServiceImpl implements PackageService{
    @Autowired
    private PackageRepository packageRepository;
    
    @Override
    public List<Package> getPackages() {
        return this.packageRepository.getPackages();
    }
    
}
