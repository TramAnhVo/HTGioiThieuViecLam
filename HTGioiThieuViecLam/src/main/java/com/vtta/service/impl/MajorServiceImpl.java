/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.vtta.pojo.Major;
import com.vtta.repository.MajorRepository;
import com.vtta.service.MajorService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Trâm Anh
 */
@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorRepository majorRepository;

    @Override
    public List<Major> getMajor() {
        return this.majorRepository.getMajor();
    }

    @Override
    public boolean addOrUpdateMajor(Major major) {
        return this.majorRepository.addOrUpdateMajor(major);
    }

    @Override
    public Major getMajorById(int i) {
        return this.majorRepository.getMajorById(i);
    }

    @Override
    public boolean deleteMajor(int i) {
        return this.majorRepository.deleteMajor(i);
    }
}
