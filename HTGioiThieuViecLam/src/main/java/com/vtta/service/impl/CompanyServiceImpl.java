/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vtta.pojo.Company;
import com.vtta.repository.CompanyRepository;
import com.vtta.service.CompanyService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trâm Anh
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Company> getCompany() {
        return this.companyRepository.getCompany();
    }

    @Override
    public boolean addCompany(Company p) {
        if (!p.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(p.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                p.setImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(CompanyServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.companyRepository.addCompany(p);
    }

    @Override
    public int countCompany() {
        return this.companyRepository.countCompany();
    }

    @Override
    public Company getCompanyById(int id) {
        return this.companyRepository.getCompanyById(id);
    }

    @Override
    public boolean deleteCompany(int id) {
        return this.companyRepository.deleteCompany(id);
    }

    @Override
    public boolean updateCompany(Company p) {
        if (!p.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(p.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                p.setImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(CompanyServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.companyRepository.UpdateCompany(p);
    }
}
