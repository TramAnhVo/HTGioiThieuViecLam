/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.vtta.pojo.Company;
import com.vtta.pojo.Cv;
import com.vtta.pojo.Job;
import com.vtta.repository.CvRepository;
import com.vtta.repository.JobRepository;
import com.vtta.service.CvService;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TramAnh
 */
@Service
public class CvServiceImpl implements CvService {

    @Autowired
    private CvRepository cvRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private JobRepository jobRepo;

    @Autowired
    private SimpleDateFormat simpleDateFormat;

    @Override
    public List<Cv> getCv(int id) {
        return this.cvRepo.getCv(id);
    }

    @Override
    public Boolean addCv(Cv c, int i) {
        if (!c.getFile().isEmpty()) {
            Job j = this.jobRepo.getJobById(i);
            c.setJobId(j);

            Random r = new Random();
            int a = r.nextInt(99999999);
            c.setId(a);
            
            Date currentDate = new Date();
            try {
                c.setDayApply(this.simpleDateFormat.
                        parse(this.simpleDateFormat.format(currentDate)));
                Map res = this.cloudinary.uploader().upload(c.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                c.setCv(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(CompanyServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(CvServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.cvRepo.addCv(c);
    }

    @Override
    public List<Cv> getCvIdCompany(int id) {
        return this.cvRepo.getCvIdCompany(id);
    }

    @Override
    public Cv getCvById(int id) {
        return this.cvRepo.getCvById(id);
    }

    @Override
    public boolean UpdateActive(int id) {
        return this.cvRepo.UpdateActive(id);
    }

}
