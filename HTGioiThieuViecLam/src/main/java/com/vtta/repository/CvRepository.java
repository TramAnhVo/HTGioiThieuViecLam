/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.repository;

import com.vtta.pojo.Company;
import com.vtta.pojo.Cv;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface CvRepository {
    List<Cv> getCv(int id);
    List<Cv> getCvIdCompany(int id);
    
    Cv getCvById(int id);
    boolean addCv(Cv c);
    boolean UpdateActive(int id);
}
