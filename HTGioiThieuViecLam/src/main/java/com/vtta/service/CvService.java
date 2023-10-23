/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.Company;
import com.vtta.pojo.Cv;
import java.util.List;

/**
 *
 * @author TramAnh
 */
public interface CvService {
    List<Cv> getCv(int id);
    List<Cv> getCvIdCompany(int id);
    
    Boolean addCv(Cv c, int i);
    Cv getCvById(int id);
    boolean UpdateActive(int id);
}
