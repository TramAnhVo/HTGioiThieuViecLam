/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.Company;
import java.util.List;

/**
 *
 * @author Trâm Anh
 */
public interface CompanyRepository {
    List<Company> getCompany();
    boolean addCompany(Company p);
    boolean UpdateCompany(Company p);   
    Company getCompanyById(int id);
    boolean deleteCompany(int id);
    
//    Company getCompanyByAccId(int id);
    int countCompany();
    
//    List<Company> getCompaniesByAccIdT();
//    List<Company> getCompaniesByAccIdF();
}
