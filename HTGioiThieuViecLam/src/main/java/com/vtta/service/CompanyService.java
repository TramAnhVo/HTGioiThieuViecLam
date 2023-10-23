/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.Company;
import java.util.List;

/**
 *
 * @author Trâm Anh
 */
public interface CompanyService {
    List<Company> getCompany();
    boolean addCompany(Company p);
    boolean updateCompany(Company p);
    int countCompany();
    Company getCompanyById(int id);
    boolean deleteCompany(int id);
}
