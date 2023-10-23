/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.vtta.service;

import com.vtta.pojo.Major;
import java.util.List;

/**
 *
 * @author Trâm Anh
 */
public interface MajorService {
    List<Major> getMajor();
    boolean addOrUpdateMajor(Major p);
    Major getMajorById(int id);
    boolean deleteMajor(int id);
}
